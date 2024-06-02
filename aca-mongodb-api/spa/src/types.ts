import type { IPublicClientApplication } from "@azure/msal-browser";

export type AppProps = {
  pca: IPublicClientApplication;
};

export type FlightData = {
  id: string;
  number: string;
  carrier: string;
  price: number;
  departure: string;
  arrival: string;
  origin: string;
  destination: string;
};

export type CustomerData = {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  phone: number;
  streetAddress: string;
  city: string;
  state: string;
  zip: number;
  country: string;
};

export type BookingData = {
  id: string;
  flightId: string;
  customerId: string;
  date: string;
};