#!/bin/bash

ImageName=`cat image-name.txt`
Latest=$(echo $ImageName | awk -F":" '{ print $1 }')":latest"

#docker build --no-cache --progress=plain -t $ImageName .  2>&1 | tee docker-build.log
docker build -t $ImageName .

docker build -t $Latest .

# docker run --rm -it  \
#     -v `pwd`:/app  \
#     $ImageName  

docker run --rm -it  \
    -v ~/pen300/PhishingWithJScript:/app  \
    $ImageName  

