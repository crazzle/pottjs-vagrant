#!/bin/bash

set -e

echo "Installing Jenkins..."
apt-get update
apt-get install openjdk-7-jdk --yes
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins --yes
sudo gpasswd -a jenkins docker
sudo sh -c 'echo jenkins ALL=NOPASSWD: ALL >> /etc/sudoers'
