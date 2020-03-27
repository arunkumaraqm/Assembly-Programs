; "Move a 100 byte block of data from one location to another"

.model small
.data

; Test case
;randomvalues db 67h, 78h, 89h, 90h, 01h
;loc1 dw randomvalues[1]; (address of 67h) + 1
;loc2 dw randomvalues[10]; (address of 67h) + 10
;noofbytes db 5; moving a 5 byte block

; Fill in loc1 and loc2 with whatever you want
; as long as loc1 + 100 < loc2 or loc2 <= loc1
; (the program doesn't handle the other values of loc1 and loc2)
; Remember to append h or there will be confusion while checking the result.
loc1 dw 0000h;
loc2 dw 0130h;
noofbytes db 100; 100 bytes as per requirement

; Unfortunately, with such large values, you won't be able to use 
; afdebug and find out what exactly is happening so use the first test case

.code
mov ax, @data
mov ds, ax
mov es, ax
mov si, loc1
mov di, loc2

cld
mov ch, 0h
mov cl, noofbytes
rep movsb

mov ah, 4ch
int 21h
end