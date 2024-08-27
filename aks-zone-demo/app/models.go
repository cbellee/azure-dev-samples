package main

type FileInfo struct {
	PodData PodInfo
	FileData []PodInfo
}

type PodInfo struct {
	TimeGenerated string
	Name          string
	Node          string
	Namespace     string
	Zone          string
	Region        string
	DiskZone      string
}
