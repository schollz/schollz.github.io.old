---
title: "Using IPFS for sending a file"
date: 2017-10-15T21:27:07-06:00
tags: [coding]
slug: ipfs-transfering
---

Sometimes you need to send someone a file. Previously I had many workarounds for this - my favorite was to make a temporary volume on DigitalOcean, upload the file, and give my friend the link to download it. There is a better way - use IPFS! When you use IPFS, you can transfer the file directly to your friend from your computer.

## First install and start IPFS

Here is the basic instructions to install:

```
wget https://dist.ipfs.io/go-ipfs/v0.4.11/go-ipfs_v0.4.11_linux-amd64.tar.gz
tar -xvzf go-ipfs*
cd go-ipfs
sudo ./install.sh
ipfs init
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/9001
ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
```

The last two lines are useful for listening on LAN connected devices.

Then start the daemon with

```
ipfs daemon
```

You could also start the daemon with an init script.[^1]

### Add the file and download

Then add the file to IPFS. When you add the file to IPFS it copy the file to your IPFS repo (usually `~/.ipfs`) and it will not touch the original file.

```
ipfs add somefile
```

Then tell your friend to download file using the IPFS hash:

```
wget https://ipfs.io/ipfs/QmSr1saoM3n1Sx8dBs5bz7ozU
```

You can also download this link from your browser. Or, for much faster downloads, you can use `https://github.com/schollz/pfd` to download all the pieces in parallel.

Once your friend has the file, then you can remove the file from being hosted on IPFS (if you want). Even though you'll still have the file in the original location, it will no longer be served from your IPFS daemon.

```
ipfs pin rm QmSr1saoM3n1Sx8dBs5bz7ozU
ipfs repo gc
```


_Note:_ after deletion your content may still be stored in the IPFS Gateway cache for some time (not sure how long).

[^1]: I made an init script here: https://gist.github.com/schollz/da71aa2a5a43d76739ef034331c7b0bb