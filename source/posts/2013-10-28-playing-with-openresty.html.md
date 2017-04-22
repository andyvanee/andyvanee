---
title: Playing With OpenResty
tags: Programming, Nginx, Lua
---

[OpenResty](http://openresty.org/) is a bit of an enigma. I first heard about
the project a few months back when reading about some benchmarks of various
web application platforms. OpenResty was WAY ahead of all the others.

The basic idea is that OpenResty is just Lua code embedded directly into the
nginx server. I had to try it out for myself.

I was pretty ambitious for my first explorations with OpenResty. I've had
this project in the back of my mind for a bit, and I thought it would be
perfect for OpenResty. The idea is this:

Makefile-style dependency driven programming with the "files" living in
Redis. You write the source "files" to Redis as well as documents that outline
what dependencies will create a target file. This way, you can request a
file from the server that doesn't exist, but the server knows how to build it.
Some minimal templating will be built in as well.

I haven't got too far with it, but thought I'd share a bit of how it is going.

First off, Lua can be pretty bizarre. There are a number of key ideas for
programming Lua that I need to get more comfortable with to do any serious
work. Also the package management is mostly non-existant.

Second, since I couldn't really figure out how to test my Lua code properly
I've just done totally decoupled testing with Python hitting the server over
HTTP. This has actually worked really well.

Third, the Lua code can be suspended and resumed at random by nginx. This can
wreak havoc with code that is not written with this in mind.

And finally, it's actually quite fun! It feels quite primitive, but the syntax
is not bad and the performance is incredible. Rather than writing code for
a process that's running independently of the server, it's like you are writing
code directly in the server.

Fun stuff!
