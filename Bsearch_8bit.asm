; "Binary Search on an array of 8 bit no.s"
.model small

.data
arr db 10h, 20h, 30h, 40h, 50h
len db $ - arr
ele db 10h
foundmsg db "Found$"
notfoundmsg db "Not Found$"

.code
mov ax, @data
mov ds, ax

; while beg <= end
; 	mid = beg + end
; 	mid = mid / 2
; 	cur = arr[mid]
; 	if cur < ele
; 		beg = mid + 1
; 	else if cur > ele
;		end = mid - 1
; 	else
; 		print found
;		return
;  print not found
;  return

mov si, 0h
mov cl, len
mov di, cl 
sub di, 1h

startofloop:
cmp di, 0ffffh; di might have been at 0 and then decremented
je notfound
cmp si, di
ja notfound


mov bx, si
add bx, di
shr bx, 1
mov al, arr[bx]

cmp al, ele
je found
ja modifyend

;modifybeg
mov si, bx
add si, 1h
jmp startofloop

modifyend:
mov di, bx
sub di, 1h
jmp startofloop

found:
lea dx, foundmsg
mov ah, 09h
int 21h
jmp terminate

notfound:
lea dx, notfoundmsg
mov ah, 09h
int 21h
jmp terminate

terminate:
mov ah, 4ch
int 21h
end
