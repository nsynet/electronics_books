	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\����\�����ܽ��M8����\016��ģ��Ƚ��������Ӧ��\icc\chengxu.c
	.dbfunc e main _main fV
;              i -> <dead>
	.even
_main::
	.dbline -1
	.dbline 11
; #include <iom16v.h>
; /********************************************************************
;                 �������Ͷ���
; *********************************************************************/
; #define uchar unsigned char
; #define uint  unsigned int
; /**********************************************************************
; 				          ������		
; **********************************************************************/
; void main(void)
; {uchar i;
	.dbline 12
;  DDRB=0xFF;                    //����PB7�������
	ldi R24,255
	out 0x17,R24
	.dbline 13
;  PORTB=0xFF;
	out 0x18,R24
	.dbline 14
;  DDRD=0x00;                    //����PB7�������
	clr R2
	out 0x11,R2
	.dbline 15
;  PORTD=0x00;
	out 0x12,R2
	.dbline 16
;  ACSR=0x00;                    //ģ��Ƚ���ʹ��
	out 0x8,R2
	xjmp L3
L2:
	.dbline 18
;  while(1)
;   {if((ACSR&0x20)==0x20)
	.dbline 18
	in R24,0x8
	andi R24,32
	cpi R24,32
	brne L5
	.dbline 19
;        PORTB=PORTB|0xf0;
	in R24,0x18
	ori R24,240
	out 0x18,R24
	xjmp L6
L5:
	.dbline 20
	in R24,0x18
	andi R24,15
	out 0x18,R24
L6:
	.dbline 20
L3:
	.dbline 17
	xjmp L2
X0:
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbsym l i 1 c
	.dbend
