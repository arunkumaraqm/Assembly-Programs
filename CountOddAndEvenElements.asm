; "Counting even and odd numbers in an arr of 8 bit no.s"
; Result will be stored in BX (noof even) and CX (noof odd)

.model small
.data

; Test cases below. Uncomment out the one you want to use.

;arr db 7h
;arr db 6h
;arr db 8h, 5h
;arr db 7h, 3h
;arr db 6h, 2h, 8h, 2h, 0h
;arr db 7h, 2h, 5h, 6h, 6h, 8h, 0h, 5h, 2h, 4h

len dw $ - arr

.code
mov ax, @data
mov ds, ax

; for i = 0 to i = len - 1
; 	if arr[i] % 2 == 0
; 		cnteven++
; cntodd = len - cnteven

mov si, 0h; si stores current index
mov cx, len; cx is for loop control 
sub bx, bx; bx stores count of even

startofloop:
	mov al, arr[si]
	shr al, 1
	shl al, 1
	cmp al, arr[si]
	je eleiseven; for an even number, shl(shr(num)) = 2 * floor(num/2) = num
	back:
	inc si
	loop startofloop

mov cx, len
sub cx, bx; cx now stores count of odd
jmp terminate

eleiseven:
	inc bx
	jmp back

terminate:
	mov ah, 4ch
	int 21h
	end