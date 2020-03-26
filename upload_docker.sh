#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Usage
# -u <username>
# -i <docker image>
# -t <image tag>
# -p <docker path>

while getopts ":i:u:t:p:" opt; do
  case $opt in
    i) dockerimage="$OPTARG"
    ;;
    t) dockertag="$OPTARG"
    ;;
    u) dockeruser="$OPTARG"
    ;;
    p) dockerpath="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

#printf "Argument i is %s\n" "$dockerimage"
#printf "Argument t is %s\n" "$dockertag"
#printf "Argument u is %s\n" "$dockeruser"
#printf "Argument p is %s\n" "$dockerpath"

# Step 1:
# Create dockerpath
dockerpath=jralonso/udacity-devops-mlproject

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag $dockerimage:$dockertag $dockerpath:$dockertag
docker login --username=$dockeruser

# Step 3:
# Push image to a docker repository
docker push $dockerpath:$dockertag
