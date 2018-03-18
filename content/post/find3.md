---
title: "FIND3"
date: 2018-03-17T09:41:01-06:00
slug: find3
keywords: coding
tags: [coding, golang]
---

The Framework for Internal Navigation and Discovery (FIND) is like indoor GPS for your house or business, using only a simple smartphone or laptop. Its an idea I started thinking about 8 years ago and  wrote the [first code](https://github.com/schollz/wifi_triangulation/tree/984ee1110e864b4bc4e751cab1a81c5688c3c0a6) in PHP almost four years ago, dubbed version 0, as a proof-of-concept. Two years later the project was [re-written in Python](https://github.com/schollz/find/tree/python3). Then it was [re-written in Go](https://github.com/schollz/find) and called "FIND". It's been [ported again to Python](https://github.com/kootenpv/whereami) and called "whereami". Now its been [re-written one more time and called "FIND3"](https://github.com/schollz/find3), with better speed, efficiency and new features.

## What can FIND do?

Before getting to the benefits of the new version, I'd like to highlight what FIND can be used for. My main use case is home automation, and I've provided [tutorials to get started with Home Assistant and OpenHAB](https://www.internalpositioning.com/doc/automation.md). In my home automation setup I use FIND to turn on/off lights as I walk around the house. In the future I'd like to use FIND for more wayfinding in hospitals and hard to navigate locations. 

Its been amazing that in the past few years to hear how other people are using FIND. Folks are using FIND to relay exhibit information in museums, as a safety monitor system for employees working alone, tracking number of attendees in a music festival, monitoring the location of pets, wayfinding in airports. I'm hoping the new version will better support all these use cases and maybe more!

## New features

Thew new version of FIND has been written with longevity and flexibility in mind. There are notable improvements from the previous version:

* Support for any data source, e.g. Bluetooth / WiFi / magnetic fields / etc. (previously just WiFi).
* [Passive scanning](https://www.internalpositioning.com/doc/passive_tracking.md) built-in (previously required a separate server, [find-lf](https://github.com/schollz/find-lf)).
* [FIND3 app](https://play.google.com/store/apps/details?id=com.internalpositioning.find3.find3app) and [command-line tool](https://www.internalpositioning.com/doc/cli-scanner.md) support Bluetooth scanning (previously just WiFi).
* Meta-learning with 10 different [machine learning classifiers](https://www.internalpositioning.com/doc/overview.md#machine-learning) (previously just three).
* Client uses Websockets which reduces bandwidth .
* [Rolling compression](https://github.com/schollz/stringsizer) of MAC addresses for much smaller on-disk databases.
* Data storage in SQLITE-database (previously it was BoltDB).
* The API for sending fingerprints (/track and /learn) and MQTT endpoints are backward compatible.

## Getting started

There are couple of ways you can get started with the new version.

The easiest way to get started is by [tracking your phone](https://www.internalpositioning.com/doc/tracking_your_phone.md). Next, you could try [tracking your computer](https://www.internalpositioning.com/doc/tracking_your_computer.md). If you have a couple of Raspberry Pi's laying around, you can try the more advanced [passive tracking](https://www.internalpositioning.com/doc/passive_tracking.md) which allows monitoring all nearby bluetooth and WiFi devices.

## Support

If you run into a problem with FIND, don't hesitate to [make a bug report](https://github.com/schollz/find3/issues/new?template=bugs.md&title=Bug:%20). For quick help, [join the Slack channel](https://find3.slack.com/messages/C9H704GP4) and someone there will help you (maybe me!). You can also contact me directly at zack dot scholl at gmail dot com.