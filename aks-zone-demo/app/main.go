package main

import (
	"bufio"
	"context"
	"encoding/json"
	"flag"
	"fmt"
	"html/template"
	"log/slog"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/moby/sys/mountinfo"

	v1 "k8s.io/api/core/v1"
	k8sErrors "k8s.io/apimachinery/pkg/api/errors"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/client-go/kubernetes"
	"k8s.io/client-go/rest"
	"k8s.io/client-go/tools/clientcmd"
	"k8s.io/client-go/util/homedir"
)

var (
	filePath  = "/mnt/info"
	namespace = os.Getenv("POD_NAMESPACE")
	podName   = os.Getenv("HOSTNAME")
	clientset = &kubernetes.Clientset{}
	port      = "8080"
)

func init() {
	var loggingLevel = new(slog.LevelVar)
	logger := slog.New(slog.NewJSONHandler(os.Stdout, nil))
	slog.SetLogLoggerLevel(loggingLevel.Level())
	slog.SetDefault(logger)
}

func main() {
	isExternal := flag.Bool("external", false, "specify this flag if the application is running outside of a Kubernetes cluster")

	clientset := createK8sClient(*isExternal)
	pi := getPodInfo(*clientset, podName, namespace)

	if isMounted(filePath) {
		writePodInfoToFile(filePath, pi)
	}

	http.HandleFunc("/", serveTemplate)
	http.HandleFunc("/info", handleInfo)

	fmt.Printf("Server is running on http://localhost:%s", port)
	http.ListenAndServe(fmt.Sprintf(":%s", port), nil)
}

func createK8sClient(isExternal bool) *kubernetes.Clientset {
	config := &rest.Config{}
	var err error

	if isExternal {
		var kubeconfig *string
		if home := homedir.HomeDir(); home != "" {
			kubeconfig = flag.String("kubeconfig", filepath.Join(home, ".kube", "config"), "(optional) absolute path to the kubeconfig file")
		} else {
			kubeconfig = flag.String("kubeconfig", "", "absolute path to the kubeconfig file")
		}
		flag.Parse()
		config, err = clientcmd.BuildConfigFromFlags("", *kubeconfig)
		if err != nil {
			panic(err.Error())
		}
	} else {
		config, err = rest.InClusterConfig()
		if err != nil {
			panic(err.Error())
		}
	}
	cs, err := kubernetes.NewForConfig(config)
	if err != nil {
		panic(err.Error())
	}
	return cs
}

func serveTemplate(w http.ResponseWriter, r *http.Request) {
	tmpl := template.Must(template.ParseFiles(("templates/layout.html")))

	podData := getPodInfo(*clientset, podName, namespace)
	fileData := []PodInfo{}

	mountPath := fmt.Sprintf("/%s", strings.Split(filePath, "/")[0])

	if isMounted(mountPath) {
		fileData = readFile(filePath)
	}

	data := FileInfo{
		PodData:  podData,
		FileData: fileData,
	}

	tmpl.Execute(w, data)
}

func isMounted(path string) bool {
	isMounted, err := mountinfo.Mounted("/mnt")
	if err != nil {
		slog.Error("unabel to detect mount point", "path", path, "error", err)
	}
	return isMounted
}

func handleInfo(w http.ResponseWriter, r *http.Request) {
	pi := getPodInfo(*clientset, podName, namespace)

	jsonPod, err := json.Marshal(pi)
	if err != nil {
		slog.Error("error marshalling json", "error", err)
		return
	}

	_, err = w.Write(jsonPod)
	if err != nil {
		slog.Error("error writing json", "error", err)
		return
	}
}

func readFile(fp string) []PodInfo {
	file, err := os.Open(fp)
	if err != nil {
		fmt.Println(err)
		return nil
	}

	fileScanner := bufio.NewScanner(file)
	fileScanner.Split(bufio.ScanLines)
	var arrPi []PodInfo

	for fileScanner.Scan() {
		line := fileScanner.Text()

		pi := PodInfo{}
		json.Unmarshal([]byte(line), &pi)

		arrPi = append(arrPi, pi)
	}

	file.Close()
	return arrPi
}

func writePodInfoToFile(fp string, pi PodInfo) {
	f, err := os.OpenFile(fp, os.O_APPEND|os.O_WRONLY|os.O_CREATE, 0600)
	if err != nil {
		fmt.Printf("Error: %s", err)
		return
	}

	defer f.Close()

	jsonPod, err := json.Marshal(pi)
	if err != nil {
		fmt.Printf("Error: %s", err)
		return
	}

	if _, err = f.WriteString(string(jsonPod) + "\n"); err != nil {
		fmt.Printf("Error: %s", err)
		return
	} else {
		slog.Error("successfully wrote to file", "name", f.Name())
	}
}

func getPodInfo(client kubernetes.Clientset, podName string, podNamespace string) PodInfo {
	nodes, err := client.CoreV1().Nodes().List(context.TODO(), metav1.ListOptions{})
	if err != nil {
		panic(err.Error())
	}

	p := PodInfo{}
	for _, n := range nodes.Items {
		labels := n.GetLabels()
		pod, err := findPodInNamespaceOnNode(client, podName, podNamespace, n.Name)

		if err != nil || pod == nil {
			// pod not found, so continue loop from start
			continue
		} else {
			p.TimeGenerated = time.Now().Format("02-01-2006 15:04:05")
			p.Name = pod.Name
			p.Node = pod.Spec.NodeName
			p.Namespace = pod.Namespace
			p.Zone = labels["topology.kubernetes.io/zone"]
			p.Region = labels["topology.kubernetes.io/region"]
			p.DiskZone = labels["topology.disk.csi.azure.com/zone"]

			if labels != nil {
				slog.Info("pod zone info", "pod", &pod.Name, "node", n.Name, "region", fmt.Sprintf(labels["topology.kubernetes.io/region"]), "zone", fmt.Sprintf(labels["topology.kubernetes.io/zone"]), "disk zone", fmt.Sprintf(labels["topology.disk.csi.azure.com/zone"]))
			}
		}
	}
	return p
}

func findPodInNamespaceOnNode(client kubernetes.Clientset, podName string, namespace string, nodeName string) (*v1.Pod, error) {
	pods, err := client.CoreV1().Pods(namespace).List(context.TODO(), metav1.ListOptions{
		FieldSelector: "spec.nodeName=" + nodeName,
	})

	if k8sErrors.IsNotFound(err) {
		fmt.Printf("Pod '%s' not found in namespace '%s' on node '%s'\n", podName, namespace, nodeName)
		return nil, nil
	} else if statusError, isStatus := err.(*k8sErrors.StatusError); isStatus {
		fmt.Printf("Error getting pod '%s': '%s' in namespace '%s'\n", podName, statusError.ErrStatus.Message, namespace)
		return nil, err
	} else if err != nil {
		fmt.Printf("Error getting pod '%s': '%s' in namespace '%s'\n", podName, statusError.ErrStatus.Message, namespace)
		return nil, err
	} else {
		for _, pod := range pods.Items {
			if pod.Name == podName {
				fmt.Printf("Found '%s' pod in namespace '%s' on node '%s'\n", pod.Name, pod.Namespace, pod.Spec.NodeName)
				return &pod, nil
			}
		}
		return nil, nil
	}
}
