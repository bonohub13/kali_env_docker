DOCKER := docker
DOCKER_IMG_TAG := kali_env
DOCKER_TEST_CONTAINER_NAME := kali_env-test
DOCKER_CONTAINER_NAME := kali_env
XHOST := xhost
SHELL := /usr/bin/bash

all: build test

build:
	${DOCKER} build -t ${DOCKER_IMG_TAG} ./

test:
	${XHOST} +local:root
	${DOCKER} run -it --rm --name ${DOCKER_TEST_CONTAINER_NAME} \
		--net=host -e DISPLAY=unix${DISPLAY} \
		-v ${XAUTH}:/root/.Xauthority \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		${DOCKER_IMG_TAG}
