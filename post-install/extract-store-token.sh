METADATA_STORE_ACCESS_TOKEN=$(kubectl get secrets metadata-store-read-write-client -n metadata-store -o jsonpath="{.data.token}" | base64 -d)
export METADATA_STORE_ACCESS_TOKEN
echo METADATA_STORE_ACCESS_TOKEN: "$METADATA_STORE_ACCESS_TOKEN"