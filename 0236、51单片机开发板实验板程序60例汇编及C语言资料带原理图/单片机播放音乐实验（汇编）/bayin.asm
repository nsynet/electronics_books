org 0000h
ajmp main
org 000bh
 ajmp timer0
org 0030h

timer0:
clr ea
djnz 33h,exit
mov 33h,53h
djnz 32h,exit
mov 32h,52h
djnz 31h,exit1
mov 31h,51h
djnz 30h,exit1
setb f0
ajmp exit
exit1: cpl p2.1
exit: setb ea
reti
main:
mov tmod,#02h
mov ie,#82h
mov th0,#254
mov tl0,#254
mov dptr,#tab
main1:
mov 40h,#00h
loop:
clr ea
mov a,40h
movc a,@a+dptr
mov 30h,a
mov 50h,a
inc 40h
mov a,40h
movc a,@a+dptr
mov 31h,a
mov 51h,a
inc 40h
mov a,40h
movc a,@a+dptr
mov 32h,a
mov 52h,a
inc 40h
mov a,40h
movc a,@a+dptr
mov 33h,a
mov 53h,a
setb ea
setb tr0
jnb f0,$
clr f0
inc 40h
mov a,40h
cjne a,#40,loop
ajmp main1
tab: ; 30h,31h,32h,33h
db 2,25,24,16 ;low frequency
db 4,25,24,8
db 8,25,24,4
db 12,25,12,4
db 20,25,6,4
db 30,25,5,4
db 40,25,4,4
db 50,25,3,4
db 60,25,2,4
db 70,50,1,4

end 
