	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\����\�������ʾ����\icc\chengxu.c
	.dbfunc e delay _delay fV
;              i -> R20,R21
;              j -> R22,R23
;              t -> R16,R17
	.even
_delay::
	rcall push_gset2
	.dbline -1
	.dbline 14
; #include <iom8v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; 
; //CW���Ʋ�������ķ���
; //H_F���Ʋ�������Ĺ�����ʽ��1Ϊ���Ĺ�����ʽ��0Ϊ���Ĺ�����ʽ��
; //CLK���Ʋ��������ת���ٶȣ�һ��������ת��һ�������ǡ�
; //RESʹ�ܿ���(Ϊ1ʱ������У�Ϊ0ʱ���ֹͣ)
; 
; /******************************************************************
; ��ʱ����
; ******************************************************************/
; void delay(uint t)
; {
	.dbline 16
;   uint i,j;
;    for(i=0;i<t;i++)
	clr R20
	clr R21
	rjmp L5
L2:
	.dbline 17
;    {
	.dbline 18
	ldi R22,800
	ldi R23,3
	rjmp L9
L6:
	.dbline 18
L7:
	.dbline 18
	subi R22,1
	sbci R23,0
L9:
	.dbline 18
	cpi R22,0
	cpc R22,R23
	brne L6
X0:
	.dbline 19
	.dbline 19
	.dbline 20
	.dbline 21
L3:
	.dbline 16
	subi R20,255  ; offset = 1
	sbci R21,255
L5:
	.dbline 16
	cp R20,R16
	cpc R21,R17
	brlo L2
	.dbline -2
L1:
	rcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r j 22 i
	.dbsym r t 16 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 25
;    	 for(j=800;j>0;j--);
; 	 { ;
; 	 }
;    }
; }
; /***********************************��ʼ��*****************************/
; void Init_IO(void)//��ʼ��I/O
; {
	.dbline 27
; //����B��Ϊ���
; DDRB=0xff;
	ldi R24,255
	out 0x17,R24
	.dbline 28
; PORTB=0xff;
	out 0x18,R24
	.dbline 30
; //����C��Ϊ���
; DDRC=0xff;
	out 0x14,R24
	.dbline 31
; PORTC=0xff;
	out 0x15,R24
	.dbline 33
; //����D��Ϊ����
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 34
; PORTD=0x00;
	out 0x12,R2
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 40
; }
;  /*************************************************************************
;                                 ������	
; **************************************************************************/
;  void main()
; {  
	.dbline 41
;     Init_IO();
	rcall _Init_IO
	rjmp L13
L12:
	.dbline 43
	.dbline 45
	ldi R24,255
	out 0x15,R24
	.dbline 48
	out 0x18,R24
	.dbline 49
	ldi R16,10
	ldi R17,0
	rcall _delay
	.dbline 50
	clr R2
	out 0x18,R2
	.dbline 51
	ldi R16,10
	ldi R17,0
	rcall _delay
	.dbline 53
L13:
	.dbline 42
	rjmp L12
X1:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
