#! /bin/bash
export EKS_CLUSTER_NAME=tap-gui
export AWS_REGION="us-east-2"


eksctl create cluster --name $EKS_CLUSTER_NAME --managed --region $AWS_REGION --instance-types t3.2xlarge --version 1.24 --with-oidc -N 4
aws eks update-kubeconfig --name ${EKS_CLUSTER_NAME} --region ${AWS_REGION}

./cluster-essentials.sh