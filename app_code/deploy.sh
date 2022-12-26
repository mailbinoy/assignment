#!/bin/bash
echo 'Logging to ECR...'
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 223316186016.dkr.ecr.us-east-1.amazonaws.com
#docker rm -f assignment
[ "$(docker ps -a | grep assignment)" ] && docker rm -f assignment ; docker run -d -p 80:8081 --name assignment 223316186016.dkr.ecr.us-east-1.amazonaws.com/assignment:latest
