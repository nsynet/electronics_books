	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\����\�����ܽ��M8����\019�����Ź���c���Ա��\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 13
; #include <iom8v.h>
; #include <macros.h> 
; #define uchar unsigned char
; #define uint  unsigned int
; #define uchar unsigned char    //��������˵��
; #define uint  unsigned int     //��������˵��
; /**********************************************************************
; 								��ʱ����			
; 
; 					   	
; **********************************************************************/
; void DelayMs(uint i)           //Ms����ʱ����,����i����ʱʱ��
; {uint j;
	.dbline 14
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 15
	.dbline 15
	ldi R20,2000
	ldi R21,7
	xjmp L9
L6:
	.dbline 15
	.dbline 15
	.dbline 15
L7:
	.dbline 15
	subi R20,1
	sbci R21,0
L9:
	.dbline 15
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 16
L3:
	.dbline 14
	subi R16,1
	sbci R17,0
L5:
	.dbline 14
	cpi R16,0
	cpc R16,R17
	brne L2
X1:
	.dbline -2
L1:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e Horse _Horse fV
;              i -> R16
	.even
_Horse::
	xcall push_gset1
	.dbline -1
	.dbline 24
;   {for(j=2000;j!=0;j--) {;}
;   }
; }
; /**********************************************************************
; 								����ƺ���			
; 
; 					   	
; **********************************************************************/
; void Horse(uchar i)            //����Ƴ���ͨ�����жϵ�����Ӧ��LED
; {switch(i)                     //�ߵ�ƽ����LED
	.dbline 24
	mov R20,R16
	clr R21
	cpi R20,1
	ldi R30,0
	cpc R21,R30
	breq L14
	cpi R20,2
	ldi R30,0
	cpc R21,R30
	breq L15
	cpi R20,3
	ldi R30,0
	cpc R21,R30
	breq L16
	cpi R20,4
	ldi R30,0
	cpc R21,R30
	breq L17
	cpi R20,5
	ldi R30,0
	cpc R21,R30
	breq L18
	cpi R20,6
	ldi R30,0
	cpc R21,R30
	breq L19
	cpi R20,7
	ldi R30,0
	cpc R21,R30
	breq L20
	cpi R20,8
	ldi R30,0
	cpc R21,R30
	breq L21
	xjmp L12
X2:
	.dbline 25
L14:
	.dbline 25
;  {case 1:PORTB=0xfe;break;     //1111 1110B ����LED1
	ldi R24,254
	out 0x18,R24
	.dbline 25
	xjmp L12
L15:
	.dbline 26
;   case 2:PORTB=0xfc;break;     //1111 1100B ����LED1~LED2
	ldi R24,252
	out 0x18,R24
	.dbline 26
	xjmp L12
L16:
	.dbline 27
;   case 3:PORTB=0xf8;break;     //1111 1000B ����LED1~LED3
	ldi R24,248
	out 0x18,R24
	.dbline 27
	xjmp L12
L17:
	.dbline 28
;   case 4:PORTB=0xf0;break;     //1111 0000B ����LED1~LED4
	ldi R24,240
	out 0x18,R24
	.dbline 28
	xjmp L12
L18:
	.dbline 29
;   case 5:PORTB=0xe0;break;     //1110 0000B ����LED1~LED5
	ldi R24,224
	out 0x18,R24
	.dbline 29
	xjmp L12
L19:
	.dbline 30
;   case 6:PORTB=0xc0;break;     //1100 0000B ����LED1~LED6
	ldi R24,192
	out 0x18,R24
	.dbline 30
	xjmp L12
L20:
	.dbline 31
;   case 7:PORTB=0x80;break;     //1000 0000B ����LED1~LED7
	ldi R24,128
	out 0x18,R24
	.dbline 31
	xjmp L12
L21:
	.dbline 32
	clr R2
	out 0x18,R2
	.dbline 32
	.dbline 33
L12:
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 16 c
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 39
;   case 8:PORTB=0x00;break;     //0000 0000B ����LED1~LED8
;   default:break;}
; }
; /**********************************************************************
; 								��ʼ��I/0						   	
; **********************************************************************/
; void Init_IO(void)             //��ʼ��I/O��
; {
	.dbline 40
; DDRB=0xff;                    //�˿����ã�PA������Ϊ����1���
	ldi R24,255
	out 0x17,R24
	.dbline 41
;  PORTB=0xff;
	out 0x18,R24
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e WDT_init _WDT_init fV
	.even
_WDT_init::
	.dbline -1
	.dbline 47
; }
; /**********************************************************************
; 								���Ź���ʼ��					   	
; **********************************************************************/
; void WDT_init(void)
; {
	.dbline 48
;  WDR();//WDT ��λ 
	wdr
	.dbline 49
;  WDTCR = 0x0F;//ʹ�ܿ��Ź�
	ldi R24,15
	out 0x21,R24
	.dbline -2
L23:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e init_eatdog _init_eatdog fV
	.even
_init_eatdog::
	.dbline -1
	.dbline 53
; }
; /**********************************************************************/
; void init_eatdog(void)
; {
	.dbline 54
;  CLI(); //��ֹ�����ж�
	cli
	.dbline 55
;  WDT_init();
	xcall _WDT_init
	.dbline 56
;  SEI();//��ȫ���ж�
	sei
	.dbline -2
L24:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e WDT_off _WDT_off fV
	.even
_WDT_off::
	.dbline -1
	.dbline 63
; }
; 
; /**********************************************************************
; 								���Ź��ر�(ι��)				   	
; **********************************************************************/
; void WDT_off(void)
; {
	.dbline 64
;  WDR();//WDT ��λ
	wdr
	.dbline 65
;  WDTCR |= (1<<WDTOE) | (1<<WDE); //��λ WDTOE �� WDE
	in R24,0x21
	ori R24,24
	out 0x21,R24
	.dbline 66
;  WDTCR = 0x00;//�ر�WDT 
	clr R2
	out 0x21,R2
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 73
; }
; 
; /**********************************************************************
; 								������						   	
; **********************************************************************/
; void main(void)               
; {uchar i;
	.dbline 74
;  Init_IO();
	xcall _Init_IO
	.dbline 75
;  PORTB=0x00;                   //PORTA��ʼֵΪ0��������е�LED      
	clr R2
	out 0x18,R2
	.dbline 76
;  DelayMs(100);                //��ʱ
	ldi R16,100
	ldi R17,0
	xcall _DelayMs
	.dbline 77
;  WDTCR=0x00;				   //���Ź�����ʹ��  1.9S
	clr R2
	out 0x21,R2
	xjmp L28
L27:
	.dbline 79
;  while(1)                      //����������ִ��
;   { 
	.dbline 81
;   
;   for(i=1;i<9;i++)           //���ε���LED1~LED8
	ldi R20,1
	xjmp L33
L30:
	.dbline 82
	.dbline 82
	mov R16,R20
	xcall _Horse
	.dbline 83
	ldi R16,100
	ldi R17,0
	xcall _DelayMs
	.dbline 84
	xcall _init_eatdog
	.dbline 85
	xcall _WDT_off
	.dbline 86
L31:
	.dbline 81
	inc R20
L33:
	.dbline 81
	cpi R20,9
	brlo L30
	.dbline 87
;       {Horse(i);
; 	   DelayMs(100);         //��ʱ
; 	   init_eatdog();		 //���Ź���ʼ��
; 	   WDT_off();			 //ι�������ֹͣι��ϵͳ�Զ���λ��
; 	   }         
; 	for(i=9;i>0;i--)          //����Ϩ��LED8~LED1
	ldi R20,9
	xjmp L37
L34:
	.dbline 88
	.dbline 88
	mov R16,R20
	xcall _Horse
	.dbline 89
	ldi R16,100
	ldi R17,0
	xcall _DelayMs
	.dbline 89
L35:
	.dbline 87
	dec R20
L37:
	.dbline 87
	clr R2
	cp R2,R20
	brlo L34
	.dbline 90
	ldi R24,255
	out 0x18,R24
	.dbline 91
	ldi R16,100
	ldi R17,0
	xcall _DelayMs
	.dbline 92
L28:
	.dbline 78
	xjmp L27
X3:
	.dbline -2
L26:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
