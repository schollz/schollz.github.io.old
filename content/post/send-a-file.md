---
title: "Send a File"
date: 2018-05-21T17:36:50-07:00
draft: true
tags: [thoughts]
slug: send-a-file
written: ["2018-05-21","2018-05","2018"]
---

# Table of contents

| Method        | Difficulty   | Windows?  | LAN? |
| :------------- |:-------------| :-----|:--------- |
| [Tor](#tor)     | Low | Not really | No 
| col 2 is      | centered      |   $12 | | 
| zebra stripes | are neat      |    $1 | | 

## Tor {#tor}

Tor is nice because in theory it is encrypted and anonymized file transfer. You need to specify the onion handle, but it can easily be created and destroyed relatively quickly.

Need `tor` and related.
```bash
sudo apt-get install tor torsocks
```

### Sender {#tor-sender}

```bash
$ go get -u -v github.com/schollz/onionserve
$ onionserve
Starting and registering onion service, please wait a couple of minutes...
Open Tor browser and navigate to http://XX.onion
Press enter to exit
```

### Receiver {#tor-receiver}

The receiver can browse the files using the Tor-browser or you can download via the command-line if you know the file name:

```bash
$ torsocks wget http://XX.onion/file 
```