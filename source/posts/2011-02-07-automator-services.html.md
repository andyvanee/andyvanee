---
title: Automator Services
---

I keep discovering new uses for Automator.

I'm not sure when the "Services" option became available, but it's worth checking out. I had previously wrote a text-to-markdown action, which converted the clipboard contents from markdown to HTML. This was convenient, but it involved copying, running the app and then pasting. The script did this:
`pbpaste | Markdown.pl | pbcopy`

With services this becomes much simpler. It's now in the contextual(right-click) menu for any application that deals with text, and I also set up the keyboard shortcut CMD-ALT-SHIFT-M. It replaces the selected markdown text with the HTML. The action is even simpler; just a single command:
`/usr/local/bin/Markdown.pl`

If you've installed the markdown script somewhere else, you'll have to set the appropriate path. And here's a screenshot of how the input is configured.
<div class="separator" style="clear: both; text-align: center;">[![](http://4.bp.blogspot.com/_ZApMPFF0N4c/TVBCPDdJyOI/AAAAAAAABIg/ltDR1LKfQkk/s320/Screen%2Bshot%2B2011-02-07%2Bat%2B11.45.40%2BAM.png)](http://4.bp.blogspot.com/_ZApMPFF0N4c/TVBCPDdJyOI/AAAAAAAABIg/ltDR1LKfQkk/s1600/Screen%2Bshot%2B2011-02-07%2Bat%2B11.45.40%2BAM.png)</div>

### Search and Replace

Almost any shell command can be wired into OSX this way. If the command needs special arguments for each run, just check the box: Options > Show this action when the workflow runs. I did this for Sed search and replace action. Here's the workflow script:
`sed s/old/new/g`

On each run you want to change old and new with what you're searching and replacing, but it doesn't have to end there. You can change the command on the fly to anything that deals with text transformation. `sed /^$/d` deletes any empty lines. `grep andyvanee` filters out any lines not containing 'andyvanee'.

### View Command Output

For text commands where you don't want to replace the text, just see the results of some command, uncheck the 'Replaces Selected Text' box and add a "Choose From List" action, or maybe "New TextEdit Document" to view the results. For good measure, add a "Copy to Clipboard" action at the end, just in case you want to do something with the output of the command.

This is probably more useful for grep type commands, so I saved this one as "Grep Text" and the previous as "Sed Text", although either can be used for a wide range of commands.
