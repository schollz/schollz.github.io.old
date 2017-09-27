---
title: "Captioning Images"
date: 2017-09-27T13:55:03-06:00
draft: true
---


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
