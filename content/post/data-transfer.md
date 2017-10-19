---
title: "Data Transfer"
date: 2017-10-18T20:11:36-06:00
draft: true
tags: [thoughts]
slug: data-transfer
---

I wrote previously [about transfering files with IPFS](/ipfs-transfering/) which
seemed like a novel and simple way of transfering files. However I soon realized
that it is not the most efficient. It requires either having a well-connected
peer to visit your site or it has to do a lookup in the distributed hash table
(DHT for those in-the-know) which seems to take
awhile. Still, it does work! Anyways, I got to thinking that there must be
a better solution. 

**But what is the problem?**

The problem is that my good friend Jessie and I want to watch a documentary on
turkeys[^turkey] and that I have the movie on my computer and she does not. The problem
is that now I want to send a ~1 gigabyte movie to someone who 
lives 2,000 miles away in a different country. I could mail her a USB with the
file but that transfer rate is about 1 kB/s and also costs 1/2 cent per megabyte.
I could upload the documentary to my DigitalOcean droplet, then host the file so
she can download it. That transfer rate is better, about 500 kB/s and costs
< 5 cents total (for hosting costs on spinning up the volume). But we want to
learn about turkeys now! Is there a faster way?

It turns out there are a lot of ways. For simple uploading/downloading you could use [send.firefox.com](https://send.firefox.com/), [IPFS](/ipfs-transfering/), or a DigitalOcean upload as I described in the last paragraph. However, the way that I am thinking about, the 
direct transfer of a file between peers has been done in some nice open-source projects. There is [instant.io](https://instant.io/) and there is [file.pizza](https://file.pizza/) which both leverage the WebTorrent javascript protocols. However, I noticed that both have problems with handling big files,[^1] which may be a browser issue that occurs. Also, speaking of browsers, I'd rather not rely on them to transfer my files. Browsers change too fast, and have too much under the hood to understand what is happening and whether data is saved or exposed or encrypted or what.

It still turns out that there are solutions that work on the command-line. There is [toss](https://github.com/zerotier/toss)[^2] and there is the amazing [wormhole](https://github.com/warner/magic-wormhole) package. Still, though, when I looked at `wormhole` I realized I would have to install it on Jessie's computer. Normally that wouldn't be a problem, except that Jessie uses Windows and the only thing Jessie knows about Python is that it is a snake. Also the installation for `wormhole` is not simple - it might require Visual C++, and very likely some Cygwin-ninjaing. 

**I wish there was something like `wormhole` but without any of the Python baggage!**

So, now there is.

[^turkey]: The documentary is *My Life as a Turkey* which follows an actors real interactions with wild turkeys following methodology put in place through author Joe Hutto's book *Illumination in the Flatwoods.*

[^1]: See [instant.io issue #149](https://github.com/webtorrent/instant.io/issues/149) and [file.pizza issue #73](https://github.com/kern/filepizza/issues/73).

[^2]: Though [issues also persist for toss](https://github.com/zerotier/toss/issues/2).
