---
title: "Sending a file in 2017"
date: 2017-10-18T20:11:36-06:00
draft: true
tags: [coding]
slug: sending-a-file
---

# TL;DR

Don't read this, just look at this table.

| Method        | Rate (MB/s) | Cost  | Requirements         |
| ------------- |:-----------:| -----------:|----------------------|
| [mail](#mail)        | 0.002       |  $1.20     | sender needs USB drive   |
| `scp`         | 3.3         | free    | receiver needs port forwarding   | 
| [personal server](#personal-server)    | 1.5         | $0.01 | sender needs server |
| [IPFS](#ipfs)          | 1.0   |    free     |  sender needs [to install IPFS](/ipfs-transfer/)             |
| [`wormhole`](#command-line)    |  1.8        |   free     | sender+receiver need Python ecosystem |
| `croc`        | 1.7         |  free     |                      |

My good friend Jessie and I want to watch a documentary on turkeys[^turkey] and that I have the movie on my computer and she does not. The problem is that now I want to send a ~1 gigabyte movie to someone who lives 2,000 miles away in a different country. 

## Mail

I could mail her a USB with the file. I'd have to buy a USB stick, even though I might get it back, its about $4. For a cross-country letter I would have to buy a stamp for $1.20. Also international postage is quite slow, so it would typically take about 10 days to reach her. Since I could recupe the USB stick cost, sending ~1 gigabyte is basically a flat rate of $1.20, but with a transfer rate is about 0.002 MB/. Though, the benefit here is that neither of us need to have a server, or know what port-forwarding or reverse proxies or DNSs are.

## Personal server

Since I do know what a server is and how to use it, there is a easy solution. I could upload the documentary to my DigitalOcean droplet, then host the file so she can download it. The nice thing about DigitalOcean [now-a-days is that you can spin-up a new volume](https://www.digitalocean.com/community/tutorials/how-to-use-block-storage-on-digitalocean) in about 2 minutes, mount it, and put a file on it for someone to download. A 3 GB volume (which will easily accommodate my ~1 GB) costs $0.30 *per month*. 

So I spin up my volume, `scp` my file to my personal server and I host the file with something like Caddy. I send Jessie the link, I can let her download it. Once she downloads it I can go log-in to DigitalOcean and delete the volume. If Jessie downloads it in 24 hours it would only cost me exactly $0.01, which is a flat rate.

The transfer rate involves two steps. First I upload the file to DigitalOcean  at 1.8 MB/s. Then Jessie downloads it at about 8.9 MB/s. Assuming Jessie downloads it the instant it is finished uploading (to minimize the time between steps to zero), the overall transfer rate is the harmonic mean of the two rates, about 1.5 MB/s.

## Web-browsers

There are web-browsers out there that let you store files temporarily. An example is [send.firefox.com](https://send.firefox.com/). This case would be very similar to the personal server solution, except you are limited to the bandwidths and quotas of the web browser (which is 1 gigabyte for send.firefox.com).

The more modern approach is something like [instant.io](https://instant.io/) or [file.pizza](https://file.pizza/) which both leverage the WebTorrent javascript protocols. These sites let you directly send files from one peer to another. However, I noticed that both have problems with handling big files,[^issues] which may be a browser issue that occurs. Also, speaking of browsers, I'd rather not rely on them to transfer my files. Browsers change too fast, and have too much under the hood to understand what is happening and whether data is saved or exposed or encrypted or what.

## IPFS

Peer-to-peer technologies are very popular now, not just in the browser. The interplanetary file system (IPFS) creates a [peer-to-peer hypermedia protocol](https://ipfs.io/) for sharing files. Seem [my previous post](/ipfs-transfer) about sending a file with IPFS. The problem with IPFS is that it requires a long lookup for rare files, in the case of most files you might want to share. However, if you are sharing the file with multiple people the speeds will increase as there are some great caching mechanisms in place on the gateway. Because the peer-to-peer lookup depends on so many factors, the download may be a bit stochastic. Even so, the rate is pretty good - I was able to transfer the file in 1 MB/s.

## Command-line 

It still turns out that there are solutions that work on the command-line. There is [toss](https://github.com/zerotier/toss)[^toss] and there is the amazing [wormhole](https://github.com/warner/magic-wormhole) package. Still, though, when I looked at `wormhole` I realized I would have to install it on Jessie's computer. Normally that wouldn't be a problem, except that Jessie uses Windows and the only thing Jessie knows about Python is that it is a snake. Also the installation for `wormhole` is not simple - it seems to require Visual C++, and very likely some Cygwin-ninjaing. 


[^turkey]: The documentary is *My Life as a Turkey* which follows an actors real interactions with wild turkeys following methodology put in place through author Joe Hutto's book *Illumination in the Flatwoods.*

[^issues]: See [instant.io issue #149](https://github.com/webtorrent/instant.io/issues/149) and [file.pizza issue #73](https://github.com/kern/filepizza/issues/73).

[^toss]: Though [issues also persist for toss](https://github.com/zerotier/toss/issues/2).