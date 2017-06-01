# FROM ubuntu:16.04
FROM debian:8
MAINTAINER Gerard Hickey <hickey@kinetic-compute.com>

ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR "/var/lib/plexmediaserver/Library/Application Support"
ENV PLEX_MEDIA_SERVER_HOME /usr/lib/plexmediaserver
ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS 6
ENV PLEX_MEDIA_SERVER_TMPDIR /tmp
ENV PLEX_MEDIA_SERVER_MAX_STACK_SIZE 3000
ENV PLEX_MEDIA_SERVER_USER plex
ENV LD_LIBRARY_PATH /usr/lib/plexmediaserver

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget locales && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    cd /tmp && \
    wget https://downloads.plex.tv/plex-media-server/1.5.6.3790-4613ce077/plexmediaserver_1.5.6.3790-4613ce077_amd64.deb && \
    dpkg -i plexmediaserver_1.5.6.3790-4613ce077_amd64.deb


EXPOSE 32400
EXPOSE 1587
EXPOSE 32469

USER plex
CMD ["/usr/lib/plexmediaserver/Plex Media Server"]