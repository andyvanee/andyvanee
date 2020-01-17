---
title: From Command-line to XCode
tags: Programming, Process
date: 2010-12-21
url: "/2010/12/21/from-command-line-to-xcode.html"
---

I'm a command-line guy at heart when it comes to programming. It seems much more organic to know what every project file is doing and how each one contributes to the whole. Which files might break things, which files are optional and which files can be refactored or optimized.

"The Pragmatic Programmer" challenged this notion. They recommend diversity. If you only know and IDE, try command-line and if you know command-line, try an IDE. At first I was skeptical of this advice. I've come to know my command-line toolset fairly well, and IDE's feel like they add too much baggage and inflexibility. I've built Xcode projects before, and there is a lot of behind the scenes voodoo attached to the projects.

But, after pushing through my initial concerns, I've come to really enjoy using Xcode for my projects. Here are some command-line programmer concerns, and how to alleviate them in Xcode. Some may be obvious to those who are at home in their IDE, but they weren't to me.

*   Problem: I'm going to have to fill my project folder with unnecessary Xcode-specific files.
*   Solution: Make a workspace (eg. Documents > Web_development.xcworkspace). Add your project folders to this workspace(without copying the files).

*   Problem: My project is unique, won't I have to use the command line anyway?

*   Solution: This is where command-line knowledge really pays off. Just create a new "Scheme" and you can run scripts pre/post Build pre/post Run. For a simple HTML site, I just set Safari.app as the executable and my index.html file as the argument. The build scheme is your hook into all the command-line utilities at your disposal.

*   Problem: I prefer editing with [vim, emacs, ...].

    Solution: Well, I can't really help you there. Personally, I like Vim, but I'm not a total fanboy. I'm quite happy using the standard OSX keybindings, with a few tweaks for one's I use a lot. Find &amp; Replace works well. Split view and file navigation work well, and syntax-highlighting is fully configurable and works with every file I've thrown at it.

*   Problem: I can't manage my git(svn, whatever) repositories from there.

*   Solution: This was my own ignorance. I use git for all my projects, and Xcode support for git is actually pretty awesome. It automatically knows if a file is in a git repo, and puts an M beside the file if it's been modified.

All in all, I've really enjoyed programming in Xcode. It does take a small investment of time and imagination to build custom projects, but I think it's worth it.
