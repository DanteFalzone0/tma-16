; This file contains subroutines for using a stack in main
; memory, the way stacks work on normal machines, since the
; hardware stack is difficult to work with.


; For this subroutine, the hardware stack must have the following
; contents on top:
;
; |return_address|stack_pointer|stack_limit|value_to_push|
;
; where return_address is the address to jump back to when this
; subroutine exits, stack_pointer is the currently selected
; stack address, stack_limit is the address that will trigger
; a stack overflow if accessed, and value_to_push is the value
; you want to push onto the stack.
;
; Keep in mind that this will only push the lowest eight bits
; of the value you want to push since this architecture's word
; size is 8 bits but the registers are 16 bits wide.
;
; This subroutine will leave the updated stack pointer in rb.
@memstack_push:
    pop     ra              ; value_to_push
    pop     rc              ; stack_limit
    pop     rb              ; stack_pointer
    jgr     rb  rc  @_memstack_segfault
    writr   ra  rb          ; write the value to the stack ptr
    inc     rb              ; update the stack pointer
    pop     ip              ; return


; For this subroutine, the hardware stack must have the following
; contents on top:
;
; |return_address|stack_pointer
;
; where return_address is the value to jump back to and
; stack_pointer is a pointer to the top of the stack.
;
; This subroutine will leave the updated stack pointer in rb
; and the retrieved value in ra.
;
; BE WARNED - if the address passed as the stack pointer is
; incorrect, there is NO GUARANTEE of memory safety.
@memstack_pop:
    pop     rb              ; stack pointer
    dec     rb              ; select the highest occupied byte
    readr   ra  rb          ; read *stack_pointer into ra
    pop     ip              ; return


; not using anything from print.asm here because that would risk
; double inclusion of source files
@_memstack_segfault:
    movl    ra      'S'
    out     ra
    movl    ra      'E'
    out     ra
    movl    ra      'G'
    out     ra
    movl    ra      'F'
    out     ra
    movl    ra      'A'
    out     ra
    movl    ra      'U'
    out     ra
    movl    ra      'L'
    out     ra
    movl    ra      'T'
    out     ra
    movl    ra      '\n'
    out     ra
    halt
