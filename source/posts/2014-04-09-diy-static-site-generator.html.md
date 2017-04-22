---
title: DIY Static Site Generator
published: false
---

Sometime in the recent past there was a major spike in the number of static site generators being released. [This list](http://staticsitegenerators.net/) is currently at 237 in total, but I'm sure there are even more out there.

So why are there so many? I think there are two main reasons:

1. Everyone has their favorite plugin/templating/markup languages.
2. They're really quite easy to write.

In this post I'm going to outline a method I've used a few times which gives you complete control over the build from start to finish. I basically took my workflow for compiling, combining and minifying javascript/css and applied it to pages as well.

### Step 1. Makefile basics

I've come to really enjoy Makefiles. There are a lot of alternatives which may work for you. For me, they just fit really well into the flow of command line development. So here's a crash course:

Assignment:
        
        GREETING=Hello, how are you


Mass assignment:

        markdown_sources=$(shell find src -name '*.md')

This generates a list of files using find. `find src -name '*.md'` is a pretty basic unix command, which just finds all our markdown files in the `src` directory. Many other basic commands will also provide options to output a basic list of files, for example `grep -Rl 'tags:.*stuff' src` will print the names of all files in the 'src' directory whose content matches the search.

