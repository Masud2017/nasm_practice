section .data
userMsg db "Please enter a number: "
userMsgLen equ $-userMsg
dispMsg db 0xa,"You have entered: "
lenDispMsg equ $-dispMsg

divider times 100 db "*"

section .bss
num resb 5

section .text
    global _start
    
_start:
    ; Print the first line of the message
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx,userMsgLen
    
    int 0x80
    
    ; reading the data
    mov eax,3
    mov ebx, 2
    mov ecx, num
    mov edx, 5
    
    int 0x80


    call print_divider
    
     
    
    ; output message
    mov eax,4
    mov ebx, 1
    mov ecx, dispMsg
    mov edx, lenDispMsg
    
    int 0x80
    
    ; printing the input data
    mov eax,4, 
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    
    int 0x80

    call print_divider

    
    ; exit the program
    mov eax,1
    mov ebx,0
    int 0x80
    
    
print_divider:
	mov eax,4
	mov ebx, 1
	mov ecx, divider
	mov edx, 100
	int 0x80

	ret 
