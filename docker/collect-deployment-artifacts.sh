#!/bin/sh
#
# Helper script to collect executables, config and libraries needed for minimal docker

mkdir /deploy
cp /kuksa.val/build/src/w3c-visserver /deploy

ldd /kuksa.val/build/src/w3c-visserver | grep "=>" | awk '{print $3}' |   xargs -I '{}' cp -v '{}' /deploy

mkdir /config
mkdir /config/certs
cp  /kuksa.val/build/src/vss_rel_2.0.json /config/
cp  /kuksa.val/build/src/Server.key /config/certs/kuksa.val.key
