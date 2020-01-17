---
title: Photo Archiving
tags: Archiving
date: 2010-08-27
url: "/2010/08/27/photo-archiving.html"
---

Backups and Archives are two different things. Ideally you should have
a good archiving system, and your backup would be a redundant copy of
that.

In photography, a robust archiving system has between two and four copies of
any file. These copies are:

- Camera Card
- Working Copy
- Source
- Backup

In this case, Source and Backup are read-only copies that are exact
duplicates of the file off the camera. The Backup copy should be on a
seperate physical media and ideally in a seperate physical location.

The working copy is the one you edit, view and share. Once a file is
edited, it is important to make a Source and Backup copy of them as
well.

It is good to view these copies as layers of mutability.

**Camera Card:** Changes the most. Every shooting session will create and
erase content from the card.

**Working Copy:** Can change with each editing session and these files
can be safely erased once backups are made.

**Source Copy:** Should never change, it is the copy that is
accessed for viewing and making working copies. Any Source copy that is
deleted will be deleted forever.

**Backup Copy:** A mirror image of your Source copy. It will only be accessed
in the rare event that your source copies are compromised (HD failure, fire, theft, etc.).

### Implementation

The way to implement this structure will vary with the tools that you
are using. The first step might be to disable automatic importing when
you connect your camera. A better solution when connecting your camera is
to make source and backup copies immediately.

If you are using DVD's as your Backup copy, it probably makes sense to
use a USB thumb drive as an intermediate backup until you have enough
to fill a DVD.

It is important though to do regular integrity checks on your Backup
copies. You need to make sure that they aren't compromised without
you knowing. If you use an external hard drive, and are command-line
savvy you might do "diff -r PictureSource/ PictureBackup/" to compare
the entire contents of the two folders. If you are using DVD's you
either have to trust the quality of your media, or do periodic checks
of your media.

1.  Connect Camera.
2.  Make Source copy, check file count.
3.  Organize Source photos into events, deleting any _Absolute Garbage_.
4.  Make Backup copies, check file count.
5.  Make Working Copy from Source copy by importing into your editor of
choice.

Resist the temptation to organize your Source folder too much. Use only
large, time-based, linear chunks.

- DO: Pete's Wedding, Reception, Saloman Bay Beach...
- DON'T: Flowers, Trees, Close-ups, Saloman Bay Beach...

The attentive reader will notice that the beach name is both in the do
and don't list. This is because in the first, I've assumed that it was
an afternoon of shooting at the beach. In the second it is a couple
shots of that subject interspersed with shots of other subjects.

On a related note, don't rename your files. The filenames from your
camera are a very good _shooting record_ of your camera. If you want
to attach descriptions and tags, do it in the file's metadata.

Now you are ready to edit your files. A typical editing session might
look like this.

1.  Make a Working Copy from Source copy (if it's not already done).
2.  Edit the file(s).
3.  Make a new source copy next to the original (eg. DSC1255-edit1.jpg)
4.  Make a Backup of what has changed in the Source.

If you are using DVD's, you probably want to make a new folder for any
edited files, because the original folder might already be burned to
disc. Again, use the original name with a standard suffix (Pete's Wedding-edited).

### Generalized Strategy

Photos are actually quite easy to organize, compared to the myriad of
other file types out there. But the systematic logic can be
transferred to other types of files as well.

By being systematic, a lot of confusion can be avoided. It also makes
it possible to work toward automating the process entirely. But as the
number of file types increases, so does the tendency to use different
sorting methods or mixing methods.
