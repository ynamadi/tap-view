#! /bin/bash
export CLUSTER_NAME=tap-view
export REGION="us-east-2"

eksctl create cluster --name ${CLUSTER_NAME} --region ${REGION}
eksctl get nodegroup --cluster=${CLUSTER_NAME} -r ${REGION}
eksctl scale nodegroup --cluster=${CLUSTER_NAME} -r ${REGION} --nodes=6 --name=ng-d2bf03b9 --nodes-min=6  --nodes-max=10
aws eks update-kubeconfig --name ${CLUSTER_NAME} --region ${REGION}