---
title: "IPFS with Hugo"
date: 2017-10-15T20:43:31-06:00
draft: true
tags: [coding]
slug: ipfs
---

This idea is to create a pipline for a totally content-addressable website, using IPFS with Hugo. The idea is that each page, on its own, is a self-contained content-addressable website, except for the index page which contains the content-addressed links. This way you can share a website and everyone will know (or maybe not) that it is immutable. If you do decide to change a site, it will be reflected on the index page, which is mutable and on a mutable domain.

The pipeline is as follows:

1. Make a site on Hugo, as you would normally, except change the index to show each URL as `/{{ .Slug }}/`.
2. Generate the website locally normally into some directory, `tmp`.
3. Do `ipfs add -r tmp/img/`. Save the output for each image. Then, for each image, go through each HTML file in `tmp` and replace all occurrences of `/img/some-image` the IPFS hash. For example, replace each `/img/?` with `https://ipfs.io/ipfs/HASH`. 
4. Do the same as #3 for `tmp/js/` and `tmp/css/`.
5. For each HTML file (except `index.html`) do `ipfs add tmp/some-slug/index.html` which should have the updated JS/images. Keep track of the IPFS hash generated for each `/some-slug/index.html` and replace each occurrence of `/some-slug/` in the `index.html` with the new `https://ipfs.io/ipfs/HASH-FOR-SOME-SLUG`.



## Benefit

A webpage is forever. When you share a hash of a webpage, that is guaranteed to be the same forever. If you do change it, the change will be reflected on the index page, `/`, which is not loaded with IPFS. If the previously shared webpage *is* changed in the future, it will not affect the people who you've shared the previous link, but they could still access it through the index.

## Caveats

No pagination. Pagination would require updating the all the hashes, which would in turn cause all the hashes to change. This is not so terrible, but it would cause users to navigate within an older version of the site. If there is no pagination, it requires uses to click back to `/posts` which would be a non-IPFS page that contains the latest addresses of the current hashes.



