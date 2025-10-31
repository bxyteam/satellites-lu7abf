---
title: Browxy Instalation
nav_order: 1
parent: Instalation
---
# <img style="vertical-align:middle; width: 40px; height:40px;" src="https://raw.githubusercontent.com/bxyteam/satellites-lu7abf/refs/heads/main/docs/images/terminal.png"> Browxy Instalation

### <img style="vertical-align:middle; width:30px; height:30px;" src="https://raw.githubusercontent.com/bxyteam/satellites-lu7abf/refs/heads/main/docs/images/network.png"> Compiler Web

#### Download project from github

```bash 
mkdir -p /home/compiler/satellites
cd /home/compiler/satellites

wget https://github.com/bxyteam/satellites-app/archive/refs/heads/main.zip

unzip main.zip
rm main.zip

cd satellites-app-main
```

#### Dockerfile

```Dockerfile
FROM docker-registry.beta.browxy.com/browxy_compiler_base:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y dosbox xvfb x11-utils tar gzip xz-utils openjdk-8-jdk locales cron git unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# grant sudoers privileges
RUN adduser --system --ingroup users --shell /bin/bash --home /home/satellite compiler
RUN echo "compiler ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN echo "Defaults env_keep+=DOCKER_DAEMON_ARGS" >> /etc/sudoers

# create hosts file and backup
RUN cp /etc/hosts /etc/hosts.default
RUN chmod ugo+rw /etc/hosts.default
#RUN chmod ugo+rw /etc/hosts


RUN mkdir -p /home/satellite/application
COPY ./target/runnable /home/satellite/application
RUN chown -R compiler:users /home/satellite/application
RUN chmod ugo+x /home/satellite/application/*.sh

# Install tini
COPY ./target/runnable/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set tini as the entrypoint
ENTRYPOINT ["/usr/bin/tini", "--"]

# Set the default command
CMD ["bash", "-c", "/home/satellite/application/dockerStart.sh"]
```
#### Docker Login
* Login with docker credentials

```bash
 docker login -u $dockerRegistryUser -p $dockerRegistryPassword $dockerRegistryUrl
```

#### Build and push images to registry
* Execute install_prod.sh script

```bash
echo "Set executions permissions"
chmod +x install_prod.sh
chmod +x install_browxy.sh

echo "Execute production script"
./install_prod.sh
```

* Or execute the following commands

```bash
echo "Building Docker image"
docker build -f "$DOCKERFILE" -t browxy_satellite .

echo "Tag docker image"
docker build -f "$DOCKERFILE" -t "${DOCKER_REGISTRY}"/browxy_satellite:1.0 .

echo "Push Docker image"
sudo docker push "${DOCKER_REGISTRY}"/browxy_satellite:1.0
```

### <img style="vertical-align:middle; width:30px; height:30px;" src="https://raw.githubusercontent.com/bxyteam/satellites-lu7abf/refs/heads/main/docs/images/network.png"> Compiler

### Create directory and files 

```bash
mkdir -p /home/compiler/satellites
cd /home/compiler/satellites

touch docker-compose.yml
touch env.prod
```

### <img style="vertical-align:middle; width:30px; height:30px;" src="https://raw.githubusercontent.com/bxyteam/satellites-lu7abf/refs/heads/main/docs/images/container.png"> Create And Run Docker Container

### Fill docker-compose file (docker-compose.yml)
#### docker-compose.yml

```yaml
version: '2'

services:

  satellite:
    image: docker-registry.beta.browxy.com/browxy_satellite:1.0
    env_file:
      - env.prod
    container_name: satellite
    hostname: satellite
    networks:
      - compiler_browxy
    restart: unless-stopped
    ports:
      - "8090:8090"
    volumes:
      - /srv/satellite_data:/var/satellite
    ulimits:
      nproc: 524288
      nofile: 524288

networks:
  compiler_browxy:
    external: true
```

### Fill Env File (env.prod)

#### env.prod

```bash
# Docker Server port

SERVER_PORT=8090

# Github repository configuration

# github repository name
GITHUB_REPO=satellites-lu7abf

# github repository owner (github username)
GITHUB_OWNER=bxyteam

# github personal token
GITHUB_TOKEN=

# path to local repository
LOCAL_REPO_PATH=/var/satellite/data/github

# Spacetrack credentials to update keps and satellite matrix

# spacetrack user credential
SPACE_TRACK_IDENTITY=

# spacetrack password credential
SPACE_TRACK_PASSWORD=

# path to keps files
SATELLITE_KEPS_DIR=/var/satellite/data/github/keps

# web configuration

# name of page builder entry point
ENTRY_POINT=pass

# admin token (only admin)
TOKEN=

# Cron task to update passes (optional default: 1:30)

# Hour 0-23
SCHEDULE_RUN_HOUR=1

# Minute 0-59
SCHEDULE_RUN_MINUTE=30

# Browxy conf

VIRTUAL_HOST=satellites.browxy.com

VIRTUAL_PORT=8090

INSTALL_MODE=browxy

DOCKER_REGISTRY=docker-registry.beta.browxy.com

# configuration ID dev | qa | production
satelliteConfigId=production
```

##### Up Docker Container

```bash
docker-compose up -d
```
#### Add ssl certificates

```bash
cp /srv/letsencrypt/live/beta.browxy.com/fullchain.pem /srv/nginx/certs/satellites.browxy.com.crt

cp /srv/letsencrypt/live/beta.browxy.com/privkey.pem /srv/nginx/certs/satellites.browxy.com.key

docker restart nginx
```
