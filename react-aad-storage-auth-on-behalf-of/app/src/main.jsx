import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import Home from './components/Home.jsx'
import { MsalProvider } from "@azure/msal-react";
import { PublicClientApplication } from "@azure/msal-browser";
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import './index.css'
import './App.css'

const router = createBrowserRouter([
  {
    element: <Home />,
    path: "/home"
  },
]);

const msalConfiguration = {
  auth: {
    clientId: "8bf9bf46-aec6-4226-b686-ac7e043e8270",
    authority: "https://login.microsoftonline.com/kainiindustries.net",
    redirectUri: "/home"
  }
};

const pca = new PublicClientApplication(msalConfiguration);

ReactDOM.createRoot(document.getElementById('root')).render(
  <MsalProvider instance={pca}>
    <App />
  </MsalProvider>
)
