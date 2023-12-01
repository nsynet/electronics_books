	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\NEW��~1\MEGA12~1\AVR��Ƭ�����׳���\002��λ������˸�����\ʵ����\icc\chengxu.c
	.dbfunc e delay _delay fV
;              i -> R20,R21
;              j -> R22,R23
;             MS -> R16,R17
	.even
_delay::
	xcall push_gset2
	.dbline -1
	.dbline 13
; #include <iom128.h>
; #include <macros.h>
; /**********************************************************************
; 				  ������������˵��							   	
; **********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; 
; /**********************************************************************
; 				   ��ʱ����						   	
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
;  for(j=0;j<1141;j++);	//1141����8MHz�����£�ͨ��������淴��ʵ��õ�����ֵ
; }
; /**********************************************************************
; 				������						   	
; **********************************************************************/
; void main()
; {
	.dbline 23
;      DDRD=0XFF;//PD����Ϊ�����
	ldi R24,255
	out 0x11,R24
	xjmp L12
L11:
	.dbline 25
	.dbline 26
	sbi 0x12,3
	.dbline 27
	ldi R16,1000
	ldi R17,3
	xcall _delay
	.dbline 28
	cbi 0x12,3
	.dbline 29
	ldi R16,1000
	ldi R17,3
	xcall _delay
	.dbline 30
L12:
	.dbline 24
	xjmp L11
X0:
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
