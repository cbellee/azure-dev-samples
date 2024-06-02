FROM golang:1.22-alpine as builder

ARG BUILD_TARGET
ARG PORT

WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -o api ./cmd/${BUILD_TARGET} 

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /app/api /api
EXPOSE ${PORT}
CMD ["/api"]
