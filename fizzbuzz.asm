;Fizz Buzz 

global _start

section .text


_start:
	add     eax, 1   ; Add one. Implicitly we start at 0  
	pushq   rax      ; Save the value 
   
        mov     ebx, 7   ; Load  the dvisor 
        div     ebx      ; divide 
    
	popq    rax      ; Restore the current index 
	pushq   rax      ; Hold onto the index 
        pushq   rdx      ; Hold on to remainder
	 
        mov     ebx, 9   ; Prepare to divide by 9
        div     ebx      ; divide 
	
        pushq   rdx      ; Hold on to Remainder 
    
        popq    rax      ; Remainder from 9 operation  
        popq    rbx      ; Remainder from 7 operation 

        cmp    rbx, 0   ; if i % 7 == 0 
	
        je      _true    ;Push a 1 for true to the stack 
        jne     _false   ;Push a 0 for false to the stack 

       
        popq    rax      ; Pop our index.  
	cmp     edx,0x64 ; if it's 100, set a flag. This will have to move lower
	jne     _start
	                 ; Convert dword to Ascii would be called here to print the index.  
	mov	eax, 1   ; sys_exit
	int	0x80     ; call kernal 
	
_true:
	;if rbx is indeed 0, then we only need to make sure rax is too. 

	cmp  rax, 0      ; is rax 0? 
	je   _fizzBuzz   ; It is. FIZZBUZZ 
	jne  _fizz 	 ; if it's not, then we are in a FIZZ only situation. 
	ret

_false: 
	cmp  rax, 0     ; We already know that rbx aint zero. The only thing left 
	je   _buzz
	ret 


_fizz: 
	pushq rdx 
	pushq rcx 
	pushq rbx
	pushq rax 
	mov edx, fizzlen
	mov ecx, fizzMsg 
	mov ebx, 1
	mov eax, 4
	int 0x80  
	popq rax
	popq rbx 
	popq rcx
	popq rdx 
	ret
_buzz:
	pushq rdx
	pushq rcx 
	pushq rbx
	pushq rax 
	mov edx, buzzlen 
	mov ecx, buzzMsg
	mov ebx, 1
	mov eax, 4
	int 0x80 
	popq rax
	popq rbx
	popq rcx
	popq rdx 
	ret

_fizzBuzz:
	pushq rdx 
	pushq rcx
	pushq rax 
	pushq rbx
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80 
	popq rax 
	popq rbx
	popq rcx
	popq rdx 
	ret

section .data 
	msg db 'FizzBuzz', 0xa 
	len  equ $ - msg
	fizzMsg db 'Fizz', 0xa
	fizzlen equ $ - msg
	buzzMsg db 'Buzz', 0xa 
	buzzlen equ $ - msg 
