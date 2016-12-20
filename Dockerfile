FROM debian:jessie

MAINTAINER PCSOFT <network@pcsoft.fr>

# import public key "PCSOFT <network@pcsoft.fr>"
RUN apt-key adv --keyserver hkp://pgp.mit.edu/ --recv-keys 3a2b08fb11ba9bca

RUN echo "deb http://package.windev.com/fr/debian/ debian main" > /etc/apt/sources.list.d/pcsoft.list

ENV HFSQL_VERSION 22.0.036.c
RUN apt-get update && apt-get install -y libqt4-gui hfsql="${HFSQL_VERSION}" && rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/hfsql
EXPOSE 4900

USER hfsql

CMD ["/opt/hfsql/manta64","--no-daemon"]


