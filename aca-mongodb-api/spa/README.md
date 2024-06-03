Before starting the server, add the followign information to the `.env.local` file:

```shell
VITE_CLIENT_ID='<application (client) ID of EntraID React app registration>'
VITE_AUTHORITY='https://login.microsoftonline.com/<tenant GUID>'
VITE_REDIRECT_URI='http://localhost:3000'
VITE_POST_LOGOUT_REDIRECT_URI='http://localhost:3000'
VITE_FLIGHT_ENDPOINT='https://<apim-name>.azure-api.net/flight-api'
VITE_CUSTOMER_ENDPOINT='https://<apim-name>.azure-api.net/customer-api'
VITE_BOOKING_ENDPOINT='https://<apim-name>.azure-api.net/booking-api'
```

Start the development server: `npm run dev`
