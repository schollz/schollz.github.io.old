---
title: "Send a file with IPFS"
date: 2017-10-15T21:27:07-06:00
tags: [coding]
slug: ipfs-transfer
---

Sending a file with IPFS is fun (after all it is leveraging the peer-to-peer network and content-addressable blocks of data!) and easy. 

## Install IPFS

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

The last two lines are useful for listening on LAN connected devices. The port `0.0.0.0` will let run the IPFS daemon on a different computer but still use the peer-to-peer portal from that computer.

Then start the daemon with

```
ipfs daemon
```

You could also start the daemon with an init script.[^1]

## Load the file into IPFS

Then add the file to IPFS. When you add the file to IPFS it copy the file to your IPFS repo (usually `~/.ipfs`) and it will not touch the original file.

```
$ ipfs add somefile
added QmSr1saoM3n1Sx8dBs5bz7ozU somefile
```

## Send it!

Then tell your friend to download file using the IPFS hash from the output:

```
wget https://ipfs.io/ipfs/QmSr1saoM3n1Sx8dBs5bz7ozU
```

This link does *not require* the user to have IPFS. It uses the public gateway, `https://ipfs.io/ipfs/`, which lookup peers from their main IPFS servers.

## Cleanup (optional)

Once your friend has the file, then you can remove the file from being hosted on IPFS (if you want). Even though you'll still have the file in the original location, it will no longer be served from your IPFS daemon.

```
ipfs pin rm QmSr1saoM3n1Sx8dBs5bz7ozU
ipfs repo gc
```


_Note:_ after deletion your content may still be stored in the IPFS Gateway cache for some time (not sure how long).

[^another]: IPFS is still growing, and the distributed hash table lookup means it may take quite awhile to transfer big files.

[^1]: I made an init script here: https://gist.github.com/schollz/da71aa2a5a43d76739ef034331c7b0bb
