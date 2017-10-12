# Docker Swarm - Magento 2

This is a Docker Swarm environment geared towards use with Magento 2. The environment is not restricted to use with Magento 2, but is a clustered environment that is great for use with many PHP projects. 

## Development

Utilize the [`Issues`](https://github.com/loganstellway/magento2-docker-swarm/issues) section to track goals and issues. 

**Pushing**

Branch from and create merge requests to the `dev` branch. 

## Images / Configuration

The `.docker-compose/config` directory contains several folders with configuation files. 

  - **mysql**
    - [mysql:5.7](https://store.docker.com/images/mysql)
    - [`init.sh`](.docker-compose/config/mysql/init.sh) is executed whenever a **mysql** container instance is launched (refer to [official documentation](https://store.docker.com/images/mysql) for more information). 
    - The goal is to move away from this image and utilize [MySQL NDB Cluster](https://dev.mysql.com/doc/mysql-cluster-excerpt/5.6/en/) / [Issue #1](https://github.com/loganstellway/magento2-docker-swarm/issues/1)
  - **nginx**
    - [nginx:stable-alpine](https://store.docker.com/images/nginx)
    - The [`certs`](.docker-compose/nginx/certs) subdirectory is configured to be mounted to `nginx` container instances. 
    - [`default.conf`](.docker-compose/config/nginx/default.conf) contains the `nginx` server configuration. 
  - **php**
    - [lstellway/php:7.1-fpm-alpine-magento2-full](https://store.docker.com/community/images/lstellway/php)
    - PHP is configured to run PHP-FPM to process PHP requests. 
  - **varnish**
    - [lstellway/varnish:4.1-alpine](https://store.docker.com/community/images/lstellway/varnish)
    - Not currently being used. 
  - **redis**
    - [redis:3-alpine](https://store.docker.com/images/redis)
    - The recommended use is to utilize Redis for session storage. Redis is not initally cluster-ready and requires some setup [Issue #2](https://github.com/loganstellway/magento2-docker-swarm/issues/2)

## Magento 2 Requirements

[Magento 2.2.0 system requirements](http://devdocs.magento.com/guides/v2.2/install-gde/system-requirements-tech.html) specify the following: 

  - Web Server
    - Apache 2.2 or 2.4
    - Nginx 1.x
  - Database
    - MySQL 5.6, 5.7
    - [MySQL NDB Cluster 7.4.x](https://dev.mysql.com/doc/mysql-cluster-excerpt/5.6/en/)
  - PHP
    - Magento 2.2 now supports PHP 7.1.x
  - Redis
    - 3.2
  - Varnish
    - 4.x
    - 5.0

## Self-Signed TLS Certificates

I have created a [bash script](https://github.com/loganstellway/self-signed-ssl) to make it easy to create self-signed TLS certificates for working locally. 
  - [Self-Signed TLS](https://github.com/loganstellway/self-signed-ssl)
