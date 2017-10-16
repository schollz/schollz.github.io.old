---
title: "Using IPFS for sending a file"
date: 2017-10-15T21:27:07-06:00
tags: [coding]
slug: ipfs-transfering
---

Sometimes you need to send someone a file. Previously I had many workarounds for this - my favorite was to make a temporary volume on DigitalOcean, upload the file, and give my friend the link to download it. There is a better way - use IPFS! When you use IPFS, you can transfer the file directly to your friend from your computer.

First install[^1] and start IPFS.[^2]

Then add the file to IPFS. When you add the file to IPFS it copy the file to your IPFS repo (usually `~/.ipfs`) and it will not touch the original file.

```
$ ipfs add somefile
added QmSr1saoM3n1Sx8dBs5bz7ozU somefile
$ ipfs pin add somehash
pinned QmSr1saoM3n1Sx8dBs5bz7ozU recursively
```

Then tell your friend to download file using the IPFS hash:

```
$ wget https://ipfs.io/ipfs/QmSr1saoM3n1Sx8dBs5bz7ozU
```

You can also download this link from your browser. Or, for much faster downloads, you can use `https://github.com/schollz/pfd` to download all the pieces in parallel.

Once your friend has the file, then you can remove the file from being hosted on IPFS (if you want). Even though you'll still have the file in the original location, it will no longer be served from your IPFS daemon.

```
$ ipfs pin rm QmSr1saoM3n1Sx8dBs5bz7ozU
unpinned QmSr1saoM3n1Sx8dBs5bz7ozU
$ ipfs repo gc
removed QmRyZ3B2GP6kUd61UYYg
...
```


_Note:_ after deletion your content may still be stored in the IPFS Gateway cache for some time (not sure how long).

[^1]: You can download IPFS [here](https://dist.ipfs.io/#go-ipfs) 
[^2]: Read how to get started [here](https://ipfs.io/docs/getting-started/). 