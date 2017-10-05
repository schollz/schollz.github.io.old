---
title: "Easily captioning images from Markdown"
date: 2017-09-27T13:55:03-06:00
slug: captioning-images
tags: [coding]
---

Here is a nice trick for captioning images with only `alt` tags. This is  useful when using Markdown to generate HTML pages, since Markdown in its natural form only includes creates an image tag, i.e. `![alt tag](img src)` -> `<img alt="alt tag" src="img src">`. For good captions, we need to add a `figcaption` and wrap both inside a `figure`.

Turns out this is easily done with Javascript to generate figure captions on the load of the page. The script [I initially found to do this](https://blog.kchung.co/adding-image-captions-to-ghost/) is the following:

<script src="https://gist.github.com/schollz/8df08090919a76df89be3eeef7d67bb3.js"></script>

It works great, but it requires JQuery. 

I carefully followed [oneuijs/You-Dont-Need-jQuery](https://github.com/oneuijs/You-Dont-Need-jQuery) and I was able to convert this to just plain Javascript:

<script src="https://gist.github.com/schollz/f86c59c5cc3520ca2509b82324915356.js"></script>

Of course this looks a little more complicated, but it works just the same. This is what is running on this site! Here's an example of a captioned image:

![This picture of worms has a caption!](/img/worms.svg)

Go ahead and copy that to whatever site you want!