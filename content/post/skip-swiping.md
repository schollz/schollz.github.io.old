---
title: "Skip swiping with one line of bash"
date: 2017-09-27T06:41:49-06:00
draft: true
slug: skip-swiping
tags: [hacks]
---


When using dating apps, I was annoyed at having to search a pool of a lot of people who would never respond to me after I swiped right. It seemed to me to be a waste of time to swipe through those people who would not actually be available in my dating pool. I'd rather only view a pool of people who respond to me so we can open a dialog right away to see whether we would match. 

I decided to automate this to *swipe right on everyone,* to get past this first block in the process of dating apps. I found one line of code that allows me to "like" everyone and then wait and see who actually responds. 

This has been successful for me, and I'm making it "open-source" so maybe it will help you.

### Instructions 

The following will be instructions for **Android phones only** on any operating system.

1. [Download the android debug bridge](https://developer.android.com/studio/releases/platform-tools.html) for your operating system: [Windows](https://dl.google.com/android/repository/platform-tools-latest-windows.zip), [Mac](https://dl.google.com/android/repository/platform-tools-latest-darwin.zip), or [Linux](https://dl.google.com/android/repository/platform-tools-latest-linux.zip). Then unzip and cd into the `platform-tools` directory.

2. [Enable your phone to use adb](https://developer.android.com/studio/command-line/adb.html#Enabling). Go to **Settings > About Phone** and tap **Build number** seven times. Then return to previous screen to find  **Developer options** at the bottom. Finally, goto **Developer options** and enable **USB debugging**. 

3. Plug in your phone, and follow the prompts on the phone to let it connect. Then open the swiping app (Tinder / OkCupid / Bumble) app, and in a terminal type the magic one-liner:

```
while true; do ./adb shell input touchscreen swipe 300 800 1000 800 100; sleep .$[ ( $RANDOM % 10 ) + 1 ]s; done
```
This line of code basically emulates a swipe from `(300,800)` to `(1000,800)` over 100 milliseconds. If its not swiping in the right place for you, then change the numbers `300` and `1000` until it performs the swipe in the right place. You can test the swiping location by downloading any kind of paint app and running the code above.

Now you can run that magic one-liner on your phone for an hour so then later that day you'll have a bunch of new people to attempt a conversation!