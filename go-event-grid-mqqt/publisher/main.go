package main

import (
	"crypto/tls"
	"crypto/x509"
	"flag"
	"fmt"
	"log"
	"os"
	"strconv"
	"time"

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
var sleepInSeconds = flag.Int("sleepInSeconds", 1, "sleep in seconds")

var messagePubHandler mqtt.MessageHandler = func(client mqtt.Client, msg mqtt.Message) {
	fmt.Printf("Received message: '%s' from topic: '%s'\n", msg.Payload(), msg.Topic())
}

var connectHandler mqtt.OnConnectHandler = func(client mqtt.Client) {
	println("Connected: " + strconv.FormatBool(client.IsConnected()))
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

func pub(client mqtt.Client) {
	num := 10
	for i := 0; i < num; i++ {
		text := fmt.Sprintf("Message %d", i)
		fmt.Printf("publishing event: '%s'\n", text)
		token := client.Publish(*strTopicPath, 0, false, text)
		token.Wait()
		time.Sleep(time.Duration(*sleepInSeconds) * time.Second)
	}
}

func appCleanup(client mqtt.Client) {
	log.Printf("disconnecting client...")
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
	opts.SetDefaultPublishHandler(messagePubHandler)
	opts.OnConnect = connectHandler
	opts.OnConnectionLost = connectLostHandler
	tlsConfig := NewTlsConfig()
	opts.SetTLSConfig(tlsConfig)
	client := mqtt.NewClient(opts)
	if token := client.Connect(); token.Wait() && token.Error() != nil {
		panic(token.Error())
	}

	pub(client)

}
