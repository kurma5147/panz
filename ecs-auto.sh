#!/bin/bash
SERVICE="CodeCommitService"
CLUSTER_NAME="CodeCommitService"
AWS_REGION="ap-south-1"
export AWS_PROFILE=defaultCodeCommitService

# Register a new Task definition 
aws ecs register-task-definition --family CodeCommitService --cli-input-json file://task-new.json --region $AWS_REGION

# Update Service in the Cluster
aws ecs update-service --cluster $CLUSTER_NAME --CodeCommitService $SERVICE --task-definition TaskCodeCommit --desired-count 1 --region $AWS_REGION

