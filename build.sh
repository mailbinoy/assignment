#!/bin/bash

echo "Logging to ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 223316186016.dkr.ecr.us-east-1.amazonaws.com
echo "Building Project..."
docker build -t assignment .
echo "Docker image tag for AWS ECR..."
docker tag assignment:latest 223316186016.dkr.ecr.us-east-1.amazonaws.com/assignment:latest
echo "Image Push to ECR..."
docker push 223316186016.dkr.ecr.us-east-1.amazonaws.com/assignment:latest
exit
