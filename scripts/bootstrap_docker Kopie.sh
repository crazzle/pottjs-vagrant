#!/bin/bash

set -e

echo "Installing Docker..."
apt-get update
apt-get install apt-transport-https ca-certificates --yes
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge lxc-docker
apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual --yes
apt-get install docker-engine --yes
