[![Build Status](https://ci.kghf.io/buildStatus/icon?job=simple-dash)](https://ci.kghf.io/job/simple-dash/)
![Docker Pulls](https://img.shields.io/docker/pulls/larskghf/simple-dash)
## simple-dash-docker

Project: https://github.com/kutyla-philipp/simple-dash 

Demo: https://kutyla-philipp.github.io/simple-dash/

---

Quick Start: `docker run --name simple-dash -d -p 80:80 larskghf/simple-dash:latest`

---

Quick Start with modified config.json: 
```bash
#start Docker Container
docker run --name tmp-simple-dash -d -p 80:80 larskghf/simple-dash:latest

#copy config.json to host file system
docker cp tmp-simple-dash:/usr/share/nginx/html/config.json /host/path/config.json

#modify config.json
vi /host/path/config.json

#remove tmp-simple-dash container
docker rm -f tmp-simple-dash 

#start docker container with modified config.json
docker run --name simple-dash -d -p 80:80 -v /host/path/config.json:/usr/share/nginx/html/config.json larskghf/simple-dash:latest
```