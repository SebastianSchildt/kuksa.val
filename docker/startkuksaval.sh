#!/bin/sh


echo "Starting kuksa.val"


if [ -e /config/vss.json ]
then
    echo "Using existing vss tree"
else
    echo "No VSS tree, initilaize with example"
    cp /kuksa.val/exampleconfig/vss.json /config/
fi

mkdir -p /config/certs

if [ -e /config/certs/server.key ]
then
    echo "Using existing server keys"
else
    echo "No server keys configured, initialize with example"
    cp /kuksa.val/exampleconfig/certs/Server.key /config/certs/
    cp /kuksa.val/exampleconfig/certs/Server.pem /config/certs/
fi


LD_LIBRARY_PATH=./ ./w3c-visserver --vss /config/vss.json --cert-path /config/certs --log-level $LOG_LEVEL
