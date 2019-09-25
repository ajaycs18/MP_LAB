.model small

display macro msg
	mov ah, 09h
	mov dx, offset msg
	int 21h
	endm
		
.data
msg1 db 0dh, 0ah, "enter string 1: $"
msg2 db 0dh, 0ah, "enter string 2: $"
msg3 db 0dh, 0ah, "not equal$"
msg4 db 0dh, 0ah, "equal$"
str1 db 10h dup(0)
str2 db 10h dup(0)
len1 db 0
len2 db 0

.code 
mov ax, @data
mov ds, ax
display msg1
mov si, 00h
back1:
        mov ah, 01h
	int 21h
	cmp al, 0dh
	jz next1
	mov str1[si], al
	inc si
	inc len1
	jmp back1
next1:
	display msg2
	mov si, 00h
back2: 
	mov ah, 01h
	int 21h
	cmp al, 0dh
	jz next2
	mov str2[si], al
	inc si
	inc len2
	jmp back2

next2:	
	mov al, len1
	cmp al, len2
	jnz noteq
	cld
	mov si, 00h
	mov di, 00h
	mov cl, len1
again: 
	mov al, str1[si]
	cmp str2[si], al
	jne noteq
	inc si
	loop again
	display msg4
	mov ah, 4ch
	int 21h

noteq: 
	display msg3
       	mov ah, 4ch
       	int 21h
end
