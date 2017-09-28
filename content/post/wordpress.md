---
title: "Using wordpress with docker"
date: 2017-09-27T13:54:51-06:00
draft: true
tags: [coding]
slug: wordpress-on-docker
---

I like wordpress, but it is very intensive to get working, as it uses a lot of PHP and requires SQL. Of course, nowadays you can do everything in Docker, so here is my method for getting wordpress to work great on Docker.

For info, I was able to make 2 blogs run on the smallest DigitalOcean droplet. Each blog required 360MB of RAM, and the total Docker space was 3.1G.

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

You can easily use Caddy as a reverse proxy. Here is an example `Caddyfile`:

```
http://blogname {
    proxy / 127.0.0.1:8006 {
        transparent
    }
}
```

Make sure to goto your blog and update it accordingly to http://blogname.

For using SSL, [checkout this blog](https://www.heavymetalcoder.com/how-to-get-wordpress-working-with-https-behind-a-reverse-proxy/)

### Backup/Restore 

[(source)](https://libertyseeds.ca/2015/11/24/Backup-migration-and-recovery-with-WordPress-and-Docker-Compose/)

Backup:

```
docker exec -i wordpress_db_1 mysqldump --user=wordpress --password=wordpress wordpress > backup.sql
tar -czvf wp_html.tar.gz wp_html
```

Restore:

```
docker exec -i wordpress_db_1 mysql --user=wordpress --password=wordpress wordpress < backup.sql
tar -xvzf wp_html.tar.gz 
```

