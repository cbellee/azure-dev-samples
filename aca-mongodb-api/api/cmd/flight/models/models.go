package models

import "time"

type Flight struct {
	ID            string    `json:"id,omitempty" bson:"id,omitempty"`
	Number  	  string    `json:"number,omitempty" bson:"number,omitempty"`
	Carrier       string    `json:"carrier,omitempty" bson:"carrier,omitempty"`
	Origin        string    `json:"origin,omitempty" bson:"origin,omitempty"`
	Destination   string    `json:"destination,omitempty" bson:"destination,omitempty"`
	Departure 	  time.Time `json:"departure,omitempty" bson:"departure,omitempty"`
	Arrival       time.Time `json:"arrival,omitempty" bson:"arrival,omitempty"`
	Price         int       `json:"price,omitempty" bson:"price,omitempty"`
}
