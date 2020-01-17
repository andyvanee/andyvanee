---
title: The World is Immutable
tags: Data, Functional Programming
date: 2013-11-28
url: "/2013/11/28/the-world-is-immutable.html"
---

Interesting slide deck here called
[Clojure: The JFDI language](https://docs.google.com/presentation/d/15-7qFy6URdE7Owi2LitkQI_OHBu1AFWPUwHxgBc-O4E/edit#slide=id.g177bd4cb5_0173)

I haven't done any Clojure programming, but I have done some lisp (sbcl) and
Haskell, so this off-the-cuff remark caught my attention:

> Reality: The world is stateful, but mostly stateless programming is quite
> practical.

Although I understand the sentiment, I think it's important to outline how
this is a matter of perspective. I'm not terribly concerned about the
performance of stateless data structures or how they enable concurrency, or
any technical factor.

Stateless data just makes sense, even if it takes a while :)

If I meet you again in 5 years, I am no longer the same person. To act like
there is no difference is an identity error, and is what stateless programming
avoids. A stateless program could recognize what has changed, if it held a
reference to who I was 5 years ago. To a **stateful** program, nothing has
changed as far as it knows, since all it retains is a reference to my abstract
identity.

It's actually a bit counter-intuitive, but consider the case of the average
SQL database. By supporting write in place, the database is stateful, yet it
is really ill suited to reasoning about state. Every previous state is lost.
Contrast this with stateless data storage (git, svn, datomic), where it is
easy to reason about state, because the current state is the sum of all the
previous states.

If I paint my house is it the same house or a different house? Yes and yes,
depending on your perspective. If someone builds an exact replica of my house
is it the same house or a different house? Yes, and yes. Are you the same
person you were 5 years ago? Yes and no.

We have a tendency to reference things by their abstract identity as well as
their concrete state quite interchangeably, which can lead to confusion and
these seeming paradoxes.

So is reality actually stateful? Yes and no. When in doubt, I think stateless
is a better model of the world.
