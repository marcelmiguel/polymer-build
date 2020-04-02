############################
# Build image
############################

FROM marcelmiguel/polymer-build:v0.0.2 as builder

LABEL mantainer="Marcel Miguel <marcel.miguel@neogrup.com>"

# VOLUMES?
RUN mkdir -p /app
WORKDIR /app 

COPY package.json ./
RUN npm install

COPY . ./

RUN echo -e "\033[0;36mNode version: " $(node --version) "\033[0m\n"\
"\033[0;36mPolymer version: " $(polymer --version) "\033[0m\n"\
"\033[0;36mBower version: " $(bower --version) "\033[0m"

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