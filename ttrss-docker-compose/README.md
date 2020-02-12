# Dockerized tt-rss using docker-compose

The idea is to provide tt-rss working (and updating) out of the box with minimal fuss.

This setup is still WIP. Some features may be unimplemented or broken. Check the following
before deploying:

- [TODO](https://git.tt-rss.org/fox/ttrss-docker-compose/wiki/TODO)
- [FAQ](https://git.tt-rss.org/fox/ttrss-docker-compose/wiki#faq)

General outline of the configuration is as follows:

 - separate containers (frontend: caddy, database: pgsql, app and updater: php/fpm)
 - tt-rss updates from git master repository on container restart
 - tt-rss source code is stored on a persistent volume so plugins, etc. could be easily added
 - ``config.php`` is generated if it is missing
 - database schema is installed automatically if it is missing
 - Caddy has its http port exposed to the outside
 - optional SSL support via Caddy w/ automatic letsencrypt certificates
 - feed updates are handled via update daemon started in a separate container (updater)

### Installation

#### Check out scripts from Git:

```sh
git clone https://git.tt-rss.org/fox/ttrss-docker-compose.git ttrss-docker && cd ttrss-docker
```

#### Edit configuration files:

Copy ``.env-dist`` to ``.env`` and edit any relevant variables you need changed.

* You will likely have to change ``SELF_URL_PATH`` which should equal fully qualified tt-rss
URL as seen when opening it in your web browser. If this field is set incorrectly, you will
likely see the correct value in the tt-rss fatal error message.

Note: ``SELF_URL_PATH`` is updated in generated tt-rss ``config.php`` automatically on container
restart. You don't need to modify ``config.php`` manually for this.

* By default, container binds to **localhost** port **8280**. If you want the container to be
accessible on the net, without using a reverse proxy sharing same host, you will need to
remove ``127.0.0.1:`` from ``HTTP_PORT`` variable in ``.env``.

#### Build and start the container

```sh
docker-compose up --build
```

See docker-compose documentation for more information and available options.

### Updating

Restarting the container will update tt-rss from the origin repository. If database needs to be updated,
tt-rss will prompt you to do so on next page refresh.

#### Updating container scripts

1. Stop the containers: ``docker-compose down && docker-compose rm``
2. Update scripts from git: ``git pull origin master`` and apply any necessary modifications to ``.env``, etc.
3. Rebuild and start the containers: ``docker-compose up --build``

### Suggestions / bug reports

- [Forum thread](https://community.tt-rss.org/t/docker-compose-tt-rss/2894)
