############################
# Build image
############################

FROM marcelmiguel/polymer-build:latest

LABEL mantainer="Marcel Miguel <marcel.miguel@neogrup.com>"

VOLUME /root/app
RUN mkdir -p app
WORKDIR /root/app

RUN bower install 
RUN npm install
RUN polymer 

CMD polymer build

############################
# Nginx static web page
############################

FROM nginx:stable-alpine as release
LABEL mantainer="Marcel Miguel <marcel.miguel@gmail.com>"
COPY build/default/ /usr/share/nginx/html/
COPY nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 8777