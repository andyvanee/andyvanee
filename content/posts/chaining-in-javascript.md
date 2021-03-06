---
title: Chaining in JavaScript
tags: Programming, JavaScript
date: 2010-11-25
url: "/2010/11/25/chaining-in-javascript.html"
---

It's been bugging me for a while that I didn't understand the method behind jQuery's function chaining. So I built the smallest functional version of it. I call it aQuery <em>(for andy, or awesome).</em></p><p>This is the calling code:

```javascript
window.onload = function(){
    aQ("#content").height().background().elem.innerHTML = "hello";
};
```

I have made two functions .height() and .background(), which do pretty much what their names suggest. The elem is the original object and so I use it to call "native" code. Maybe should have called it "target" to be consistent.


Here's the meat and potatoes of the "library":

```javascript
(function() {
    var aQ = function(selector) {
        return new aQuery.fn(selector);
    };

    var aQuery = {};
    aQuery.fn = function(selector) {
        this.elem = document.getElementById(selector.split("#")[1]);
        this.cssText = "";
        this.height = function(){
            this.cssText = this.cssText + "height: " + window.innerHeight + "px;";
            this.elem.style.cssText = this.cssText;
            return this;
        };
        this.background = function(){
            this.cssText = this.cssText + "background-color: #444;";
            this.elem.style.cssText = this.cssText;
            return this;
        };
        return this;
    };

    return (window.aQ = aQ);
})();
```

Each call to aQ makes a new object, primed with the selector string. This object has several functions and attributes, and all the functions return "this", so they can be chained together. As it stands, it's not dynamic at all but you can use your imagination!
