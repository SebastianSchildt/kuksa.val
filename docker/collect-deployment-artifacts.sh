#!/bin/sh
#
# Helper script to collect executables, config and libraries needed for minimal docker

mkdir /deploy
cp /kuksa.val/build/src/w3c-visserver /deploy

cp /kuksa.val/docker/startkuksaval.sh /deploy

ldd /kuksa.val/build/src/w3c-visserver | grep "=>" | awk '{print $3}' |   xargs -I '{}' cp -v '{}' /deploy

mkdir /deploy/exampleconfig
mkdir /deploy/exampleconfig/certs

cp /kuksa.val/build/src/vss_rel_2.0.json  /deploy/exampleconfig/vss.json
cp /kuksa.val/build/src/Server.key /deploy/exampleconfig/kuksa.val.key
cp /kuksa.val/certificates/* /deploy/exampleconfig/certs/
