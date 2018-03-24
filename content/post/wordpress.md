---
title: "Using Wordpress with Docker"
date: 2017-01-11T13:54:51-06:00
tags: [coding]
slug: wordpress-on-docker
written: ["2017","2017-01","2017-01-11"]
---

I like wordpress, but it is very intensive to get working, as it uses a lot of PHP and requires SQL. Of course, nowadays you can do everything in Docker, so here is my method for getting wordpress to work great on Docker. 

Using Docker, I was able to get 2 blogs run on the smallest DigitalOcean droplet (which was already running two dozen other things). Each blog required 360MB of RAM, and the total Docker space was 3.1G. 

The following instructions will enable you to go from zero to Wordpress in about six minutes.

### Setup 

First make a file `docker-compose.yml`:

```yaml
version: '2'

services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: wordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8001:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_PASSWORD: wordpress
     volumes:
       - /path/to/some/folder/on/your/computer/wp_html:/var/www/html
volumes:
    db_data:
```

Then, to start just use (add `-d` for daemon mode)

```
docker-compose up
```

If you need to stop it just use

```
docker-compose stop
```

### Reverse proxy 

If you are using a domain name, you can easily use Caddy as a reverse proxy. Here is an example `Caddyfile`:

```shell
http://blogname {
    proxy / 127.0.0.1:8006 {
        transparent
    }
}
```

Make sure to goto your blog and update it accordingly to http://blogname.

For using SSL, [checkout this blog](https://www.heavymetalcoder.com/how-to-get-wordpress-working-with-https-behind-a-reverse-proxy/) which describes the process for correctly configuring Wordpress to allow it.

### Backup/Restore 

Wordpress on docker is also nice because its very easy to move. I basically [copied the instructions here](https://libertyseeds.ca/2015/11/24/Backup-migration-and-recovery-with-WordPress-and-Docker-Compose/) to get a simple way to backup and restore a Wordpress instance.

To backup:

```
docker exec -i wordpress_db_1 mysqldump --user=wordpress --password=wordpress wordpress > backup.sql
tar -czvf wp_html.tar.gz wp_html
```

To restore:

```
docker exec -i wordpress_db_1 mysql --user=wordpress --password=wordpress wordpress < backup.sql
tar -xvzf wp_html.tar.gz 
```

