---
title: "Why go?"
date: 2017-04-29T09:48:59-06:00
slug: /why-go/
draft: true
keywords: coding
tags: [thoughts, coding]
---

![Gopher](/img/NERDY.png)

Lots of people ask me this question, and I end up writing the same answer over and over. I just wrote my plain answer here so I can just link to it! Don't hesitate to ask me other questions, though if you need.
​
The answer is: because of **time** and **money**.


## Golang saves me time

When I write code, I often write run the program periodically to test it. I like Golang because it offers a simple and easy way to split up the code into pieces that are periodically tested, so you can test everything at once. Sure, Python does this, but its builtin to Golang so nicely that the barrier is small. I've spent too long trying to figure out Python tests to ever bother using them anymore. They work great, but its just easier for me to do it in Golang.

## Golang saves me money

I host dozens of web apps on a single DigitalOcean droplet. This droplet has half a gig of RAM and some swap. From my experience, every Python web server I write ends up being around a quarter gig of RAM. There is no way I can run a dozen of these on a single Droplet, I'd have to buy more. With Golang, I don't need to buy more because each binary usually consumes 10-20 MB of RAM.

## Preference

Why use pencil over pen or pen over mechanical pencil? Its preference. All three will work just fine. My preference is to use Golang when I want and use Python when I want.