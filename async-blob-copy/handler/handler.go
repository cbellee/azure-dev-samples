package main

import (
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/Azure/azure-sdk-for-go/sdk/azcore/to"
	"github.com/Azure/azure-sdk-for-go/sdk/storage/azblob"
	"github.com/Azure/azure-sdk-for-go/sdk/storage/azblob/blockblob"
	"github.com/Azure/azure-sdk-for-go/sdk/storage/azblob/sas"

	models "handler/models"

	"github.com/schollz/progressbar/v3"
	log "github.com/sirupsen/logrus"
)

func handleError(err error) {
	if err != nil {
		log.Error(err.Error())
		return
	}
}

func main() {
	log.SetLevel(log.TraceLevel)

	customHandlerPort, exists := os.LookupEnv("FUNCTIONS_CUSTOMHANDLER_PORT")
	if !exists {
		customHandlerPort = "8080"
	}

	mux := http.NewServeMux()
	mux.HandleFunc("/", healthHandler)
	mux.HandleFunc("/EventGridTrigger", eventHandler)
	log.Info("Go server Listening on: ", customHandlerPort)
	log.Fatal(http.ListenAndServe(":"+customHandlerPort, mux))
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(200)
}

func eventHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	dstAccountName, exists := os.LookupEnv("DST_ACCOUNT_NAME")
	if !exists {
		log.Fatal("'DST_ACCOUNT_NAME' not found")
		return
	}

	dstContainerName, exists := os.LookupEnv("DST_CONTAINER_NAME")
	if !exists {
		log.Fatal("'DST_CONTAINER_NAME' not found")
	}

	requestDump, err := httputil.DumpRequest(r, true)
	if err != nil {
		fmt.Println(err)
		return
	}
	log.Trace(fmt.Printf("Http Body Dump: %s\n", requestDump))

	if r.Body == nil {
		log.Error("Request Body not found")
		http.Error(w, "Request Body not found", 400)
		return
	}

	var request models.Request

	// read body
	b, err := ioutil.ReadAll(r.Body)
	defer r.Body.Close()
	if err != nil {
		log.Error(err.Error())
		http.Error(w, err.Error(), 500)
		return
	}

	// unmarshal
	err = json.Unmarshal(b, &request)
	if err != nil {
		log.Error(err.Error())
		http.Error(w, err.Error(), 500)
		return
	}

	// parse url
	u, err := url.Parse(request.Data.EventGridEvent.Data.Url)
	if err != nil {
		log.Error(err.Error())
		http.Error(w, err.Error(), 500)
		return
	}

	pathArray := strings.Split(u.Path, "/")
	srcAccountName := strings.Split(u.Hostname(), ".")[0]
	srcContainerName := pathArray[1]
	srcBlobName := strings.Join(pathArray[2:], "/")

	log.Trace(fmt.Sprintf("storage account: %s\n", srcAccountName))
	log.Trace(fmt.Sprintf("container: %s\n", srcContainerName))
	log.Trace(fmt.Sprintf("blob: %s\n", srcBlobName))

	// start copy operation
	err = startCopyWithAccountKey(srcAccountName, srcContainerName, dstAccountName, dstContainerName, srcBlobName)
	if err != nil {
		log.Error(err.Error())
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}

	w.Write([]byte("{\"completed\": true}"))
}

func getSASToken(accountName string, containerName string, blobName string, credential *azblob.SharedKeyCredential) (url string, token string, err error) {
	sasQueryParams, err := sas.BlobSignatureValues{
		Protocol:      sas.ProtocolHTTPS,
		StartTime:     time.Now().UTC().Add(-48 * time.Hour),
		ExpiryTime:    time.Now().UTC().Add(48 * time.Hour),
		Permissions:   to.Ptr(sas.ContainerPermissions{Read: true, Create: true, Write: true}).String(),
		ContainerName: containerName,
		BlobName:      blobName,
	}.SignWithSharedKey(credential)
	if err != nil {
		log.Error(err.Error())
		return "", "", err
	}

	token = sasQueryParams.Encode()
	url = fmt.Sprintf("https://%s.blob.core.windows.net/%s/%s", accountName, containerName, blobName)
	return url, token, nil
}

func startCopyWithAccountKey(srcAccountName string, srcContainerName string, dstAccountName string, dstContainerName string, srcBlobName string) (err error) {
	ctx := context.Background()

	dstUrl, err := url.Parse(fmt.Sprintf("https://%s.blob.core.windows.net/%s/%s", dstAccountName, dstContainerName, srcBlobName))
	handleError(err)

	srcAccountKey, exists := os.LookupEnv("SRC_ACCOUNT_KEY")
	if !exists {
		log.Fatal("'SRC_ACCOUNT_KEY' not found")
		return
	}

	dstAccountKey, exists := os.LookupEnv("DST_ACCOUNT_KEY")
	if !exists {
		log.Fatal("'DST_ACCOUNT_KEY' not found")
		return
	}

	srcSharedKeyCredential, err := azblob.NewSharedKeyCredential(srcAccountName, srcAccountKey)
	if err != nil {
		log.Error(err.Error())
		return err
	}

	dstSharedKeyCredential, err := azblob.NewSharedKeyCredential(dstAccountName, dstAccountKey)
	if err != nil {
		log.Error(err.Error())
		return err
	}

	uri, token, err := getSASToken(srcAccountName, srcContainerName, srcBlobName, srcSharedKeyCredential)
	sasTokenURI := fmt.Sprintf("%s?%s", uri, token)
	if err != nil {
		log.Error(err.Error())
		return err
	}

	src, _ := url.Parse(sasTokenURI)
	blockBlobClient, err := blockblob.NewClientWithSharedKeyCredential(dstUrl.String(), dstSharedKeyCredential, nil)
	if err != nil {
		log.Error(err.Error())
		return err
	}

	copyOperation, err := blockBlobClient.StartCopyFromURL(ctx, src.String(), nil)
	if err != nil {
		log.Error(err.Error())
		return err
	}

	copyID := copyOperation.CopyID
	copyStatus := copyOperation.CopyStatus

	log.Info(fmt.Sprintf("Copying %s --> %s\nid:%s\n", uri, blockBlobClient.URL(), *copyID))

	bar := progressbar.NewOptions(100, progressbar.OptionSetPredictTime(true))

	for *copyStatus == *copyOperation.CopyStatus {
		getMetadata, err := blockBlobClient.GetProperties(ctx, nil)
		if err != nil {
			log.Error(err.Error())
			return err
		}

		copyStatus = getMetadata.CopyStatus
		copyCompleted, err := strconv.ParseFloat(strings.Split(*getMetadata.CopyProgress, "/")[0], 64)
		if err != nil {
			log.Error(err.Error())
			return err
		}

		copyTotal, err := strconv.ParseFloat(strings.Split(*getMetadata.CopyProgress, "/")[1], 64)
		if err != nil {
			log.Error(err.Error())
			return err
		}

		percentComplete := (copyCompleted / copyTotal) * 100
		bar.Set(int(percentComplete))
		time.Sleep(500 * time.Millisecond)
	}
	err = bar.Finish()
	handleError(err)
	fmt.Println("")
	log.Info("Copy complete")

	return nil
}
