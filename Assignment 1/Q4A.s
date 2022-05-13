.text
.global getCount    # a in %rdi, output in %rsi

getCount:
    pushq   %rbp
    pushq   %rbx
    movq    $0,     %r8
    jmp .check1

.check1:
    cmpl    $26,    %r8d
    jl      .initialise
    jge     .actual

.initialise:
    leaq    (%rsi,%r8,4),     %r9
    movl    $0,     (%r9)
    inc     %r8
    jmp     .check1

.actual:
    movl   $0,     %r8d
    jmp     .check2

.check2:
    cmpl    $32,    %r8d
    jl      .L1
    jge     .done

.L1:
    cmpb    $97,    (%rdi,%r8,1)
    jge     .L2
    inc     %r8
    jmp     .check2

.L2:
    cmpb    $122,   (%rdi,%r8,1)
    jle     .func
    inc     %r8
    jmp     .check2

.func:
    movb    (%rdi,%r8,1),   %r9b
    movzbq  %r9b,   %r9
    subb    $97,    %r9b
    leaq    (%rsi,%r9,4),  %r9
    incl     (%r9)
    inc     %r8
    jmp     .check2

.done:
    popq   %rbx
    popq   %rbp
    ret
