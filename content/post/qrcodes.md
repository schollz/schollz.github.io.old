---
title: "QR coding"
date: 2017-10-06T08:10:35-06:00
draft: true
tags: [coding]
slug: qrcodes
written: ["2017","2017-10","2017-10-06"]
---

Is it possible to back up a computer program onto a piece of paper so that it can be restored with a couple of photos?

## Pre-requisities

```
sudo apt-get install zbar-tools qrencode
```






```
cat test.txt | gzip | base64 | split --bytes=2400 --numeric-suffixes --additional-suffix=piece
for f in x*piece; do; cat $f | qrencode -o $f.png; done;
zbarimg -D --raw x*piece*png | base64 -d | gzip -d > test2.txt
diff test.txt test2.txt
```


```
cat test.txt | base64 | split --bytes=2400 --numeric-suffixes --additional-suffix=piece
for f in x*piece; do; cat $f | qrencode -o $f.png; done;
convert -append x00piece.png x01piece.png 0double.png
```