package models

import "time"

type Booking struct {
	ID         string    `json:"id,omitempty" bson:"id,omitempty"`
	CustomerID string    `json:"customerId,omitempty" bson:"customerId,omitempty"`
	FlightID   string    `json:"flightId,omitempty" bson:"flightId,omitempty"`
	Date       time.Time `json:"date,omitempty" bson:"date,omitempty"`
}
