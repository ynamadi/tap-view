# On the Supply Chain Security Tools - Store's cluster
export VIEW_CLUSTER_NAME="tap-view"
export BUILD_CLUSTER_NAME="tap-build"

kubectl config use-context $VIEW_CLUSTER_NAME
CA_CERT=$(kubectl get secret -n metadata-store ingress-cert -o json | jq -r ".data.\"ca.crt\"")
AUTH_TOKEN=$(kubectl get secrets -n metadata-store -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='metadata-store-read-write-client')].data.token}" | base64 -d)

cat <<EOF > store_ca.yaml
---
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: store-ca-cert
  namespace: metadata-store-secrets
data:
  ca.crt: $CA_CERT
EOF

# On the second cluster
kubectl config use-context $BUILD_CLUSTER_NAME
# Create secrets namespace
kubectl create ns metadata-store-secrets

# Create the CA Certificate secret
kubectl apply -f store_ca.yaml
kubectl create secret generic store-auth-token --from-literal=auth_token="$AUTH_TOKEN" -n metadata-store-secrets
kubectl apply -f secret-export.yml
rm store_ca.yaml

kubectl config use-context $VIEW_CLUSTER_NAME