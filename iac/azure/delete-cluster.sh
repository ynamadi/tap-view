#! /bin/bash
export AKS_RESOURCE_GROUP="tap-gui-rg"
export AKS_CLUSTER_NAME="tap-gui"

az aks delete --resource-group ${AKS_RESOURCE_GROUP} --name ${AKS_CLUSTER_NAME} --yes