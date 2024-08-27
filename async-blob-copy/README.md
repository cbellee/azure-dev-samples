# asynchronous blob copy function

Simple Event Grid triggered golang Azure function to copy blobs between storage accounts.
Event grid listens for `Blob.Created` events on the source storage account and calls the Azure function to copy the blob to the destination storage account.

## requirements

- azure cli
- bash shell

## usage
update the following variables in `./deploy.sh`

```bash
location='australiaeast'
prefix='async-blob-copy'
```

```bash
$ ./deploy.sh
```
