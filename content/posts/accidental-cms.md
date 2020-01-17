---
title: Accidental CMS
tags: Programming
date: 2013-11-29
url: "/2013/11/29/accidental-cms.html"
---

When I started reading [this article called CMS Trap](http://hakunin.com/cms-
trap), I had no idea what the hell he was talking about. As I pushed through, I
began saying 'yes' more and more, and by the time I was finished I had to go
back and re-read it again because so much rang true.

Here's the gist:

> Ruthlessly axe the moving parts in your app.

The primary target of the article is admin interfaces. Elaborate architectures
and interfaces make our code exponentially harder to refactor and extend. Simple
changes become bogged down in database migrations, complex dependencies and
unpredictable production data.

Near the end, he proposes some simpler alternatives to a full blow database-
backed CRUD admin interface. A class, a static page, a constant or a string in
the database.

I'd like to propose another. A technique that I've been using more and more:

### Static Models

These are models that look and behave just like your standard database-backed
models, with the exception that they just store hard-coded values.

It should be pretty easy to mimic the interface of your standard model classes.
The rest of your code doesn't need to know where that data is coming from, and
doesn't need to change if you decide it really needs to be database backed.

Here's how it looks in DataMapper:

```ruby
class Countries
  def self.all
    [{:name => 'US'}, {:name => 'CA'}]
  end
end

class Users
  def self.all
    YAML.load_file('data/users.yml')
  end
end
```

Go ahead and fake any other model methods you might need as well.

I've been surprised at how flexible this approach is. It's much easier to define
tightly focused models, test their interactions, and refactor mercilessly while
prototyping. Some never end up needing to be runtime-editable, so they can stay
as they are. Others may come in handy as mock objects for testing (wrapping
external API's, for example).

So throw those generators and migrations away and keep things static as long as
you can!
