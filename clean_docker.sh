#!/bin/bash
CONTAINER=`sudo docker ps --no-trunc -a -q`
echo "killing " $CONTAINER
sudo docker kill $CONTAINER
sudo docker rm $CONTAINER

