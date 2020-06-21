[![Build Status](https://drone.kghf.io/api/badges/larskghf/simple-dash-docker/status.svg)](https://drone.kghf.io/larskghf/simple-dash-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/kghf/simple-dash)](https://hub.docker.com/r/kghf/simple-dash)
## simple-dash (docker image)

Project: https://github.com/kutyla-philipp/simple-dash 

Demo: https://kutyla-philipp.github.io/simple-dash/

---

Quick Start: `docker run --name simple-dash -d -p 80:80 kghf/simple-dash:latest`

---

Quick Start with modified config.json: 
```bash
#start Docker Container
docker run --name tmp-simple-dash -d -p 80:80 kghf/simple-dash:latest

#copy config.json to host file system
docker cp tmp-simple-dash:/usr/share/nginx/html/config.json /host/path/config.json

#modify config.json
vi /host/path/config.json

#remove tmp-simple-dash container
docker rm -f tmp-simple-dash 

#start docker container with modified config.json
docker run --name simple-dash -d -p 80:80 -v /host/path/config.json:/usr/share/nginx/html/config.json kghf/simple-dash:latest
```