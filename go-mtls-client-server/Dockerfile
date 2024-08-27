FROM golang:alpine AS builder

WORKDIR /app
COPY ./go.mod .
RUN go mod download

COPY ./cmd/server/*.go ./
RUN go build -o /main

FROM golang:alpine AS runner

WORKDIR /
COPY --from=builder /main /main
ENTRYPOINT ["/main"]