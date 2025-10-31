---
title: Local / Dev Instalation
nav_order: 2
parent: Instalation
---

# <img style="vertical-align:middle; width: 40px; height:40px;" src="https://raw.githubusercontent.com/bxyteam/satellite-test/refs/heads/main/docs/images/terminal.png"> Local / Dev Instalation

### Apache2

#### Add configuration file to apache2 to enable HTTPS in dev env, need SSL certs

```bash 
 sudo bash -c "cat > /etc/apache2/sites-available/browxy_satellites.conf << --EOL
  <VirtualHost *:80>
     RewriteEngine on
     ProxyPreserveHost On
     ServerName satellites.dev.browxy.com
     Redirect permanent / https://satellites.dev.browxy.com/
  </VirtualHost>

  <IfModule mod_ssl.c>
    <VirtualHost *:443>
       RewriteEngine on
       ProxyPreserveHost On
       ServerName satellites.dev.browxy.com
       ProxyPass / http://127.0.0.1:8090/
       ProxyPassReverse / http://127.0.0.1:8090/
       SSLCertificateFile /srv/letsencrypt/live/dev.browxy.com/fullchain.pem
       SSLCertificateKeyFile /srv/letsencrypt/live/dev.browxy.com/privkey.pem
    </VirtualHost>
  </IfModule>
--EOL"
```
* Check server name, port and SSL certificate paths

#### Link conf file

```bash
  sudo ln -sfn /etc/apache2/sites-available/browxy_satellites.conf /etc/apache2/sites-enabled/browxy_satellites.conf
```

#### Add hostname to hosts file

```bash
  sudo bash -c "printf \"127.0.0.1\tsatellites.dev.browxy.com\n\" >> /etc/hosts"
```

### Use project script to compile, build and run

###### Go to the root project directory

### Create And Fill Env File (env.dev or env.local)

#### Rename env.example to env.dev or env.local or create new one and fill

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

* Add execution permissions
```bash
chmod +x *.sh
```

* Run script > Dev: install_dev.sh or Local: install_local.sh 
```bash
./install_dev.sh
```

###### Open the browser and go to https://satellites.dev.browxy.com

* For local go to http://localhost:8090
