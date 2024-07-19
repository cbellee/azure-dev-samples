import { useState, React } from "react";
import { BlobServiceClient } from '@azure/storage-blob';
import { InteractiveBrowserCredential } from '@azure/identity';
import { authConfig } from "../authConfig.js";

export default function Home() {

    const [hasError, setHasError] = useState(false);
    const [message, setMessage] = useState("");

    const account = authConfig.storageAccount;
    const credential = new InteractiveBrowserCredential({
        clientId: authConfig.clientId,
        tenantId: authConfig.tenantId,
        redirectUri: authConfig.redirectUri
    });

    const blobServiceClient = new BlobServiceClient(
        `https://${account}.blob.core.windows.net`,
        credential
    );

    const createContainer = (name) => {
        const createContainerResponse = blobServiceClient
            .getContainerClient(name)
            .create();

        createContainerResponse
            .then(response => {
                console.log(JSON.stringify(response))
                console.log(`created container '${name}' successfully with requestId: '${response.requestId}`);
                setMessage(`created container '${name}' successfully with requestId: '${response.requestId}`);
            })
            .catch(e => {
                console.log(`creating container '${name}' failed with error: '${e}'`);
                setHasError(true);
            })
    }

    const handleClick = (e) => {
        const prefix = 'newcontainer';
        let containerName = `${prefix}${new Date().getTime()}`;
        createContainer(containerName);
    }

    return (
        <div>
            <button
                onClick={handleClick}
            >Create container</button>
            {hasError ? <p>Something went wrong</p> : <p>{message}</p>}
        </div>
    )
}