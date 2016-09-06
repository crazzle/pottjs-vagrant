#!/bin/bash

set -e

echo "Activating Docker Remote API..."
sed -i -- 's/DOCKER_OPTS=/DOCKER_OPTS="-H tcp:\/\/0.0.0.0:4243 -H unix:\/\/\/var\/run\/docker.sock"/g' /etc/init/docker.conf
sudo service docker restart
