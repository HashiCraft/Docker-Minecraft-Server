DOCKER_NAME=hashicraft/minecraft
DOCKER_VERSION=v1.12.2

build:
	docker build -t ${DOCKER_NAME}:${DOCKER_VERSION} docker/

build_and_push: build
	docker push ${DOCKER_NAME}:${DOCKER_VERSION}

ngrok:
	ngrok tcp 25565