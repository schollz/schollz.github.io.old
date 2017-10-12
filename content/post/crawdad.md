---
title: "Comparing scrapy with crawdad"
date: 2017-10-11T20:03:10-06:00
tags: [coding]
slug: crawdad
---

Here I will compare scraping the same site, [quotes.toscrape.com](http://quotes.toscrape.com/) with *crawdad* (my creation) and *scrapy* (the popular framework for scraping).

## Using *scrapy*

![scrapy is really useful tool to get started in scraping.](https://user-images.githubusercontent.com/6550035/31486741-b06865e4-aef5-11e7-8b0d-c5ed107b25b4.png)

*scrapy* is powerful, but complicated. Lets follow the tutorial to get a baseline on how a scrapy should run. 

### Install

First install *scrapy* by installing the dependencies (there are a lot of dependencies).

```sh
$ sudo apt-get install python-dev python-pip libxml2-dev libxslt1-dev zlib1g-dev libffi-dev libssl-dev
$ sudo -H python3 -m pip install --upgrade scrapy
```

Once you get it install you can check the version:

```sh
$ scrapy -version
Scrapy 1.4.0 - project: quotesbot
```

### Build scraper

Actually, I will just use the [tutorial of *scrapy*](https://github.com/scrapy/quotesbot) to skip building it myself.

```sh
$ git clone https://github.com/scrapy/quotesbot.git
$ cd quotesbot
```
*scrapy* is not simple. It requires > 40 lines of Python code in several different files (`items.py`, `pipelines.py`, `settings.py`, `spiders/toscrape-css.py`). 


### Run

Lets run and time the result:

```
$ time scrapy crawl toscrape-xpath -o quotes.json
1.16s user 0.09s system 26% cpu 4.728 total
```

Scraping is fast! Only about 4-5 seconds for the 11 pages! 



## Using *crawdad*

![Crawdads crawl around and pinch you.](https://user-images.githubusercontent.com/6550035/31456157-58663efe-ae76-11e7-8e53-6a2a5b7a196c.png)

*crawdad* is a simple, yet powerful alternative for scraping in a distributed, persistent manner (since its backed by Redis).

### Install

First [get Docker](https://www.docker.com/community-edition) which will be used for running Redis. Then you can simply download *crawdad*:

```sh
$ wget https://github.com/schollz/crawdad/releases/download/v3.0.0/crawdad_3.0.0_linux_amd64.zip
$ unzip crawdad*zip
$ sudo mv crawdad*amd64 /usr/local/bin/crawdad
```

Unlike *scrapy*, *crawdad* is a single binary that has no dependencies.

## Build scraper

*scrapy* does require some coding. It requires writing a TOML file in order to scrape the webpage. Here is the TOML for quotes.toscrape.com. Read more about pluck TOML files [here](https://github.com/schollz/pluck#use-config-file). Essentially they can be written without knowing any CSS or HTML and are intuitive for grabbing data.

<script src="https://gist.github.com/schollz/02205b5c1a3c5ade132e17ce61ce1213.js"></script>

Basically you are telling the computer to find all the "activators" and collect the text until a "deactivator". This is completely code-agnostic, and can be determined simply by looking at the HTML/CSS of the webpage.


### Run

First, start Redis with Docker:

```sh
$ docker run -d -p 6374:6379 redis
```

and then start *crawdad*:

```
$ time crawdad -p 6374 -set -u http://quotes.toscrape.com -pluck quotes.toml -include '/page/' -exclude '/tag/'
0.26s user 0.07s system 9% cpu 3.510 total
```

*crawdad* is a little faster, completing in less than 4 seconds for the same data. 

The data from *crawdad* can be parsed in the same as *scrapy* by first dumping it,

```
$ crawdad -p 6374 -done done.json
```


The data, `done.json`, contains each URL as a key and the data it extracted. It needs to be quickly parsed, too, which can be done lickity-split in Python in 12 lines of code:

<script src="https://gist.github.com/schollz/f27547bb4716fc14fd574e9bbdad57a1.js"></script>

## Thoughts

*crawdad* has some other mighty benefits as well. Once initiated, you can run another crawdad on a different machine:

```sh
$ crawdad -p 6374 -s X.X.X.X
```

This will start crawling using the same parameters as the first *crawdad*, but will pull from the queue.

Also, since it is backed by Redis, *crawdad* is resilient to interruptions and allows you to restart from the point that it was interrupted.
