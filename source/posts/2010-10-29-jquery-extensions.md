---
title: jQuery Extensions?
tags: [Programming, JavaScript]
---
<p>I've been working with jQuery a fair bit lately. Although it gives you a fair number of handy shortcuts, I think it's true value is as an educational tool on how to use JavaScript effectively.</p>
<p>This means diving in to the jQuery sources. This means learning what anonymous functions and closures are all about, letting it settle, and then learning what they're about again. It also means taking 98% of all the JavaScript tutorials on the internets and throwing them out. Well, maybe not throwing them out, but putting them in to context.</p>
<p>What I'm digging in to right now is programming in the jQuery paradigm. What this means is bolting all my own functions onto the jQuery object through an anonymous function. I can then call these functions just as I would call the jQuery functions, making for a cleaner and more reusable codebase.</p>
<p>The basic pattern is this:</p>
<h4>jQuery.js</h4>
<p>The jQuery library.</p>
<h4>myLibrary.js</h4>
<p>This is where I attach my functions to the $ object. The template goes like this:</p>
<pre>(function ($) {
    var private_var = 1;
    var private_function = function() {return "Only this closure can call me, I'm special."};
    $.cool_function = function(){
      return "Hello jQuery.";
    }
}(jQuery));
</pre>
<h4>doStuff.js</h4>
<pre>$().ready(function() {
    $("h4").html($.cool_function());
});
</pre>
<p>That's it in a nutshell. For more info on wrapping your brain around why this works, see <a href="http://www.adequatelygood.com/2010/3/JavaScript-Module-Pattern-In-Depth">this article</a>. I wish I would have read it earlier.</p>
<p>You'll note i'm not handling input from jQuery selectors. I'm going to have to let that one bounce around in my brain a bit longer...</p>

<p>Happy coding!</p><div class="blogger-post-footer"><img alt="" height="1" src="https://blogger.googleusercontent.com/tracker/3761776372224414205-408398736370509501?l=amxor.blogspot.com" width="1" /></div>
