go build -o accounts-service . && dapr run --app-id accounts --app-protocol http --app-port 8002 --components-path ./components --log-level info ./server
