package main

import (
	"crypto/tls"
	"crypto/x509"
	"flag"
	"fmt"
	"log"
	"os"
	"os/signal"
	"strconv"
	"syscall"

	mqtt "github.com/eclipse/paho.mqtt.golang"
)

var strCaPath = flag.String("caPath", "", "ca certificate file path")
var strClientCertPath = flag.String("clientCertPath", "", "client certificate file path")
var strClientKeyPath = flag.String("clientKeyPath", "", "client key file path")
var strBrokerUri = flag.String("brokerUri", "", "broker Uri")
var strBrokerPort = flag.Int("brokerPort", 8883, "broker Port")
var strClientID = flag.String("clientID", "", "client ID")
var strClientUsername = flag.String("clientUsername", "", "client username")
var strTopicPath = flag.String("topicPath", "", "topic path")

var connectHandler mqtt.OnConnectHandler = func(client mqtt.Client) {
	println("Connected: " + strconv.FormatBool(client.IsConnected()))
	println("Connection open: " + strconv.FormatBool(client.IsConnectionOpen()))
}

var connectLostHandler mqtt.ConnectionLostHandler = func(client mqtt.Client, err error) {
	fmt.Printf("Connect lost: %v\n", err)
}

func NewTlsConfig() *tls.Config {
	certpool := x509.NewCertPool()
	ca, err := os.ReadFile(*strCaPath)
	if err != nil {
		log.Fatalln(err.Error())
	}

	certpool.AppendCertsFromPEM(ca)
	// Import client certificate/key pair
	clientKeyPair, err := tls.LoadX509KeyPair(*strClientCertPath, *strClientKeyPath)
	if err != nil {
		panic(err)
	}
	return &tls.Config{
		RootCAs:            certpool,
		ClientAuth:         tls.NoClientCert,
		ClientCAs:          nil,
		InsecureSkipVerify: true,
		Certificates:       []tls.Certificate{clientKeyPair},
	}
}

func sub(client mqtt.Client) {
	topic := *strTopicPath
	token := client.Subscribe(topic, 1, nil)
	token.Wait()
	err := token.Error()
	if err != nil {
		fmt.Printf("subscription error: %e\n", err.Error())
	}

	fmt.Printf("Subscribed to topic %s\n", topic)
}

func appCleanup(client mqtt.Client) {
	log.Printf("disconnecting client: %s\n")
	client.Disconnect(250)
}

func main() {
	flag.Parse()
	broker := fmt.Sprintf("mqtts://%s:%d", *strBrokerUri, *strBrokerPort)
	fmt.Println("broker: " + broker)

	opts := mqtt.NewClientOptions()
	opts.AddBroker(broker)
	opts.SetClientID(*strClientID)
	opts.SetUsername(*strClientUsername)
	opts.OnConnect = connectHandler
	opts.OnConnectionLost = connectLostHandler
	tlsConfig := NewTlsConfig()
	opts.SetTLSConfig(tlsConfig)
	client := mqtt.NewClient(opts)
	if token := client.Connect(); token.Wait() && token.Error() != nil {
		panic(token.Error())
	}

	sub(client)

	// Messages will be delivered asynchronously so we just need to wait for a signal to shutdown
	sig := make(chan os.Signal, 1)
	signal.Notify(sig, os.Interrupt)
	signal.Notify(sig, syscall.SIGTERM)

	<-sig
	fmt.Println("signal caught - exiting")
	client.Disconnect(1000)
	fmt.Println("shutdown complete")
}
