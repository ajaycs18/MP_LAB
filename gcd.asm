.model small

display macro
    aam
    xor dx, dx  
    mov dx, ax
    mov ah, 02h
    add dx, 3030h
    xchg dl, dh
    int 21h ; display higher byte first
    xchg dl, dh
    int 21h ; display lower byte
    
 endm

.data
n1 db 36d
n2 db 60d
      
.code
mov ax, @data
mov ds, ax
mov al, n1
mov bl, n2

again: 
    mov ah, 00h
    div bl ; after execution = ah => remainder, al => quotient, bl => n2 (initially)
    mov al, bl
    mov bl, ah ; after execution =  bl => remainder, al => n2 (initially) 
    cmp ah, 00h ; remainder = 0
    jne again
 
display
mov ah, 4ch
int 21h
 

