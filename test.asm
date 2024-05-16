section .data
displayText db "Printing the value of name: "
displayTextLen equ $-displayText

section .bss
name resb 150

section .text
	global _start

_start:
	mov eax,3
	mov ebx, 2
	mov ecx, name
	mov edx, 150
	
	int 0x80

	call print_name

	; exit the program
	mov eax, 1
	mov ebx, 0
	
	int 0x80


print_name:
	; printing the text prompt 
	mov eax, 4
	mov ebx, 1
	mov ecx, displayText
	mov edx, displayTextLen
	int 0x80 ; kernel interrupt


	mov eax, 4
	mov ebx, 1
	mov ecx, name
	mov edx, 150
	
	int 0x80
