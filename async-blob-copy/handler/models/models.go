package models

type Request struct {
	Data     EventData     `json:"data"`
	MetaData EventMetaData `json:"metadata"`
}

type EventData struct {
	EventGridEvent Event `json:"eventGridEvent"`
}

type System struct {
	MethodName string `json:"methodName"`
	UtcNow     string `json:"utcNow"`
	RandGuid   string `json:"randGuid"`
}

type EventMetaData struct {
	Data Event  `json:"data"`
	Sys  System `json:"sys"`
}

type Event struct {
	Topic           string `json:"topic"`
	Subject         string `json:"subject"`
	EventType       string `json:"eventType"`
	EventTime       string `json:"eventTime"`
	Id              string `json:"id"`
	Data            Data   `json:"data"`
	DataVersion     string `json:"dataVersion"`
	MetadataVersion string `json:"metadataVersion"`
}

type Data struct {
	Api                string             `json:"api"`
	ClientRequestId    string             `json:"clientRequestId"`
	RequestId          string             `json:"requestId"`
	ETag               string             `json:"eTag"`
	ContentType        string             `json:"contentType"`
	ContentLength      int                `json:"contentLength"`
	BlobType           string             `json:"blobType"`
	Url                string             `json:"url"`
	Sequencer          string             `json:"sequencer"`
	StorageDiagnostics StorageDiagnostics `json:"storageDiagnostics"`
}

type StorageDiagnostics struct {
	BatchId string `json:"batchId"`
}
