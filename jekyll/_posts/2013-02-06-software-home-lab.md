---
layout: post
title: The Software Developers Home Lab
tags: [Programming, HomeLab, GTD]
---

This post caught my eye:
[Why you need a home lab to keep your job](http://www.theregister.co.uk/2013/02/07/home_lab_career_saver/).

<blockquote>Your boss won't pay for training, so your partner has to put up with servers at home</blockquote>

What intrigued me, as a web developer, was not setting up servers with the latest and greatest hardware. It was the question of what exactly the 'Home Lab' looks like for a web developer. I have a number of things cooking in my home lab but I'm thinking I really should have more. These are non-paying projects, built for fun or necessesity or just to develop my skills with tools I don't use at work. Here's a rundown of a couple of them:

- [My wife's website](http://www.dollhousespa.com). Wordpress for most, Django for gift certificates. Nginx on EC2.
- [This blog](https://github.com/Andyvanee/andyvanee.github.com): Jekyll static site hosted on github
- [My scrapbook](http://scrapbook.andyvanee.com): home-brew static site generator in python, hosted on S3
- A little Node app for sharing / publishing lists of links. (also on EC2, but no link at the moment :)

There are a number of notable omissions from this list, and the reason I've omitted them is important (to me, anyway).

First, I didn't include the many throwaway projects [on github](https://github.com/Andyvanee?tab=repositories) or the ones littering my hard drive. Second, I didn't include the tools I use, or the substantial time commitment that's involved in learning new tools and frameworks.

The reason I think it's important is that there is a certain pathology that can become nearly all-consuming when working in this field. The pathology is an obsession with methodologies, tools and frameworks at the expense of code that can ship.

Code that can ship.

Flamewars about code editors, MVC, TDD, IDE's or security mean very little in comparison with deliverables. No matter if they are contracted, personal or purely experimental, the focus needs to be on shipping code.

When your code is out there in public, it represents a committment. So buy a domain name [DNSimple](https://dnsimple.com/). Signup with a web host that can host the kind of apps you want to run (gh-pages, S3, EC2, Rackspace, Heroku, ...).

Then **ship some code.**
