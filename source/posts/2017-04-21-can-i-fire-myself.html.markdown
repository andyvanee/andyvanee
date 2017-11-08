---
title: Can I fire myself?
date: 2017-04-21 22:50
published: false
---

I've been trying to live by the following axiom for a while now:

> Be kind to your future self

This idea was ringing in my head as I posted the previous blog post. As a
developer, I am extremely bad at this some times. I often say "Why would I use
service X when there are A, B and C open source projects that do it so much
better?!?!"

Here's why: maintaining software is terrible.

It's fantastic when it's fresh and clean, but open source software is not
optimizing for your future self. Breaking compatibility is often necessary for
one reason or another. These reasons matter to maintainers, I get that. But the
same reasons don't really matter to your future self.

To drive home the point, I want to post an annotated command-line session of
exactly what was required to post a single article on my blog.

I haven't posted in a year, so I was assuming that stuff would be broken. That's
a given. And I'm not actually that suprised by how long it took. But it does
impact how I view my software choices in the future.

It may appear that I'm picking on Middleman or Ruby or whatever. I'm not. This
is a ubiquitous problem across the board for any developer that has many
projects that they only sporadically maintain.

Okay, let's see what we've got.

```
cd andyvanee.github.com
ruby version
rbenv version
rbenv global 2.2.0
bundle
```

Oh yeah, an older ruby version. One of these should work.

```
rbenv versions
rbenv global 2.3.3
bundle update
```

Hmm, I've gone from middleman-core (3.3.10) to middleman-core (4.2.1). Is that
going to be a problem?

```
bundle exec middleman build --verbose
```

Yup - [absolutely a problem](https://github.com/middleman/middleman-sprockets/blob/master/docs/upgrade-3-to-4.md).

Let's generate a blank site to see what we've got:

```
be middleman init blank
mv blank ..
ll config
```

For some reason I have an uncommitted config directory and a Dockerfile in
there. They don't seem important.

```
subl source/posts/2017-04-21-deconstruct-2017-stronger-communities.md
git add source/posts/2017-04-21-deconstruct-2017-stronger-communities.md
git add Gemfile*
git add config source/feed.xml.builder wercker.yml
git reset config
git commit -m 'New post, update middleman and gems, probably break everything'
git push
```

Now I just push because I knew that I had a wercker bot to build the thing.
Maybe it will magically still build even though it's not working on my
machine... Nope.

Let's dig more into the blank generated project to see what's changed.

```
subl ../../blank
cd build
git mv source/layouts/layout.erb source/
git mv source/stylesheets/all.css.less source/stylesheets/all.css.scss
git commit -am 'Get styles working'
```

LESS moved out of sprockets, which is why the styling was broken. Luckily, my
styles were minimal and the LESS file was also valid SCSS. Win!

But I still have zero posts showing up on my home page, so it doesn't really
qualify as a blog anymore. I see that the new files seem to all have a
`.html.markdown` extension. Maybe that's the problem?

```
cd source/posts
for old in *.md; do mv $old `basename $old .md`.html.md; done
ll
for old in *.markdown; do mv $old `basename $old .markdown`.html.md; done
ls -1 source/posts | grep .html.html
ls -1 source/posts | grep -v .html.md
git add --all source
git add config.rb
git commit -m 'Posts actually rendering and permalinked correctly'
```

I now have posts!

```
be middleman build
git commit -m 'Re-add summary'
```

I now have a properly rendering blog! I now look into why my deploys are failing.
I conclude that I have no idea why my build is failing, and Wercker was bought
by Oracle, so screw that. Let's switch to github pages.

```
rm -rf build
git rm wercker.yml
be middleman build --help
be middleman build --build-dir=docs
cd docs
server
cd ..
touch Makefile
git add Makefile
git commit -m 'Build to docs directory and add Makefile'
```

Cool, we're building to a docs directory because github pages supports that
now and building to a separate branch always seemed like a hacky pain in the
ass.

But wait! Turns out User and Organization pages don't actually support that, so
we've got to switch to make it a project. Okay.

```
git remote rm origin
git remote add origin git@github.com:andyvanee/andyvanee.git
git push --set-upstream origin master
touch source/CNAME
cat > source/CNAME
git pull
make
cat docs/CNAME
git add source
git add docs
git status
git commit -m 'Add CNAME to build'
git push
```

Now I start rummaging around the github pages docs for how to set up my DNS
records. Then I log in to switch them.

```
dig andyvanee.com
```

And I've finally posted to my blog again after nearly a year. If you are a
developer, none of this should seem unfamiliar, but I think we should all be
taking a hard look through our command line and browser history and ask:
Am I being kind to my future self?
