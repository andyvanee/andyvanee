---
title: The Zen of Text Entry
draft: true
date: 2015-05-28
url: "/2015/05/28/intermediate-text-editing.html"
---

Have you ever furiously hammered the delete key for a whole word? Have you ever
reached for the mouse to select a line of text?

If you have, then this article is for you. This article is meant to point you
down the road of text entry enlightenment.

I will not appeal to the esoteric wisdom of Vim or Emacs, but instead focus
entirely on input methods available in all applications on your Mac, from Chrome
to Text Edit to Mail.

### Step 0: Foundations

*Control(C) Key*. Many of these commands revolve around the use of the `Control`
key. I would *very strongly* encourage you to swap out that Caps Lock key and
change it to be your Control key. This is very easy on a Mac and can be changes
at `System Preferences > Keyboard > Modifier Keys`.

*Alt(M) Key*. The second most used key is the `Alt` key. I will be following the
Emacs convention of labeling this as the `Meta` key, which is shortened to `M-`.
So, for example `M-f` means that you should hold down `Alt` and type `f`.

*Repeat*. Also in `System Preferences > Keyboard` are the options for Key Repeat
and Delay Until Repeat. Drag both of these sliders to the right to make things
much more nimble. Any system with the default settings will feel like wading
through quicksand once you're used to this.


### Step 1: Getting Around

- `C-f` - move forward one character
- `C-b` - move backward one character
- `M-f` - move forward one word (`M-` with arrow keys also works)
- `M-b` - move backward one word
- `C-a` - move to the start of the line
- `C-e` - move to the end of the line
- `C-p` - move to previous line
- `C-n` - move to next line
- `C-v` - move down one screen
- `M-v` - move up one screen

These are the most essential shortcuts to start your journey into effective
text editing on a Mac. If you are not using these regularly, in every program
on your Mac, learn them! Print off this list, or keep it open in a separate
window and just practice moving around some text.

A few of them may seem underwhelming, especially the ones that simply duplicate
the functionality of the arrow keys. It is vital that you learn these ones as
well and commit them to muscle memory, because they all work together as a
system and the following commands build upon them.

### Basic Editing

- `C-d` - delete character forward
- `C-h` - delete character backward
- `M-Delete` - delete word backward

### Modifying Selection

- `C-Shift-a` - select to start of line
- `C-Shift-e` - select to end of line
- `C-Shift-p` - select to previous line
- `C-Shift-n` - select to next line
- `C-Shift-f` - select forward one character
- `C-Shift-b` - select backward one character
- `M-Shift-f` - select forward one word
- `M-Shift-b` - select backward one word

These pretty much match all the movement commands, but it is important that you
learn to think about the movement commands in the context of modifying your
selection as well.

### The Kill Ring

The Kill Ring is similar to the clipboard which is inherited from the Emacs
tradition. At it's most basic it simply provides you with a secondary clipboard,
but the interface is slightly different and very useful in certain contexts.

- `C-k` - kill to end of line
- `C-y` - yank killed text

The difference comes when you type `C-k` a number of times in a row. Each time
it will remove either the line of text or the empty line. These `killed` lines
accumulate in the kill ring and one `C-y` will paste everything in the kill
ring at the cursor position.

Another notable difference is that the kill ring is scoped to the application.
If you kill a URL in the address bar of Chrome, it won't yank into Text Edit. If
you then kill some text in Text Edit, it won't overwrite the kill ring in
Chrome.






--------

This article was meant to be an apology for using Sublime Text as my main
editor. Having used both Vim and Emacs enough to know how much I don't know
about them, I'm quite happy sticking with the interface and discoverability that
Sublime Text gives me. But this article is not about that - this article is
about much of the built in text editing capabilities of Mac OS available to
everyone, in every program, not just your IDE.

Most of these lesser know keyboard shortcuts are inherited from Emacs, so some
Emacs experience will certainly help you, although it is by no means required.



