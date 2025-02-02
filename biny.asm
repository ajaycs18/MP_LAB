.model small

display macro msg
lea dx, msg
mov ah, 09h
int 21h
endm

.data
list db 01h, 02h, 03h, 04h, 05h
len equ ($-list)
key db 02h
msg1 db 0dh, 0ah, "element found...$"
msg2 db 0dh, 0ah, "element not found$"

.code
start:  mov ax, @data
	mov ds, ax
	mov ch, len-1
	mov cl, 00h

again:  mov si, offset list
        xor ax, ax
	cmp cl, ch
        je next
	jnc failed

next:   mov al, cl
	add al, ch
	shr al, 01h
	mov bl, al
	xor ah, ah
	mov bp, ax
	mov al, ds:[bp][si]
	cmp al, key
	je success
	jc inclow
	mov ch, bl
	dec ch
	jmp again

inclow: mov cl, bl
	inc cl
	jmp again

success:display msg1
	jmp final

failed: display msg2

final:  mov ah, 4ch

int 21h
end start
