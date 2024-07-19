# build stage
FROM golang:latest AS build
COPY ./api/ /api
WORKDIR /api
RUN CGO_ENABLED=1 GOOS=linux go build -o handler .

# runtime stage
FROM mcr.microsoft.com/azure-functions/dotnet:4.9.1-appservice AS runtime
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY --from=build /api/ /home/site/wwwroot

RUN rm /home/site/wwwroot/handler.go
RUN rm /home/site/wwwroot/go.mod
RUN rm /home/site/wwwroot/go.sum
