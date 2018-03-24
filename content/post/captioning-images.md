---
title: "Automatic captioning of images using Javascript"
date: 2017-09-27T13:55:03-06:00
slug: captioning-images
tags: [coding]
written: ["2017","2017-09","2017-09-27"]
---

I like to caption my images and I like to write in Markdown. However, it is
currently *not* possible to make captioned images, i.e. make
[an HTML figure](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure)
using just Markdown - at least at the current spec ([version
0.27](http://spec.commonmark.org/0.27/#images)) at the time of this writing.  Of course, Markdown
supports HTML, so you could just write a "`<figure>`" tag everywhere
instead of writing with the Markdown "`![]()`" image syntax. However, I want to use the
"`![]()`" syntax! So, here is a nice trick for captioning images using only the Markdown syntax with a little vanilla Javascript.

![This picture of worms has a caption!](/img/worms.svg)

The trick is to use Javascript to find images with non-zero `alt` attributes and convert them to figures with the caption filled in with the content of the `alt` attribute. Someone came up with this before me, and [here is their script](https://blog.kchung.co/adding-image-captions-to-ghost/):

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

It works great, but it requires JQuery. I don't want to use JQuery so I carefully followed
[oneuijs/You-Dont-Need-jQuery](https://github.com/oneuijs/You-Dont-Need-jQuery)
and I was able to convert this to just plain Javascript:


```javascript
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
same. 

The only issue here is that when you load a page you will see all the figures "jump" into place as the captions are written to them, about one hundred milliseconds after the page loads. To avoid this, you can cover up the page until it is totally ready with a div:

```html
<div id="loadingMask" style="width: 100%; height: 100%; position: fixed; background: #fff;"></div>
```

Then you can add a fade out to this div in the Javascript `ready()` function:

```javascript
el = document.getElementById('loadingMask');
fadeOut(el);
```

The `fadeOut()` function is adapted from the [youmightnotneedjquery.com](http://youmightnotneedjquery.com/) `fadeIn()` function:

```javascript
function fadeOut(el) {
  el.style.opacity = 1;

  var last = +new Date();
  var tick = function() {
    el.style.opacity = +el.style.opacity - (new Date() - last) / 80;
    last = +new Date();
    // console.log(el.style.opacity);

    if (el.style.opacity > 0) {
      (window.requestAnimationFrame && requestAnimationFrame(tick)) || setTimeout(tick, 16);
    } else {
        el.style.display='none';
    }
  };

  tick();
}
```

Go ahead and copy that to whatever site you want! The full code is [here](https://gist.github.com/schollz/ecc814acfa546721acdb9e55107b7277).