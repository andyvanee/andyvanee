----
title: Advent of Code
---

I've really been enjoying working my way through the code challenges at
<http://adventofcode.com/>.

My solutions are here: <https://github.com/andyvanee/adventofcode>

I'm now on day 8, and the examples have ranged from
[very easy](https://github.com/andyvanee/adventofcode/blob/master/bin/day_1) to
[pretty involved](https://github.com/andyvanee/adventofcode/blob/master/lib/bt.rb),
but none have been devilishly complicated or tricky.

Here's my favorite part:

Each exercise has a second step, which is only visible after solving step 1.
Knowing that you will have to refactor or extend deal the code you wrote in step
one is much more like real-world coding.

I think this kind of exercise is important at any level of programming
experience. For me, it was some confirmation that I actually have made progress
in my code. I'm sure my solutions much more modular and well tested than I would
have produced a few years ago.

<https://github.com/andyvanee/adventofcode/blob/master/spec/fire_hazard_spec.rb>

Day 7 was a highlight for me, as I've never actually written a parser/evaluator
for a custom minilanguage. I've read the theory a few times, and had some
experience with ad-hoc embedded DSL's, but this was my first end-to-end
implementation of something like this. My solution is in the `BT` module here:

<https://github.com/andyvanee/adventofcode/tree/master/lib>

Although it could use some cleanup and documentation about what's actually going
on, I was pretty happy with the performance and functionality - especially with
the addition of memoization of partial results here: 
<https://github.com/andyvanee/adventofcode/blob/master/lib/bt/evaluator.rb>

A big thumbs up to <http://was.tl/> for this project!
