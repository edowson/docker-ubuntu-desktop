#!/bin/sh
docker build --file Dockerfile --build-arg repository=ubuntu --build-arg tag=16.04 -t ubuntu-desktop:16.04 .
