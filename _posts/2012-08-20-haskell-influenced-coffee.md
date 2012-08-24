---
layout: post
title: Haskell Influenced Coffee
---

I've been learning Haskell. It's been a very interesting experience to
learn to think in the Haskell way, but I have been unsure whether it will
actually have any practical benefit in my day to day work.

Then I switched modes and wrote a little CoffeeScript. The lessons I had
been struggling with Haskell suddenly became so clear when applied to
CoffeeScript (and JavaScript, by extension). Here's a few examples of
what I'm talking about...

### Example #1 - Callbacks with scope

Asynchronous execution is pretty fundamental in modern JavaScript, and
callbacks are the way this is usually managed. Sometimes it makes sense
to pass small inline anonymous functions in these cases, but other times
you want to break the callback into it's own named function. The problem
that can arise with this is that your function might lose things it
previously had in scope.

Take this example of reading a file asynchronously with node (inside
a request):

<script src="https://gist.github.com/3443765.js?file=inline_callback.coffee"> </script>

Not bad, but those inline functions are essentially untestable and have
a tendency to grow in ugly ways. I'd like to break it into it's own
named function, but I have a problem: my response handle will go out of
scope so I can't actually write my response. My Haskell-influenced
solution uses a function-returning function and looks surprisingly
like a Haskell type signature:

<script src="https://gist.github.com/3443765.js?file=scoped_callback_constructor.coffee"> </script>

So this is a function that returns a callback function (taking err,data)
with the proper response writer in scope. Nice!

And now, with a minimal mock of res, err and data, it would be nice
and easy to test the output of the responder across many inputs.

### Example #2 - Loving Recursion

This one is a bit more of a gray area for me. Recursion can be slower and
harder to understand for some. I've found that I naturally tend to solve
things recursively more since using Haskell. Here's a simple example that
pads a string with another string up to a certain length. I didn't even
think, "I should do this recursively", it just came naturally.

<script src="https://gist.github.com/3443765.js?file=recursion.coffee"> </script>

Now we can change "7" to "007", just by doing `"7".pad("0", 3)`. Sure, this
could have been done just fine with a while or for loop. The thing I like
about recursive solutions is that the edge conditions are clearer than in
an iterative solution.

### Example #3 - Functional Decomposition

One definite influence of writing Haskell is the size of functions I've
been writing. Each function is only a couple lines long and does a single
thing. Here's an excerpt of some filename processing I did:

<script src="https://gist.github.com/3443765.js?file=decomposition.coffee"> </script>

In the past, it's quite possible that I wouldn't have even created a
single function for this, much less three. It's only a couple string
replacements which wouldn't have cluttered up the calling code too much.
As it turns out, I was able to use this inside a string interpolation
which was much cleaner and more or less self-documenting.

<script src="https://gist.github.com/3443765.js?file=template_call.coffee"> </script>
