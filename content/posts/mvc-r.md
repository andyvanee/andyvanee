---
title: MVC-r The pattern you already use
tags: Programming
date: 2012-04-15
url: "/2012/04/15/mvc-r.html"
---

*The pattern you already use*

MVC has long been the defacto standard for building web and desktop applications. There are many variations on the theme, but I think the acronym is missing one component that is already an important part of any MVC application...

### Resources

Call them assets, static files or whatever. A large portion of every application is the stuff that never changes. The reason it's missing from the acronym is most likely that developers want to differentiate dynamic code from immutable resources. The real work happens in the code, whereas resources are dumb entities; not really the concern of our smart code.

Aaron Swartz: Bake, Dont Fry: <http://www.aaronsw.com/weblog/000404>

The problem with this approach is that the lines between static and dynamic resources has become unclear. Most of what was traditionally static content on the web is now generated dynamically and hosted statically (less, coffeescript, markdown, etc), and much of what is now completely dynamic should probably be handled the same way.

Todays web frameworks do not cater to this type of thinking. The trend is to pull more and more of the content into the realm of the application server and away from the static server. The problem with this is that static servers are **really good** at what they do. Application servers are less robust for a number of reasons, the main one being **your code**. No developer wants to hear this, but it's simply the truth. Your code (and mine) has bugs. No matter how much testing goes into the application, it will never be as stable as a static resource.

My suggestion, and the goal of my acronym MVC-r, is to move as much as humanly possible into the realm of compiled static resources. 'MVC' is capitalized because it's big. It takes time, performs serious tasks, and is generally hard work. 'r' is lowercase and seperated by a dash because it's lean, stable and won't keep you up at night thinking about edge cases.

The architecture of this system means that the application should be seperated into discreet components. The average POST request should trigger content generation, query/submit to the database, and generate a compiled resource. The average GET request to the application should return custom data fragments. Everything else should be handled by the static content server.
