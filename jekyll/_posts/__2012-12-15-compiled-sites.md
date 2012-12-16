---
layout: post
title: Compiled Sites
tags: [Programming]
---

As mentioned before, [this site](http://andyvanee.com/2012/06/07/old-projects-and-gh-pages.html) is using [jekyll](http://jekyllrb.com) and running on [github pages](http://pages.github.com). Getting used to the workflow of using a static site generator along with its benefits and limitations has been an interesting process.

### The drawbacks:

- User specific content needs special consideration
- Server side authentication needs to happen elsewhere
- Content mixed into the code repo (debatable)
- Deploying new content requires tools not readily available to the average content creator (ie: non-developer)

### The benefits:

- Cheap, fast and durable hosting
- No server-side logic to exploit

Deploy with nginx



As a web developer, I'm less interested in how it works for me, but how I can make it work for clients. In this sense, I think it's important to breakdown the 'life cycle' of a web application and see how the different web application paradigms fit.

- Edit Content
- Edit Code
- Build
- Deploy
- Run Application

### Case 1 - Static HTML

This type of site wouldn't even be considered an application. It is hand-edited HTML with manually uploaded and linked images, stylesheets, scripts, etc. The only use-case that I can think of where this approach makes sense is something like a single splash page.

### Case 2 - Dynamic HTML

This is the first generation of dynamic web pages. 

