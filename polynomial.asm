.model small                

display macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

.data
msg db 0dh, 0ah, "enter input: $"
res db 0dh, 0ah, "result: $"
a db 9
b db 5
c db 2

.code
mov ax, @data
mov ds, ax
display msg
;9x^3 + 5x^2 - 2
mov ah, 01h
int 21h
sub al, 30h
mov bl, al
mov cl, 03h 
mov al, 01h
ag:
    mul bl
    loop ag
mul a
mov dl, al
    
mov al, 01h    
mov cl, 02h    
ag1: 
    mul bl
    loop ag1
mul b
add dl, al
sub dl, c
mov bl, dl
 
display res
mov al, bl
aam
add ax, 3030h
mov dx, ax
xchg dl, dh
mov ah, 02h
int 21h
xchg dl, dh
int 21h

mov ah, 4ch
int 21h