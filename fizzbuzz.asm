;FizzBuzz
global _start

section .text

_start:
	mov    rdx, 0   ; Zero out rdx. Else we get FPE
	add    rax, 1   ; Add one. Implicitly we start at 0  
	push   rax      ; Save the value 
   
        mov    rbx, 7   ; Load  the dvisor 
        div    rbx      ; divide 
    
	pop    rax      ; Restore the current index 
	push   rax      ; Hold onto the index 
        push   rdx      ; Hold on to remainder

	mov     rdx, 0  ; Zero out the rdx for clean divides 	 
        mov     rbx, 9   ; Prepare to divide by 9
        div     rbx      ; divide 
	
        push   rdx      ; Hold on to Remainder 
    
        pop    rax      ; Remainder from 9 operation  
        pop    rbx      ; Remainder from 7 operation 

        cmp     rbx, 0   ; if i % 7 == 0 
	
        je      _true    ;Push a 1 for true to the stack 
        jne     _false   ;Push a 0 for false to the stack 

_loopOrQuit: 
       
        pop     rax      ; Pop our index.  
	cmp     rax,0x64 ; if it's 100, set a flag. This will have to move lower
	jne     _start
	                 ; Convert dword to Ascii would be called here to print the index.  
	mov	rax, 1   ; sys_exit
	int	0x80     ; call kernal 
	
_true:
	;if rbx is indeed 0, then we only need to make sure rax is too. 

	cmp  rax, 0      ; is rax 0? 
	je   _fizzBuzz   ; It is. FIZZBUZZ 
	jne  _fizz 	 ; if it's not, then we are in a FIZZ only situation. 
	

_false: 
	cmp  rax, 0     ; We already know that rbx aint zero. The only thing left 
	je   _buzz
	jne  _loopOrQuit 


_fizz: 
	push rdx 
	push rcx 
	push rbx
	push rax 
	mov rdx, fizzlen
	mov rcx, fizzMsg 
	mov rbx, 1
	mov rax, 4
	int 0x80  
	pop rax
	pop rbx 
	pop rcx
	pop rdx 
	jmp _loopOrQuit 
_buzz:
	push rdx
	push rcx 
	push rbx
	push rax 
	mov rdx, buzzlen 
	mov rcx, buzzMsg
	mov rbx, 1
	mov rax, 4
	int 0x80 
	pop rax
	pop rbx
	pop rcx
	pop rdx 
	jmp  _loopOrQuit 

_fizzBuzz:
	push rdx 
	push rcx
	push rax 
	push rbx
	mov rdx, len
	mov rcx, msg
	mov rbx, 1
	mov rax, 4
	int 0x80 
	pop rax 
	pop rbx
	pop rcx
	pop rdx 
	jmp _loopOrQuit 

section .data 
	msg db 'FizzBuzz', 0xa 
	len  equ $ - msg
	fizzMsg db 'Fizz', 0xa
	fizzlen equ $ - fizzMsg
	buzzMsg db 'Buzz', 0xa 
	buzzlen equ $ - buzzMsg
