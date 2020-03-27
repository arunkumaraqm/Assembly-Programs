; "Largest no. in an arr of 8 bit no.s"
; Result will be stored in BL

.model small
.data

; Test cases below. Uncomment out which one you want to use.

;arr db 56h, 43h, 78h, 10h, 42h, 90h
;arr db 56h, 43h, 78h, 10h, 42h
;arr db 0h, 0h, 0h, 0h
;arr db 55h
;arr db 80h, 8ah
len dw $ - arr

.code
mov ax, @data
mov ds, ax

; big = arr[0]
; for i = 1 to i = len - 1
; if arr[i] > big
; 	big = arr[i]

mov al, arr[0]
mov si, 1h
mov cx, len

cmp cx, 1h
je storeresult

dec cx; because we start loop from index si = 1


startofloop:
	cmp al, arr[si]
	jb updatebig; if al < arr[si], then al = arr[si]
	back:
	inc si
	loop startofloop
	jmp storeresult

updatebig:
	mov al, arr[si]
	jmp back

storeresult:
	mov bh, 0h
	mov bl, al

terminate:
	mov ah, 4ch
	int 21h

end