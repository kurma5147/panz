#!/bin/bash
SERVICE="sampledeploy"
CLUSTER_NAME="sampledeploy"
AWS_REGION="us-east-1"
export AWS_PROFILE=default

# Register a new Task definition 
aws ecs register-task-definition --family sampledeploy --cli-input-json file://task-new.json --region $AWS_REGION

# Update Service in the Cluster
aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE --task-definition sampledeploy --desired-count 1 --region $AWS_REGION

