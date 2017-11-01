---
title: "Sending a file in 2017"
date: 2017-10-21T20:11:36-06:00
tags: [coding]
slug: sending-a-file
description: Evaluating different means to send a file.
---

My good friend Jessie and I want to watch a documentary movie on turkeys together.[^turkey] I have the file on my computer and she does not, so I want to send this file to her directly[^direct] from my computer. There are a couple of restrictions though:

- the turkey documentary is a ~1 GB file
- Jessie lives 2,000 miles away in a different country
- Jessie uses Windows OS
- Jessie is not a programmer, and avoids anything that involves running something on the command-line

**How should I send the movie, in the fastest possible way, so we can start learning about turkeys together?**[^xkcd] Even though its 2017, the method I use to send a file from my computer to someone else's computer will depend greatly on who that someone is and how comfortable they are with computers. Here's a table I made of the methods I tried with a brief description of what I would do to send the file (with my reaction) and what Jessie does to receive the file (and her reaction).


<table>
<thead>
<tr>
<th align="center" width="20%">Method</th>
<th align="center" width="40%">What I do</th>
<th align="center" width="40%">What Jessie does</th>
</tr>
</thead>
<tbody>
<tr>
<td align="center">
    <a href="#mail">mail</a>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f644.svg"/>
    </div></center>
    mail a USB drive
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f600.svg" alt="" />
    </div></center>
    plug in USB drive 
</td>
</tr>
<tr>
<td align="center">
    <a href="#scp"><code>scp</code></a>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f600.svg"/>
    </div></center>
    run <code>scp</code>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f635.svg" alt="" />
    </div></center>
    determine local IP, log-in to router and forward port 22, start SSH server, generate guest account and send password
</td>
</tr>
<tr>
<td align="center">
    <a href="#scp">personal server</a>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f614.svg"/>
    </div></center>
    setup port-forwarding, download a server and a reverse proxy
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f604.svg" alt="" />
    </div></center>
    click a link
</td>
</tr>
<tr>
<td align="center">
    <a href="#ipfs">IPFS</a>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f615.svg"/>
    </div></center>
    <a href="/ipfs-transfer/">install IPFS</a>, pin file, warm up cache
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f604.svg" alt="" />
    </div></center>
    click a link
</td>
</tr>
<tr>
<td align="center">
    <a href="#ipfs">WebTorrent</a>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f610.svg"/>
    </div></center>
    drag-and-drop file 
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f604.svg" alt="" />
    </div></center>
    click a link (hopefully)
</td>
</tr>
<tr>
<td align="center">
    <a href="#wormhole"><code>wormhole</code></a>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f612.svg"/>
    </div></center>
    apt-get Python2 ecosystem 
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f62d.svg" alt="" />
    </div></center>
    install Python ecosystem and Visual C++ 
</td>
</tr>
<tr>
<td align="center">
    <a href="#croc"><code>croc</code></a>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/1f600.svg"/>
    </div></center>
    run <code>croc</code>
</td>
<td align="center"> 
    <center><div style="width:30%">
        <img src="/img/thumbs-up-sign_1f44d.png" alt="" />
    </div></center>
    download <code>croc</code> and double-click
</td>
</tr>
</tbody>
</table>


Read the following for a more in-depth description of the methods. Basically after investigating a lot of the techniques I ended up making my own.[^standards]

## Mail

![Transfer rate: roughly 0.002 MB/s and cost is ~$1.20.](/img/mail.png)

I could mail Jessie a USB with the file. I'd have to buy a USB stick, even though I might get it back, its about $4. For a cross-country letter I would have to buy a stamp for $1.20. Also international postage is quite slow, so it would typically take about 10 days to reach her. Since I could recuperate the USB stick cost, sending ~1 gigabyte is basically a flat rate of $1.20, but with a transfer rate is about 0.002 MB/s. Though, the benefit here is that neither of us need to have a server, or know what port-forwarding or reverse proxies or DNSs are. One drawback is that this is not encrypted, although their the breaking of federal crimes would help to de-incentavize interfering with the transfer.

# `scp`

![Transfer rate: your upload speed.](/img/scp.png)

I use `scp` for almost everything, since I've got all my computers networked toegether. However, even though it seems like its super easy to do, there is a bit of setup. You have to have an SSH server running and you have to setup port-forwarding and determine your public IP address. Now all of this can be done pretty easily. If I were telling someone I would say: download Cygwin and choose `openssh` for installation, run cygwin and do ifconfig to get your local IP, login to your router and forward port 22 to your local IP address, then goto icanhazip.com to get your public IP address and tell the other person your public address. But, to really be secure (and not share your personal password) you'd also have to share a SSH key with your friend. Well, I guess `scp` is not really great for sharing between friends afterall, but it is certainly great for personal use!

# Personal server

![Transfer rate: harmonic mean of Your upload speed and your recipient's download rate.](/img/droplet.png)


Since I do know what a server is and how to use it, there is a easy solution. I could upload the documentary to my DigitalOcean droplet, then host the file so she can download it. The nice thing about DigitalOcean [now-a-days is that you can spin-up a new volume](https://www.digitalocean.com/community/tutorials/how-to-use-block-storage-on-digitalocean) in about 2 minutes, mount it, and put a file on it for someone to download. A 3 GB volume (which will easily accommodate my ~1 GB) costs $0.30 *per month*. 

So I spin up my volume, `scp` my file to my personal server and I host the file with something like Caddy. I send Jessie the link, I can let her download it. Once she downloads it I can go log-in to DigitalOcean and delete the volume. If Jessie downloads it in 24 hours it would only cost me exactly $0.01, which is a flat rate.

The transfer rate involves two steps. First I upload the file to DigitalOcean  at 0.8 MB/s. Then Jessie downloads it at about 3.5 MB/s. Assuming Jessie downloads it the instant it is finished uploading (to minimize the time between steps to zero), the overall transfer rate is the harmonic mean of the two rates, about 0.7 MB/s.

# WebTorrent

![Transfer rate: your upload speed](/img/webtorrent.png)

There are web browsers out there that let you store files temporarily. An example is [send.firefox.com](https://send.firefox.com/). This case would be very similar to the personal server solution, except you are limited to the bandwidths and quotas of the web browser (which is 1 gigabyte for send.firefox.com). The more modern approach is something like [instant.io](https://instant.io/) or [file.pizza](https://file.pizza/) which both leverage the WebTorrent javascript protocols. 

These sites let you directly send files from one peer to another. However, I noticed that both have problems with handling big files,[^issues] which may be a browser issue that occurs (definitely an issue on Chrome). Also, speaking of browsers, I'd rather not rely on them to transfer my files (in fact the second time I tried file.pizza it gave me a `503` and instant.io was just unresponsive). These servers depend on too many undependables: people that host the servers, browsers that change too fast, too much under the hood to understand what is happening and whether data is saved or exposed or encrypted or what.

# IPFS

![Transfer rate: your upload speed plus ~25 minutes for look-up (first time). Subsequently, the recipient's download speed.](/img/ipfs.png)


Peer-to-peer technologies are very popular now, not just in the browser. The interplanetary file system (IPFS) creates a [peer-to-peer hypermedia protocol](https://ipfs.io/) for sharing files. Seem [my previous post](/ipfs-transfer) about sending a file with IPFS. The problem with IPFS is that it requires a long lookup for rare files, in the case of most files you might want to share. However, if you are sharing the file with multiple people the speeds will increase as there are some great caching mechanisms in place on the gateway. Because the peer-to-peer lookup depends on so many factors, the download may be a bit stochastic. 

# wormhole

![Transfer rate: your upload speed.](https://i.imgur.com/zvG7RTM.png =100px)

It still turns out that there are solutions that work on the command-line. There is [toss](https://github.com/zerotier/toss)[^toss] and there is the amazing [wormhole](https://github.com/warner/magic-wormhole) package. Still, though, when I looked at `wormhole` I realized I would have to install it on Jessie's computer. Normally that wouldn't be a problem, except that Jessie uses Windows and the only thing Jessie knows about Python is that it is a snake. Also the installation for `wormhole` is not simple - it seems to require Visual C++, and very likely some Cygwin-ninjaing. 


# croc

![Transfer rate: your upload speed.](/img/croc.png)


Here's my shameless plug of a new tool I've been working on. Essentially it is the same as `wormhole` but it has no dependencies, you [can just download it and run](https://github.com/schollz/croc/releases/latest). It does encryption, too, and uses parallel TCP ports to transfer files as fast as possible (which is about as fast as all the other programs). 

This solution ends up being ideal for Jessie and I because its simple for me (I just download and run with the file as a flag) and its simple for Jessie (she just downloads and run).

---

## Foot notes

[^direct]: By "directly" I mean generally without being stored on a server in the process of transferring. Things like email, Dropbox, Google Drive, OneDrive, etc. all have an intermediate server which stores your file before the other person can retrieve it. 

[^turkey]: The documentary is *My Life as a Turkey* which follows an actors real interactions with wild turkeys following methodology put in place through author Joe Hutto's book *Illumination in the Flatwoods.*

[^xkcd]: For posterity's sake [here is the relevant XKCD](https://xkcd.com/949/).

[^standards]: Again, for posterity's sake [here is the relevant XKCD](https://xkcd.com/927/).

[^rates]: All of these "rates" were estimated from my own computers. I had two computers - computer 1 was connected to a VPN in Seattle and computer 2 was connected to a network in Edmonton. Though physically located in the same place, these tests monitor the transfer speed from a file from computer 1 (Seattle) to computer 2 (Edmonton). Still, you probably shouldn't believe these, or any other benchmarks. Try it yourself!

[^ipfs]: The rate to actually download a file can vary widely. Once it is found in the system, it is pretty fast, but the peers must first be able to find it which can take quite awhile the first time it is requested.

[^issues]: See [instant.io issue #149](https://github.com/webtorrent/instant.io/issues/149) and [file.pizza issue #73](https://github.com/kern/filepizza/issues/73).

[^toss]: Though [issues also persist for toss](https://github.com/zerotier/toss/issues/2).
