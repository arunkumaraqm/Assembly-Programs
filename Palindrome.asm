; "Reverse a string and check whether it is a palindrome."

.model small

.data
str db "papa"
len dw $ - str
; rstr db 10 dup(65h)
; When I print rstr, eeeeeeeeee followed by a lot of junk values are displayed
; All we're doing is allocating 10 bytes to rstr and initializing each with 65h or 'e'.
; Those junk values are also printed because there is no "$" at the end.
; Just commented out that line because 65h was inconvenient. 

rstr db 10 dup(0h)

msg_reversedstring db "Reversed String: $"
msg_yespalindrome db ". So, it is a palindrome.$"
msg_nopalindrome db ". So, it is not a palindrome.$"

.code
mov ax, @data
mov ds, ax
mov es, ax

lea si, str
lea di, rstr

mov cx, len
add di, cx 
dec di

; Copying the reverse of str to rstr.
startofloop:
	cld
	lodsb; acc := [ds:si] and then si++
	std
	stosb; [es:di] := acc and then di--
	loop startofloop; if cx == 0, break

; Printing the reversed string.
lea dx, msg_reversedstring
mov ah, 09h
int 21h
lea dx, rstr; TODO: Add null character.
mov ah, 09h
int 21h

; Checking whether str == rstr
mov cx, len
lea si, str
lea di, rstr
cld
rep cmpsb
je yespalindrome

; Printing not a palindrome
lea dx, msg_nopalindrome
mov ah, 09h
int 21h
jmp terminate

; Printing yes a palindrome
yespalindrome:
	lea dx, msg_yespalindrome
	mov ah, 09h
	int 21h 
	jmp terminate

terminate:
	mov ah, 4ch
	int 21h

end