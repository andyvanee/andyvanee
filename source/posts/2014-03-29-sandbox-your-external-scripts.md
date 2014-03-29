---
title: Sandbox your external scripts!
tags: Programming, JavaScript
---

Fonts and external scripts can be a real performance killer for modern websites. This is the white-screen of death for front-end web development. Anytime a page is blocked for 0.5 or more seconds due to scripts and hosts outside of your control is a serious problem in my opinion. The best solution is to completely sandbox your external scripts like social media widgets. Fonts could use similar treatment.

Here's two waterfalls to compare:

![Network Fail](https://dl.dropboxusercontent.com/u/20801198/andyvanee.com/network-fail.png)

![Network Soft Fail](https://dl.dropboxusercontent.com/u/20801198/andyvanee.com/network-nice-fail.png)

Below is the gist of the code.

What it does is put all the HTML that contains possibly blocking scripts into an unknown script tag type (which the browser just skips) and then injects this after the page is loaded. There's a bit of gymnastics to make it possible to embed script tags within a script tags, but I think the result is worth it.

```html
<div id="async-scripts">Social widgets will go here...</div>

<script id="script-sandbox" type="text/html-template">
  <div class="my-toolbar">
    <a href="https://twitter.com/andyvanee" class="twitter-follow-button" data-show-count="false" data-width="60px" data-align="left">
        Follow @andyvanee
    </a>
    <a href="https://twitter.com/share" class="twitter-share-button" data-via="andyvanee">
        Tweet
    </a>
    --#script#--
        !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
    --#/script#--

    ... the rest of your widgets here ...
  </div>
</script>

<script>
  jQuery(function($){
    var sandbox = $("#script-sandbox").html().replace(/--#/g, '<').replace(/#--/g, '>');
    $("#async-scripts").append($(share_html));
  });  
</script>
```

[View on gist.github.com](https://gist.github.com/Andyvanee/9849384)

I've used various methods with similar results before, but what I like about this one is that you can just block off an entire chunk of HTML and defer loading it until a later point.

One final hint: you can simulate a network timeout really easily by adjusting the external url to specifying a blocked port. Change <https://twitter.com/share> to <a rel="nofollow" href="https://twitter.com:81/share">https://twitter.com:81/share</a> to see how your page is affected by timeout errors.

Happy Hacking!

<style type="text/css">
    pre {
        white-space: pre;
        word-wrap: normal;
        overflow-y: scroll;        
    }
</style>
