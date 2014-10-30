;Merge Sort 
global _start 

section .text 

_start:

; Loosely based on http://rosettacode.org/wiki/Sorting_algorithms/Merge_sort#C
    startArray db 0x32, 0x44, 0x55, 0x78, 0x81, 0x92, 0x88, 0x11, 0x01, 0x02
    ; Maybe this goes in the data section? 
    startlen equ $-startArray ; or something look this up. 
    ;as a policy we just write down the length of each array as we go.     
     
_getN:  ; size of array / sizae of array [0] 
	

_quick_sort
; Params A / N 
cmp n, 2
jl escapeAndQuit 
; int l = a
; int r = a + n -1
; int p = a [ n / 2 ] 

_incrementL: 

_decrementR:

_else: 


;set up args for next quicksort 

;set up args for next quicksort 

; Double word to ascii  


_print_list: 


 

    
