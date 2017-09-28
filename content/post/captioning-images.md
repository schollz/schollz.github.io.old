---
title: "Easily captioning images from Markdown"
date: 2017-09-27T13:55:03-06:00
draft: true
slug: captioning-images
tags: [coding]
---

Here is a nice trick for captioning images with only `alt` tags. This is  useful when using Markdown to generate HTML pages, since Markdown in its natural form only includes creates an image tag, i.e. `![alt tag](img src)` -> `<img alt="alt tag" src="img src">`. For good captions, we need to add a `figcaption` and wrap both inside a `figure`.

Turns out this is easily done with Javascript to generate figure captions on the load of the page. The script I initially found to do this is the following:

```javascript
<script>  
// Creates Captions from Alt tags
$("img").each(
    function() {
        // Let's put a caption if there is one
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
    });
</script> 
```

It works great, but it requires JQuery. Using [You-Dont-Need-jQuery](https://github.com/oneuijs/You-Dont-Need-jQuery) 
I was able to convert this to just plain Javascript:

```
<script>
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
            console.log(el);
            console.log(el.outerHTML)
        }
    });
} else {
    document.addEventListener('DOMContentLoaded', fn);
}
}
window.onload = ready;
</script>
```

Of course this looks a little more complicated, but it works just the same. This is what is running on this site! Here's an example of a captioned image:

![This picture of worms has a caption!](/img/worms.svg)

Go ahead and copy that to whatever site you want!