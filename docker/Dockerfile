FROM ubuntu:bionic as build

RUN apt-get  update 
RUN apt-get -y install build-essential gnupg2
RUN apt-get -y install wget software-properties-common
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null |  apt-key add -
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
RUN apt  update && apt -y install cmake

#Build Boost 1.67
RUN mkdir /buildboost
WORKDIR /buildboost
RUN wget  --no-check-certificate https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.bz2
RUN tar xvjf boost_1_67_0.tar.bz2
WORKDIR /buildboost/boost_1_67_0
RUN ./bootstrap.sh
RUN ./b2 install

RUN apt install -y libssl-dev pkg-config
RUN apt install -y libglib2.0-dev

ADD . /kuksa.val
WORKDIR /kuksa.val
RUN  rm -rf build  && mkdir  build && cd build
RUN cd build && cmake ..
RUN cd build && make
RUN ls -ahl /usr/local/lib/

FROM ubuntu:bionic

RUN apt-get update && apt install --no-install-recommends  -y openssl libglib2.0
COPY --from=build /usr/local/lib/libboost_program_options.* /usr/local/lib
COPY --from=build /usr/local/lib/libboost_system.* /usr/local/lib

RUN mkdir /kuksa.val

COPY --from=build /kuksa.val/build/src/w3c-server /kuksa.val
COPY --from=build /kuksa.val/build/src/vss_rel_2.0.json /kuksa.val


