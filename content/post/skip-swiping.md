---
title: "Skip swiping with adb and bash"
date: 2016-09-10T06:41:49-06:00
slug: skip-swiping
tags: [coding]
---

Like many, I've used dating apps (Tinder / Bumble / OkCupid) to find potential dates. I was annoyed at having to swipe right on a lot of people who would probably never respond to me after I swiped right. It seemed to me to be a waste of time to swipe through those people who would not actually be available in my dating pool. I'd rather only view a pool of people who respond to me so we can open a dialog right away to see whether we would match. 

I decided to automate swiping to get past this first block in this process of online dating. With `adb` and bash, I can have my phone *swipe right on everyone* automatically. Then, when I use the app I can focus on interacting with the people that match me instead of searching for matches!

This has been successful for me, and I'm making it "open-source" so maybe it will help you.

### Instructions 

The following will be instructions for **Android phones only**.

1. [Download the android debug bridge](https://developer.android.com/studio/releases/platform-tools.html) for your operating system: [Windows](https://dl.google.com/android/repository/platform-tools-latest-windows.zip), [Mac](https://dl.google.com/android/repository/platform-tools-latest-darwin.zip), or [Linux](https://dl.google.com/android/repository/platform-tools-latest-linux.zip). Then unzip and cd into the `platform-tools` directory.

2. [Enable your phone to use adb](https://developer.android.com/studio/command-line/adb.html#Enabling). Go to **Settings > About Phone** and tap **Build number** seven times. Then return to previous screen to find  **Developer options** at the bottom. Finally, goto **Developer options** and enable **USB debugging**. 

3. Plug in your phone, and follow the prompts on the phone to let it connect. Then open the swiping app (Tinder / OkCupid / Bumble) app, and in a terminal copy and paste this magic code into your terminal:

```
while true; \
do ./adb shell input touchscreen swipe 300 800 1000 800 100; \
sleep .$[ ( $RANDOM % 10 ) + 1 ]s; \
done;
```

This bash code utilizes `adb` to perform a swipe from `(300,800)` to `(1000,800)` over 100 milliseconds. If its not swiping in the right place for you, then change the numbers `300` and `1000` until it performs the swipe in the right place. You can test the swiping location by downloading any kind of paint app and running the code above.

Plug in your phone, run the code, and wait about an hour. By the next day you should have lots of new people to converse and connect with. Good luck in the dating world!
