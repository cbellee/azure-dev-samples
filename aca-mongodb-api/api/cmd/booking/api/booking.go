package booking

import (
	"context"
	"encoding/json"
	"log/slog"
	"net/http"
	"time"

	"github.com/google/uuid"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	"github.com/cbellee/go-flight/cmd/booking/models"
)

type API struct {
	Connection     *mongo.Client
	DBName         string
	CollectionName string
}

func NewAPI(connectionString, db, collection string) *API {
	return &API{Connection: getConnection(connectionString), DBName: db, CollectionName: collection}
}

func getConnection(connectionString string) *mongo.Client {
	ctx, cancel := context.WithTimeout(context.Background(), time.Second*10)
	defer cancel()

	clientOptions := options.Client().ApplyURI(connectionString)
	c, err := mongo.Connect(ctx, clientOptions)
	if err != nil {
		slog.Error("unable to connect to MongoDB", "error", err)
	}

	err = c.Ping(ctx, nil)
	if err != nil {
		slog.Error("unable to ping MongoDB", "error", err)
		return nil
	}

	slog.Info("Connected to MongoDB")
	return c
}

func (a API) Close() {
	err := a.Connection.Disconnect(context.Background())
	if err != nil {
		slog.Error("unable to disconnect from MongoDB", "error", err)
	}
	slog.Info("Disconnected from MongoDB")
}

func (api API) Create(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Create a booking
	var booking models.Booking
	err := json.NewDecoder(r.Body).Decode(&booking)
	if err != nil {
		slog.Info("unable to decode booking", "error", err)
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	booking.Date = time.Now()
	booking.ID = uuid.New().String()

	slog.Info("booking object", "object", booking)

	/* 	findResult := coll.FindOne(ctx, bson.M{"customerId": booking.CustomerID, "flightId": booking.FlightID, "date": booking.Date.Format("2006-01-02")})
	   	if findResult != nil {
	   		slog.Info("booking already exists", "customerId", booking.CustomerID, "flightId", booking.FlightID, "date", booking.Date.Format("2006-01-02"))
	   		w.WriteHeader(http.StatusBadRequest)
	   		return
	} */

	slog.Info("Inserting booking", "id", booking.ID, "customerId", booking.CustomerID, "flightId", booking.FlightID, "date", booking.Date)
	insertResult, err := coll.InsertOne(ctx, booking)
	if err != nil {
		slog.Info("unable to insert booking", "error", err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	id := insertResult.InsertedID.(primitive.ObjectID)
	slog.Info("Inserted booking", "id", id)
	w.WriteHeader(http.StatusCreated)
}

func (api API) Read(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)

	// Read a booking
	var booking models.Booking

	// determine if a booking is being requested by ID or by customer ID and flight number
	//id := r.URL.Query().Get("customerId")
	//flightNumber := r.URL.Query().Get("flightNumber")
	id := r.PathValue("id")

	res := coll.FindOne(ctx, bson.M{"id": id})
	if res.Err() != nil {
		slog.Info("unable to find booking", "error", res.Err())
		w.WriteHeader(http.StatusNotFound)
		return
	}

	res.Decode(&booking)
	slog.Info("Found booking", "id", booking.ID)
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(booking)
}

func (api API) ReadBookingByFlightNumberAndCustomerId(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)

	// Read a booking
	var booking models.Booking

	// determine if a booking is being requested by ID or by customer ID and flight number
	customerID := r.URL.Query().Get("customerId")
	flightNumber := r.URL.Query().Get("flightNumber")

	res := coll.FindOne(ctx, bson.M{"customerId": customerID, "flightNumber": flightNumber})
	if res.Err() != nil {
		slog.Info("unable to find booking", "error", res.Err())
		w.WriteHeader(http.StatusNotFound)
		return
	}

	res.Decode(&booking)
	slog.Info("Found booking", "customerId", booking.CustomerID)
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(booking)
}

func (api API) ReadAll(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)

	// Read a booking
	var bookings []models.Booking
	var emptySlice = make([]models.Booking, 0)
	cursor, err := coll.Find(ctx, bson.M{})
	if err != nil {
		slog.Info("unable to find any bookings", "error", err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	for cursor.Next(ctx) {
		var booking models.Booking
		err := cursor.Decode(&booking)
		if err != nil {
			slog.Info("unable to decode booking", "error", err)
			w.WriteHeader(http.StatusInternalServerError)
			return
		}
		slog.Info("found booking", "id", booking.ID, "customerId", booking.CustomerID, "flightId", booking.FlightID, "date", booking.Date)
		bookings = append(bookings, booking)
	}

	slog.Info("found bookings", "count", len(bookings))
	w.WriteHeader(http.StatusOK)
	if len(bookings) == 0 {
		json.NewEncoder(w).Encode(emptySlice)
	} else {
		json.NewEncoder(w).Encode(bookings)
	}
}

func (api API) Delete(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)

	// Delete booking
	id := r.URL.Query().Get("id")

	result := coll.FindOneAndDelete(ctx, bson.M{"id": id})
	if result.Err() != nil && result.Err() != mongo.ErrNoDocuments {
		slog.Info("unable to find booking", "id", id, "error", result.Err())
		w.WriteHeader(http.StatusNotFound)
		return
	} else if result.Err() != nil {
		slog.Info("unable to delete booking", "id", id, "error", result.Err())
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	slog.Info("Deleted booking", "id", id)
	w.WriteHeader(http.StatusNoContent)
}
