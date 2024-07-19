package customer_test

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/cbellee/go-flight/cmd/customer/api"
)

func TestCreate(t *testing.T) {
	// Create a new API instance
	api := customer.NewAPI("connectionString", "dbName", "collectionName")

	// Create a mock HTTP request and response
	req := httptest.NewRequest(http.MethodPost, "/create", nil)
	w := httptest.NewRecorder()

	// Call the Create method
	api.Create(w, req)

	// Check the response status code
	if w.Code != http.StatusCreated {
		t.Errorf("Expected status code %d, got %d", http.StatusCreated, w.Code)
	}

	// Check the response body
	expectedBody := `{"message": "Booking created successfully"}`
	if w.Body.String() != expectedBody {
		t.Errorf("Expected response body %s, got %s", expectedBody, w.Body.String())
	}
}
