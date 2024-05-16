
section .data
dat db '3'
msg db "Hello world this is a looped message",0xa
msgLen equ $-msg
datLen equ $-dat

section .text 
global _start:
_start:
	mov eax, dat
	sub eax,'0' ; converting the value of dat in to decimal

	; starting printing the value of dat
	mov ecx,eax
	mov eax,4
	mov ebx,1
	;mov ecx, dat
	mov edx, datLen
	int 0x80

	mov ecx,3
	loop loop_print

	mov eax, 1
	mov ebx,0
	int 0x80


loop_print:
	mov eax, 4
	mov ebx,1
	push ecx
	mov ecx,msg
	mov edx,msgLen
	int 0x80
	pop ecx
	loop loop_print
	
	mov eax,1
	int 80h	

