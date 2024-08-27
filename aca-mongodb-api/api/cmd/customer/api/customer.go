package customer

import (
	"context"
	"encoding/json"
	"log/slog"
	"net/http"
	"time"

	"github.com/cbellee/go-flight/cmd/customer/models"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	"github.com/google/uuid"
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

	// Create a customer
	var customer models.Customer
	err := json.NewDecoder(r.Body).Decode(&customer)
	if err != nil {
		slog.Info("unable to decode customer", "error", err)
		w.WriteHeader(http.StatusBadRequest)
		return
	}
	
	customer.ID = uuid.New().String()

	slog.Info("inserting customer", "id", customer.ID, "firstName", customer.FirstName, "lastName", customer.LastName, "address", customer.StreetAddress, "email", customer.Email, "phone", customer.Phone, "city", customer.City, "state", customer.State, "zip", customer.Zip, "country", customer.Country)
	insertResult, err := coll.InsertOne(ctx, customer)
	if err != nil {
		slog.Info("unable to insert customer", "error", err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	id := insertResult.InsertedID.(primitive.ObjectID)
	slog.Info("inserted customer", "id", id)
	w.WriteHeader(http.StatusCreated)
}

func (api API) Read(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Read a customer
	var customer models.Customer
	//id := r.URL.Query().Get("id")
	id := r.PathValue("id")

	res := coll.FindOne(ctx, bson.M{"id": id})
	if res.Err() != nil {
		slog.Info("unable to find customer", "error", res.Err())
		w.WriteHeader(http.StatusNotFound)
		return
	}

	res.Decode(&customer)
	slog.Info("Found customer", "id", customer.ID)
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(customer)
}

func (api API) ReadAll(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Read a customer
	var customers []models.Customer
	var emptySlice = make([]models.Customer, 0)
	cursor, err := coll.Find(ctx, bson.M{})
	if err != nil {
		slog.Info("unable to find any customers", "error", err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	for cursor.Next(ctx) {
		var customer models.Customer
		err := cursor.Decode(&customer)
		if err != nil {
			slog.Info("unable to decode customer", "error", err)
			w.WriteHeader(http.StatusInternalServerError)
			return
		}
		slog.Info("Found customer", "id", customer.ID, "firstName", customer.FirstName, "lastName", customer.LastName, "address", customer.StreetAddress, "city", customer.City, "state", customer.State, "zip", customer.Zip, "country", customer.Country)
		customers = append(customers, customer)
	}

	slog.Info("found customers", "count", len(customers))
	w.WriteHeader(http.StatusOK)
	if len(customers) == 0 {
		json.NewEncoder(w).Encode(emptySlice)
	} else {
		json.NewEncoder(w).Encode(customers)
	}
}

func (api API) Delete(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()
	coll := api.Connection.Database(api.DBName).Collection(api.CollectionName)
	slog.Info("db context", "db", api.DBName, "collection", api.CollectionName)

	// Delete customer
	//id := r.URL.Query().Get("id")
	id := r.PathValue("id")

	result := coll.FindOneAndDelete(ctx, bson.M{"id": id})
	if result.Err() != nil && result.Err() != mongo.ErrNoDocuments {
		slog.Info("unable to find customer", "id", id, "error", result.Err())
		w.WriteHeader(http.StatusNotFound)
		return
	} else if result.Err() != nil {
		slog.Info("unable to delete customer", "id", id, "error", result.Err())
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	slog.Info("Deleted customer", "id", id)
	w.WriteHeader(http.StatusNoContent)
}
