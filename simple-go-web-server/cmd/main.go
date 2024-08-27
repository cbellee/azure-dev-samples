package main

import (
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"

	"os"
	"time"
)

var (
	portNumber = os.Getenv("SERVICE_PORT")
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		reqDump, err := httputil.DumpRequest(r, false)
		if err != nil {
			log.Fatal(err)
		}

		fmt.Printf("REQUEST:\n%s", string(reqDump))
		t := time.Now().Format(time.RFC3339Nano)
		w.Write([]byte(t))
	})

	port := fmt.Sprintf(":%s", portNumber)
	log.Printf("Starting server on port %s...", port)
	err := http.ListenAndServe(port, nil)
	if err != nil {
		log.Fatal(err)
	}
}
