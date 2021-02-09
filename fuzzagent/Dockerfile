FROM debian:sid-slim

ARG DNH_REPO

ENV DNH_REPO "$DNH_REPO"

ARG DNH_FOLDER

ENV DNH_FOLDER "$DNH_FOLDER"

RUN apt-get update

RUN apt-get install -y libncurses5-dev build-essential flex bison gcc git gdb procps

RUN useradd -s /bin/bash -m fuzzagent

WORKDIR /app

RUN chown -R fuzzagent:fuzzagent /app

USER fuzzagent

RUN git clone $DNH_REPO

RUN cd /app/$DNH_FOLDER && sed -i -e "/^CFLAGS/s/-g/-g -fsanitize=address/" GNUmakefile && sed -i -e "/^LDFLAGS/s/-Wno-knr-promoted-parameter/-Wno-knr-promoted-parameter -fsanitize=address/" GNUmakefile

RUN cd /app/$DNH_FOLDER && sed -i -e "/boolean currentgend = Upolyd ? u.mfemale : flags.female;/s/.*/boolean currentgend = Upolyd ? u.mfemale : flags.female;buf[-1] = 0;/" src/allmain.c

RUN cd /app/$DNH_FOLDER && make install

COPY init.sh .

COPY debugrc /home/fuzzagent/.nethackrc

COPY gdbconfig .

#CMD sleep infinity
CMD cd /app/$DNH_FOLDER && /app/init.sh
