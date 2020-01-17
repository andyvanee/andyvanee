---
title: "Event Driven Web"
date: 2020-01-17T00:04:51-07:00
---

I've recently been working on a project that uses WebSockets as a core mechanic.
These are my thoughts...

For starters, an event-driven architecture all the way from Server to UI brings
some interesting features. Most notably, it allows you to think about the app as
a single one-way rendering flow.

The app is driven by a log file which stores events and publishes them to
clients connected through web sockets. When a client first connects, they get
the backlog of events (filtered to remove duplicates, deletions, etc) and then
from then on recieve and process future events in exactly the same way.

The frontend uses [LitElement](https://lit-element.polymer-project.org/)
components which work very well for this kind of one-way data flow.

One aspect that I really enjoy about my implementation is that events bubble all
the way up the DOM and into the backend. The backend registers event listeners
and can also trigger events on the client, or broadcast events to all clients. I
was definitely influenced by my reading on Event Sourcing and Erlang message
passing, but I haven't really found a system that's implemented in this way.

Another aspect I've really enjoyed about using Web Sockets is how good the
Chrome Developer tools are at inspecting the traffic. If you click on a
websocket request in the Network tab and are using JSON formatted messages, you
get a nice JSON inspector. I had initially started using MessagePack, but found
it too difficult for rapid prototyping, testing and debugging.

On the negative side, I've found Web Sockets to be pretty reliable, but
obviously not 100%. The failure mode of traditional web architecture is quite
predictable, but it's something you really have to think about when using
sockets. With this project I had full access to all client machines, so I could
make breaking changes and just refresh them. I can definitely see it being an
issue if you didn't have that luxury.

I don't have any code to show at the moment as it's a closed codebase, but I
think it's a really powerful idea, so will likely work on something open source
in the future.
