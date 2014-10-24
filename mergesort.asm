;Merge Sort
 
 ;Loosely based on http://rosettacode.org/wiki/Sorting_algorithms/Merge_sort#C
global _start 

section .text 

_start:
    
; Print Values before hand 

_mergesort:
    pushq rcx
    pushq rbx 
    pushq rax

_mergesort_r:
     
   ;Return value goes in EAX  
   
     
_merge: 
;push and pop etc...
;Requires a list, left start, left end , right start, right end




_print_list: 


 

section .data 
    startArray db 0x32, 0x44, 0x55, 0x78, 0x81, 0x92, 0x88, 0x11, 0x01, 0x02
    ; Maybe this goes in the data section? 
    startlen equ $-startArray ; or something look this up. 
    ;as a policy we just write down the length of each array as we go.     
    
