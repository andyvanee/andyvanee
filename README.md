andyvanee.github.com
====================

My Homepage [andyvanee.com](http://andyvanee.com/)

This site ties together some command-line tools to generate a static site.

The `generate` branch is where the work happens, and the `master` branch is
where the compiled site lives. In order to do this, I'm using a dubious
technique of creating a submodule in the `generate` branch which points
to the master branch. This may be an outrageous solution, but it actually works.

    git clone git@github.com:Andyvanee/andyvanee.github.com.git
    git checkout generate
    git submodule init
    git submodule update  # pulls the code from master into public/
    make        # runs jekyll, et-al - compiling to public/
    cd public   # This is actually the master branch
    git status  # Push/pull from here to update master

