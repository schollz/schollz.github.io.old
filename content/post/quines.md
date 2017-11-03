---
title: "Autological words and quines"
date: 2017-06-04T09:48:59-06:00
slug: quines
keywords: thoughts
---

The word *"noun"* is a singular word. It is the only word that is what it is. Such a word is an *"autological word"* as they posses the property that they express. To determine if *X* is autological, it requires answering yes to any of the following questions:

- Is *X* a *X* word?
- Is "*X*", *X*?

Some great examples of autological words are "polysyllabic", "unhyphenated", "harmless", "pentasyllabic", "real", and "unique". Dr. Henry Segerman has [a long list of these autological words on his website](http://www.segerman.org/autological.html).

There is analog to autological words in the digital world: *"quines"*. [Quines](https://en.wikipedia.org/wiki/Quine_(computing)) are non-empty programs that produce a copy of its own source-code as its only output. A Python quine is rather simple:

```python
s = 's = %r\nprint(s%%s)'
print(s%s)
```

A [Golang quine](https://play.golang.org/p/pVBds0oHrO) is also pretty simple:

```golang
package main

import "fmt"

func main() {
    fmt.Printf("%s%c%s%c\n", s, 0x60, s, 0x60)
}

var s = `package main

import "fmt"

func main() {
    fmt.Printf("%s%c%s%c\n", s, 0x60, s, 0x60)
}

var s = `
```

Here's an **Idea**: what if you wrote a program that quinified your program? It can take any generic program and then re-write so that it also produces a code of itself.

And here's a **Thought**: what are other things in the world that are quines or autologically predisposed? Are there other things that are in themselves representations of itself? Without resorting to *[The Society of the Spectacle](https://en.wikipedia.org/wiki/The_Society_of_the_Spectacle)*, of course.