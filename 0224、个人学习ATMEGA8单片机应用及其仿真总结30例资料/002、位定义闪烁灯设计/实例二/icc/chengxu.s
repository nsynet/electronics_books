	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\002、位定义闪烁灯设计\实例二\icc\chengxu.c
	.dbfunc e delay _delay fV
;              i -> R20,R21
;              j -> R22,R23
;             MS -> R16,R17
	.even
_delay::
	xcall push_gset2
	.dbline -1
	.dbline 13
; #include <iom8v.h>
; #include <macros.h>
; /**********************************************************************
; 				  函数数据类型说明							   	
; **********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; 
; /**********************************************************************
; 				   延时函数						   	
; **********************************************************************/
; void delay(uint MS)		  
; {
	.dbline 15
;  uint i,j;
;  for( i=0;i<MS;i++)
	clr R20
	clr R21
	xjmp L5
L2:
	.dbline 16
	clr R22
	clr R23
	xjmp L9
L6:
	.dbline 16
L7:
	.dbline 16
	subi R22,255  ; offset = 1
	sbci R23,255
L9:
	.dbline 16
	cpi R22,117
	ldi R30,4
	cpc R23,R30
	brlo L6
L3:
	.dbline 15
	subi R20,255  ; offset = 1
	sbci R21,255
L5:
	.dbline 15
	cp R20,R16
	cpc R21,R17
	brlo L2
	.dbline -2
L1:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r j 22 i
	.dbsym r MS 16 i
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 22
;  for(j=0;j<1141;j++);	//1141是在8MHz晶振下，通过软件仿真反复实验得到的数值
; }
; /**********************************************************************
; 				主函数						   	
; **********************************************************************/
; void main()
; {
	.dbline 23
;      DDRB=0XFF;
	ldi R24,255
	out 0x17,R24
	xjmp L12
L11:
	.dbline 26
	.dbline 27
	sbi 0x18,3
	.dbline 28
	ldi R16,1000
	ldi R17,3
	xcall _delay
	.dbline 29
	cbi 0x18,3
	.dbline 30
	ldi R16,1000
	ldi R17,3
	xcall _delay
	.dbline 31
L12:
	.dbline 25
	xjmp L11
X0:
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
