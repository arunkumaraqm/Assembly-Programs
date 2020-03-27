; "Binary Search on an array of 16 bit no.s"
.model small

.data
arr dw 1000h, 2000h, 3000h, 4000h, 5000h
len db $ - arr
ele dw 1000h
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

; For a 16 bit array, the current value of bx isn't actually the mid.
; si & di are indices for our reference, not the offset addresses.
; bx has to be an offset address because we'll be accessing arr[bx]
; Currently, bx is the mid index. We multiply it by two to make it the 
; offset address of that middle element. 

shl bx, 1
mov ax, arr[bx]
shr bx, 1; We have to make bx the mid index again for upcoming calculations.

cmp ax, ele
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
