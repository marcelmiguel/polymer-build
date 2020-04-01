RELEASE?=v0.0.1
RELEASEW?=v0.0.4

build: 
	docker build --no-cache -t marcelmiguel/polymer-build:$(RELEASE) .

push: container
	docker login
	docker push marcelmiguel/polymer-build:$(RELEASE)

build-example: 
	docker build -t polymer-example -f ./example/Dockerfile -t polymer-example:$(RELEASEW) ./example
	docker images | grep polymer-example

run:
	docker run -d -p 8080:8080 polymer-example:$(RELEASEW)

# not to be used if downloaded, already on project
prepare-example:
	./example/polymer init