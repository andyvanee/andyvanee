---
title: RPN Calculator - v0.02
tags: [Programming, Assembly]
---

*disclaimer: I copied this from my old blog. Not sure if it actually works:)*

My calculator code was quite easily polished up. Here's the revised
code which stacks operands properly and supports the main arithmetic
operators +, -, * , /. If you flush the stack completely, you get
a "nan" warning, which seems reasonable. Here's the code: (gas, x86)

    .section .data
    expr_length:    .int 128
    ADD:            .ascii "+"
    SUB:            .ascii "-"
    MUL:           .ascii "*"
    DIV:            .ascii "/"
    null:           .ascii "\0"
    disp_float:     .ascii "%f\n\n\0"
    .section .bss
        .lcomm expr, 128
    .section .text
    .globl main

    main:
        finit
        1:
        leal    null, %esi          #Clear the expr buffer
        leal    expr, %edi
        movl    expr_length, %ecx
        cld
        lodsb
        rep     stosb
        addl    $4, %esp
        pushl   stdin               # Read an expression
        pushl   $64
        pushl   $expr
        call    fgets
        addl    $12, %esp

        movb    ADD, %ah            # Test For Operators
        movb    expr, %bh
        cmp     %ah, %bh
        je      addFloat
        movb    SUB, %ah
        cmp     %ah, %bh
        je      subFloat
        movb    MUL, %ah
        cmp     %ah, %bh
        je      mulFloat
        movb    DIV, %ah
        cmp     %ah, %bh
        je      divFloat

        pushl   $expr               # Must be a number
        call    atof
        addl    $4, %esp
        jmp 1b

        addFloat:
            faddp
            fstl   (%esp)
            jmp     disp_answer

        subFloat:
            fsubrp
            fstl   (%esp)
            jmp     disp_answer

        mulFloat:
            fmulp
            fstl    (%esp)
            jmp     disp_answer

        divFloat:
            fdivrp
            fstl   (%esp)

        disp_answer:
            pushl   $disp_float
            call    printf
            addl    $8, %esp
            jmp     1b


        notfound:
        movl $1, %eax
        movl $0, %ebx
        int $0x80
