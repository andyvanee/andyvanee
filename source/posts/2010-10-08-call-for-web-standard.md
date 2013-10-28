---
title: Call For Web Standard
tags: [Programming]
---

Developing native apps is a pain. Yes, you have the luxury of fixed screen dimensions and access to hardware features that may not be available elsewhere, but when you're done, you have an app that only works on one platform.

Web apps, on the other hand, work on a lot more platforms straight out of the box. The performance may not be the greatest, but the technology is advancing at breakneck speed.

The single largest drawback of web apps is working with files. The browser has no access to the filesystem, which makes sense in a lot of ways, but I'm surprised that this hasn't been addressed more thoroughly.

What we need is a new web standard and API for remote filesystems. Unlike the popular storage solutions like Dropbox, Box.net and MobileMe, this would be a remote hard-drive that you and your apps have access to. Apps would need to authenticate to access zones of your storage space; you could make some zones public and other zones publicly accessible via login.

Again, this goes back to my idea of content control. I would far sooner use an app that writes to a simple, accessible file-type than one that uses a locked down and proprietary format. The same standard applies to web apps, but the current assumption is that your web-app files live and die with the service that created them. Even Google Docs, probably the best of it's breed, only operates ideally if you only access and edit the files through their service (downloading/uploading strips date, author, etc. ). Interoperability with other web apps? Well, that's just crazy talk!

### Crazy!?!

But why is it crazy? What is it about web-services that makes us freely give up the rights to our data? If I downloaded a word processor that password encrypted every file so that only that app could read it, I certainly wouldn't use it! But we are so blinded by the sharing and publishing features of these apps that we throw interoperability and future-proofing out the window.

In fact, I think there's some merit to this idea even in the desktop computing world. By zoning the filesystem, you could download and run apps in a sandboxed environment without worrying that they are messing with your files.

Maybe something like this exists? It seems like the IETF group working on WebDAV has something like this in mind, but it still seems pretty system level, like Samba and afp.
