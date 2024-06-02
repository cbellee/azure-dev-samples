package main

import (
	"context"
	"log/slog"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	booking "github.com/cbellee/go-flight/cmd/booking/api"
	"github.com/cbellee/go-flight/utils"
)

var (
	bookingAPI *booking.API
	port       string
)

func init() {
	cxnStr := utils.GetEnvVar("MONGO_DB_CXN")
	dbName := utils.GetEnvVar("MONGO_DB_NAME")
	collectionName := utils.GetEnvVar("MONGO_DB_COLLECTION")
	port = utils.GetEnvVar("PORT")
	bookingAPI = booking.NewAPI(cxnStr, dbName, collectionName)
}

func main() {
	router := http.NewServeMux()

	router.HandleFunc("GET /bookings", bookingAPI.ReadAll)
	router.HandleFunc("GET /booking/{id}", bookingAPI.Read)
	router.HandleFunc("GET /booking", bookingAPI.ReadBookingByFlightNumberAndCustomerId)
	router.HandleFunc("POST /bookings", bookingAPI.Create)
	router.HandleFunc("DELETE /booking/{id}", bookingAPI.Delete)

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
		bookingAPI.Close()
		cancel()
	}()

	err := server.Shutdown(c)
	if err != nil {
		slog.Error("failed to shutdown server", "error", err)
	}

	slog.Info("server shutdown")
}
