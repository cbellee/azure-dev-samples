import React from "react";
import Home from './components/Home.jsx';
import Login from './components/Login.jsx';
import Logout from './components/Logout.jsx';
import { AuthenticatedTemplate, UnauthenticatedTemplate } from '@azure/msal-react';
import './App.css'

const App = () => {
  return (
    <>
      <AuthenticatedTemplate>
        <Home />
        <Logout />
      </AuthenticatedTemplate>
      <UnauthenticatedTemplate>
        <Login />
      </UnauthenticatedTemplate>
    </>
  );
}

export default App
