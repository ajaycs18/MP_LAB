.model small

.data
n1 db 36    
n2 db 60
      
.code
mov ax, @data
mov ds, ax
mov ah, 00h ; or xor ax, ax
mov al, n1
mov bl, n2
call gcd ; after this call, unpacked bcd gcd is in ax
aam
call display
mov ah, 4ch
int 21h

gcd proc near
    div bl ; after execution = ah => remainder, al => quotient, bl => n2 (initially)
    mov al, bl
    mov bl, ah ; after execution =  bl => remainder, al => n2 (initially) 
    cmp ah, 00h ; remainder = 0
    je return
    xor ah, ah
    call gcd
    
    return:
        ret
gcd endp 

display proc near
    xor dx, dx
    mov dx, ax
    mov ah, 02h
    add dx, 3030h
    xchg dl, dh
    int 21h ; display higher byte first
    xchg dl, dh
    int 21h ; display lower byte
    ret
display endp