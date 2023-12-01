	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\����\icc�ο�����-��ʱ��ʽ\chengxu.c
	.dbfunc e delay _delay fV
;              i -> R20,R21
;              j -> R22,R23
;             MS -> R16,R17
	.even
_delay::
	xcall push_gset2
	.dbline -1
	.dbline 16
; ////////////////////////��ϿƼ�////////////////////
; //////////////////http://www.ourhc.cn///////////////
; ///////////////////����������Գ���/////////////////
; #include <iom16v.h>
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
	.dbline 18
;  uint i,j;
;  for( i=0;i<MS;i++)
	clr R20
	clr R21
	xjmp L5
L2:
	.dbline 19
	clr R22
	clr R23
	xjmp L9
L6:
	.dbline 19
L7:
	.dbline 19
	subi R22,255  ; offset = 1
	sbci R23,255
L9:
	.dbline 19
	cpi R22,80
	ldi R30,0
	cpc R23,R30
	brlo L6
L3:
	.dbline 18
	subi R20,255  ; offset = 1
	sbci R21,255
L5:
	.dbline 18
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
;              i -> R20,R21
	.even
_main::
	.dbline -1
	.dbline 25
;  for(j=0;j<80;j++);	//1141����8MHz�����£�ͨ��������淴��ʵ��õ�����ֵ
; }
; /**********************************************************************
; 				������						   	
; **********************************************************************/
; void main()
; {	 uint i;
	.dbline 26
; 	 i=10;//�ı���� i �Ĵ�С���Ըı��ٶȣ�iԽ���ٶ�Խ��
	ldi R20,10
	ldi R21,0
	.dbline 27
;      DDRB=0XFF;
	ldi R24,255
	out 0x17,R24
	.dbline 29
; 	 //PORTC=0XFF;
; 	 PORTB|=BIT(0);//00000001  ʹ�ܿ��ƿ�
	sbi 0x18,0
	.dbline 30
; 	 PORTB|=BIT(1);//00000010  ���Ĺ�����ʽ
	sbi 0x18,1
	.dbline 31
; 	 PORTB|=BIT(2);//00000100  ��������ת
	sbi 0x18,2
	xjmp L12
L11:
	.dbline 33
	.dbline 34
	sbi 0x18,3
	.dbline 35
	movw R16,R20
	xcall _delay
	.dbline 36
	cbi 0x18,3
	.dbline 37
	movw R16,R20
	xcall _delay
	.dbline 38
L12:
	.dbline 32
	xjmp L11
X0:
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbend
