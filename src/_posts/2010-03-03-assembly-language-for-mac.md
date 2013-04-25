---
layout: post
title: Assembly Language For Mac
tags: [Programming, Assembly]
---

I'm away from my Linux box and want to do some assembly
programming. Mac installs GCC with the developer tools, but there are
enough differences that I haven't bothered to work through them until
now. Here's [a decent tutorial](http://shorestreet.com/node/21),
although it focuses on PPC assembly and I'm using an Intel Mac. The
thing that frightened me about the Mac assembler was the default
output of gcc -S. There is some strange optimizations and flags in the
resulting assembly code. The key, as the tutorial points out, is in
the compiler options. Here's what I used on the ubiquitous "Hello
World" program:

    gcc -S -fno-PIC -O2 -Wall -o hello.s hello.c

And here's the assembly code it spit out:

    .cstring
    LC0:
       .ascii "Hello World!%d\12\0"
       .text
       .align 4,0x90

    .globl _main
       _main:
       pushl   %ebp
       movl    %esp, %ebp
       subl    $24, %esp
       movl    $12, 4(%esp)
       movl    $LC0, (%esp)
       call    _printf
       xorl    %eax, %eax
       leave
       ret
       .subsections_via_symbols

This is more familiar territory, the only differences being the 
`.cstring` directive instead of `.section .text`, the leading underscore
on printf, and the `.subsections_via_symbols` directive. The general
naming of sections is outlined on the Mac Assembler Reference, and the
`.subsections_via_symbols` explanation is interesting. I'm already used
to using many labels in my code; does this mean that the named
sections would be ripped out because they are not "called" by any
other code? I tested this out in the previous example, just adding a
second call to `_printf` in a labelled section and the code worked just
fine. It seems that labels don't count, they have to be declared
sections like `.globl`, `.section` or whatever. That seems fair, I haven't
yet made a habit of calling sections that are supposed to flow
naturally into other sections. Maybe there is some instance where this
might be a useful optimization? I will be looking into Position
Independent Code(PIC) a bit more, it seems that it's similar in theory
to how the latest Linux kernel runs code at randomized memory
locations to prevent hardcoded attacks, but I don't know if that's the
extent of it.
