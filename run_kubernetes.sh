#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=jralonso/udacity-devops-mlproject

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-mserv-dev\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels env=ml-mserv-development

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward ml-mserv-dev 8000:80
