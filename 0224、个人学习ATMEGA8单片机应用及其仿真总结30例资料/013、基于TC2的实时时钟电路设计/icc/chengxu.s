	.module chengxu.c
	.area data(ram, con, rel)
_Table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\013������TC2��ʵʱʱ�ӵ�·���---------------δ�ɹ�\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\013������TC2��ʵʱʱ�ӵ�·���---------------δ�ɹ�\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\013������TC2��ʵʱʱ�ӵ�·���---------------δ�ɹ�\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
_CNT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\013������TC2��ʵʱʱ�ӵ�·���---------------δ�ɹ�\icc\chengxu.c
	.dbsym e CNT _CNT c
	.area text(rom, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\013������TC2��ʵʱʱ�ӵ�·���---------------δ�ɹ�\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 18
; #include <iom16v.h>
; /********************************************************************
;                 �������Ͷ���
; *********************************************************************/
; #define uchar unsigned char
; #define uint  unsigned int
; /********************************************************************
;                 ����ܶ��붨��0123456789
; *********************************************************************/
; //��������ͱ���Ӧ0��1��2��3��4��5��6��7��8��9//
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
; uchar Data[4]={0,0,0,0};       //�����ʼʱ�䣺00��00            
; uchar CNT=0;                     //�����жϼ�������    
; /**********************************************************************
; 				  MS����ʱ�������򣬲���i ��ʱʱ��					   	
; **********************************************************************/            
; void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
; {uint j;
	.dbline 19
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 20
	.dbline 20
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 20
	.dbline 20
	.dbline 20
L7:
	.dbline 20
	subi R20,1
	sbci R21,0
L9:
	.dbline 20
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 20
L3:
	.dbline 19
	subi R16,1
	sbci R17,0
L5:
	.dbline 19
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
	.dbline 27
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            ��ʾ����		
; ע�⣺ʹ�ÿ�����ʱsel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
; {uchar i,sel=0x01;           
	.dbline 27
	ldi R20,1
	.dbline 28
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 29
	.dbline 29
	out 0x15,R20
	.dbline 30
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
	.dbline 31
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 32
	lsl R20
	.dbline 33
L12:
	.dbline 28
	inc R22
L14:
	.dbline 28
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
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 39
;   {PORTC=sel;                  //ѡͨ���ұߵ������
;    PORTA=~Table[p[i]];          //��������
;    DelayMs(1);                 //��ʾ��ʱ    
;    sel=sel<<1;                 //��λ����ʾǰһλ
;   }
; }
; /**********************************************************************
; 				         ��ʼ��I/O��	
; **********************************************************************/
; void Init_IO(void)             //��ʼ��I/O��
; {DDRA=0xff;                    //����A��Ϊ����1���
	.dbline 39
	ldi R24,255
	out 0x1a,R24
	.dbline 40
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 41
;  DDRC=0xff;                    //����C��Ϊ����1���             
	out 0x14,R24
	.dbline 42
;  PORTC=0xff;
	out 0x15,R24
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Add_Second _Add_Second fV
;              p -> R16,R17
	.even
_Add_Second::
	.dbline -1
	.dbline 48
; }
; /**********************************************************************
; 				         ʱ�䴦������ʱ59��59��	
; **********************************************************************/
; void Add_Second(uchar *p)
; {p[3]++;
	.dbline 48
	movw R24,R16
	adiw R24,3
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 49
;  if(p[3]==10) {p[3]=0;p[2]++;}
	movw R30,R16
	ldd R24,z+3
	cpi R24,10
	brne L17
	.dbline 49
	.dbline 49
	clr R2
	movw R30,R16
	std z+3,R2
	.dbline 49
	movw R24,R16
	adiw R24,2
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 49
L17:
	.dbline 50
;  if(p[2]==6)  {p[2]=0;p[1]++;}
	movw R30,R16
	ldd R24,z+2
	cpi R24,6
	brne L19
	.dbline 50
	.dbline 50
	clr R2
	movw R30,R16
	std z+2,R2
	.dbline 50
	movw R24,R16
	adiw R24,1
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 50
L19:
	.dbline 51
;  if(p[1]==10) {p[1]=0;p[0]++;}
	movw R30,R16
	ldd R24,z+1
	cpi R24,10
	brne L21
	.dbline 51
	.dbline 51
	clr R2
	movw R30,R16
	std z+1,R2
	.dbline 51
	movw R30,R16
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 51
L21:
	.dbline 52
	movw R30,R16
	ldd R24,z+0
	cpi R24,6
	brne L23
	.dbline 52
	.dbline 52
	clr R2
	std z+0,R2
	.dbline 52
L23:
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbsym r p 16 pc
	.dbend
	.dbfunc e main _main fV
;              i -> <dead>
	.even
_main::
	.dbline -1
	.dbline 58
;  if(p[0]==6)  {p[0]=0;}
; }
; /**********************************************************************
; 				          ������		
; **********************************************************************/
; void main(void)
; {uchar i;
	.dbline 59
;  Init_IO();                    //��ʼ��I/O��
	xcall _Init_IO
	.dbline 62
;  //TCCR2=0x00;				   //ֹͣ��ʱ��
;  //TIMSK=0X00;				   //�ر�����ж�ʹ��
;  ASSR=0x08;                    //�첽ʱ��ʹ��
	ldi R24,8
	out 0x22,R24
	.dbline 63
;  TCCR2=0x07;                   //32768�ľ���1024��Ƶ��ΪT/C2��ʱ��Դ
	ldi R24,7
	out 0x25,R24
	.dbline 64
;  TCNT2=0Xff;				   //���ݼĴ�����ʼֵ����1�����
	ldi R24,255
	out 0x24,R24
	.dbline 65
;  TIMSK=0x40;                   //T/C2����ж�ʹ��
	ldi R24,64
	out 0x39,R24
	.dbline 66
;  SREG=SREG|0x80;               //ȫ���ж�ʹ��       
	bset 7
	xjmp L27
L26:
	.dbline 68
;  while(1)
;  {Display(Data);
	.dbline 68
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 69
;  if(CNT==32) 
	lds R24,_CNT
	cpi R24,32
	brne L29
	.dbline 70
;     {CNT=0;
	.dbline 70
	clr R2
	sts _CNT,R2
	.dbline 71
; 	 Add_Second(Data);}		   //ʱ�䴦��
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Add_Second
	.dbline 71
L29:
	.dbline 72
L27:
	.dbline 67
	xjmp L26
X2:
	.dbline -2
L25:
	.dbline 0 ; func end
	ret
	.dbsym l i 1 c
	.dbend
	.area vector(rom, abs)
	.org 16
	jmp _Timer2
	.area text(rom, con, rel)
	.dbfile E:\Proteus\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\013������TC2��ʵʱʱ�ӵ�·���---------------δ�ɹ�\icc\chengxu.c
	.dbfunc e Timer2 _Timer2 fV
	.even
_Timer2::
	st -y,R24
	st -y,R25
	in R24,0x3f
	st -y,R24
	.dbline -1
	.dbline 77
;  }
; }
; /******************TC2�жϷ�����*******************************/
; #pragma interrupt_handler Timer2:5
; void Timer2(void)
; {
	.dbline 78
; TCNT2=0XFF;//���ݼĴ�����ʼֵ����1�����
	ldi R24,255
	out 0x24,R24
	.dbline 79
; CNT=CNT+1;}//�жϴ���
	lds R24,_CNT
	subi R24,255    ; addi 1
	sts _CNT,R24
	.dbline -2
L31:
	ld R24,y+
	out 0x3f,R24
	ld R25,y+
	ld R24,y+
	.dbline 0 ; func end
	reti
	.dbend
