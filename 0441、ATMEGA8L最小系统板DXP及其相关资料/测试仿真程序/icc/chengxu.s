	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\��Ʒ��������\��ϿƼ���Ʒ��������\ATMEGA8��Сϵͳ\�������\icc\chengxu.c
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 6
; #include <iom8v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; //////////////////////////////��ʼ��////////////////////////////////////
; void Init_IO(void)//��ʼ��I/O
; {
	.dbline 8
; //����B��Ϊ����
; DDRB=0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 9
; PORTB=0xFF;
	out 0x18,R24
	.dbline 11
; //����C��Ϊ���
; DDRC=0xFF;
	out 0x14,R24
	.dbline 12
; PORTC=0xFF;
	out 0x15,R24
	.dbline 14
; //����D��Ϊ���
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 15
; PORTD=0xff;
	out 0x12,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 19
; }
; /////////////////////////////������/////////////////////////////////////
; void main(void)
; {
	.dbline 20
; Init_IO();  //��ʼ��I/O
	rcall _Init_IO
	rjmp L4
X0:
	.dbline 22
; while(1)
; {
L6:
	.dbline 24
	.dbline 24
	ldi R24,85
	out 0x18,R24
	.dbline 24
L7:
	.dbline 23
; while((PIND&0X04)==0)//�����Ӽ�����־
	sbis 0x10,2
	rjmp L6
	rjmp L10
L9:
	.dbline 26
	.dbline 26
	ldi R24,170
	out 0x18,R24
	.dbline 26
L10:
	.dbline 25
; {PORTB=0x55;}
; while((PIND&0X08)==0)//������������־
	sbis 0x10,3
	rjmp L9
	rjmp L13
L12:
	.dbline 28
	.dbline 28
	ldi R24,15
	out 0x18,R24
	.dbline 28
L13:
	.dbline 27
; {PORTB=0xaa;}
; while((PIND&0X10)==0)//�����Ӽ�����־
	sbis 0x10,4
	rjmp L12
	rjmp L16
L15:
	.dbline 30
	.dbline 30
	ldi R24,240
	out 0x18,R24
	.dbline 30
L16:
	.dbline 29
	sbis 0x10,5
	rjmp L15
	.dbline 31
L4:
	.dbline 21
	rjmp L7
X1:
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
