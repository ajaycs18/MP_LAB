.model small
.data
n db 5
a dw 5, 4, 1, 6, 2

.code
   mov ax,@data
   mov ds,ax
   mov cl,n
   dec cl

outloop:mov ch,cl
        mov si, 0

inloop: mov ax, a[si]
        add si, 2h
        cmp ax, a[si]
        jb noxg
        xchg ax, a[si]
        mov a[si-2], ax

noxg: dec ch
      jnz inloop
      dec cl
      jnz outloop
      mov ax, 4ch
      int 21h
end
