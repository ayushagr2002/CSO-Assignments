.text
.global hammingdist

hammingdist:
    pushq   %rbp
    pushq   %rbx
    movq    %rdi,   %r8
    xorq    %rsi,   %r8
    movq    $0,     %rax

.check:
    testl   %r8d,    %r8d
    je      .L1
    jne     .L2

.L2:
    movl    %r8d,    %r9d
    andl    $1,      %r9d
    addl    %r9d,    %eax
    shrl    $1,      %r8d
    jmp     .check

.L1:
    popq    %rbx
    popq    %rbp
    ret

