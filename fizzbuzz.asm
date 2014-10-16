;Fizz Buzz 

global _start

section .text


_start: 
	mov edx,len
	mov ecx,msg
	mov ebx, 1
	mov eax, 4
	int 0x80 
	;Modulo 	

	;Add line feeds? 
	; Convert dword to Ascii 
	mov	eax, 1 ; sys_exit
	int	0x80   ; call kernal 

section .data 
	msg db 'FizzBuzz', 0xa 
	len  equ $ - msg 
