package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func HelloServer(w http.ResponseWriter, req *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	w.Write([]byte("This is an example server.\n"))

	if req.TLS.PeerCertificates == nil || len(req.TLS.PeerCertificates) == 0 {
		fmt.Fprintf(w, "No client certificate\n")
		return
	} else {
		fmt.Fprintf(w, "Client certificate found\n")
		fmt.Fprintf(w, "Subject: %s\n", req.TLS.PeerCertificates[0].Subject)
		fmt.Fprintf(w, "DNS: %s\n", req.TLS.PeerCertificates[0].DNSNames)
		fmt.Fprintf(w, "ServerName: %s\n", req.TLS.ServerName)
	}
}

func main() {
	certFilePath, exists := os.LookupEnv("CERT_FILE_PATH")
	if !exists {
		certFilePath = "/etc/certs/tls.crt"
	}

	keyFilePath, exists := os.LookupEnv("KEY_FILE_PATH")
	if !exists {
		keyFilePath = "/etc/certs/tls.key"
	}

	port, exists := os.LookupEnv("PORT")
	if !exists {
		port = "8080"
	}

	http.HandleFunc("/", HelloServer)

	log.Printf("Listening on port %s\n", port)
	err := http.ListenAndServeTLS(fmt.Sprintf(":%s", port), certFilePath, keyFilePath, nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
