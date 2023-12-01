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
	.dbfile D:\MYDOCU~1\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\018��ͬ�����нӿ�SPI��C���Ա��-�޷���\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\018��ͬ�����нӿ�SPI��C���Ա��-�޷���\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\018��ͬ�����нӿ�SPI��C���Ա��-�޷���\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\MYDOCU~1\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\018��ͬ�����нӿ�SPI��C���Ա��-�޷���\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 23
; /********************************************************************
;     �����ͨ��RS232�ӿ�����������1,2,3,4�ĸ����ݡ���Ƭ����
; ���ĸ����ݺ���������϶�̬��ʾ������Ȼ��Ƭ������������a��b��c��d����
; ���ַ���ʹ����ͨ�������ڵ������� ��������۲����ݴ������
; 
; *********************************************************************/
; #include <iom16v.h>
; #include <macros.h>
; /********************************************************************
;                 �������Ͷ���
; *********************************************************************/
; #define uchar unsigned char
; #define uint  unsigned int
; /********************************************************************
;                 ����ܶ��붨��0123456789
; *********************************************************************/
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
; uchar Data[4]={0,0,0,0};			
; /**********************************************************************
; 				  MS����ʱ�������򣬲���i ��ʱʱ��					   	
; **********************************************************************/            
; void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
; {uint j;
	.dbline 24
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 25
	.dbline 25
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 25
	.dbline 25
	.dbline 25
L7:
	.dbline 25
	subi R20,1
	sbci R21,0
L9:
	.dbline 25
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 25
L3:
	.dbline 24
	subi R16,1
	sbci R17,0
L5:
	.dbline 24
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
	.dbline 32
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            ��ʾ����		
; ע�⣺ʹ�ÿ�����ʱsel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
; {uchar i,sel=0xef;           
	.dbline 32
	ldi R20,239
	.dbline 33
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 34
	.dbline 34
	out 0x15,R20
	.dbline 35
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
	.dbline 36
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 37
	lsl R20
	.dbline 38
L12:
	.dbline 33
	inc R22
L14:
	.dbline 33
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
	.dbfunc e DelayNOP _DelayNOP fV
;              i -> R16
	.even
_DelayNOP::
	.dbline -1
	.dbline 44
;   {PORTC=sel;                  //ѡͨ���ұߵ������
;    PORTA=~Table[p[i]];          //��������
;    DelayMs(1);                 //��ʾ��ʱ    
;    sel=sel<<1;                 //��λ����ʾǰһλ
;   }
; }
; /**********************************************************************
; 				         ��ʼ��
; **********************************************************************/
; void DelayNOP(uchar i)
; {for(;i!=0;i--)  
	.dbline 44
	xjmp L19
L16:
	.dbline 45
	.dbline 45
	nop
	.dbline 45
L17:
	.dbline 44
	dec R16
L19:
	.dbline 44
	tst R16
	brne L16
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbsym r i 16 c
	.dbend
	.dbfunc e Convert _Convert fV
;              i -> R22
;              p -> R20,R21
	.even
_Convert::
	xcall push_gset2
	mov R22,R18
	movw R20,R16
	.dbline -1
	.dbline 51
;     { NOP();}
; } 
; /**********************************************************************
; 				         ���ݸ�ʽת��
; **********************************************************************/
; void Convert(uchar *p,uchar i)
; {p[0]=0;		   //��ʵ��������Ϊ���¶�
	.dbline 51
	clr R2
	movw R30,R20
	std z+0,R2
	.dbline 52
;  p[1]=i/100;
	ldi R17,100
	mov R16,R22
	xcall div8u
	movw R30,R20
	std z+1,R16
	.dbline 53
;  p[2]=(i-p[1]*100)/10;
	movw R30,R20
	ldd R2,z+1
	ldi R24,100
	mul R24,R2
	mov R16,R22
	sub R16,R0
	ldi R17,10
	xcall div8u
	movw R30,R20
	std z+2,R16
	.dbline 54
;  p[3]=i-p[1]*100-p[2]*10;
	movw R30,R20
	ldd R2,z+1
	ldi R24,100
	mul R24,R2
	mov R2,R22
	sub R2,R0
	movw R30,R20
	ldd R3,z+2
	ldi R24,10
	mul R24,R3
	sub R2,R0
	movw R30,R20
	std z+3,R2
	.dbline -2
L20:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 22 c
	.dbsym r p 20 pc
	.dbend
	.dbfunc e Write_Byte _Write_Byte fV
;          clear -> R20
;           Data -> R18
;        Address -> R16
	.even
_Write_Byte::
	xcall push_gset1
	.dbline -1
	.dbline 61
; }
; /**********************************************************************
; 				        д���ݺ���	
; 			����:��DS1722ָ����ַAddressдһ�ֽ�����Date
; **********************************************************************/
; void Write_Byte(uchar Address,uchar Data)
; {uchar clear;
	.dbline 62
;  PORTB=PORTB|0x10; //ʹ��SPI����
	sbi 0x18,4
	.dbline 63
;  SPDR=Address;	   //�͵�ַ����SPIʱ��
	out 0xf,R16
L22:
	.dbline 64
	.dbline 64
	.dbline 64
L23:
	.dbline 64
;  while(!(SPSR&0x80)) {;}//�ȴ����ݷ������
	sbis 0xe,7
	rjmp L22
	.dbline 65
;  clear=SPSR;		 	//������ͱ�־λ				  
	in R20,0xe
	.dbline 66
;  clear=SPDR;			//������ͱ�־λ	
	in R20,0xf
	.dbline 67
;  SPDR=Data;				//�������ݣ�����SPIʱ��
	out 0xf,R18
L25:
	.dbline 68
	.dbline 68
	.dbline 68
L26:
	.dbline 68
;  while(!(SPSR&0x80)) {;}//�ȴ����ݷ������
	sbis 0xe,7
	rjmp L25
	.dbline 69
;  clear=SPSR;		 	//������ͱ�־λ				  
	in R20,0xe
	.dbline 70
;  clear=SPDR;			//������ͱ�־λ		
	in R20,0xf
	.dbline 71
;  PORTB=PORTB&0xef;		//��ֹSPI����
	in R24,0x18
	andi R24,239
	out 0x18,R24
	.dbline -2
L21:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r clear 20 c
	.dbsym r Data 18 c
	.dbsym r Address 16 c
	.dbend
	.dbfunc e Read_Byte _Read_Byte fc
;           Data -> R20
;          clear -> R22
;        Address -> R16
	.even
_Read_Byte::
	xcall push_gset2
	.dbline -1
	.dbline 78
; }
; /**********************************************************************
; 				         �����ݺ���	
; 			 ����:��DS1722ָ����ַAddress��ȡһ�ֽ�����Date
; **********************************************************************/
; uchar Read_Byte(uchar Address)
; {uchar clear;
	.dbline 80
;  uchar Data;
;  PORTB=PORTB|0x10;	  	//ʹ��SPI����
	sbi 0x18,4
	.dbline 81
;  SPDR=Address;			//�͵�ַ����SPIʱ��
	out 0xf,R16
L29:
	.dbline 82
	.dbline 82
	.dbline 82
L30:
	.dbline 82
;  while(!(SPSR&0x80)) {;}//�ȴ����ݷ������
	sbis 0xe,7
	rjmp L29
	.dbline 83
;  clear=SPSR;		 	//������ͱ�־λ				  
	in R22,0xe
	.dbline 84
;  clear=SPDR;			//������ͱ�־λ
	in R22,0xf
	.dbline 85
;  SPDR=Address;//�������ݣ��������ݷ����Խ�������
	out 0xf,R16
L32:
	.dbline 86
	.dbline 86
	.dbline 86
L33:
	.dbline 86
;  while(!(SPSR&0x80)) {;}//�ȴ����ݷ���/�������
	sbis 0xe,7
	rjmp L32
	.dbline 87
;  clear=SPSR;		 	//������ͱ�־λ					   
	in R22,0xe
	.dbline 88
;  Data=SPDR;				//��������
	in R20,0xf
	.dbline 89
;  PORTB=PORTB&0xef;		//��ֹSPI����
	in R24,0x18
	andi R24,239
	out 0x18,R24
	.dbline 90
;  return(Data);			//�¶�ֵ����
	mov R16,R20
	.dbline -2
L28:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r Data 20 c
	.dbsym r clear 22 c
	.dbsym r Address 16 c
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 96
; }
; /**********************************************************************
; 				         ��ʼ��I/O��	
; **********************************************************************/
; void Init_IO(void)             //��ʼ��I/O��
; {DDRA=0xff;                    //����A��Ϊ����1���
	.dbline 96
	ldi R24,255
	out 0x1a,R24
	.dbline 97
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 98
;  DDRC=0xff;                    //����C��Ϊ����1���             
	out 0x14,R24
	.dbline 99
;  PORTC=0xff;
	out 0x15,R24
	.dbline 100
;  DDRC=0xbf;                    //����C��Ϊ����1���             
	ldi R24,191
	out 0x14,R24
	.dbline 101
;  PORTC=0xbf;
	out 0x15,R24
	.dbline -2
L35:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;          value -> R20
	.even
_main::
	.dbline -1
	.dbline 107
;  }
; /**********************************************************************
; 				          ������		
; **********************************************************************/
; void main(void)
; {
	.dbline 109
; uchar value;
; Init_IO();
	xcall _Init_IO
	.dbline 110
; SPCR=0x5c;//ʹ��SPC���ܣ�
	ldi R24,92
	out 0xd,R24
	.dbline 111
;  Write_Byte(0x80,0xf0);//DS1722����������ת��ģʽ��8λ�ֱ���
	ldi R18,240
	ldi R16,128
	xcall _Write_Byte
	xjmp L38
L37:
	.dbline 113
	.dbline 114
	ldi R16,1
	xcall _Read_Byte
	.dbline 115
	ldi R16,2
	xcall _Read_Byte
	mov R20,R16
	.dbline 116
	mov R18,R20
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Convert
	.dbline 117
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 118
L38:
	.dbline 112
	xjmp L37
X2:
	.dbline -2
L36:
	.dbline 0 ; func end
	ret
	.dbsym r value 20 c
	.dbend
