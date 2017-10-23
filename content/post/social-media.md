---
title: "Use social media without being social"
date: 2017-09-23T09:04:40-06:00
slug: using-social-media
keywords: thoughts
description: Social media seems to be more about creating a persona that voicing your thoughts and ideas. Not thinking about public opinion enables you too emit thoughts without fear of judgment, which is why I've found it helpful to use social media without being social.
tags: [thoughts]
---


Social media seems to be more about creating a persona that voicing your
thoughts and ideas. Not thinking about public opinion enables you too emit
thoughts without fear of judgment, which is why I've found it helpful to
use social media without being social.

I make accounts on social media that are totally protected. I don't follow anyone or let anyone follow me. I keep the account locked so no one can even visit it. This way, I can use the  cutting edge technology ecosystem and infrastructure of social media giants for my own personal journal.

I do program, so I could write my own diary program (and I have). But there is something nice about having a ready-made solution with so much support. In fact, just Twitter [has almost 100,000 repositories](https://github.com/search?utf8=%E2%9C%93&q=twitter&type=) of varying quality for interfacing with it. This means, if you decide you want a Twitter library written in [random language] then you probably can find it.

## Social media as a private experience

Here is how I use my social media. I am using Twitter, but that is interchangeable with most of the other platforms, as they are all big enough to have support. I could've easily done the same with Facebook, Tumblr, etc.

### Keep track of things to do

I like to do stuff from the command-line, so I found one of the 100,000 repos devoted to interfacing with Twitter: https://github.com/sferik/t. Its well written and supported, and its easy to use. I use this for some of my updates.

I keep a list of things todo. Using *t* I can easily see what I have todo:

```
> t search timeline  '#todo' | more 
#todo get ice cube trays from the dollar store
#todo get a haircut
```

or update my todo-list

```
> t update "#todo mow the lawn"
Tweet posted by @?.

Run `t delete status ?` to delete.
```

And if I'm on my phone, I can just go to my Twitter feed to quickly look at a grocery list, or update something I need to do.

*Sample tweets from my #todo feed:*

<div class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">
<a href="#">#todo</a>
Make a collection of web articles that cite me
</p>&mdash; Zak (@?) <a href="#">September 23, 2017</a></div>


<div class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">
<p><a href="#">#todo</a>
get a haircut
</p>&mdash; Zak (@?) <a href="#">September 20, 2017</a></div>


### Quickly jotting random thoughts

My twitter feed is best for random thoughts. I like that the Twitter application is polished enough that you can use it anywhere, even when there is no data/wifi. The draft will be saved and posted when you reach a place that does. 

This failsafe is hard to program into things I make, so I'm glad that I can take advantage of this to post random thoughts, such as:

<div class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Super-autological words<br><br>
The word Noun is defined by being a noun.<br>
The word Polysyllabic is defined by being polysyllabic.</p>&mdash; Zak (@?) <a href="#">September 23, 2017</a></div>

<div class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">
<p>vanilla ice cream in a unwashed cup of licorice tea is amazing</p>&mdash; Zak (@?) <a href="#">September 20, 2017</a></div>

### Using IFTTT to keep track of everything else

There are many things you can hook up to [IFTTT](https://ifttt.com/), to
keep a record of in your Twitter biography. For example:

1. Keep track of songs I like on Spotify. *E.g.*:

    <div class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">
    <p><a href="#">#music</a>
    "Rusalka, Op. 114, B. 203, Act I: Lieblicher Mond (Song to the Moon)" by Antonín Dvořák, Emalie Savoy, Bran… 
    </p>&mdash; Zak (@?) <a href="#">September 20, 2017</a></div>

2. Record the daily weather. *E.g.*:

    <div class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="#">#weather</a> Light Rain today, high of 42, low of 36, currently 37</p>&mdash; Zak (@?) <a href="#">September 21, 2017</a></div>

3. Connect public life (Facebook, Instagram) to Twitter so my private log is updated.
4. Keep track of my movements with the IFTTT geofencing.

# Caveats

Obviously, Twitter is a company basically offering a service for free.
I would always be wary of that. So, I would never post things that are
truly secret (i.e. passwords, bank statements, etc.).

Also, I chose Twitter because it has a option for export. Their export
option is suboptimal (it only updates every two weeks or so), but it is
a requirement that I can have my data that I create.

