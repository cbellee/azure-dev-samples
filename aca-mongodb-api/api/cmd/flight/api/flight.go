package flight

import (
	"context"
	"encoding/json"
	"log/slog"
	"net/http"
	"time"

	"github.com/cbellee/go-flight/cmd/flight/models"
	"github.com/google/uuid"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
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

func (api API) Close() {
	err := api.Connection.Disconnect(context.Background())
	if err != nil {
		slog.Error("unable to disconnect from MongoDB", "error", err)
	}
	slog.Info("Disconnected from MongoDB")
}

func (api API) Create(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Create a flight
	var flight models.Flight
	err := json.NewDecoder(r.Body).Decode(&flight)
	if err != nil {
		slog.Info("unable to decode flight", "error", err)
		w.WriteHeader(http.StatusBadRequest)
		return
	}

	flight.ID = uuid.New().String()


	/* 	findResult := coll.FindOne(ctx, bson.M{"id": flight.ID})
	   	if findResult != nil {
	   		slog.Info("flight already exists", "id", flight.ID)
	   		w.WriteHeader(http.StatusBadRequest)
	   		return
	   	} */
		
    slog.Info("inserting flight", "id", flight.ID, "number", flight.Number, "carrier", flight.Carrier, "origin", flight.Origin, "destination", flight.Destination, "departure", flight.Departure, "arrival", flight.Arrival, "price", flight.Price)
	insertResult, err := coll.InsertOne(ctx, flight)
	if err != nil {
		slog.Info("unable to insert flight", "error", err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	id := insertResult.InsertedID.(primitive.ObjectID)
	slog.Info("Inserted flight", "id", id)
	w.WriteHeader(http.StatusCreated)
}

func (api API) Read(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Read a flight
	var flight models.Flight
	//id := r.URL.Query().Get("customerId")
	id := r.PathValue("id")

	res := coll.FindOne(ctx, bson.M{"id": id})
	if res.Err() != nil {
		slog.Info("unable to find flight", "error", res.Err())
		w.WriteHeader(http.StatusNotFound)
		return
	}

	res.Decode(&flight)
	slog.Info("Found flight", "id", flight.ID)
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(flight)
}

func (api API) ReadAll(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Read a flight
	var flights []models.Flight
	var emptySlice = make([]models.Flight, 0)
	cursor, err := coll.Find(ctx, bson.M{})
	if err != nil {
		slog.Info("unable to find any flights", "error", err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	for cursor.Next(ctx) {
		var flight models.Flight
		err := cursor.Decode(&flight)
		if err != nil {
			slog.Info("unable to decode flight", "error", err)
			w.WriteHeader(http.StatusInternalServerError)
			return
		}
		slog.Info("found flight", "id", flight.ID, "number", flight.Number, "carrier", flight.Carrier, "origin", flight.Origin, "destination", flight.Destination, "departure", flight.Departure, "arrival", flight.Arrival, "price", flight.Price)
		flights = append(flights, flight)
	}

	slog.Info("found flights", "count", len(flights))
	w.WriteHeader(http.StatusOK)
	if len(flights) <= 0 {
		json.NewEncoder(w).Encode(emptySlice)
	} else {
		json.NewEncoder(w).Encode(flights)
	}
}

func (api API) Delete(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Delete flight
	//id := r.URL.Query().Get("id")
	id := r.PathValue("id")

	result := coll.FindOneAndDelete(ctx, bson.M{"id": id})
	if result.Err() != nil && result.Err() != mongo.ErrNoDocuments {
		slog.Info("unable to find flight", "id", id, "error", result.Err())
		w.WriteHeader(http.StatusNotFound)
		return
	} else if result.Err() != nil {
		slog.Info("unable to delete flight", "id", id, "error", result.Err())
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	slog.Info("deleted flight", "id", id)
	w.WriteHeader(http.StatusNoContent)
}
