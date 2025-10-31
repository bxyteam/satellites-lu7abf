---
title: Instalation From Docker
nav_order: 3
parent: Instalation
---

# <img style="vertical-align:middle; width: 40px; height:40px;" src="https://raw.githubusercontent.com/bxyteam/satellite-test/refs/heads/main/docs/images/docker.png"> Instalation From Docker

##### To run this application, you must have docker and docker-Compose installed on your computer. Otherwise, visit the Docker website and follow the instructions for your operating system. Next, create a file named docker-compose.yml and another file named env without an extension. Copy the following contents into them.

###### <img style="vertical-align:middle;" src="https://raw.githubusercontent.com/bxyteam/satellite-test/refs/heads/main/docs/images/file-code.png">  docker-compose.yml
```yml
services:
  satellite:
    image: ghcr.io/bxyteam/satellites:1.0 
    env_file:
      - env
    container_name: satellite_orbitron
    hostname: satellite
    restart: unless-stopped
    ports:
      - "8091:8090"
    volumes:
      - /var/orbitron/satellite:/var/satellite
    ulimits:
      nproc: 524288
      nofile: 524288
```

<br>

*Complete the env file with your credentials if necessary*

###### <img style="vertical-align:middle;" src="https://raw.githubusercontent.com/bxyteam/satellite-test/refs/heads/main/docs/images/file-code.png">  env
```bash
# Docker Server port

SERVER_PORT=8090

# Github repository configuration

# github repository name
GITHUB_REPO=satellite-test

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
SCHEDULE_RUN_HOUR=

# Minute 0-59
SCHEDULE_RUN_MINUTE=

# configuration ID dev | qa | production
satelliteConfigId=dev
```

<br>

##### Finally run the application with the following command in the terminal

```bash
docker-compose up -d
```