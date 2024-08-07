ENVIRONMENT := dev
VERSION := 0.1.0
TAG := ${ENVIRONMENT}-${VERSION}
BUILD_INFO := "dapr bet demo"
ACR_LOGIN_NAME := daprbet891237
ACR_URI := daprbet891237.azurecr.io
ACCOUNTS_SERVICE_PORT := 8002
RESULTS_SERVICE_PORT := 8003
BETS_SERVICE_PORT := 8004
RACES_SERVICE_PORT := 8005

#### export shell env vars #####
source ./.env

build_results:
	docker build -t ${ACR_URI}/results:${TAG} --build-arg SERVICE_NAME="results" --build-arg SERVICE_PORT=${RESULTS_SERVICE_PORT} --build-arg BUILD_INFO=${BUILD_INFO} --build-arg VERSION=${VERSION} -f Dockerfile .
	docker image prune -f

build_bets:
	docker build -t ${ACR_URI}/bets:${TAG} --build-arg SERVICE_NAME="bets" --build-arg SERVICE_PORT=${BETS_SERVICE_PORT} --build-arg BUILD_INFO=${BUILD_INFO} --build-arg VERSION=${VERSION} -f Dockerfile .
	docker image prune -f

build_accounts:
	docker build -t ${ACR_URI}/accounts:${TAG} --build-arg SERVICE_NAME="accounts" --build-arg SERVICE_PORT=${ACCOUNTS_SERVICE_PORT} --build-arg BUILD_INFO=${BUILD_INFO} --build-arg VERSION=${VERSION} -f Dockerfile .
	docker image prune -f

build_races:
	docker build -t ${ACR_URI}/races:${TAG} --build-arg SERVICE_NAME="races" --build-arg SERVICE_PORT=${RACES_SERVICE_PORT} --build-arg BUILD_INFO=${BUILD_INFO} --build-arg VERSION=${VERSION} -f Dockerfile .
	docker image prune -f


build: build_results build_bets build_accounts build_races

push_results:
	az acr login --name ${ACR_URI}
	docker push ${ACR_URI}/results:${TAG}

push_bets:
	az acr login --name ${ACR_URI}
	docker push ${ACR_URI}/bets:${TAG}

push_accounts:
	az acr login --name ${ACR_URI}
	docker push ${ACR_URI}/accounts:${TAG}

push_races:
	az acr login --name ${ACR_URI}
	docker push ${ACR_URI}/races:${TAG}

push: push_results push_bets push_accounts push_races

deploy_results:
	@if [ -z $(kubectl get deployment results) = *"Error from server (NotFound)"* ]; then\
		kubectl apply -f ./manifests/deploy.results.yml;\
	fi
	@if [ -z $(kubectl get deployment results) != *"Error from server (NotFound)"* ]; then\
		kubectl delete deploy results;\
		kubectl apply -f ./manifests/deploy.results.yml;\
	fi

deploy_bets:
		@if [ -z $(kubectl get deployment bets) = *"Error from server (NotFound)"* ]; then\
		kubectl apply -f ./manifests/deploy.bets.yml;\
	fi
	@if [ -z $(kubectl get deployment bets) != *"Error from server (NotFound)"* ]; then\
		kubectl delete deploy bets;\
		kubectl apply -f ./manifests/deploy.bets.yml;\
	fi

deploy_accounts:
	@if [ -z $(kubectl get deployment accounts) = *"Error from server (NotFound)"* ]; then\
		kubectl apply -f ./manifests/deploy.accounts.yml;\
	fi
	@if [ -z $(kubectl get deployment accounts) != *"Error from server (NotFound)"* ]; then\
		kubectl delete deploy accounts;\
		kubectl apply -f ./manifests/deploy.accounts.yml;\
	fi

deploy_races:
	@if [ -z $(kubectl get deployment races) = *"Error from server (NotFound)"* ]; then\
		kubectl apply -f ./manifests/deploy.races.yml;\
	fi
	@if [ -z $(kubectl get deployment races) != *"Error from server (NotFound)"* ]; then\
		kubectl delete deploy races;\
		kubectl apply -f ./manifests/deploy.races.yml;\
	fi

deploy: deploy_results deploy_bets deploy_accounts deploy_races

logs_results:
	kubectl logs $$(kubectl get pods --selector=app=results --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') results -f

logs_bets:
	kubectl logs $$(kubectl get pods --selector=app=bets --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') bets -f

logs_accounts:
	kubectl logs $$(kubectl get pods --selector=app=accounts --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') accounts -f

logs_races:
	kubectl logs $$(kubectl get pods --selector=app=races --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') races -f

logs_results_dapr:
	kubectl logs $$(kubectl get pods --selector=app=results --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') daprd -f

logs_bets_dapr:
	kubectl logs $$(kubectl get pods --selector=app=bets --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') daprd -f

logs_accounts_dapr:
	kubectl logs $$(kubectl get pods --selector=app=accounts --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') daprd -f

logs_races_dapr:
	kubectl logs $$(kubectl get pods --selector=app=races --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}') daprd -f

deploy_dapr_components:
	# deploy AAD pod identity 
	kubectl apply -f ./manifests/azure.pod.identity.yml
	kubectl apply -f ./components/dapr-bet.secretstore.yml
	
	# add secrets to key vault
	az keyvault secret set --name cosmosDbConnectionString --vault-name dapr-bet-kv --value ${cosmosDbConnectionString}
	az keyvault secret set --name cosmosDbMasterKey --vault-name dapr-bet-kv --value ${cosmosDbMasterKey}
	az keyvault secret set --name cosmosDbUrl --vault-name dapr-bet-kv --value ${cosmosDbUrl}
	az keyvault secret set --name aiInstrumentationKey --vault-name dapr-bet-kv --value ${aiInstrumentationKey}
	az keyvault secret set --name aiApiKey --vault-name dapr-bet-kv --value ${aiApiKey}
	az keyvault secret set --name signalrConnectionString --vault-name dapr-bet-kv --value ${signalrConnectionString}
	az keyvault secret set --name sbConnectionString --vault-name dapr-bet-kv --value ${sbConnectionString}

	# apply ai forwarder manifests
	kubectl apply -f ./manifests/appinsights.forwarder.yml
	kubectl apply -f ./manifests/dapr-bet.exporter.appinsights.yml
	kubectl apply -f ./components/dapr-bet.tracing.yml

	# apply dapr components
	kubectl apply -f ./components/dapr-bet.cosmosdb.binding.bets.yml
	kubectl apply -f ./components/dapr-bet.cosmosdb.binding.accounts.yml
	kubectl apply -f ./components/dapr-bet.cosmosdb.binding.results.yml
	kubectl apply -f ./components/dapr-bet.cosmosdb.statestore.bets.yml
	kubectl apply -f ./componentss/dapr-bet.cosmosdb.statestore.accounts.yml
	kubectl apply -f ./components/dapr-bet.pubsub.servicebus.yml
	kubectl apply -f ./components/dapr-bet.binding.signalr.yml
