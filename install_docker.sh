#!/bin/bash

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker