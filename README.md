## postgresql-client Dockerfile


This repository contains **Dockerfile** of [postgresql-client](http://www.postgresql.org/docs/current/static/reference-client.html) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/igortimoshenko/docker-postgresql-client/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [igortimoshenko/docker-cron-job](https://hub.docker.com/igortimoshenko/docker-cron-job/)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/igortimoshenko/docker-postgresql-client/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull igortimoshenko/docker-postgresql-client`

   (alternatively, you can build an image from Dockerfile: `docker build -t="igortimoshenko/docker-postgresql-client" github.com/igortimoshenko/docker-postgresql-client`)


### Usage

Start container specifying the executable script for cron:

    docker run -d \
    -v `<script-dir>`/script.sh:/root/script.sh \
    --volumes-from=postgresql \
    -e CRON_JOB='* * * * * ~/script.sh >> /var/log/script.log 2>&1' \
    -e HOST="postgresql" \
    -e PORT="5432" \
    -e USER="postgresql" \
    -e PASS="postgresql" \
    --link postgresql:postgresql \
    igortimoshenko/docker-postgresql-client    

> Note that if you need environment variables within your cron script then
> include the following line `source /root/.env-vars` in your script
