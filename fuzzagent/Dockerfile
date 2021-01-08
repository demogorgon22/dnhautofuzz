FROM debian:buster-slim

ARG DNH_REPO

ENV DNH_REPO "$DNH_REPO"

ARG DNH_FOLDER

ENV DNH_FOLDER "$DNH_FOLDER"

RUN apt-get update

RUN apt-get install -y libncurses5-dev build-essential flex bison gcc git gdb

WORKDIR /app

RUN git clone $DNH_REPO

RUN cd /app/$DNH_FOLDER && make install

CMD sleep infinity
