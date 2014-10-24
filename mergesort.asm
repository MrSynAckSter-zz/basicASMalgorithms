;Merge Sort
 
 ;Loosely based on http://rosettacode.org/wiki/Sorting_algorithms/Merge_sort#C
global _start 

section .text 

_start:
    
; Print Values before hand 

_mergesort:
    pushq startArray ; Pointer to the list 
    pushq startlen ; Length of the list. Should be predetermined
    pushq rax ; "Left" intialized to 0 the first go round 
    
    ; Return control or exit or something 
_mergesort_r:
    ; Pop or something
    popq rax ; left
    popq rbx ; Right 
    popq rcx ; Pointer to list
    ; Replace the pops with stack manipulation 
    
    mov rdx, rax ; Move left into a spot where we can keep the result
    sub rdx, rbx
    cmp rdx, 0x01 ; if right - left  is less than or equal 1
    
    jle returnProc ; return if that's the case 
     
   ;Return value goes in EAX 
    
   ;set up stack for recurssion 
   
   pushq THECORRECTCURRENTLOCATIONOFTHELIST ; The current list 
    
   mov rdx, rax ; move left to rdx for computation 
   add rdx, rax ; left + right 
   ; rivide rdx by two to get left end  
   pushq rax ; left_start

    jmp merge ; Most likely merge should be inlined 

    ;return control 
   
_returnProc:
;perhaps do some stack cleaning here. 
ret      
     
_merge: 
;push and pop etc...
;Requires a list, left start, left end , right start, right end




_print_list: 

section .data 
    startArray db 0x32, 0x44, 0x55, 0x78, 0x81, 0x92, 0x88, 0x11, 0x01, 0x02
    ; Maybe this goes in the data section? 
    startlen equ $-startArray ; or something look this up. 
    ;as a policy we just write down the length of each array as we go.     
    
