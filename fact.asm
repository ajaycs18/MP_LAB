.model small

.data
n db 5

.code
mov ax, @data
mov ds, ax 
mov dl, n
mov al, 01h

call fact
    
; result is in ax (al)

mov ah, 4ch
int 21h

fact proc near
    cmp dl, 1
    je return
    mul dl
    dec dl
    call fact
    return:
        ret
fact endp