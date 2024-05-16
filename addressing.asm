section .data
MY_TABLE TIMES 10 DW 0 ; declaring and initializing the double word array  with 0 and the size of the array is : 10
section .bss

section .text

global _start

_start:
	; providing info to the array
	mov ebx, [MY_TABLE]
	mov [ebx], 100
	add ebx, 2 ; changing the pointer to the second index of the array
	mov [ebx], 120
	add ebx, 3 ; changing the pointer to the third index of the array
	mov [ebx], 220
	add ebx, 4 ; changing the pointer to the fourth index of the array
	mov [ebx], 10

	; printing the value of array
	mov eax, 4
	mov ebx, 1
	mov ecx, MY_TABLE
	mov edx, 10

	int 0x80

	; exiting from the program
	mov eax,1
	mov ebx,0
	int 0x80
	
