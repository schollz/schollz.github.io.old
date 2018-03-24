---
title: "Look ma, no hard disk"
date: 2017-10-27T04:51:39-06:00
tags: [coding]
slug: just-ram
written: ["2017","2017-10","2017-10-27"]
---


I had a bad habit of leaving everything in my Downloads folder, and never clearing anything out. I might need it, assume, at some point. However, this is never true. To get myself out of this "I might need it*" mindset, I started deleting my `Downloads/` folder every time I start my computer. This way, I had to remember, that anything I put in there would disappear when I turned my computer off. This was easy to do with one line in `crontab -e`, 

```
@reboot  /bin/rm -rf /home/zns/Downloads/*
```

However there is even a better way. You can mount the Downloads directory directly to RAM! That, not only will it automatically purge itself when your computer turns off, it should also run faster! You can easily do this with `tmpfs`, just add this line to your `/etc/fstab`:

```
tmpfs /home/zns/Downloads tmpfs defaults,noatime,mode=1777 0 0
```