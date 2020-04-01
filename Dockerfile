FROM node:10.2.0-alpine
#FROM node:slim

LABEL mantainer="Marcel Miguel <marcel.miguel@gmail.com>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    npm install -g bower && \
    npm install -g polymer-cli --unsafe-perm 
    