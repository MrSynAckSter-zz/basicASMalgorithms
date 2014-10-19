;Fizz Buzz 

global _start

section .text


_start:
	add edx, 1 ; Add one 
	cmp edx,0x64 ; if it's 100, set a flag. This will have to move lower
    pushq   rdx    ; Save the value 
   
    mov eax, edx   
    mov ebx, 7 
    div ebx
    
    pushq rax ; Hold on to remainder
    
    mov eax, edx
    mov ebx, 9 
    div ebx, 
    cmp eax, 0

    pushq rax ; Hold on to Remainder 
    

    popq rax ; Remainder from 9 operation  
    popq rbx ; Remainder from 7 operation 

    comp rax rbx; 
                
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
	mov	eax, 1 ; sys_exit
	int	0x80   ; call kernal 

section .data 
	msg db 'FizzBuzz', 0xa 
	len  equ $ - msg 
