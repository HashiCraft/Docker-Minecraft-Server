DOCKER_NAME=hashicraft/minecraft
DOCKER_VERSION=v1.16.4

build:
	docker build -t ${DOCKER_NAME}:${DOCKER_VERSION} .

build_and_push: build
	docker push ${DOCKER_NAME}:${DOCKER_VERSION}

ngrok:
	ngrok tcp 25565
