---
title: "Most sentences are unique"
date: 2017-10-14T21:16:56-06:00
tags: [thoughts]
slug: sentences
---

How long does a sentence have to be to gaurantee its uniqueness? This
question can be answered by looking at a huge corpora of indexed
sentences, e.g. the text of the internet. All that has been written on the
internet is not nessecarily a million monkeys typing on a keyboard
(although a million monkeys typing on a keyboard could produce all the
current content),[^1] with exception of a website that generates random
text.[^2] Still, I was wondering, out of the current 25 billion or so
webpages[^3], how long does a sentence have to be to make it unique?
Surprisingly short, as it turns out.

## A quick experiment

Here's a quick experiment to see how few words you need to actually
produce a totally and completely unique sentence into the universe.

![My actual painting of a donkey in the desert.](/img/donkey.jpg)

Lets take the sentence (which I'm making up as I type):

> A painting of a donkey in the desert.


This sentence comes from a painting I made that I'm looking at. For
searching "A" there are 25.3 billion results. The exact phrase "A
painting" narrows it down to 22.4 million. Already we've decreased by
a factor of 10<sup>3</sup>. The phrase "A painting of" decreases it to 5.3
million (another 10<sup>~1</sup> decrease) and adding "a donkey" decreases
it to 131,000 (another 10<sup>~2</sup> decrease). The smallest number of
results is "a painting of a donkey in the" which yields only a single
result (another 10<sup>~5</sup> decrease).[^4] There are no results for "A
painting of a donkey in the desert", at least until this post is
published.


This makes sense, as there are increasing combinatorial factors that limit the probability of
a given sentence for each new word. Each word has many possibilities as there
are hundreds of thousands of 
English words. Although, most of the words are *not* possible because there are
requirements on grammar and context. We can very roughly approximate this by
solving for the 7th root (since we only had seven words that gave us a few
results) as the total number of sites (25 billion), which gives ~30. Although
this number is inflated for the nouns and deflated for the prepositions.

But the size of this number, 30, gives pause to ever think that the internet
will contain every possible sentence. Though the internet may contain most 6-7
word sentences, it would need 30x as many pages to have 8 word sentence. It
would need ~900x more pages to have 9 word sentences, and so on *exponentially*.

So far now, it is really amusing and satisfying to relish in the thought that
most 8 word sentences we create, are totally unique to the internet and have
never existed before. And if we extrapolate a little bit, and say that the sum
of total language ever spoken may be only a million times bigger than the
internet, than that would mean that most 11 word sentences have never been
uttered before!*

Take these calculations with a big big big grain of salt, but since these
numbers lie in the world of logarithms, they won't be off my much more
than an order of magnitude.

[^1]: See the [infinite monkey theorem](https://en.wikipedia.org/wiki/Infinite_monkey_theorem)
[^2]: See the [Library of Babel .info](https://libraryofbabel.info/)
[^3]: 25.3 billion is the estimate of web pages containing the letter "a" in a Google search.
[^4]: At time of writing, the only website that contains "A painting of a donkey in the" is from [a Yelp review (archived)](https://web.archive.org/web/20171015040441/https://www.yelp.com/list/pittsburgh-cool-stuff-to-do-pittsburgh).
