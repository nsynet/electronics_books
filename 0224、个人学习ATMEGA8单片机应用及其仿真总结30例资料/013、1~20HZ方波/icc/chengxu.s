	.module chengxu.c
	.area data(ram, con, rel)
_CNT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA8\1~20HZ����\icc\chengxu.c
	.dbsym e CNT _CNT c
_CNT1::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA8\1~20HZ����\icc\chengxu.c
	.dbsym e CNT1 _CNT1 c
_CNT2::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA8\1~20HZ����\icc\chengxu.c
	.dbsym e CNT2 _CNT2 c
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA8\1~20HZ����\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	rcall push_gset1
	.dbline -1
	.dbline 34
; #include <iom8v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; //����BIT 0-7 ��1 
; #define BIT0_POS (1<<0)   
; #define BIT1_POS (1<<1) 
; #define BIT2_POS (1<<2) 
; #define BIT3_POS (1<<3) 
; #define BIT4_POS (1<<4) 
; #define BIT5_POS (1<<5) 
; #define BIT6_POS (1<<6) 
; #define BIT7_POS (1<<7) 
; 
; //����BIT 0-7 ���� 
; #define BIT0_NEG ((unsigned char)(~(1<<0))) 
; #define BIT1_NEG ((unsigned char)(~(1<<1))) 
; #define BIT2_NEG ((unsigned char)(~(1<<2))) 
; #define BIT3_NEG ((unsigned char)(~(1<<3))) 
; #define BIT4_NEG ((unsigned char)(~(1<<4))) 
; #define BIT5_NEG ((unsigned char)(~(1<<5))) 
; #define BIT6_NEG ((unsigned char)(~(1<<6))) 
; #define BIT7_NEG ((unsigned char)(~(1<<7))) 
; 
; //�����ɫLEDϨ��������ת 
; #define LED_red_OFF PORTB&=BIT2_NEG 
; #define LED_red_ON   PORTB|=BIT2_POS   
; #define LED_red_OTN PORTB^=BIT2_POS 
; 
; uchar CNT=0;//������ֵ
; uchar CNT1=0;//�ж�ֵ
; uchar CNT2=0;//�ı�Ƶ��ֵ
; ////////////////////////////////////////////////////////////////////
; void DelayMS(uint i)//��ʱ
;    {
	.dbline 36
;     uint j;
;     for(;i!=0;i--)
	rjmp L5
L2:
	.dbline 37
;         {
	.dbline 38
	ldi R20,8000
	ldi R21,31
	rjmp L9
L6:
	.dbline 38
L7:
	.dbline 38
	subi R20,1
	sbci R21,0
L9:
	.dbline 38
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 39
L3:
	.dbline 36
	subi R16,1
	sbci R17,0
L5:
	.dbline 36
	cpi R16,0
	cpc R16,R17
	brne L2
X1:
	.dbline -2
L1:
	rcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 43
;           for(j=8000;j!=0;j--);
;         }
;    }
; //////////////////////////////��ʼ��////////////////////////////////////
; void Init_IO(void)//��ʼ��I/O
; {
	.dbline 45
; //����C��Ϊ���
; DDRC=0xFF;
	ldi R24,255
	out 0x14,R24
	.dbline 46
; PORTC=0xFF;
	out 0x15,R24
	.dbline 48
; //����B��Ϊ���
; DDRB=0XFF;
	out 0x17,R24
	.dbline 49
; PORTB=0xFF;
	out 0x18,R24
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 53
; }
; /////////////////////////////������/////////////////////////////////////
; void main(void)
; {
	.dbline 55
; //uchar Load;
; Init_IO();  //��ʼ��I/O
	rcall _Init_IO
	.dbline 56
; TCCR0=0x04; //T/C0������ʽѡ��ϵͳʱ��256��Ƶ
	ldi R24,4
	out 0x33,R24
	.dbline 58
; //(��һ����Ը�Ϊ)TCCR0 |= (1<<CS02);//T/C0�����ڶ�ʱ��ʽ��ϵͳʱ��256��Ƶ
; TCNT0=0X06; //������ʼֵ
	ldi R24,6
	out 0x32,R24
	.dbline 59
; TIMSK=0x01;  //ʹ��T0����ж�
	ldi R24,1
	out 0x39,R24
	.dbline 61
; //(��һ����Ը�Ϊ)TIMSK |= (1<<TOIE0);  //ʹ��T0����ж�
; SREG=0x80;  //ʹ��ȫ���ж�
	ldi R24,128
	out 0x3f,R24
L12:
	.dbline 64
	.dbline 66
L13:
	.dbline 63
	rjmp L12
X2:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 18
	rjmp _Timer0
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA8\1~20HZ����\icc\chengxu.c
	.dbfunc e Timer0 _Timer0 fV
	.even
_Timer0::
	st -y,R2
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 71
	.dbline 72
	lds R24,_CNT
	subi R24,255    ; addi 1
	sts _CNT,R24
	.dbline 73
	lds R24,_CNT2
	subi R24,255    ; addi 1
	sts _CNT2,R24
	.dbline 74
	lds R24,_CNT
	cpi R24,4
	brne L16
	.dbline 75
	.dbline 76
	clr R2
	sts _CNT,R2
	.dbline 77
	lds R24,_CNT1
	subi R24,255    ; addi 1
	sts _CNT1,R24
	.dbline 78
	ldi R24,4
	in R2,0x18
	eor R2,R24
	out 0x18,R2
	.dbline 80
L16:
	.dbline -2
L15:
	ld R2,y+
	out 0x3f,R2
	ld R25,y+
	ld R24,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
