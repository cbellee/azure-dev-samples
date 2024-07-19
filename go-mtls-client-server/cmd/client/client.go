package main

import (
	"crypto/tls"
	"crypto/x509"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)

func main() {
	certFilePath, exists := os.LookupEnv("CERT_FILE_PATH")
	if !exists {
		log.Fatal("'CERT_FILE_PATH' not defined")
	}

	keyFilePath, exists := os.LookupEnv("KEY_FILE_PATH")
	if !exists {
		log.Fatal("'KEY_FILE_PATH' not defined")
	}

	url, exists := os.LookupEnv("SERVER_URL")
	if !exists {
		url = "go-api.kainiindustries.net"
	}

	port, exists := os.LookupEnv("PORT")
	if !exists {
		port = "443"
	}

	// Read the key pair to create certificate
	cert, err := tls.LoadX509KeyPair(certFilePath, keyFilePath)
	if err != nil {
		log.Fatal(err)
	}

	// Create a CA certificate pool and add cert.pem to it
	caCert, err := ioutil.ReadFile(certFilePath)
	if err != nil {
		log.Fatal(err)
	}
	caCertPool := x509.NewCertPool()
	caCertPool.AppendCertsFromPEM(caCert)

	// Create a HTTPS client and supply the created CA pool and certificate
	client := &http.Client{
		Transport: &http.Transport{
			TLSClientConfig: &tls.Config{
				RootCAs:      caCertPool,
				Certificates: []tls.Certificate{cert},
			},
		},
	}

	// Request /hello via the created HTTPS client over port 8443 via GET
	r, err := client.Get(fmt.Sprintf("https://%s:%s",url, port)) //("https://go-api.kainiindustries.net:8443/hello")
	if err != nil {
		log.Fatal(err)
	}

	// Read the response body
	defer r.Body.Close()
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Fatal(err)
	}

	// Print the response body to stdout
	fmt.Printf("%s\n", body)
}
