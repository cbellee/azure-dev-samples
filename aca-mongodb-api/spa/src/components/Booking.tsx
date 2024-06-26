import {
  InteractionStatus,
  InteractionType,
  InteractionRequiredAuthError,
} from "@azure/msal-browser";

import type { AccountInfo } from "@azure/msal-browser";
import type { BookingData } from "../types";

import { MsalAuthenticationTemplate, useMsal } from "@azure/msal-react";
import { useEffect, useState } from "react";
import { loginRequest } from "../authConfig";
import { get } from "../FlightApiCall";
import { ErrorComponent } from "./ErrorComponent";
import { Loading } from "./Loading";
import { apiConfig } from "../authConfig";

const BookingContent = () => {
  const { instance, inProgress } = useMsal();
  const [data, setData] = useState<null | BookingData[]>(null);
  const [error, setError] = useState<null | Error>(null);
  const [loading, setLoading] = useState<boolean>(false);

  useEffect(() => {
    if (!data && inProgress === InteractionStatus.None) {
      get(apiConfig.bookingEndpoint + "/bookings")
        .then(data => {
          setData(data);
          setLoading(false);
        })
        .catch(error => {
          console.log("error: " + error);
          setError(error);
          setLoading(false);
        })
        .catch((e: Error) => {
          if (e instanceof InteractionRequiredAuthError) {
            instance.acquireTokenRedirect({
              ...loginRequest,
              account: instance.getActiveAccount() as AccountInfo,
            });
          }
        });
    }
  }, [inProgress, data, instance]);

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error.message}</div>
  }

  if (!data || data.length <= 0) {
    return <div>No Bookings found</div>;
  }

  return (
    <table>
      <tbody>
        <tr key={"header"}>
          {Object.keys(data[0]).map((key) => (
            <th key={key}>{key}</th>
          ))}
        </tr>
        {data.map((item) => (
          <tr key={item.id}>
            {Object.values(item).map((val) => (
              <td key={val}>{val}</td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export function Booking() {
  return (
    <MsalAuthenticationTemplate
      interactionType={InteractionType.Redirect}
      authenticationRequest={{ ...loginRequest }}
      errorComponent={ErrorComponent}
      loadingComponent={Loading}
    >
      <BookingContent />
    </MsalAuthenticationTemplate>
  );
}
