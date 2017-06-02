#!/bin/bash

set -e

echo "Activating Docker Registry"
docker run -d -p 5000:5000 --restart=always --name registry registry:2
