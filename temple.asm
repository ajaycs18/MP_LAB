.model small

display macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm    

.data
str db "TEMPLE$"
len equ $-str
msg1 db 0dh, 0ah, "Found$"
msg2 db 0dh, 0ah, "Not found$"

.code
mov ax, @data
mov ds, ax 
mov es, ax
mov al, 'E'
mov di, offset str
mov cx, len
cld 

find: 
    scasb
    jne ag
    mov es:[di-1], 'A' ; di gets incremented after scasb to next character
ag: loop find

display str
mov ah, 4ch
int 21h
        
end