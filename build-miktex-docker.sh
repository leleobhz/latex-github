#!/bin/bash

#docker run --rm -ti \
#  -v $(pwd)/dot_miktex:/miktex/.miktex \
#  -v $(pwd)/dot_miktex/logs:/var/log/miktex/ \
#  -v $(pwd):/miktex/work \
#  -e MIKTEX_GID=0 \
#  -e MIKTEX_UID=0 \
#  miktex/miktex \
#  sh -c "mpm --admin --update ; mpm --admin --update"

#docker run --rm -ti \
#  -v $(pwd)/dot_miktex:/miktex/.miktex \
#  -v $(pwd)/dot_miktex/logs:/var/log/miktex/ \
#  -v $(pwd):/miktex/work \
#  -e MIKTEX_GID=$(id -g) \
#  -e MIKTEX_UID=$(id -u) \
#  miktex/miktex \
#  sh -c "mpm --update ; mpm --update"

if [[ $(docker --version | awk '{print $1}') == "Docker" ]]; then
	docker build --tag localhost/miktex/miktex:latest ./docker-miktex

else
	podman build --tag localhost/miktex/miktex:latest ./docker-miktex
fi
