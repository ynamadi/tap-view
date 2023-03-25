#! /bin/bash
export EKS_CLUSTER_NAME=tap-gui
export AWS_REGION="us-east-2"

eksctl delete cluster --region=$AWS_REGION --name=$EKS_CLUSTER_NAME