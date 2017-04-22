---
title: The Case Against Frameworks
---

This may come across  as a rant, but I'm hoping I can keep this as objective as possible: I don't like frameworks.

I'm going to use a broad definition of frameworks defined like this:

> Any 3rd party dependency which broadly influences how you structure
> and implement your own application.

I'm defining it in this way specifically to break down the divide between libraries and frameworks. You'll find many articles bashing frameworks that go on to sing the praises of their favorite libraries. I don't agree with this distinction.

The other reason I'm defining it this way is that I really have nothing against using 3rd party code. There is a wealth of people that are amassing a collective wisdom far beyond what you can accomplish on your own. By all means - **make use of that**. I want to highlight the pitfalls of this reliance.

### Symbiotic Coupling

In the best case, a library or framework is perfectly aligned with your own objectives. The authors wrote it to solve your problem exactly. They have thoroughly documented  the use cases, tested all the common and edge cases and they are responsive to community feedback. This is a true symbiotic relationship - and it is the most powerful force multiplier a developer has at their disposal.

In reality, the relationship is a *lot more blurry*.

Maintainers can be stubborn and opinionated - ignoring or outright refusing to address legitimate feedback. On the flip-side, they may be constantly swayed by community feedback, leading to a muddled and inconsistent API and a constantly growing scope. They may silently drop support for the version that you depend on in favor of a shiny new implementation, leaving you to pay the cost of either migrating away from, or independently supporting the rotting legacy code.

This is a social contract. You need to get a sense if the developers and community will be allies or adversaries in the long run. Read the mailing lists. Skim the open and closed issues. Get a feel for the commit history.

### SLOC

Another consideration is how many significant lines of code this library adds to your project. I would argue (somewhat hypocritically) that a responsible developer must read and have a basic understanding of every one of those lines.

This may sound outrageous. The whole reason for using that code is to hide that complexity and keep your own app tightly focused. But there are significant costs to ignoring what's under the hood.

The first cost is that of reinventing the wheel. If you have only a surface understanding of the code you're using, there is a much greater chance that you will use it incorrectly or reinvent portions of that code (with your own bugs).

The second cost lies in the unseen mass of code that you are not actually using. The vast majority of major security vulnerabilities in tools, libraries and frameworks are in features that the average developer isn't even aware of. I'm not saying that a responsible developer will identify those bugs at a glance, but it will give you a good feel for the surface area of the code. **Beware large surface areas**. Even if you're only using a small corner, you may be dragging in a lot more maintenance headaches than you realize.

### Structure

My final point is that 3rd party code will always affect how you structure your application. This can happen in a number of different ways and I'll only skim a few.

Twitter was famously started as a Rails application. This is a classic case of an application that doesn't suit the framework in really fundamental ways. To framework enthusiasts - it's a clear victory, since it actually worked. They bootstrapped their minimum viable product with a framework and re-architected when they had the cash and developers to do so. To others, it is a joke. A huge waste of time since it could have been done right from day one.

I think both are missing the core issues. First of all, you'll never get it right the first time. With that in mind, it's best to think hard about how to structure things that are as decoupled as possible. Secondly, a lot has changed since 2006, and there are a lot more options for choosing 3rd party code that may align much better with your own application.

Another, more subtle, influence on the structure of your application is the community at large. PHP and JavaScript have famously bad sample code and libraries almost universally. I truly believe that good applications can be built in either, if used appropriately and in the right context. Rails tutorials can be equally bad: encouraging fat views, fat controllers or fat models. The truth is that if your app is fat anywhere - that part is unhealthy. There is no silver bullet.

Good structure is hard - and it's worth considering the merits of all approaches, but at the end of the day you need to learn what's right for your application. The rest is just dogma.
