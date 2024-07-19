import { Configuration, PopupRequest } from "@azure/msal-browser";

// Config object to be passed to Msal on creation
export const msalConfig: Configuration = {
  auth: {
    clientId: import.meta.env.VITE_CLIENT_ID,
    authority: import.meta.env.VITE_AUTHORITY,
    redirectUri: import.meta.env.VITE_REDIRECT_URI,
    postLogoutRedirectUri: import.meta.env.VITE_POST_LOGOUT_REDIRECT_URI,
  },
};

// Add here scopes for id token to be used at MS Identity Platform endpoints.
export const loginRequest: PopupRequest = {
  scopes: ["api://a39ecde7-73e9-4866-a016-88e28952cefd/Bookings.Read"]
};

export const apiConfig = {
  flightEndpoint: import.meta.env.VITE_FLIGHT_ENDPOINT,
  customerEndpoint: import.meta.env.VITE_CUSTOMER_ENDPOINT,
  bookingEndpoint: import.meta.env.VITE_BOOKING_ENDPOINT
};
