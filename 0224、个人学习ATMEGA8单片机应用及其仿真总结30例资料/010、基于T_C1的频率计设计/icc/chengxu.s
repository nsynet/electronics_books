	.module chengxu.c
	.area data(ram, con, rel)
_Flag::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.dbsym e Flag _Flag c
_Table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
_CNT::
	.blkb 2
	.area idata
	.word 100
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.dbsym e CNT _CNT i
	.area text(rom, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 27
; #include <iom16v.h>
; #include <macros.h>       
; /********************************************************************
;                 �������Ͷ���
; *********************************************************************/   
; #define uchar unsigned char
; #define uint  unsigned int
; 
; #define CON 1000      
; //Ƶ�ʳ�������
; uchar Flag=0;         
; //�����������
; 
; /********************************************************************
;                 ����ܶ��붨��0123456789
; *********************************************************************/
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
;                  0x7f,0x6f};
; uchar Data[4]={0,0,0,0};       //��ʾ��ʼֵ��0 0 0 0
; uint  CNT1;                    //��һ�β���ֵ
; uint  CNT2;                    //�ڶ��˲���ֵ
; uint  CNT=100;                 //�����ֵ 
; /**********************************************************************
; 				  MS����ʱ�������򣬲���i ��ʱʱ��					   	
; **********************************************************************/      
; void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
; {uint j;
	.dbline 28
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 29
	.dbline 29
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 29
	.dbline 29
	.dbline 29
L7:
	.dbline 29
	subi R20,1
	sbci R21,0
L9:
	.dbline 29
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 29
L3:
	.dbline 28
	subi R16,1
	sbci R17,0
L5:
	.dbline 28
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
	.dbfunc e Display _Display fV
;            sel -> R20
;              i -> R22
;              p -> R10,R11
	.even
_Display::
	xcall push_gset3
	movw R10,R16
	.dbline -1
	.dbline 36
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            ��ʾ����		
; ע�⣺ʹ�ÿ�����ʱsel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
; {uchar i,sel=0x01;           
	.dbline 36
	ldi R20,1
	.dbline 37
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 38
	.dbline 38
	out 0x15,R20
	.dbline 39
	mov R30,R22
	clr R31
	add R30,R10
	adc R31,R11
	ldd R30,z+0
	clr R31
	ldi R24,<_Table
	ldi R25,>_Table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	com R2
	out 0x1b,R2
	.dbline 40
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 41
	lsl R20
	.dbline 42
L12:
	.dbline 37
	inc R22
L14:
	.dbline 37
	cpi R22,4
	brlo L11
	.dbline -2
L10:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r sel 20 c
	.dbsym r i 22 c
	.dbsym r p 10 pc
	.dbend
	.dbfunc e HZ _HZ fV
;            TEM -> R22,R23
;              p -> R20,R21
;              i -> R10,R11
	.even
_HZ::
	xcall push_gset3
	movw R20,R18
	movw R10,R16
	.dbline -1
	.dbline 46
;   {PORTC=sel;                  //ѡͨ���ұߵ������
;    PORTA=~Table[p[i]];          //��������
;    DelayMs(1);                 //��ʾ��ʱ    
;    sel=sel<<1;                 //��λ����ʾǰһλ
;   }
; }
; /**************************Ƶ��ֵ������********************************/
; void HZ(uint i,uchar *p)
; {
	.dbline 48
;  uint TEM;
;  p[0]=CON/i;
	ldi R16,1000
	ldi R17,3
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+0,R16
	.dbline 49
;  TEM=CON%i;
	ldi R16,1000
	ldi R17,3
	movw R18,R10
	xcall mod16u
	movw R22,R16
	.dbline 50
;  TEM=TEM*10;
	ldi R16,10
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R22,R16
	.dbline 51
;  p[1]=TEM/i;
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+1,R16
	.dbline 52
;  TEM=TEM%i;
	movw R18,R10
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 53
;  TEM=TEM*10;
	ldi R16,10
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R22,R16
	.dbline 54
;  p[2]=TEM/i;
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+2,R16
	.dbline 55
;  TEM=TEM%i;
	movw R18,R10
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 56
;  TEM=TEM*10;
	ldi R16,10
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R22,R16
	.dbline 57
;  p[3]=TEM/i;
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+3,R16
	.dbline -2
L15:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r TEM 22 i
	.dbsym r p 20 pc
	.dbsym r i 10 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 63
; }
; /**********************************************************************
; 				           ��ʼ��I/O			   	
; **********************************************************************/
; void Init_IO(void)             //��ʼ��I/O��
; {DDRA=0xff;                    //����A��Ϊ����1���
	.dbline 63
	ldi R24,255
	out 0x1a,R24
	.dbline 64
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 65
;  DDRC=0xff;                    //����C��Ϊ����1���             
	out 0x14,R24
	.dbline 66
;  PORTC=0xff;
	out 0x15,R24
	.dbline 67
;  DDRD=0x00;                    //����D��Ϊ��������������
	clr R2
	out 0x11,R2
	.dbline 68
;  PORTD=0x00;    
	out 0x12,R2
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_Timer1 _Init_Timer1 fV
	.even
_Init_Timer1::
	.dbline -1
	.dbline 74
; }
; /**********************************************************************
; 				          ��ʼ��T/C1�����벶���ж�		   	
; **********************************************************************/
; void Init_Timer1(void)         //��ʼ��T/C1�����벶���ж�
; {
	.dbline 75
;  TIMSK=TIMSK|0x20;             //���벶��ʹ��
	in R24,0x39
	ori R24,32
	out 0x39,R24
	.dbline 76
;  TCCR1B=0xC2;                  //���벶������ʹ�ܣ��½��ز���ʱ��8��Ƶ1uS����һ�Ρ�
	ldi R24,194
	out 0x2e,R24
	.dbline 77
;  ICR1H=0x00;
	clr R2
	out 0x27,R2
	.dbline 78
;  ICR1L=0x00;
	out 0x26,R2
	.dbline 79
;  TIFR=0x20;                    //���жϱ�־
	ldi R24,32
	out 0x38,R24
	.dbline 80
;  SREG=SREG&0x7f;               //ȫ���жϹ�
	in R24,0x3f
	andi R24,127
	out 0x3f,R24
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 86
;  } 
; /**********************************************************************
; 				          ������		   	
; **********************************************************************/
; void main(void)
; {uchar i;
	.dbline 87
;  Init_IO();                    //��ʼ��I/O��
	xcall _Init_IO
	.dbline 88
;  Init_Timer1();                //T/C1���Ի� 
	xcall _Init_Timer1
	xjmp L20
X2:
	.dbline 90
;  while(1)
;   {
L22:
	.dbline 92
	.dbline 93
	in R24,0x38
	ori R24,32
	out 0x38,R24
	.dbline 94
	in R2,0x26
	clr R3
	sts _CNT1+1,R3
	sts _CNT1,R2
	.dbline 95
	in R2,0x26
	in R3,0x27
	sts _CNT2+1,R3
	sts _CNT2,R2
	.dbline 96
	sts _CNT+1,R3
	sts _CNT,R2
	.dbline 97
	lds R24,_Flag
	subi R24,255    ; addi 1
	sts _Flag,R24
	.dbline 98
L23:
	.dbline 91
; while(TIFR&0x20)             //������
	in R2,0x38
	sbrc R2,5
	rjmp L22
	.dbline 99
;       {
; 	  TIFR|=0x20;             //��������־
; 	  CNT1=ICR1L;
; 	  CNT2=(ICR1H<<8)+ICR1L; 
; 	  CNT=CNT2;
; 	  Flag++;
; 	   }                //��⵽��һ�β���
;    if(Flag==1)                 //��⵽�ڶ��˲���
	lds R24,_Flag
	cpi R24,1
	brne L25
	.dbline 100
;       {Flag=0;                 //����������־
	.dbline 100
	clr R2
	sts _Flag,R2
	.dbline 101
; 	   HZ(CNT,Data);           //���ݴ���
	ldi R18,<_Data
	ldi R19,>_Data
	lds R16,_CNT
	lds R17,_CNT+1
	xcall _HZ
	.dbline 102
; 	   for(i=0;i<100;i++)      //Ƶ����ʾ
	clr R20
	xjmp L30
L27:
	.dbline 103
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
L28:
	.dbline 102
	inc R20
L30:
	.dbline 102
	cpi R20,100
	brlo L27
	.dbline 104
; 	       Display(Data);
; 	   CNT=0;CNT1=0;CNT2=0;
	clr R2
	clr R3
	sts _CNT+1,R3
	sts _CNT,R2
	.dbline 104
	sts _CNT1+1,R3
	sts _CNT1,R2
	.dbline 104
	sts _CNT2+1,R3
	sts _CNT2,R2
	.dbline 105
; 	   ICR1H=0x00;
	out 0x27,R2
	.dbline 106
;        ICR1L=0x00;
	out 0x26,R2
	.dbline 107
; 	   }
L25:
	.dbline 108
L20:
	.dbline 89
	xjmp L23
X3:
	.dbline -2
L18:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\010������T_C1��Ƶ�ʼ����\icc\chengxu.c
_CNT2::
	.blkb 2
	.dbsym e CNT2 _CNT2 i
_CNT1::
	.blkb 2
	.dbsym e CNT1 _CNT1 i
