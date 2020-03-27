; "Find factorial of an 8 bit no"
; Output will be in bx.

.model small

.data 
number db 8h; works from 0h to 8h

.code
mov ax, @data
mov ds, ax

mov ax, 0001h
mov cx, number
cmp cx, 0h
jz afterloop

startofloop:
	mul cx
	loop startofloop
jmp afterloop

afterloop:
	mov bx, ax
	jmp terminate

terminate:
	mov ah, 4ch
	int 21h

end