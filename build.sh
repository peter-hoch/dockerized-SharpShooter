#!/bin/bash

ImageName=`cat image-name.txt`
Latest=$(echo $ImageName | awk -F":" '{ print $1 }')":latest"

docker build --no-cache -t $ImageName .
#docker build -t $ImageName .

docker build -t $Latest .

docker run --rm -it  \
    -v `pwd`:/app  \
    $ImageName  

