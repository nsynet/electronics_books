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
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA16\Eeprom��c���Ա��\icc\chengxu.c
	.dbsym e Table _Table A[16:16]c
	.area text(rom, con, rel)
	.dbfile D:\Proteus\ATMEGA16\Eeprom��c���Ա��\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 16
; #include <iom16v.h>
; #include <macros.h> 
; #define uchar unsigned char
; #define uint  unsigned int
; /**********************************************************************
; 								��������								   	
; **********************************************************************/
; //��������ͱ���Ӧ0��1��2��3��4��5��6��7��8��9��A,B,C,D,E,F//
; uchar Table[16]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
;                  0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; uchar Read_Data[4];            //�������4�ֽ�����
; /**********************************************************************
; 								��ʱ����								   	
; **********************************************************************/
; void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
; {uint j;
	.dbline 17
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 18
	.dbline 18
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 18
	.dbline 18
	.dbline 18
L7:
	.dbline 18
	subi R20,1
	sbci R21,0
L9:
	.dbline 18
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 18
L3:
	.dbline 17
	subi R16,1
	sbci R17,0
L5:
	.dbline 17
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
	.dbline 24
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 								��̬��ʾ����								   	
; **********************************************************************/
; void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
; {uchar i,sel=0x01;           
	.dbline 24
	ldi R20,1
	.dbline 25
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 26
	.dbline 26
	out 0x15,R20
	.dbline 27
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
	clr R3
	ldi R24,255
	ldi R25,0
	sub R24,R2
	sbc R25,R3
	out 0x1b,R24
	.dbline 28
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 29
	lsl R20
	.dbline 30
L12:
	.dbline 25
	inc R22
L14:
	.dbline 25
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
	.dbline 36
;   {PORTC=sel;                  //ѡͨ���ұߵ������
;    PORTA=0xff-Table[p[i]];     //��������
;    DelayMs(1);                 //��ʾ��ʱ    
;    sel=sel<<1;                 //��λ����ʾǰһλ
;   }
; }
; /**********************************************************************
; 								��ʼ��I/O��								   	
; **********************************************************************/
; void Init_IO(void)             //��ʼ��I/O��
; {DDRA=0xff;                    //����A��Ϊ����1���
	.dbline 36
	ldi R24,255
	out 0x1a,R24
	.dbline 37
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 38
;  DDRC=0xff;                    //����C��Ϊ����1���             
	out 0x14,R24
	.dbline 39
;  PORTC=0xff;
	out 0x15,R24
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Write_EEPROM _Write_EEPROM fV
;        Address -> R22,R23
;           Data -> R20
	.even
_Write_EEPROM::
	xcall push_gset2
	movw R22,R18
	mov R20,R16
	.dbline -1
	.dbline 47
; }
; /**********************************************************************
; 		  дһ�ֽڵ�EEPROM����	
; 		������Date��д������ݣ�  
; 		    Address:д��ĵ�ַ					   	
; **********************************************************************/
; void Write_EEPROM(uchar Data,uint Address)
; {if(EECR&0x20) DelayMs(4);//�ж�дʹ���Ƿ�Ϊ0
	.dbline 47
	sbis 0x1c,5
	rjmp L17
	.dbline 47
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
L17:
	.dbline 48
;  EEARH=Address>>8;        //�͸ߵ�ַ
	movw R2,R22
	mov R2,R3
	clr R3
	out 0x1f,R2
	.dbline 49
;  EEARL=Address&0x00ff;    //�͵͵�ַ
	movw R24,R22
	andi R25,0
	out 0x1e,R24
	.dbline 50
;  EEDR=Data;               //������
	out 0x1d,R20
	.dbline 51
;  EECR=EECR|0x04;          //��дʹ����λ
	sbi 0x1c,2
	.dbline 52
;  EECR=EECR|0x02;          //дʹ����λ
	sbi 0x1c,1
	.dbline 53
;  DelayMs(4);              //��ʱ��д��ʱ��Լ��2.5ms~4ms��
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
	.dbline -2
L16:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r Address 22 i
	.dbsym r Data 20 c
	.dbend
	.dbfunc e Read_EEPROM _Read_EEPROM fc
;              i -> R20
;        Address -> R20,R21
	.even
_Read_EEPROM::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 60
; }
; /**********************************************************************
; 			��һ�ֽڵ�EEPROM����	
; 		����:Address��д��ĵ�ַ������ֵ����ȡ������							   	
; **********************************************************************/
; uchar Read_EEPROM(uint Address)
; {uchar i;
	.dbline 61
;  if(EECR&0x01) DelayMs(4);//�ж϶�ʹ���Ƿ�Ϊ0
	sbis 0x1c,0
	rjmp L20
	.dbline 61
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
L20:
	.dbline 62
;  EEARH=Address>>8;        //�͸ߵ�ַ
	movw R2,R20
	mov R2,R3
	clr R3
	out 0x1f,R2
	.dbline 63
;  EEARL=Address&0x00ff;    //�͵͵�ַ
	movw R24,R20
	andi R25,0
	out 0x1e,R24
	.dbline 64
;  EECR=EECR|0x01;          //��ʹ����λ
	sbi 0x1c,0
	.dbline 65
;  DelayMs(5);              //��ʱ
	ldi R16,5
	ldi R17,0
	xcall _DelayMs
	.dbline 66
;  i=EEDR;                  //������
	in R20,0x1d
	.dbline 67
;  return(i);
	mov R16,R20
	.dbline -2
L19:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r Address 20 i
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 73
; }
; /**********************************************************************
; 								������								   	
; **********************************************************************/
; void main(void)
; {uchar i;
	.dbline 74
;  Init_IO();                    //��ʼ��I/O��
	xcall _Init_IO
	.dbline 75
;  PORTA=0x00;                   //�����Բ������е������
	clr R2
	out 0x1b,R2
	.dbline 76
;  PORTC=0xff;   
	ldi R24,255
	out 0x15,R24
	.dbline 77
;  DelayMs(300);                 //��ʱ
	ldi R16,300
	ldi R17,1
	xcall _DelayMs
	.dbline 78
;  PORTC=0xff;                   //Ϩ�����е������
	ldi R24,255
	out 0x15,R24
	.dbline 79
;  for(i=0;i<4;i++)              //д��λ���ݣ�0x00��0x04��0x08��0x0c
	clr R20
	xjmp L26
L23:
	.dbline 80
	mov R18,R20
	clr R19
	ldi R24,4
	mul R24,R20
	mov R16,R0
	xcall _Write_EEPROM
L24:
	.dbline 79
	inc R20
L26:
	.dbline 79
	cpi R20,4
	brlo L23
	.dbline 81
;     Write_EEPROM(4*i,i);       //д��λ���ݣ�0x00��0x04��0x08��0x0c
;  for(i=0;i<4;i++)
	clr R20
	xjmp L30
L27:
	.dbline 82
	mov R16,R20
	clr R17
	xcall _Read_EEPROM
	ldi R24,<_Read_Data
	ldi R25,>_Read_Data
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R16
L28:
	.dbline 81
	inc R20
L30:
	.dbline 81
	cpi R20,4
	brlo L27
	xjmp L32
L31:
	.dbline 84
	ldi R16,<_Read_Data
	ldi R17,>_Read_Data
	xcall _Display
L32:
	.dbline 83
	xjmp L31
X2:
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA16\Eeprom��c���Ա��\icc\chengxu.c
_Read_Data::
	.blkb 4
	.dbsym e Read_Data _Read_Data A[4:4]c
