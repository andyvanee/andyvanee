---
layout: post
title: Prose, Github and S3
---

In an effort to make the static site workflow a little less manual, I've created a little web-service to automate things a bit. Here's how it works:

1. Edit posts/pages/layouts etc with [prose.io](http://prose.io/)
2. Github web-hook hits my service, triggering a build.

The build stage looks like this:

1. git pull (or clone if need be)
2. make
3. s3cmd sync

Setting up the server was a bit difficult for a couple of reasons. My blog is pretty straightforward, but it did need a number of things installed on the server for a successful build: make, jekyll, uglifyjs, recess, pygments and s3cmd. Also, this all had to be run as the www-data user, which had a pretty minimal environment.

Which is awesome, since it's completely automated. Code coming soon on [github](https://github.com/Andyvanee)...
