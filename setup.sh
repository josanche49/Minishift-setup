#!/usr/bin/env bash

# Using xhyve driver for hypervisor platform on mac
brew install docker-machine-driver-xhyve

## Changing ownership
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

## Set the owner User ID (SUID) for the binary
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve


echo 'Preparing to install minishift using Homebrew'
brew update
brew cask install minishift


## Install Kube controller
# current version in local openshift cluster
k8version=v1.9.1

# Get the kubectl binary.
curl -LO https://storage.googleapis.com/kubernetes-release/release/$k8sversion/bin/darwin/amd64/kubectl

# Make the kubectl binary executable
chmox +x ./kubectl

# Move the kubectl executable to /usr/local/bin
sudo mv ./kubectl /usr/local/bin/kubectl
