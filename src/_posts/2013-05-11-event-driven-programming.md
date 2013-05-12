---
published: true
title: Event Driven Programming
layout: post
tags: 
  - JavaScript
  - Programming

---

I haven't been doing a lot of JavaScript lately, but every time I do i try to explore the idea of doing everything **event driven**.

> "I want the world to be made of hooks" -[Andrew Plotkin](http://www.eblong.com/zarf/home.html)

This quote probably means nothing to non-programmers, but to a programmer it speaks volumes. We all cringe at taking apart other's code just to enable some functionality that they didn't think of enabling. Sometimes our hands are completely tied and we **cannot** modify the code we really wish we could. Sometimes it means forking code when we would really rather not.

Event driven programming has the potential to solve this completely. To illustrate why I'm so in love with this approach, here's some code:

<http://jsfiddle.net/andyvanee/BBxw9/2/>

<iframe width="100%" height="300" src="http://jsfiddle.net/andyvanee/BBxw9/2/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

It's basically a couple of jQuery plugins to do time-sequence type stuff.

`$.heartbeat [line 80]` just triggers a `beat` event however often you specify. It also implements event handlers for `pause` and `resume` events.

`$.stepper [line 122]` builds on top of this (without any awkward inheritance) and increments a counter every heartbeat. It adds the `reset` and `set:increment` events to control how the counter behaves.

`$.looper [line 158]` builds on top of this and resets the counter whenever it reaches a threshold. It doesn't add any events but *inherits all the events of it's sub-components*, including `reset` which may be more interesting in this context. Notice I'm using the `reset` event `[line 38]` to randomize the color of the target.

The important point is that these plugins define **no methods**, only events. And because they're events we can call them, or listen for them, from anywhere. This is the most clear, open and powerful implementation of hooks that I can imagine.

Combine this with the fact that events bubble by default in JavaScript, and you can go one step further and aggregate these events (logging or global manipulation) with no extra code inside the plugin (see line 47-73).

In comparison, classical inheritance (single or multiple) seems incredibly confining. It requires the library author to define stub methods that may be overridden and called at the appropriate time. It requires the end user to override library methods and call `super` at the appropriate time (or not). All this adds up to an uneasy coupling between your code and the library code.

Most importantly, it defines a single code path. Classical inheritance provides an abstraction for a single code path to jump from parent class to child. Forking or spawning parallel tasks is as awkward as it ever was. With event-driven programming forking and aggregating is the norm.
