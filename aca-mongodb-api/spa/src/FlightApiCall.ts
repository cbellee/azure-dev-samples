import { loginRequest, apiConfig } from "./authConfig";
import { msalInstance } from "./main";

export async function get(endpoint: string) {
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
  headers.append("Content-Type", "application/json");
  headers.append("X-Content-Type-Options", "nosniff");
  headers.append("Accept", "application/json");

  const options = {
    method: "GET",
    headers: headers,
  };

  try {
    const resp = await fetch(endpoint, options);
    if (!resp.ok) {
      throw new Error(`Error: ${resp.status} - ${resp.statusText}`);
    } else {
      const result = await resp.json();
      return result;
    }
  } catch (error) {
    throw error;
  }
}
