	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\NEW��~1\��·��������̵������ư�\�ð�����ʹ�ó���\003����������Ƴ���\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	rcall push_gset1
	.dbline -1
	.dbline 65
; #include <iom8v.h>
; #include <macros.h> 
; /**********************************************************************
; 				  ������������˵��							   	
; **********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; uchar KEY_PC0;
; uchar KEY_PC1;
; uchar KEY_PC2;
; uchar KEY_PC3;
; uchar KEY_PB0;
; uchar KEY_PB1;
; uchar KEY_PB2;
; uchar KEY_PB3;
; //����BIT 0-7 ��1 
; #define BIT0_POS (1<<0)   
; #define BIT1_POS (1<<1) 
; #define BIT2_POS (1<<2) 
; #define BIT3_POS (1<<3) 
; //����BIT 0-7 ���� 
; #define BIT0_NEG ((unsigned char)(~(1<<0))) 
; #define BIT1_NEG ((unsigned char)(~(1<<1))) 
; #define BIT2_NEG ((unsigned char)(~(1<<2))) 
; #define BIT3_NEG ((unsigned char)(~(1<<3))) 
; 
; //����̵����պϡ��Ͽ�����ת 
; #define PB0_OFF PORTB&=BIT0_NEG 
; #define PB0_ON  PORTB|=BIT0_POS   
; #define PB0_OTN PORTB^=BIT0_POS 
; //����̵����պϡ��Ͽ�����ת 
; #define PB1_OFF PORTB&=BIT1_NEG 
; #define PB1_ON  PORTB|=BIT1_POS   
; #define PB1_OTN PORTB^=BIT1_POS 
; //����̵����պϡ��Ͽ�����ת 
; #define PB2_OFF PORTB&=BIT2_NEG 
; #define PB2_ON  PORTB|=BIT2_POS   
; #define PB2_OTN PORTB^=BIT2_POS 
; //����̵����պϡ��Ͽ�����ת 
; #define PB3_OFF PORTB&=BIT3_NEG 
; #define PB3_ON  PORTB|=BIT3_POS   
; #define PB3_OTN PORTB^=BIT3_POS 
; 
; //����̵����պϡ��Ͽ�����ת 
; #define PC0_OFF PORTC&=BIT0_NEG 
; #define PC0_ON  PORTC|=BIT0_POS   
; #define PC0_OTN PORTC^=BIT0_POS 
; //����̵����պϡ��Ͽ�����ת 
; #define PC1_OFF PORTC&=BIT1_NEG 
; #define PC1_ON  PORTC|=BIT1_POS   
; #define PC1_OTN PORTC^=BIT1_POS 
; //����̵����պϡ��Ͽ�����ת 
; #define PC2_OFF PORTC&=BIT2_NEG 
; #define PC2_ON  PORTC|=BIT2_POS   
; #define PC2_OTN PORTC^=BIT2_POS 
; //����̵����պϡ��Ͽ�����ת 
; #define PC3_OFF PORTC&=BIT3_NEG 
; #define PC3_ON  PORTC|=BIT3_POS   
; #define PC3_OTN PORTC^=BIT3_POS 
; 
; /**********************************************************************
; 				  MS����ʱ�������򣬲���i ��ʱʱ��								   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 67
; uint j;
; for(;i!=0;i--)
	rjmp L5
L2:
	.dbline 68
; {
	.dbline 69
	ldi R20,1000
	ldi R21,3
	rjmp L9
L6:
	.dbline 69
L7:
	.dbline 69
	subi R20,1
	sbci R21,0
L9:
	.dbline 69
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 70
L3:
	.dbline 67
	subi R16,1
	sbci R17,0
L5:
	.dbline 67
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
	.dbfunc e WDT_init _WDT_init fV
	.even
_WDT_init::
	.dbline -1
	.dbline 76
; for(j=1000;j!=0;j--);
; }
; }
; /**********************************************************************
; 								���Ź���ʼ��					   	
; **********************************************************************/
; void WDT_init(void)
; {
	.dbline 77
;  WDR();//WDT ��λ 
	wdr
	.dbline 78
;  WDTCR = 0x0F;//ʹ�ܿ��Ź�
	ldi R24,15
	out 0x21,R24
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e init_eatdog _init_eatdog fV
	.even
_init_eatdog::
	.dbline -1
	.dbline 82
; }
; /**********************************************************************/
; void init_eatdog(void)
; {
	.dbline 83
;  CLI(); //��ֹ�����ж�
	cli
	.dbline 84
;  WDT_init();
	rcall _WDT_init
	.dbline 85
;  SEI();//��ȫ���ж�
	sei
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e WDT_off _WDT_off fV
	.even
_WDT_off::
	.dbline -1
	.dbline 92
; }
; 
; /**********************************************************************
; 								���Ź��ر�(ι��)				   	
; **********************************************************************/
; void WDT_off(void)
; {
	.dbline 93
;  WDR();//WDT ��λ
	wdr
	.dbline 94
;  WDTCR |= (1<<WDTOE) | (1<<WDE); //��λ WDTOE �� WDE
	in R24,0x21
	ori R24,24
	out 0x21,R24
	.dbline 95
;  WDTCR = 0x00;//�ر�WDT 
	clr R2
	out 0x21,R2
	.dbline -2
L12:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e get_key _get_key fV
	.even
_get_key::
	.dbline -1
	.dbline 103
; }
; /**********************************************************************
; 				          ����ɨ�躯��		   	
; **********************************************************************/
; 
; void get_key(void)//����ɨ�躯��
; 
; {
	rjmp L15
L14:
	.dbline 105
	.dbline 105
	ldi R24,1
	sts _KEY_PC0,R24
	.dbline 105
L15:
	.dbline 104
; while((PIND&0X01)==0)//����PD0,PC0�պ�
	sbis 0x10,0
	rjmp L14
	rjmp L18
L17:
	.dbline 107
	.dbline 107
	ldi R24,1
	sts _KEY_PC1,R24
	.dbline 107
L18:
	.dbline 106
; {KEY_PC0=1;}
; while((PIND&0X02)==0)//����PD1,PC1�պ�
	sbis 0x10,1
	rjmp L17
	rjmp L21
L20:
	.dbline 109
	.dbline 109
	ldi R24,1
	sts _KEY_PC2,R24
	.dbline 109
L21:
	.dbline 108
; {KEY_PC1=1;}
; while((PIND&0X04)==0)//����PD2,PC2�պ�
	sbis 0x10,2
	rjmp L20
	rjmp L24
L23:
	.dbline 111
	.dbline 111
	ldi R24,1
	sts _KEY_PC3,R24
	.dbline 111
L24:
	.dbline 110
; {KEY_PC2=1;}
; while((PIND&0X08)==0)//����PD3,PC3�պ�
	sbis 0x10,3
	rjmp L23
	rjmp L27
L26:
	.dbline 113
	.dbline 113
	ldi R24,1
	sts _KEY_PB0,R24
	.dbline 113
L27:
	.dbline 112
; {KEY_PC3=1;}
; while((PIND&0X10)==0)//����PD4,PB0�պ�
	sbis 0x10,4
	rjmp L26
	rjmp L30
L29:
	.dbline 115
	.dbline 115
	ldi R24,1
	sts _KEY_PB1,R24
	.dbline 115
L30:
	.dbline 114
; {KEY_PB0=1;}
; while((PIND&0X20)==0)//����PD5,PB1�պ�
	sbis 0x10,5
	rjmp L29
	rjmp L33
L32:
	.dbline 117
	.dbline 117
	ldi R24,1
	sts _KEY_PB2,R24
	.dbline 117
L33:
	.dbline 116
; {KEY_PB1=1;}
; while((PIND&0X40)==0)//����PD6,PB2�պ�
	sbis 0x10,6
	rjmp L32
	rjmp L36
L35:
	.dbline 119
	.dbline 119
	ldi R24,1
	sts _KEY_PB3,R24
	.dbline 119
L36:
	.dbline 118
; {KEY_PB2=1;}
; while((PIND&0X80)==0)//����PD7,PB3�պ�
	sbis 0x10,7
	rjmp L35
	.dbline -2
L13:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 125
; {KEY_PB3=1;}
; }
; /**********************************************************************
; 				   ��ʼ��					   	
; **********************************************************************/
; void Init_IO(void)//��ʼ��I/O
; {
	.dbline 127
; //����B��Ϊ���
; DDRB=0x3F;
	ldi R24,63
	out 0x17,R24
	.dbline 128
; PORTB=0x3F;
	out 0x18,R24
	.dbline 130
; //����C��Ϊ���
; DDRC=0xFF;
	ldi R24,255
	out 0x14,R24
	.dbline 131
; PORTC=0xFF;
	out 0x15,R24
	.dbline 133
; //����D��Ϊ����
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 134
; PORTD=0x00;
	out 0x12,R2
	.dbline -2
L38:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 141
; }
; 
; /**********************************************************************
; 				  ������				   	
; **********************************************************************/
; void main(void)
; {
	.dbline 142
; Init_IO();  //��ʼ��I/O
	rcall _Init_IO
	rjmp L41
L40:
	.dbline 144
; while(1)
; {
	.dbline 145
; get_key();
	rcall _get_key
	.dbline 146
; if(KEY_PC0==1){PC0_OTN;DelayMS(3);KEY_PC0=0;}
	lds R24,_KEY_PC0
	cpi R24,1
	brne L43
	.dbline 146
	.dbline 146
	ldi R24,1
	in R2,0x15
	eor R2,R24
	out 0x15,R2
	.dbline 146
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 146
	clr R2
	sts _KEY_PC0,R2
	.dbline 146
L43:
	.dbline 147
; if(KEY_PC1==1){PC1_OTN;DelayMS(3);KEY_PC1=0;}
	lds R24,_KEY_PC1
	cpi R24,1
	brne L45
	.dbline 147
	.dbline 147
	ldi R24,2
	in R2,0x15
	eor R2,R24
	out 0x15,R2
	.dbline 147
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 147
	clr R2
	sts _KEY_PC1,R2
	.dbline 147
L45:
	.dbline 148
; if(KEY_PC2==1){PC2_OTN;DelayMS(3);KEY_PC2=0;}
	lds R24,_KEY_PC2
	cpi R24,1
	brne L47
	.dbline 148
	.dbline 148
	ldi R24,4
	in R2,0x15
	eor R2,R24
	out 0x15,R2
	.dbline 148
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 148
	clr R2
	sts _KEY_PC2,R2
	.dbline 148
L47:
	.dbline 149
; if(KEY_PC3==1){PC3_OTN;DelayMS(3);KEY_PC3=0;}
	lds R24,_KEY_PC3
	cpi R24,1
	brne L49
	.dbline 149
	.dbline 149
	ldi R24,8
	in R2,0x15
	eor R2,R24
	out 0x15,R2
	.dbline 149
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 149
	clr R2
	sts _KEY_PC3,R2
	.dbline 149
L49:
	.dbline 150
; if(KEY_PB0==1){PB0_OTN;DelayMS(3);KEY_PB0=0;}
	lds R24,_KEY_PB0
	cpi R24,1
	brne L51
	.dbline 150
	.dbline 150
	ldi R24,1
	in R2,0x18
	eor R2,R24
	out 0x18,R2
	.dbline 150
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 150
	clr R2
	sts _KEY_PB0,R2
	.dbline 150
L51:
	.dbline 151
; if(KEY_PB1==1){PB1_OTN;DelayMS(3);KEY_PB1=0;}
	lds R24,_KEY_PB1
	cpi R24,1
	brne L53
	.dbline 151
	.dbline 151
	ldi R24,2
	in R2,0x18
	eor R2,R24
	out 0x18,R2
	.dbline 151
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 151
	clr R2
	sts _KEY_PB1,R2
	.dbline 151
L53:
	.dbline 152
; if(KEY_PB2==1){PB2_OTN;DelayMS(3);KEY_PB2=0;}
	lds R24,_KEY_PB2
	cpi R24,1
	brne L55
	.dbline 152
	.dbline 152
	ldi R24,4
	in R2,0x18
	eor R2,R24
	out 0x18,R2
	.dbline 152
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 152
	clr R2
	sts _KEY_PB2,R2
	.dbline 152
L55:
	.dbline 153
; if(KEY_PB3==1){PB3_OTN;DelayMS(3);KEY_PB3=0;}
	lds R24,_KEY_PB3
	cpi R24,1
	brne L57
	.dbline 153
	.dbline 153
	ldi R24,8
	in R2,0x18
	eor R2,R24
	out 0x18,R2
	.dbline 153
	ldi R16,3
	ldi R17,0
	rcall _DelayMS
	.dbline 153
	clr R2
	sts _KEY_PB3,R2
	.dbline 153
L57:
	.dbline 154
L41:
	.dbline 143
	rjmp L40
X2:
	.dbline -2
L39:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile F:\NEW��~1\��·��������̵������ư�\�ð�����ʹ�ó���\003����������Ƴ���\icc\chengxu.c
_KEY_PB3::
	.blkb 1
	.dbsym e KEY_PB3 _KEY_PB3 c
_KEY_PB2::
	.blkb 1
	.dbsym e KEY_PB2 _KEY_PB2 c
_KEY_PB1::
	.blkb 1
	.dbsym e KEY_PB1 _KEY_PB1 c
_KEY_PB0::
	.blkb 1
	.dbsym e KEY_PB0 _KEY_PB0 c
_KEY_PC3::
	.blkb 1
	.dbsym e KEY_PC3 _KEY_PC3 c
_KEY_PC2::
	.blkb 1
	.dbsym e KEY_PC2 _KEY_PC2 c
_KEY_PC1::
	.blkb 1
	.dbsym e KEY_PC1 _KEY_PC1 c
_KEY_PC0::
	.blkb 1
	.dbsym e KEY_PC0 _KEY_PC0 c
