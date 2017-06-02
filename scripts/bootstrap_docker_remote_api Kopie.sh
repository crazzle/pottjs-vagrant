#!/bin/bash

set -e

echo "Activating Docker Remote API and insecure regitry..."
sed -i -- 's/DOCKER_OPTS=/DOCKER_OPTS="--insecure-registry 10.100.198.202:5000 -H tcp:\/\/0.0.0.0:4243 -H unix:\/\/\/var\/run\/docker.sock"/g' /etc/init/docker.conf
sudo service docker restart
