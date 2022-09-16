#! /bin/bash
export AKS_RESOURCE_GROUP="tap-view-rg"
export AKS_CLUSTER_NAME="tap-view"

az aks delete --resource-group ${AKS_RESOURCE_GROUP} --name ${AKS_CLUSTER_NAME} --yes