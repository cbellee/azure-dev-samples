import { loginRequest, apiConfig } from "./authConfig";
import { msalInstance } from "./main";

export async function callFlightApi(endpoint: string) {
  const account = msalInstance.getActiveAccount();
  if (!account) {
    throw Error(
      "No active account! Verify a user has been signed in and setActiveAccount has been called."
    );
  }

  const response = await msalInstance.acquireTokenSilent({
    ...loginRequest,
    account: account,
  });

  const headers = new Headers();
  const bearer = `Bearer ${response.accessToken}`;

  console.log(bearer);

  headers.append("Authorization", bearer);

  const options = {
    method: "GET",
    headers: headers,
  };

  return await fetch(endpoint, options)
    .then((response) => {
      console.log(response.status);
      return response.json();
    })
    .catch((error) => {
      console.error(error.message);
      return error.message;
    });
}
