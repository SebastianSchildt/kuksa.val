#  Dockerfiles


Dockerfiles.test ist for setting up an environment to play/develop VSS

## Development Docker
Not optimized a t all, just gets  Ubuntu installed and does a first compile. Will drop you to a shell

To build go to kuksa.val main dir and do

```
docker build -f docker/Dockerfile.dev -t kuksavaltest . 
```

To run

```
docker run -it --net=host kuksavaltest:latest 
```

## Production docker
To run kuksa.val on target hardware use an optimized docker build based on alpine


To run it

```
docker run -it  -p 127.0.0.1:8090:8090 --mount type=bind,source=/path/to/myconfig,target=/config kuksaval:latest
```

 `/path/to/myconfig ` is a folder where a `vss.json` datamodel is expected and a subdirectory `/path/to/myconfig/certs` containing at least the server key (`Server.key`) and certificate (`Server.pem`). If those files do not exist default files will be copied automatically


