#!/bin/bash
echo "Building the docker image:"
docker build -t jrnmagalhaes/dockertest .
echo "Searching the host ip address"
HOSTIP=`ip -4 addr show scope global dev docker0 | grep inet | awk '{print \$2}' | cut -d / -f 1`
echo "Host ip: $HOSTIP"
echo "Running the docker container"
docker run --add-host=hostmachine:${HOSTIP} -p 3000:3000 -d jrnmagalhaes/dockertest