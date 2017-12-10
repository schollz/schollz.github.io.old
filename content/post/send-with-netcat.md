---
title: "Send a file with netcat"
date: 2017-10-28T04:15:10-06:00
tags: [coding]
slug: send-with-netcat
---

I've mentioned [how to send a file with IPFS](/ipfs-transfer/) and also [how to send a file with an assortment of modern techniques](/sending-a-file/). Here's yet another method to send a file. It's only a line of bash, and you can get a nice progress bar and upload to any server that is listening on a certain TCP port.

On the server computer, `server.com`, that is receiving the file, just do:

```
netcat -l -p 6000 > somefile
```


On the other computer that is sending the file just do:

```
cat somefile | pv | netcat server.com 6000
```
