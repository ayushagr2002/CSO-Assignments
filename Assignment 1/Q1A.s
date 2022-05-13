.data
    a:       #store the array here
    .word    68,63,-89,-35,-6,29,-45,70,-32,43,-16,18,-96,-41,97,-57,89,-94,30,-66,77,-56,-83,-12,32,-75,-21,82,99,8,36,20
.text
.global main

main:
    pushq    %rbp
    pushq    %rbx
    leaq    a(%rip),%rdi    # load base address of a in %rdi
    movl    $0,     %r8d    # store i in %r8d
    jmp     .checki

.checki:
    cmpl    $31,    %r8d    # check i < 31
    jl      .initj
    jge     .done

.initj:
    movl    $0,     %r9d    # store j in %r9d
    jmp     .checkj

.checkj:
    movl    $31,    %eax
    subl    %r8d,   %eax
    cmpl    %eax,   %r9d    # check j < 31 - i
    jl      .actual
    inc     %r8d
    jmp     .checki

.actual:
    movl    %r9d,   %eax
    inc     %eax
    movl    %eax,   %r11d
    movw    (%rdi,%rax,2),  %ax
    movw    (%rdi,%r9,2),   %bx
    cmpw    %ax,    %bx
    jg      .swap
    inc     %r9d
    jmp     .checkj

.swap:
    movw    (%rdi,%r11,2),  %r10w
    movw    (%rdi,%r9,2),   %r12w
    movw    %r12w,  (%rdi,%r11,2)
    movw    %r10w,  (%rdi,%r9,2)
    inc     %r9d
    jmp     .checkj

.done:
    popq     %rbx
    popq     %rbp
    ret 

    



   