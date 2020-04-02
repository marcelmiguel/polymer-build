FROM node:10-alpine
#FROM node:slim

LABEL mantainer="Marcel Miguel <marcel.miguel@gmail.com>"

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh && \
    npm install -g bower && \
    npm install -g polymer-cli --unsafe-perm 
