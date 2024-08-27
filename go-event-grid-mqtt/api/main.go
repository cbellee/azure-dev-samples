package main

import (
	"context"
	"fmt"
	"log/slog"
	"net/http"
	"os"
	"strings"

	"github.com/dapr/go-sdk/service/common"
	daprd "github.com/dapr/go-sdk/service/http"
)

var (
	port    = getEnvVar("PORT", "8080")
	pubSubName = getEnvVar("PUBSUB_NAME", "eventgridcomponent")
	topicName  = getEnvVar("TOPIC_NAME", "device-telemetry")
	routeName = getEnvVar("ROUTE_NAME", "events")
)

func main() {
	s := daprd.NewService(fmt.Sprintf(":%s", port))

	sub := &common.Subscription{
		PubsubName: pubSubName,
		Topic:      topicName,
		Route:      fmt.Sprintf("/%s", routeName),
	}

	err := s.AddTopicEventHandler(sub, eventHandler)
	if err != nil {
		slog.Error("error adding topic subscription", "subscription", pubSubName, "topic", topicName, "route", routeName, "error", err)
	}

	if err := s.Start(); err != nil && err != http.ErrServerClosed {
		slog.Error("error starting server", "port", port, "error", err)
	}
}

func eventHandler(ctx context.Context, e *common.TopicEvent) (retry bool, err error) {
	slog.Info("event received", "name", e.PubsubName, "topic", e.Topic, "id", e.ID, "data", e.Data)
	return false, nil
}

func getEnvVar(key, fallbackValue string) string {
	if val, ok := os.LookupEnv(key); ok {
		return strings.TrimSpace(val)
	}
	return fallbackValue
}
