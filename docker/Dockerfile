# Copyright Robert Bosch GmbH, 2020. Part of the Eclipse Kuksa Project.
#
# All rights reserved. This configuration file is provided to you under the
# terms and conditions of the Eclipse Distribution License v1.0 which
# accompanies this distribution, and is available at
# http://www.eclipse.org/org/documents/edl-v10.php

FROM alpine:3.11 as build

LABEL maintainer="Sebastian Schildt <sebastian.schildt@de.bosch.com>"



RUN apk update && apk add cmake wget alpine-sdk linux-headers openssl-dev libstdc++ mosquitto-dev


#Build Boost 1.75
ENV BOOST_VER=1.75.0
ENV BOOST_VER_=1_75_0
RUN mkdir /buildboost
WORKDIR /buildboost
RUN wget   https://boostorg.jfrog.io/artifactory/main/release/${BOOST_VER}/source/boost_${BOOST_VER_}.tar.bz2
RUN tar xvjf boost_${BOOST_VER_}.tar.bz2
WORKDIR /buildboost/boost_${BOOST_VER_}
RUN ./bootstrap.sh
RUN ./b2 -j 6 install


ADD . /kuksa.val
RUN  rm -rf /kuksa.val/build  && mkdir  /kuksa.val/build 
WORKDIR /kuksa.val/build
RUN cmake ..
RUN make -j 4
RUN ls
RUN /kuksa.val/docker/collect-deployment-artifacts.sh


FROM alpine:3.11

COPY --from=build /deploy /kuksa.val
WORKDIR /kuksa.val

ENV LOG_LEVEL=INFO
#Usually you want this to be 0.0.0.0 when using porter port expose via -p. 
ENV BIND_ADDRESS=0.0.0.0

EXPOSE 8090/tcp

CMD /kuksa.val/startkuksaval.sh


