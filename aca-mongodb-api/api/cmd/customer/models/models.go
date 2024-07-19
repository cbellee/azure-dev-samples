package models

type Customer struct {
	ID            string `json:"id,omitempty" bson:"id,omitempty"`
	FirstName     string `json:"firstName,omitempty" bson:"firstName,omitempty"`
	LastName      string `json:"lastName,omitempty" bson:"lastName,omitempty"`
	Email		  string `json:"email,omitempty" bson:"email,omitempty"`
	Phone		  int 	 `json:"phone,omitempty" bson:"phone,omitempty"`
	StreetAddress string `json:"streetAddress,omitempty" bson:"streetAddress,omitempty"`
	City          string `json:"city,omitempty" bson:"city,omitempty"`
	State         string `json:"state,omitempty" bson:"state,omitempty"`
	Zip           int 	 `json:"zip,omitempty" bson:"zip,omitempty"`
	Country       string `json:"country,omitempty" bson:"country,omitempty"`
}
