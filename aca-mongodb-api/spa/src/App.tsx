import { Routes, Route, useNavigate } from "react-router-dom";
import { MsalProvider } from "@azure/msal-react";

import type { AppProps } from "./types";

import { CustomNavigationClient } from "./NavigationClient";

import { Home } from "./components/Home";
import { Booking } from "./components/Booking";
import { Customer } from "./components/Customer";
import { Flight } from "./components/Flight";

export function App({ pca }: AppProps) {
  // The next 3 lines are optional. This is how you configure MSAL to take advantage of the router's navigate functions when MSAL redirects between pages in your app
  const navigate = useNavigate();
  const navigationClient = new CustomNavigationClient(navigate);
  pca.setNavigationClient(navigationClient);

  return (
    <MsalProvider instance={pca}>
      <Routes>
        <Route path="/flight" element={<Flight />} />
        <Route path="/customer" element={<Customer />} />
        <Route path="/booking" element={<Booking />} />
        <Route path="/" element={<Home />} />
      </Routes>
    </MsalProvider>
  );
}
