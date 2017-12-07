---
title: "Watercoloring with neural networks"
date: 2017-06-14T05:48:49-07:00
draft: true
tags: [art]
slug: watercolor
---



Can a neural network help me improve my art?

What if the artist painted a photo, and then used a neural network to render the photo in the style of the same painting? Would it improve the art? I decided to see for myself if neural networks would improve my watercoloring. I started thinking about these questions because I’ve been reading about neural networks, and I’ve seen a lot of these neural networks create new works of art by rendering a photo in the style of a famous painting[^1]. 

![The "content" of Jean-Jacques Rosseau’s painting is recognizable as a cat, despite the painting "style".](/img/rosseauscat.jpg)

Neural networks are complicated and worth reading about[^2]. Basically, a neural network is a system composed of computational “neurons” linked up in a way that is similar to the brain that try to solve problems. The connections between these neurons are given specific weights, as they learn how to classify one thing from another. A neural network understands a painting by looking at its specific features. So far researchers have discovered that paintings have two main transferable features: *"content"* and *"style"*. When we look at a painting, like Jean-Jacques Rosseau’s cat, we experience both the *content* and the *style* of the painting simultaneously, but we can (usually) identify them separately. The *content* is the the subject of that the painter is trying to convey (the cat), where *style* is the manner which they convey it (bold colors and strokes, awkward proportions in the legs). Rosseau cannot fool us into thinking he did not paint a cat, even though he did an awfully strange representation of it.

![Neural network rendered painting in the style of *Starry Night* with the content from Neckarfront houses. Photo credit: github.com slash jcjohnson](/img/tubingen_starry.png)

Recently, a paper by Gatys, Ecker, and Bethge[^3] was able to show that *representations of content and style are separable*. They used an algorithm that makes use of a convolutional neural network[^4] and demonstrated the separability of content and style by transferring the style of a *Starry Night* by Van Gogh (i.e. the iconic swirls of dark blue pastel) to a photograph of the Neckarfront houses of Tubingen, Germany. 

The genius of the paper by Gatys, Ecker, and Bethge[^3] is that they leverage neural networks for classifying local features in images to extract the representations of content. The neural network used here is the VGG-Network by Simonyan and Zisserman which is the state-of-the-art for identifying things in images[^5]. To transfer *Starry Night* to Neckarfront, Gatys, Ecker, and Bethge simply exploited the neural network to copy the set of neurons that finds representations of content (which parts of the image are the “building”), and then using another layer that extracts the style, or texture (i.e. non-features that are local in context, like the swirls in Van Gogh’s painting).

## Making a neural network to paint with my style

To make a neural network paint like me, I will first select a photo and then paint the photo myself. Then I will use my painting to generate a neural network rendering from the original photo. That is, I will use the *style* from the painting I create and transfer it to the *content* of the photo that I used to create the painting. Technically speaking, I used the algorithm from Gatys, Ecker, and Bethge, as coded by [jcjohnson](https://github.com/awentzonline/image-analogies) compiled with the CUDA backend to use on a GTX 1080Ti.



![Source photo for painting](/img/heron1.jpg)

I started with a photo of a heron.

![My painting](/img/heron2.jpg)

Then, I create my own Gouache painting of the photo.

![Transfer of my style to original photo](/img/heron3.jpg)

Finally, I used Torch[^1] to transfer the *style* of my painting to the *content* of the photo to create a neural network rendering.
The results are impressive. The neural network uses my color palette and some of my strokes, but seems to suppress a lot of my mistakes and more precisely articulates the original photo. For example - the wings that I painted are very unordered and sloppy, but the neural network used the original wings and used the idea of my painting to fix them.

## The neural network becomes the teacher


The heron is not an outlier. Almost every painting I create can be re-imagined by a neural network to be rendered as a much cleaner and more professional painting[^6]. The machine makes a professional out of a novice.

Here are more examples showing the original photo (left), my painting of the photo (middle) and the neural network rendering of the photo using the style of my painting (right). After looking at them quite a bit, I can see some simple things I can do to improve my own painting.

Click on any of the paintings to see them in full resolution.

### Cat

I like how the neural network put more white around the eyes and also patches of gray to shadow the eye and mouth. I could have also been more liberal with my striping on the arm.

[![](/img/cat.jpg)](/img/cat.jpg)

### Bison

Though I like the original watercoloring better, I think the neural network does a better job on the bison's hair on its head - using a reddish color and blending it out.

[![](/img/bison.jpg)](/img/bison.jpg)

### Koala

My mistakes fixed by the neural network - I made the yellow around the baby koala is too wide, and its head too light. I love the neural network ears - they aren't outlined so it gives them a lighter touch, and the fur on the big koala has more brush strokes which makes it more dynamic.

[![](/img/koala.jpg)](/img/koala.jpg)

### Deer and cat

I also think my rendition for the watercolor is very good, although I wish I had gotten the proportions better, as it looks a lot nicer. Also a thinner outline would have been better, as the neural network does. I also love how the neural network reinterprets the background - putting in more orange and gray which complements the deer and cat.

[![](/img/deer.jpg)](/img/deer.jpg)

### Fox

I had a lot of trouble on the tail of this fox, and the neural network has a great way of doing it - simply dab the outside and then blend in the grey and red. I also love the purple on the fox hind leg, which I was not bold enough in bringing out on my own painting.


[![](/img/fox.jpg)](/img/fox.jpg)

### Dog and owl

I love my painting here as well, but the proportions are wrong, my dog is far to narrow. I also could have shadowed the snout a little differently, to make the sides of the head stand out more, like in the neural network.


[![](/img/dogandowl.jpg)](/img/dogandowl.jpg)

### Mountain Goat

A white animal is *very* difficult for me, but I think the neural network shows a possible solution: focus on the middle with gray/blue and then on the outside with yellow.

[![](/img/mtngoat.jpg)](/img/mtngoat.jpg)

## Conclusion

It seems a computer is better at painting than I am.

But seriously, this is a rather neat illustration of the separation of *content* and *style*. In the future I would like to instead train my own neural network with a corpus of my photos and illustrations to transfer my style to photos. In this case, I imagine it will be agnostic to *content* but will merely encode my style. I have to learn how to train neural networks first, though.

[^1]: Some great resources on Github are [awentzonline's image analogies](https://github.com/awentzonline/image-analogies) and [jcjohnsons's Torch implementation of neural styles](https://github.com/jcjohnson/neural-style).

[^2]: [Here is a great, free, online book](https://neuralnetworksanddeeplearning.com/) written by Michael Nielsen which gives a great introduction to neural networks.

[^3]: Gatys, Leon A., Alexander S. Ecker, and Matthias Bethge. "A neural algorithm of artistic style." arXiv preprint arXiv:1508.06576 (2015).

[^4]: A convolutional neural network is a special kind of neural network that links up the computer neurons in a way that mimics how the visual cortex operates.

[^5]: Simonyan, Karen, and Andrew Zisserman. "Very deep convolutional networks for large-scale image recognition." arXiv preprint arXiv:1409.1556 (2014).

[^6]: The cases where the neural network did poorly was in paintings where I left the background completely white.
