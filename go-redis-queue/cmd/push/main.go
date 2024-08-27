package main

import (
	"context"
	"crypto/tls"
	"log/slog"
	"os"
	"strconv"

	"github.com/redis/go-redis/v9"
)

func main() {
	logger := slog.New(slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{
		AddSource: true,
		Level:     slog.LevelInfo,
	}))
	slog.SetDefault(logger)

	ctx := context.Background()

	redisHost := os.Getenv("REDIS_HOST")
	redisPassword := os.Getenv("REDIS_PASSWORD")
	numItems := os.Getenv("NUM_ITEMS")

	op := &redis.Options{Addr: redisHost, Password: redisPassword, TLSConfig: &tls.Config{MinVersion: tls.VersionTLS12}}
	client := redis.NewClient(op)

	max, err := strconv.Atoi(numItems)
	if err != nil {
		slog.Error("error casting string to int", "error", err)
	}

	for i := 0; i <= max; i++ {
		slog.Info("pushing to queue...", "value", i)
		go push(ctx, *client, "jobs", i)
	}
}

func push(ctx context.Context, cl redis.Client, queue string, value interface{}) {
	err := cl.RPush(ctx, queue, value).Err()
	if err != nil {
		slog.Error("error pushing to Redis queue", "queue", queue, "error", err)
	}
}

func pop(ctx context.Context, cl redis.Client, queue string) {
	item, err := cl.RPop(ctx, queue).Result()
	if err != nil {
		slog.Error("error reading from queue", "error", err)
		return
	}
	slog.Info("read item from queue", "value", item)
}
