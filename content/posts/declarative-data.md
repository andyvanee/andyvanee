---
title: Declarative Data
date: 2012-07-15
url: "/2012/07/15/declarative-data.html"
---

There seems to be certain mystique surrounding declarative programming
and how it applies to the real world. There are not many technologies in
the average web programmer toolkit that are truly declarative.

Config files are declarative, but only in the simplest form. YAML and JSON
files are essentially a static view of some state - A manual database
that is read in by the 'real' imperative program.

CSS files are similarly declarative, but have the imperative cascading
effect of overwriting previous declarations.

And it seems that there is a general consensus among frameworks that SQL
is something that every programmer should be sheilded from at any cost.
A single SELECT and WHERE may be easy enough, but any nested queries or
more complicated logic is just too much to bear.

Is all this overhead necessary when all I want is a place to store my
data?

This alone is enough to explain the rise of NoSQL in dealing with our
data. If there is a simple, fast and flexible way to store data
structures - which can nearly always be represented as lists or hashes -
why not just do that and avoid the overhead of rigid schemas and strange
query languages?
