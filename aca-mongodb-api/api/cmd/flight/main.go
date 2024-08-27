package main

import (
	"context"
	"log/slog"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	flight "github.com/cbellee/go-flight/cmd/flight/api"
	"github.com/cbellee/go-flight/utils"
)

var (
	flightAPI *flight.API
	port      string
)

func init() {
	cxnStr := utils.GetEnvVar("MONGO_DB_CXN")
	dbName := utils.GetEnvVar("MONGO_DB_NAME")
	collectionName := utils.GetEnvVar("MONGO_DB_COLLECTION")
	port = utils.GetEnvVar("PORT")
	flightAPI = flight.NewAPI(cxnStr, dbName, collectionName)
}

func main() {
	router := http.NewServeMux()

	router.HandleFunc("GET /flights", flightAPI.ReadAll)
	router.HandleFunc("GET /flight/{id}", flightAPI.Read)
	router.HandleFunc("POST /flights", flightAPI.Create)
	router.HandleFunc("DELETE /flight/{id}", flightAPI.Delete)

	server := http.Server{Addr: ":" + port, Handler: router}

	slog.Info("starting server", "port", port)
	go func() {
		err := server.ListenAndServe()
		if err != nil && err != http.ErrServerClosed {
			slog.Error("failed to start server", "error", err)
		}
	}()

	exit := make(chan os.Signal)
	signal.Notify(exit, syscall.SIGTERM, syscall.SIGINT)
	<-exit

	slog.Info("shutting down server")

	c, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer func() {
		flightAPI.Close()
		cancel()
	}()

	err := server.Shutdown(c)
	if err != nil {
		slog.Error("failed to shutdown server", "error", err)
	}

	slog.Info("server shutdown")
}
