---
title: Automate The Itch - Part 1
tags: GTD
date: 2011-02-11
url: "/2011/02/11/automate-the-itch---part-1.html"
---

Small, single-purpose utility applications have a long lineage in computing history. They are the cornerstone of the UNIX philosophy, and are rampant on mobile platforms. They are the small building blocks in a larger task. These are apps that scratch an itch. They do things that could be done in another way, but with less time and effort.

Every Mac comes with a tool for building your own utility apps quickly and painlessly: Automator. These apps don't need to clutter your dock, but can sit in the contextual menu (right-click) whenever you need them. This series will show you how to build a few useful apps, and hopefully give you the tools to dream up your own.

The first part will deal with files and folders, then I'll dive into network tasks, and finally text. I may also throw in a bonus section on porting some command-line wizardry to Automator.

### Batch Renamer

One of the most common, time consuming tasks is emailing files. You may want to rename them, compress them or convert them somehow. Automator can deal with almost any of these tasks. Say you have 1000 files named [DSC1020.jpg-DSC2020.jpg], and want them to be called [Vacation_0001.jpg - Vacation_1001.jpg]. Here's how Automator can help.

1.  Open Automator and make a new "Service"
2.  Set the service to receive files or folders in any application.
3.  Add a "Rename Finder Items" action. (Don't make new copies of the files)
4.  Change "Add Date &amp; Time" to "Make Sequential".
5.  In the actions "Options" pane, click "Show this action when workflow runs", so you can tweak the settings each time you run it.

Save it and it will show up whenever you right click any files or folders.

### Resize Images

If you email photos a lot, your workflow may also include copying them and resizing them. Here's how that might look:

1.  Create a "Service" that receives "image files", or just continue on from the previous workflow.
2.  Add a "Copy Finder Items" action. Set it to copy to the Desktop, your Dropbox or wherever you want the new files.
3.  Add a "Scale Images" action and set the scaling. 600-pixels is probably good for general usage. If you want to adjust this each time it's run, check the box "Options > Show this action when run"

    4a. Optionally: add a "Reveal Finder Items" action to show you the files in Finder when it's complete. This one throws an error for me, even though it does the job perfectly, so it's up to you…

    4b. Or: add a "New Mail Message" action to automatically add those photos to a new message in Mail. If you're feeling lucky, you can also add a "Send Outgoing Messages" action to automatically send the prepared email.

### Other Handy File Actions

*   Use "Sort Finder Items" prior to a sequential rename, to organize them by date, kind or size.*   Include "Label Finder Items" or "Set Spotlight Comments" to organize the files you run through a particular workflow.
*   "Create Archive" is useful if you want to zip the files before sending.
*   "New Alias" is a great one-action service that just takes the selected files or folders and makes a shortcut on the Desktop.
*   Use "Choose From List" whenever you need to confirm an action. You then have the option to "Select None" or pick and choose items before the workflow continues.

### Bonus Points - Email Screen Recording

Here's a much more esoteric, but potentially very useful workflow. This one captures a screen recording, and emails it to someone.

1.  Make a new "Application".
2.  Add a "New Screen Capture" action.
3.  Add a "Start Capture" action and check the box "Wait for capture to complete"4.  Add a "Ask For Finder Items" action, and set it to start at "Movies". This is where screen recordings are saved by default.
5.  Add a "New Mail Message" action like before. The selected movie will get added to the body of the mail message.

This starts the recording right away, if you haven't used screen recording in QuickTime you probably want to run it once manually to set up your levels. Instant tutorials!
