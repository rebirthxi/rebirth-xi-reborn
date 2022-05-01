FROM ubuntu:20.04 as dev-env

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    g++-9 \
    cmake \
    make \
    gdb \
    libluajit-5.1-dev \
    libzmq3-dev \
    libssl-dev  \
    zlib1g-dev  \
    mariadb-server  \
    libmariadb-dev \
    && apt clean

FROM dev-env as build

# Do building stuff

ADD ./cmake /app/cmake
ADD ./ext /app/ext
ADD ./src /app/src
ADD ./modules /app/modules
ADD ./CMakeLists.txt /app

WORKDIR /app

# set on commandline with "--build-arg num_jobs=<your number>" can be $(nproc)
ARG num_jobs=1

# build and clean up
RUN mkdir build && cd build && cmake .. && cmake --build . -- -j $num_jobs && cd .. && rm -r build

FROM ubuntu:20.04 as run-time

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    libmariadb3 \
    libzmq5 \
    libluajit-5.1-2 \
    mysql-client \
    && apt clean


COPY --from=build /app/topaz_connect /
COPY --from=build /app/topaz_game /
COPY --from=build /app/topaz_search /

ADD ./conf /conf
ADD ./scripts /scripts
ADD ./modules /modules
ADD ./navmeshes /navmeshes
ADD ./tools/wait_for_silly_sql.sh /wait_for_silly_sql.sh
ADD ./compress.dat /compress.dat
ADD ./decompress.dat /decompress.dat
