---
title: "Read news in the terminal with Docker"
date: 2017-10-05T05:44:33-06:00
tags: ["coding",]
slug: docker-news
---

I've been working on *readable*, a simple bookmarklet for easily reading articles in the browser ([Github](https://github.com/schollz/readable)). As part of this, I made a Docker image that utilizes [Mozilla's *readability* package](https://github.com/mozilla/readability).


You can easily use the Docker image to directly read articles from the command line.

First pull it.

```
$ docker pull schollz/readable
```

Then set a URL that contains a news article:

```bash
$ URL=http://www.cnn.com/2017/10/03/world/nobel-physics-prize-2017/index.html
```

Then read!

``` shell
$ docker run --rm -t schollz/readable $URL | more

----------------------------------------------------------
Nobel Prize in Physics goes to 'black hole telescope' trio
----------------------------------------------------------

Story highlights

-   The development proves Einstein's prediction of gravitational waves
-   More than 1,000 people worked on the technology over four decades

(CNN)The 2017 Nobel Prize in Physics has been awarded to Rainer Weiss,
Barry C. Barish and Kip S. Thorne for their detection of gravitational
waves, a development scientists believe could give vital clues to the
origins of the universe.
```
