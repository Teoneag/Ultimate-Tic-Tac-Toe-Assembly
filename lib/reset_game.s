# Initializes the
    # matrix81 and the matrix9 with '-'
    # currentPlayer with 'X' 
    # index9 with 4
    # move MessageDefaultBig in stringPrintTable
reset_game:                      # By Teo
    # prologue
    push %rbp
    mov %rsp, %rbp

    # push registers
    push %rbx
    push %rbx
    push %r12
    push %r13
    push %r14
    push %r15

    # initialize matrix81 wiht '-'
    mov $0, %r12        # i = 0
    start_loop_init_game:
        movb $'-', matrix81(%r12)   # matrix81[i] = '-'
        inc %r12                    # i++
        cmp $81, %r12               # i < 81
        jne start_loop_init_game    # jump if not equal

    # initialize matrix9 with '-'
    mov $0, %r12        # i = 0
    start_loop_2_init_game:
        movb $'-' , matrix9(%r12)    # matrix9[i] = '-'
        inc %r12                    # i++
        cmp $9, %r12                # i < 9
        jne start_loop_2_init_game  # jump if not equal

    # initialize currentPlayer with 'O' (The init switches it)
    movb $'O', currentPlayer

    # initialize currentInput (The init makes the index9 4)
    movl $9, currentInput

    # initialize index9 with 9
    movl $9, index9

    # initialize stringPrintTable with MessageDefaultBig
    mov $MessageDefaultBig, %r12
    mov $0, %r13        # i = 0
    start_loop_3_init_game:
        mov (%r12), %r14                 # r14 = r12
        movb %r14b, stringPrintTable(%r13)   # stringPrintTable[i] = MessageDefaultBig[i]
        inc %r12                        # i++
        inc %r13                        # i++
        cmp $765, %r13                   # i < 81
        jne start_loop_3_init_game      # jump if not equal


    # pop registers
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %rbx
    pop %rbx

    #epilogue
    mov %rbp, %rsp
    pop %rbp
    ret
    