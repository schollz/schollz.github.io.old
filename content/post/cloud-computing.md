---
title: "Cloud Computing"
date: 2017-10-24T21:00:41-06:00
draft: true
tags: [thoughts]
slug: cloud-computing
written: ["2017","2017-10","2017-10-24"]
---

The `pingfs` repo got me thinking. How could would it be if you could
store other things in the cloud? What if you had a bunch of servers
connected together that were forwarding TCP packets to one another so that
each packet would only live in a single place for a short time? You could
make a keystore so that each key never is stored in memory - it is only
stored on a server for ~5 milliseconds before it is sent to another server
(usually with a roundtrip time of 50-300 millisecond). The problem would
be to reduce the amount of time on the server and increase the amount of
time in between. The first can be reduced with something very high
performance, maybe like writing in Go or Rust, and the second can be done
by choosing other servers that are far away. 

What about making a neural network with an actual network? Have several
nodes that are actual connections and strengthen/weaken them based on the
network itself.
