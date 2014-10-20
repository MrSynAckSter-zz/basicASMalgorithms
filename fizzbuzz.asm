;Fizz Buzz 

global _start

section .text


_start:
	add     edx, 1   ; Add one. Implicitly we start at 0  
	cmp     edx,0x64 ; if it's 100, set a flag. This will have to move lower
	pushq   rdx      ; Save the value 
   
        mov     eax, edx ; Move the value to edx so it may be devided (devided clobbers eax)   
        mov     ebx, 7   ; Move the dvisor 
        div     ebx      ; divide 
    
        pushq   rax      ; Hold on to remainder
    
        mov     eax, edx ; Move that same value over into  
        mov     ebx, 9   ; Prepare to divide by 9
        div     ebx      ; divide 

        pushq   rax      ; Hold on to Remainder 
    
        popq    rax      ; Remainder from 9 operation  
        popq    rbx      ; Remainder from 7 operation 

        comp    rax, rbx ; this wont work 
                
        jnz  _fizz
        jk   _fizzbuzz
        jz   _buzz 

     
	mov edx,len
	mov ecx,msg
	mov ebx, 1
	mov eax, 4
	int 0x80 
        popq rdx 
	jnz _start
	                 ; Convert dword to Ascii 
	mov	eax, 1   ; sys_exit
	int	0x80     ; call kernal 

section .data 
	msg db 'FizzBuzz', 0xa 
	len  equ $ - msg 
