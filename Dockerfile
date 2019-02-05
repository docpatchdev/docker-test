FROM debian:latest as docpatch-grundgesetz-build

MAINTAINER cryptkiddie <cryptkidde-spam@chaospott.de>

ARG DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Update system
RUN apt-get update
RUN apt-get dist-upgrade -y

# Install dependencies
RUN apt-get install bash git gpg make pandoc quilt -y

# Configuring GIT
RUN git config --global user.name "Bundesrepublik Deutschland"
RUN git config --global user.email "no-reply@bundestag.de"

# Push files into container
COPY ./DATA /DATA

# Run installation
RUN /DATA/install.sh

# Setup GG
RUN /DATA/gg-builder.sh
