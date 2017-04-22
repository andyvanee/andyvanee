---
title: Simple Code
tags: Simplicity, Programming
published: false
---

I love simplicity. I'd like to think that in everything I do, I'm searching for
the cleanest, simplest and most elegant solution to the problem.

But simplicity is not easy. Sometimes the simpler solution seems complicated
because it requires that we learn fundamentally different concepts. I'd like to
dive into a few of my favorite examples of simplicity in software.

## Docker

[Docker](https://www.docker.com/) has exploded in the past few years, for good
reason. But I've found that it's not always apparent to developers what problem
Docker is actually solving.

The problem is that of creating isolated, reproducible environments. Without a
fair bit of experience deploying and maintaining servers and code over time, you
might think this is a small annoyance. But it is huge. I've had a few *aha*
moments with this, but the most recent was finally realizing that I could start
deleting all the `.rc` and `*file` files from my projects.

Bundler and virtualenv are no longer necessary when using docker. Configuration
commands can be done right in the Dockerfile rather than having all the
platform-specific run control files. In many of my projects, I've been able to
reduce the files to just source code, a `Dockerfile` for the environment setup
and a `Makefile` for commonly used shortcuts.

In the past few years, it seems like every tool requires additional
configuration files at the top level of your project. Deleting these files makes
me very happy.

## CSS

In the battle of the CSS preprocessors, plain old CSS has taken quite a beating.
I think this is unfair for two reasons.

First, plain CSS doesn't require a build step or any extra software to make it
work. It may seem like a small thing, but it's my opinion that every software
choice must be weighed very carefully.

Second, plain CSS encourages simplicity by failing to mask complexity. I feel
like CSS preprocessors often encourage sloppy programming by masking complexity.
Code that uses nesting, includes, extends and macros may look clean on the
surface while the result is a huge mess.

I've become somewhat of a CSS minimalist in my own projects. When I need a grid,
I just add the selectors and breakpoints as I need them. When I use Less/SASS, I
use variables (a lot!), but I like to keep nesting to a minimum and use mixins
for only the most common functionality such as `clearfix`.

## PHP

Now I'm probably getting into very controversial subject matter. Developers love
to bash PHP, and for many good reasons. I'd like to propose a few reasons why I
don't accept the popular view.

Batteries Included. This is the Python slogan, but I think it applies well to
PHP in the context of web development. You can get a long way with what is
built into the language.

The CGI programming model. While it may have it's drawbacks, it's so much
cleaner to think of each request as a complete setup and teardown of your code.
As a programmer, you are protected from memory leaks, out of control processes
and exceptions. They are isolated to the request.

There are many other features of modern PHP which are generally ignored by the
critics because they judge PHP by outdated or bad code examples. WordPress
plugins and themes are notoriously bad. I recommend
[PHP The Right Way](http://www.phptherightway.com/) for a good overview of what
PHP has to offer such as namespaces, traits, anonymous functions and testing.

