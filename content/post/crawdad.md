---
title: "Comparing scrapy with crawdad"
date: 2017-10-11T20:03:10-06:00
draft: true
tags: [coding]
slug: crawdad
---


## Using *scrapy*

*scrapy* is powerful, but not straightforward. You can use a well-defined scraper from the tutorial to get started. First you can install it via `apt` since installing via `pip` can result in a lot of problems (when I try to install the latest `cryptography` I always get `RequirementParseError: Invalid requirement, parse error at "'; python'"`).

```sh
$ sudo apt-get install python-dev python-pip libxml2-dev libxslt1-dev zlib1g-dev libffi-dev libssl-dev
$ sudo -H python3 -m pip install --upgrade scrapy
```

Once you get it install you can check the version:

```sh
$ scrapy -version
Scrapy 1.4.0 - project: quotesbot
```

Then, lets use the tutorial version of *scrapy*

```sh
$ git clone https://github.com/scrapy/quotesbot.git
$ cd quotesbot
$ time scrapy crawl toscrape-xpath -o quotes.json
1.16s user 0.09s system 26% cpu 4.728 total
```

Scraping is fast! Only about 4-5 seconds for the 11 pages! 

However, *scrapy* is not simple. It requires > 40 lines of Python code in several different files (`items.py`, `pipelines.py`, `settings.py`, `spiders...`). Also *scrapy* has a lot of dependencies that need to be installed and up-to-date.

## Using *crawdad*

Conversly, *crawdad* has no dependencies. It does require some coding. It requires writing a TOML file in order to scrape the webpage. Here is the TOML for quotes.toscrape.com. It is written in [pluck](https://github.com/schollz/pluck) which is very intuitive for grabbing data.

```toml
[[pluck]]
name="quote"
activators=['span class="text"','>']
deactivator='<'
limit=-1

[[pluck]]
name="author"
activators=['small class="author"','>']
deactivator='<'
limit=-1

[[pluck]]
name="keywords"
activators=['keywords','content="']
deactivator='"'
limit=-1
```
Then to run:

```sh
$ docker run -d -p 6374:6379 redis
$ time crawdad -p 6374 -set -u http://quotes.toscrape.com -pluck quotes.toml -include '/page/' -exclude '/tag/'
0.26s user 0.07s system 9% cpu 3.510 total
$ crawdad -p 6374 -done done.txt
```

*crawdad* is a little faster, completing in less than 4 seconds for the same data. 

The data needs to be quickly parsed, too, which can be done lickity-split in Python in 12 lines of code. Here's `parse.py`:

```python
import json

d = json.load(open('done.txt','r'))

data = []
for k in d:
    j = json.loads(d[k])
    for i,_ in enumerate(j['quote']):
        dat = {}
        for k2 in j:
            dat[k2] = j[k2][i]
        data.append(dat)

with open('quotes.json','w') as f:
    f.write(json.dumps(data,indent=2))
```

*crawdad* has some other mighty benefits as well. Once initiated, you can run another crawdad on a different machine:

```sh
$ crawdad -p 6374 -s X.X.X.X
```

This will start crawling using the same parameters as the first *crawdad*, but will pull from the queue.

