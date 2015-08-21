#!/bin/bash
sudo docker exec -it $(sudo docker ps -lq) /bin/bash
