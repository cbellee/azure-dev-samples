package main

import (
	"log"
	"net/http"
	"os"

	"github.com/cbellee/dapr-bet/cmd/accounts/impl"
	"github.com/cbellee/dapr-bet/cmd/accounts/spec"
	"github.com/dapr/go-sdk/service/common"
)

var (
	version               = "0.0.1"
	buildInfo             = "No build details"
	serviceName           = "accounts"
	servicePort           = "8002"
	cosmosDbName          = "accounts"
	cosmosDbContainerName = "default"
	cosmosDbKey           = os.Getenv("COSMOS_DB_KEY")
	cosmosDbURL           = os.Getenv("COSMOS_DB_URL")
	storeName             = "accounts-statestore"
	pubSubName            = "messagebus"
	secretStoreName       = "azurekeyvault"
	logger                = log.New(os.Stdout, "", 0)
)

var sub = &common.Subscription{
	PubsubName: pubSubName,
	Topic:      "payments",
	Route:      "/",
}

var components = spec.DaprComponents{
	MessageBusName: pubSubName,
	StateStoreName: storeName,
}

// API type
type API struct {
	service spec.AccountsService
}

func main() {
	logger.Printf("### Dapr: %v v%v starting...", serviceName, version)

	api := API{
		impl.NewService(serviceName, servicePort, components),
	}

	if err := api.service.AddTopicHandler(sub, api.service.CalculateBalance); err != nil {
		logger.Fatalf("error adding topic subscription: %v", err)
	}

	if err := api.service.AddServiceHandler("/get", api.service.GetAccount); err != nil {
		logger.Fatalf("error adding 'GetAccounts' invocation handler: %v", err)
	}

	if err := api.service.AddServiceHandler("/add", api.service.AddAccount); err != nil {
		logger.Fatalf("error adding 'AddAccounts' invocation handler: %v", err)
	}

	if err := api.service.StartService(); err != nil && err != http.ErrServerClosed {
		logger.Fatalf("error: %v", err)
	}
}
