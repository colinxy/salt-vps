#!/bin/bash

set -e


docker run \
       --name jenkinsci-blueocean \
       -u root \
       --rm \
       -d \
       -p 8080:8080 \
       -p 50000:50000 \
       -v jenkins-data:/var/jenkins_home \
       -v /var/run/docker.sock:/var/run/docker.sock \
       jenkinsci/blueocean


# using mounted volume could be easier
jenkins_volume=$(docker volume inspect jenkins-data --format '{{.Mountpoint}}')
echo 'Initial password:'
cat "$jenkins_volume"/secrets/initialAdminPassword

echo
echo 'Initial setup at localhost:8080 with'
echo 'ssh -N -L 8080:localhost:8080 do  # do refers to hostname'
