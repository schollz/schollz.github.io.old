---
title: "Easily captioning images from Markdown"
date: 2017-09-27T13:55:03-06:00
slug: captioning-images
tags: [coding]
---

I like to caption my images and I like to write in Markdown. However it is
currently not possible to make captioned images, i.e. make
[figures](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure)
in Markdown, at for the spec at the time of this writing ([version
0.27](http://spec.commonmark.org/0.27/#images).  Of course, Markdown
supports HTML, so you could just insert a `<figure>` tag everywhere
instead of using the Markdown `![]()` syntax. However, I want to use the
`![]()` syntax, so here is a nice trick for captioning images (by creating
figures) using only the Markdown syntax.

![This picture of worms has a caption!](/img/worms.svg)

This is basically a drop-in Javascript function that finds images with
`alt` tags and converts them to figures with the caption filled in with
the content of the `alt` tag.


Turns out this is easily done with Javascript to generate figure captions
on the load of the page. The script [I initially found to do
this](https://blog.kchung.co/adding-image-captions-to-ghost/) is the
following:

```javascript
$(".post-content img").each(
function() {
    if ($(this).attr("alt")) {
        $(this).wrap(
            '<figure class="image"></figure>'
        ).after(
            '<figcaption>' +
            $(this).attr(
                "alt") +
            '</figcaption>'
        );
    }
}); // from https://blog.kchung.co/adding-image-captions-to-ghost/
```

It works great, but it requires JQuery. 

I carefully followed
[oneuijs/You-Dont-Need-jQuery](https://github.com/oneuijs/You-Dont-Need-jQuery)
and I was able to convert this to just plain Javascript:


```javascript
// licensed under wtfpla
function ready(fn) {
    if (document.attachEvent ? document.readyState === "complete" :
        document.readyState !== "loading") {
        var elements = document.querySelectorAll("img");
        Array.prototype.forEach.call(elements, function(el, i) {
            if (el.getAttribute("alt")) {
                const caption = document.createElement('figcaption');
                var node = document.createTextNode(el.getAttribute("alt"));
                caption.appendChild(node);
                const wrapper = document.createElement('figure');
                wrapper.className = 'image';
                el.parentNode.insertBefore(wrapper, el);
                el.parentNode.removeChild(el);
                wrapper.appendChild(el);
                wrapper.appendChild(caption);
            }
        });
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}
window.onload = ready;
```

Of course this looks a little more complicated, but it works just the
same. This is what is running on this site!

Go ahead and copy that to whatever site you want!
