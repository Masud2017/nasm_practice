section .data
data db "Hello world this is a test string",0xa
dataLen equ $-data

section .bss
dat resd 150
a resd 150
b resd 150

section .text 

global _start

_start:
	push data
	push dataLen
	call print_data

	call exit_program

;	push 10
;	push 45
;	call add_two_number

;	push dat
;	push 150

;	call print_data


print_data:
	push ebp
	mov ebp,esp
	mov eax, 4
	mov ebx,1
	mov ecx, [ebp + 8]
	mov edx, [ebp + 12]
	pop ebp

	int 0x80
	ret

exit_program:
	mov eax,1
	mov ebx,0
	int 0x80
	ret


add_two_number:
	mov ebp,esp
	mov eax,[ebp+8]
	mov ebx, [ebp + 12]
	pop ebp
	add eax, ebx

	mov [dat], eax

	ret
