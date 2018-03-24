---
title: "Why Go?"
date: 2017-04-29T09:48:59-06:00
slug: why-go
keywords: coding
tags: [coding]
written: ["2017","2017-04","2017-04-29"]
---

Lots of people ask me this question, and I end up writing the same answer over and over. I just wrote my plain answer here so I can just link to it. Don't hesitate to ask me other questions, though if you need. The basic answer is: because of *time* and *money*.

*Coding in Go saves me time*. When I write code, I often write run the program periodically to test it. I like Golang because it offers a simple and easy way to split up the code into pieces that are periodically tested, so you can test everything at once. Sure, Python does this, but its builtin to Golang so nicely that the barrier is small. I've spent too long trying to figure out Python tests to ever bother using them anymore. They work great, but its just easier for me to do it in Golang.

*Coding in Go saves me money*. I host dozens of web apps on a single DigitalOcean droplet. This droplet has half a gig of RAM and some swap. From my experience, every Python web server I write ends up being around a quarter gig of RAM. There is no way I can run a dozen of these on a single Droplet, I'd have to buy more. With Golang, I don't need to buy more because each binary usually consumes 10-20 MB of RAM.

In the end, though, most things are just about preference. Why use pencil over pen or pen over mechanical pencil? Its preference. All three will work just fine. My preference is to use Golang when I want and use Python when I want. Generally nowadays I will prototype in Python (which is usually faster to write) but then write the production in Go (which is usually faster and easier to run).

I also like a bunch of other features of Go which are still improving. The `go fmt` is incredible, as I've spent sometimes hours trying to pass continuous integration tests in Python which often only are failing because of different formatting issues (`autopep8` mostly solves this in Python, but still some people have different preferences with `autopep8`).

At the risk of sounding unpopular, I also greatly enjoy how Go manages dependencies. The current tool `dep`, simply copies all the code of your dependencies, in a way that Node does. However, unlike Node, in Golang you are encouraged to cut-and-paste so usually the other dependencies are small. Having the ability to have the entire codebase in a single folder is a wonderful thing, in the case that dependencies suddenly go missing (which was a problem in Node and also for me recently).