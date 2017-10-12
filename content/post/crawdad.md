---
title: "Using crawdad"
date: 2017-10-11T20:03:10-06:00
tags: [coding]
slug: crawdad
---



![A new, simple, powerful content extractor](https://user-images.githubusercontent.com/6550035/31456157-58663efe-ae76-11e7-8e53-6a2a5b7a196c.png)

*crawdad* is a simple, yet powerful alternative for scraping in a distributed, persistent manner (backed by Redis). It can  do simple things, like generating site maps. It can also do complicated things, like extracting all the quotes from every page on a quotes website (tutorial follows).

## Install

First [get Docker](https://www.docker.com/community-edition) which will be used for running Redis. 

Then you can simply download *crawdad*:

```sh
$ wget https://github.com/schollz/crawdad/releases/download/v3.0.0/crawdad_3.0.0_linux_amd64.zip
$ unzip crawdad*zip
$ sudo mv crawdad*amd64 /usr/local/bin/crawdad
```

Unlike many other scraping frameworks, *crawdad* is a single binary that has no dependencies.

## Configure

For scraping, *crawdad* requires creating a [pluck configuration file](https://github.com/schollz/pluck#use-config-file). Here is the configuration file for scraping [quotes.toscrape.com](http://quotes.toscrape.com):

<script src="https://gist.github.com/schollz/02205b5c1a3c5ade132e17ce61ce1213.js"></script>

*pluck* is a language-agnostic way of extracting structured data from text without HTML/CSS/Regex. Essentially *pluck* is configured in a way you would tell your friend to grab data.

For example, the first *pluck* unit describes how you would get the quote text from [quotes.toscrape.com](http://quotes.toscrape.com). Starting from the beginning of the source, you look for the string "`span class="text"`" (called an *activator*). Once that is found, you look for a "`>`", the next activator. Then you capture all the characters until a "`<`" is seen (the *deactivator*). This will allow you to collect all the quotes.

Each of the *pluck* units will be found simultaneously and extracted from any HTML page crawled by *crawdad*.

## Run

First, start Redis with Docker:

```sh
$ docker run -d -p 6374:6379 redis
```

and then start *crawdad*:

```
$ time crawdad -p 6374 -set -u http://quotes.toscrape.com -pluck quotes.toml -include '/page/' -exclude '/tag/'
0.12s user 0.03s system 5% cpu 2.666 total
```

The `-set` flag tells the *crawdad* to create some new settings with a URL (`-u`) and a *pluck* configuration (`-pluck`) and with some inclusions/exclusions (`-include`/`-exclude`). The inclusions and exclusions ensures that only the `/page` links will be followed (in order to compare with scrapy).


## Extract data

The data from *crawdad* can be parsed in the same as *scrapy* by first dumping it,

```
$ crawdad -p 6374 -done done.json
```


The data, `done.json`, contains each URL as a key and the data it extracted. It needs to be quickly parsed, too, which can be done lickity-split in Python in 12 lines of code:

<script src="https://gist.github.com/schollz/f27547bb4716fc14fd574e9bbdad57a1.js"></script>

## *crawdad* bonuses

*crawdad* has some other mighty benefits as well. Once initiated, you can run another crawdad on a different machine:

```sh
$ crawdad -p 6374 -s X.X.X.X
```

This will start crawling using the same parameters as the first *crawdad*, but will pull from the queue. Thus, you can easily make a distributed crawler.

Also, since it is backed by Redis, *crawdad* is resilient to interruptions and allows you to restart from the point that it was interrupted. Try it!

# Comparison with *scrapy*

Here I will compare scraping the same site, [quotes.toscrape.com](http://quotes.toscrape.com/) with *crawdad* (my creation) and *scrapy* (the popular framework for scraping).

![scrapy is really useful tool to get started in scraping.](https://user-images.githubusercontent.com/6550035/31486741-b06865e4-aef5-11e7-8b0d-c5ed107b25b4.png)

*scrapy* is powerful, but complicated. Lets follow the tutorial to get a baseline on how a scrapy should run. 

## Install

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

## Configure

Actually, I will just use the [tutorial of *scrapy*](https://github.com/scrapy/quotesbot) to skip building it myself.

```sh
$ git clone https://github.com/scrapy/quotesbot.git
$ cd quotesbot
```
*scrapy* is not simple. It requires > 40 lines of Python code in several different files (`items.py`, `pipelines.py`, `settings.py`, `spiders/toscrape-css.py`). 


## Run

Lets run and time the result:

```
$ time scrapy crawl toscrape-xpath -o quotes.json
1.06s user 0.08s system 29% cpu 3.877 total
```

*scrapy* is about 10-30% slower than *crawdad*, plus it can not easily be run in a distributed, persistent way.




