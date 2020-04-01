# Polymer Build image

## Introduction

Gives a base image to build Polymer projects
Image prepared for k8s

## Example

Dockerfile multi-stage, see example/Dockerfile

```dockerfile
############################
# Build image
############################

FROM marcelmiguel/polymer-build:v0.0.1 as builder

LABEL mantainer="Marcel Miguel <marcel.miguel@neogrup.com>"

# VOLUMES?
RUN mkdir -p /app
WORKDIR /app

COPY package.json ./
RUN npm install

COPY . ./

RUN echo -e "\033[0;36mNode version: " $(node --version) "\033[0m"
RUN echo -e "\033[0;36mPolymer version: " $(polymer --version) "\033[0m"
RUN echo -e "\033[0;36mBower version: " $(bower --version) "\033[0m"

RUN polymer build

RUN ls -l /app/build/default

############################
# Nginx static web page
############################

FROM nginx:stable-alpine as release
LABEL mantainer="Marcel Miguel <marcel.miguel@gmail.com>"
COPY --from=builder /app/build/default/ /usr/share/nginx/html/
COPY nginx/default.conf /etc/nginx/conf.d/

RUN ls -l /usr/share/nginx/html/

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
```

## Build & Publish

```sh
make push
```

Only build:

```bash
make build
```

## Links

[Docker nginx image](https://stackoverflow.com/questions/55270099/how-do-i-build-a-custom-nginxalpine-based-container-listening-on-port-other-tha)
[With docker-compose and dev](https://hackernoon.com/a-better-way-to-develop-node-js-with-docker-cd29d3a0093)