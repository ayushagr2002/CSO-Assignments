# after execution %r11 will contain index of the element (0-based indexing)
# it will contain -1 if element is not found
# %r12 will contain number of iterations required to find key(X)
.data
    a:      # store the array here
    .word   68,63,-89,-35,-6,29,-45,70,-32,43,-16,18,-96,-41,97,-57,89,-94,30,-66,77,-56,-83,-12,32,-75,-21,82,99,8,36,20
    X:      # store the key here
    .word   63

.text
.global main

main:
    pushq   %rbp                # save registers %rbp 
    pushq   %rbx                # and %rbx
    leaq    a(%rip),    %rdi    # load the base address of array
    leaq    X(%rip),  %r14      # load address of key
    movw    (%r14),%r14w        # load value of key
    movswq  %r14w,%r14          # sign extend value of key
    movl    $0,     %r8d        # int i = 0, i is in r8
    movl    $-1,    %r11d       # r11 contains index of key
    movslq  %r11d,  %r11        # sign extend -1
    movl    $0,     %r12d       # r12 contains number of iterations
    jmp     .checki             # goto checki

.checki:
    cmpl    $32,    %r8d        # check if i < 32
    jl      .actual             # if yes, goto actual
    jge     .done               # if no, goto done

.actual:
    inc     %r12d               # increment number of iterations
    movw    (%rdi,%r8,2), %r9w  # load a[i] in r9    
    cmpw    %r14w,    %r9w      # compare key and a[i]
    je      .L1                 # if equal, goto L1
    inc     %r8d                # increase i
    jmp     .checki             # goto checki

.L1:
    movl    %r8d,   %r11d        # if element is found load its index into r11

.done:
    popq    %rbx                # pop the saved registers rbx
    popq    %rbp                # and rbp
    ret                         # return
