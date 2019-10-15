.model small

.data 
msg1 db 0dh, 0ah, "enter alphanumeric$"
res db 02 dup(0)

.code
	mov ax, @data
	mov ds, ax
    mov ah, 01h
    int 21h
    aam 
    mov cx, ax
      
    
    mov ah, 00h ; display mode
    mov al, 03h
    int 10h 
    mov ah, 02h
    mov bh, 00h
    mov dh, 0ch
    mov dl, 28h
    int 10h
     ; for decimal ascii value
    add cx, 3030h
    mov dx, cx
    xchg dh, dl
    int 21h
    xchg dh, dl
    int 21h 
       ; or for hex ascii value, do mov bl, al instead of mov cx, ax and aam
    mov cl, bl
    and cl, 0f0h
    shr cl, 4
    add cl, 30h
    mov dl, cl 
    mov ah, 02h
    int 21h   
    mov dl, bl
    and dl, 0fh
    add dl, 30h
    int 21h
    
