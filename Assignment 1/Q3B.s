.text
.global rotatematrixcw

rotatematrixcw:
    pushq   %rbp
    pushq   %rbx
    movl    $0,     %r8d    # i in %r8d
    jmp     .checki

.checki:
    movl    %r8d,   %r9d    # j in %r9d
    cmpl    $4,     %r8d
    jl      .checkj
    je      .exit

.checkj:
    
    movl    $7,     %eax
    subl    %r8d,   %eax
    cmpl    %eax,   %r9d
    jl      .actual
    inc     %r8d
    jmp     .checki

.actual:
    movl    %r8d,       %esi
    imulq   $16,        %rsi
    leaq    (%rdi,%rsi),    %rax
    leaq    (%rax,%r9,2),     %rax
    movw    (%rax),     %dx
    movq    $0,         %r12
    movw    %dx,        %r12w
    movq    $0,         %r10
    movl    $7,         %r10d
    subl    %r9d,       %r10d
    movl    %r10d,      %esi
    imulq   $16,        %rsi
    leaq    (%rdi,%rsi),   %r11
    leaq    (%r11,%r8,2),    %r11
    movw    (%r11),    %dx
    movw    %dx,        (%rax)
    movq    $0,         %rax
    movl    $7,         %eax
    subl    %r8d,       %eax
    movq    $0,         %rdx
    movl    $7,         %edx
    subl    %r9d,       %edx
    movl    %eax,       %esi
    imulq   $16,        %rsi
    leaq    (%rdi,%rsi),    %rax
    leaq    (%rax,%rdx,2),     %rax
    movw    (%rax),     %dx
    movw    %dx,        (%r11)
    movq    $0,         %r11
    movl    $7,         %r11d
    subl    %r8d,       %r11d
    movl    %r9d,       %esi
    imulq   $16,        %rsi
    leaq    (%rdi,%rsi),    %rdx
    leaq    (%rdx,%r11,2),    %r11
    movw    (%r11),     %dx
    movw    %dx,        (%rax)
    movw    %r12w,      (%r11)
    inc     %r9d
    jmp     .checkj

.exit:
    popq    %rbx
    popq    %rbp
    ret
