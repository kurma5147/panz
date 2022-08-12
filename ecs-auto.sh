#!/bin/bash
SERVICE="siva"
CLUSTER_NAME="siva"
AWS_REGION="us-east-1"
export AWS_PROFILE=default

# Register a new Task definition 
aws ecs register-task-definition --family siva --cli-input-json file://task-new.json --region $AWS_REGION

# Update Service in the Cluster
aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE --task-definition siva --desired-count 1 --region $AWS_REGION

