RELEASE?=v0.0.1

build: 
	docker build --no-cache -t marcelmiguel/polymer-build:$(RELEASE) .

push: container
	docker login
	docker push marcelmiguel/polymer-build:$(RELEASE)

build-example: 
	docker build --no-cache -t polymer-example -f ./example/Dockerfile -t polymer-example:v0.0.1 ./example
	docker images | grep polymer-example

run:
	docker run -d polymer-example -p 8777:8777

# not to be used if downloaded, already on project
prepare-example:
	./example/polymer init