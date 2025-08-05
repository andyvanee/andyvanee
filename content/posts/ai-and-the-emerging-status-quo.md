---
title: AI and the emerging status quo
tags: Programming, AI
date: 2025-06-02
url: "/2025/06/02/ai-and-the-emerging-status-quo.html"
draft: true
---

Much has been said in the last few years about the death of software development jobs due to AI. While I don't totally disagree, I think the current blip is the result of shortsighted managment rather than the capabilities of the AI.

### Vibe check

Let me start by establishing some assumptions. The job of a software developer is not measured in lines of code - it never has and it never will be. The real 10x developers are those that can **remove** lines of code and **simplify** interfaces rather than add to them. Better systems come through better abstractions and better core assumptions. This is **even more true** in the age of AI-driven software.

One of my first experiments with 100% vibe coded software produced around 5000 lines of code in one evening which was easily doubled if you include the verbose commentary which AI will include by default. It was a good functional prototype - as long as you only looked at the result and didn't dig into the code. It didn't pass my own vibe check at code level for quite a few reasons, but it passed all my functional tests.

On it's own, this covers a broad range of useful software products that aren't yet being built, but can now be built. The important note is that this is a **net new** capability that unlocks new options for non-technical folks. It is another tool in the category of "nocode" options which is a fantastic growth area with it's own distinct opportunities and limitations.

For larger projects, performance critical applications and core infrastructure, the skills of a competent software developer are even more important to unlock future capabilities. Future systems are more than ever only limited by the power of the fundamental building blocks and the skill of the developers who build them.

### Future oriented design

Non-developers may assume that I'm being pedantic about software quality when I say that the code didn't pass my vibe check. I'll admit that there may be some of this going on. I make a practice of code reviewing code bases in different languages with different technical goals regularly, and every time I'm struck by the wildly different conventions and practices used in different codebases. Some recent examples of codebases that I've reviewed with very different standards and conventions are:

- <https://github.com/cc65/cc65>
- <https://github.com/git/git>
- <https://github.com/raysan5/raylib>

Yes, it's been weirdly C oriented for a frontend leaning developer, but that's where I've been at. This goes back to a blog post that was highly influential for me [I like Unicorn because it's Unix](https://tomayko.com/blog/2009/unicorn-is-unix). Before that post, I remember being interested in what was under the hood, but it opened my eyes to being more precise and methodical about how to analyze a codebase and how to answer specific questions.

The primary factor in what makes a codebase good, or not so good, is a sort of abstract notion of how prepared it is for the future. The natural "gravity" of a software project is to optimize for the present which manifests in vague names and interfaces. This can _have the appearance_ of a well structured application, but hide leaky abstractions all over the place. My vibe-coded example ended up with objects called `State`, `Grid`, `Block` and `Status` which all variously mixed into and manipulated each other and shared global state. I could have got ahead of this with more specific instructions, but I was avoiding that to see what the end result would be.

The point being that good design is still good design which will always require a certain amount of forethought and rigor. If we can build these pieces in a way that enables end users to prototype more quickly to develop useful applications, everyone wins.

This does mean that developers who primarily **consume** API's and components must level up and **produce** the building blocks which humans and AI will consume. This was true to some extent before AI came into the picture, but I think it's only going to become a more meaningful distinction. Having skill in using software does not always map cleanly to skill in producing software.

### Unopinionated and enthusiastic

Subject matter experts have often made the point that AI assistants are very good on topics where you have little context, but often are outright wrong on topics where you have a lot of context. Similarly, coding assistants will often happily churn out thousands of lines of code in the wrong direction. I think it's important to deeply consider this malleable nature of AI Assistants. They will happily entertain bad ideas since it makes no difference to them.

By nature, AI Assistants are extremely unopinionated and unmotivated while possessing infinite enthusiasm.

I think it's important for everyone, in any line of work, to consider the ways in which we build networks around ourselves which end up confirming and reinforcing our biases.

The critical thinking skills of knowledge workers using AI assistants are even more important than they've ever been, as is the need to surround ourselves with diverse voices. The emerging status quo means that the best knowledge workers will be the ones that are able to add meaninful direction and mental frameworks to direct these tools to the best outcomes.

Another key skill that's not often mentioned is being very explicit and precise about code quality issues on multiple levels, from specific syntax all the way to broad abstractions. This is valuable in feedback to peers but even more crucial when directing AI assistants. AI (and people, including me) will miss things all the time and part of the job is being clear and specific about what these things are.

### The emerging status quo

I'm willing to double down on this: zero-sum thinking is actively wrong and harmful when predicting our future with this technology. If companies believe that the current status-quo can be achieved by cutting the workforce and replacing them with AI, they **will be eaten** by companies which embrace the emerging status quo and continue hiring for the next stage of evolution.

This is not a new thought and can probably be traced well beyond the famous Henry Ford quote:

> “If I had asked people what they wanted, they would have said faster horses.”

We may have unlocked a faster horse, but any company which evaluates the new capabilities against the current status quo _will be left behind_. This could be true if it was something only available to the elite technology companies. The truth is that this technology gives them _zero competitive advantage_ since it is available to all.

### The future

I could easily be wrong. Perhaps all the doomsday predictions are correct and my field of work is just months or years away from extinction?

It is my strong belief though that with new capabilities come expanding opportunities and features. The horizon widens as we step into this future, and any company which recoils into zero-sum thinking will not survive the unfolding revolution.
