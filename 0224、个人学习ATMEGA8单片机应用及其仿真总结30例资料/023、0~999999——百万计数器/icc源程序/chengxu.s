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
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.dbsym e Data _Data A[6:6]c
_y::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.dbsym e y _y c
_j::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.dbsym e j _j c
_k::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.dbsym e k _k c
	.area text(rom, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 29
; #include <iom8v.h>
; //#include <macros.h> 
; /********************************************************************
;                 �������Ͷ���
; *********************************************************************/
; #define uchar unsigned char
; /*�궨���ַ�����*/
; #define uint  unsigned int
; /*�궨��������*/
; #define WEI PORTC
; /*�궨��λ��ΪPC��*/
; #define DUAN PORTB
; /*�궨�����ΪPB��*/
; 
; uchar key_up;//������־
; /********************************************************************
;                 ����ܶ��붨��0123456789
; *********************************************************************/
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};//����ܶ������
; uchar Data[6]={0,0,0,0,0,0};    //��ʾ��ʼֵ��0 0 0 0 0 0
; uchar y=0;                      //��λʮλ����ֵ��0 
; uchar j=0;						//��λǧλ����ֵ��0
; uchar k=0;						//��λʮ��λ����ֵ��0
; 
; /**********************************************************************
; 				  MS����ʱ�������򣬲���i ��ʱʱ��					   	
; **********************************************************************/
; void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
; {uint j;
	.dbline 30
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 31
	.dbline 31
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 31
	.dbline 31
	.dbline 31
L7:
	.dbline 31
	subi R20,1
	sbci R21,0
L9:
	.dbline 31
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 31
L3:
	.dbline 30
	subi R16,1
	sbci R17,0
L5:
	.dbline 30
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
	.dbline 38
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            ��ʾ����		
; 
; **********************************************************************/
; void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
; {
	.dbline 39
;  uchar i,sel=0x01;             //��λ��ʼֵ
	ldi R20,1
	.dbline 40
;  for(i=0;i<6;i++)
	clr R22
	xjmp L14
L11:
	.dbline 41
	.dbline 42
	out 0x15,R20
	.dbline 43
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
	out 0x18,R2
	.dbline 44
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 45
	lsl R20
	.dbline 46
L12:
	.dbline 40
	inc R22
L14:
	.dbline 40
	cpi R22,6
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
	.dbfunc e Process _Process fV
;              p -> R20,R21
;              i -> R22
	.even
_Process::
	xcall push_gset2
	movw R20,R18
	mov R22,R16
	.dbline -1
	.dbline 52
;   {
;    WEI=sel;                    //ѡͨ���ұߵ������
;    DUAN=~Table[p[i]];          //��������
;    DelayMs(1);                 //��ʱ    
;    sel=sel<<1;                 //��λ����ʾǰһλ
;   }
; }
; 
; //����ֵ������������i:����ֵ������p:�������ݴ�ŵ�������//
; //���ܣ��˺������ڽ�����ֵ���ΪBCD���ʮ����ǧ���٣�ʮ��һ���ݣ����ڲ����ʾ//
; void Process(uchar i,uchar *p) 
; {
	.dbline 53
;  i=TCNT0;
	in R22,0x32
	.dbline 54
;  if(i>=100){j++;TCNT0=0;}//���iֵ���ڵ���100,jֵ��1�������Ĵ�������ֵ��
	cpi R22,100
	brlo L16
	.dbline 54
	.dbline 54
	lds R24,_j
	subi R24,255    ; addi 1
	sts _j,R24
	.dbline 54
	clr R2
	out 0x32,R2
	.dbline 54
L16:
	.dbline 55
;  y=i;
	sts _y,R22
	.dbline 56
;  p[5]=i%10;
	ldi R17,10
	mov R16,R22
	xcall mod8u
	movw R30,R20
	std z+5,R16
	.dbline 57
;  p[4]=i/10;
	ldi R17,10
	mov R16,R22
	xcall div8u
	movw R30,R20
	std z+4,R16
	.dbline 58
;  if(j>=100){k++;j=0;}	   //���jֵ���ڵ���100,kֵ��1��jֵ����ֵ��											  
	lds R24,_j
	cpi R24,100
	brlo L18
	.dbline 58
	.dbline 58
	lds R24,_k
	subi R24,255    ; addi 1
	sts _k,R24
	.dbline 58
	clr R2
	sts _j,R2
	.dbline 58
L18:
	.dbline 59
;  p[3]=j%10;
	ldi R17,10
	lds R16,_j
	xcall mod8u
	movw R30,R20
	std z+3,R16
	.dbline 60
;  p[2]=j/10;
	ldi R17,10
	lds R16,_j
	xcall div8u
	movw R30,R20
	std z+2,R16
	.dbline 61
;  if(k>=100){k=0;}	       //���jֵ���ڵ���100,kֵ��1��jֵ����ֵ��		
	lds R24,_k
	cpi R24,100
	brlo L20
	.dbline 61
	.dbline 61
	clr R2
	sts _k,R2
	.dbline 61
L20:
	.dbline 62
;  p[1]=k%10;
	ldi R17,10
	lds R16,_k
	xcall mod8u
	movw R30,R20
	std z+1,R16
	.dbline 63
;  p[0]=k/10;
	ldi R17,10
	lds R16,_k
	xcall div8u
	movw R30,R20
	std z+0,R16
	.dbline -2
L15:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r p 20 pc
	.dbsym r i 22 c
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 70
; }
; 
; /**********************************************************************
; 				           ��ʼ��I/O			   	
; **********************************************************************/
; void Init_IO(void)             //��ʼ��I/O��
; {
	.dbline 71
;  DDRB=0xff;                    //����B��Ϊ����1���
	ldi R24,255
	out 0x17,R24
	.dbline 72
;  DUAN=0xff;
	out 0x18,R24
	.dbline 73
;  DDRD=0x00;                    //����D��Ϊ����������������
	clr R2
	out 0x11,R2
	.dbline 74
;  PORTD=0x00;    
	out 0x12,R2
	.dbline 75
;  DDRC=0xff;                    //����C��Ϊ����1�����             
	out 0x14,R24
	.dbline 76
;  WEI=0xff;
	out 0x15,R24
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e get_key _get_key fV
	.even
_get_key::
	.dbline -1
	.dbline 83
	.dbline 84
	sbic 0x10,5
	rjmp L24
	.dbline 84
	.dbline 84
	ldi R24,1
	sts _key_up,R24
	.dbline 84
L24:
	.dbline -2
L23:
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
	.dbline 93
; }
; /**********************************************************************
; 				          ����ɨ�躯��		   	
; **********************************************************************/
; 
; void get_key(void)//����ɨ�躯��
; {
; if((PIND&0X20)==0){key_up=1;}//ȷ�����㰴������
; //if((PIND&0X40)==0){key_down=1;}
; }
; /**********************************************************************
; 		  дһ�ֽڵ�EEPROM����	
; 		������Date��д������ݣ�  
; 		    Address:д��ĵ�ַ					   	
; **********************************************************************/
; void Write_EEPROM(uchar Data,uint Address)
; {if(EECR&0x20) DelayMs(4);//�ж�дʹ���Ƿ�Ϊ0
	.dbline 93
	sbis 0x1c,5
	rjmp L27
	.dbline 93
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
L27:
	.dbline 94
;  EEARH=Address>>8;        //�͸ߵ�ַ
	movw R2,R22
	mov R2,R3
	clr R3
	out 0x1f,R2
	.dbline 95
;  EEARL=Address&0x00ff;    //�͵͵�ַ
	movw R24,R22
	andi R25,0
	out 0x1e,R24
	.dbline 96
;  EEDR=Data;               //������
	out 0x1d,R20
	.dbline 97
;  EECR=EECR|0x04;          //��дʹ����λ
	sbi 0x1c,2
	.dbline 98
;  EECR=EECR|0x02;          //дʹ����λ
	sbi 0x1c,1
	.dbline 99
;  DelayMs(4);              //��ʱ��д��ʱ��Լ��2.5ms~4ms��
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
	.dbline -2
L26:
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
	.dbline 106
; }
; /**********************************************************************
; 			��һ�ֽڵ�EEPROM����	
; 		����:Address��д��ĵ�ַ������ֵ����ȡ������							   	
; **********************************************************************/
; uchar Read_EEPROM(uint Address)
; {uchar i;
	.dbline 107
;  if(EECR&0x01) DelayMs(4);//�ж϶�ʹ���Ƿ�Ϊ0
	sbis 0x1c,0
	rjmp L30
	.dbline 107
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
L30:
	.dbline 108
;  EEARH=Address>>8;        //�͸ߵ�ַ
	movw R2,R20
	mov R2,R3
	clr R3
	out 0x1f,R2
	.dbline 109
;  EEARL=Address&0x00ff;    //�͵͵�ַ
	movw R24,R20
	andi R25,0
	out 0x1e,R24
	.dbline 110
;  EECR=EECR|0x01;          //��ʹ����λ
	sbi 0x1c,0
	.dbline 111
;  DelayMs(5);              //��ʱ
	ldi R16,5
	ldi R17,0
	xcall _DelayMs
	.dbline 112
;  i=EEDR;                  //������
	in R20,0x1d
	.dbline 113
;  return(i);
	mov R16,R20
	.dbline -2
L29:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r Address 20 i
	.dbend
	.dbfunc e main _main fV
;           Load -> <dead>
	.even
_main::
	.dbline -1
	.dbline 119
; }
; /**********************************************************************
; 				          ������		   	
; **********************************************************************/
; void main(void)
; {
	.dbline 121
;  uchar Load;   				   //�����ַ�����Load									   
;  Init_IO();                    //��ʼ��I/O��
	xcall _Init_IO
	.dbline 122
;  DUAN=0xff;                    //�����Բ������е�����ܿ��ƶ�
	ldi R24,255
	out 0x18,R24
	.dbline 123
;  WEI=0x00;                     //�����Բ������е�����ܿ���λ
	clr R2
	out 0x15,R2
	.dbline 124
;  DelayMs(30);                  //��ʱ
	ldi R16,30
	ldi R17,0
	xcall _DelayMs
	.dbline 125
;  PORTC=0xff;                   //Ϩ�����е������
	ldi R24,255
	out 0x15,R24
	.dbline 126
;  TCCR0=0x06;                   //T/C0�����ڼ�����ʽ���½��ؼ���
	ldi R24,6
	out 0x33,R24
	.dbline 127
;  y=Read_EEPROM(1);//������λʮλ����
	ldi R16,1
	ldi R17,0
	xcall _Read_EEPROM
	sts _y,R16
	.dbline 128
;  j=Read_EEPROM(2);//������λǧλ����
	ldi R16,2
	ldi R17,0
	xcall _Read_EEPROM
	sts _j,R16
	.dbline 129
;  k=Read_EEPROM(3);//������λʮ��λ����
	ldi R16,3
	ldi R17,0
	xcall _Read_EEPROM
	sts _k,R16
	.dbline 130
;  TCNT0=y;                    //������ʼ��ֵ
	lds R2,_y
	out 0x32,R2
	xjmp L34
L33:
	.dbline 132
;  while(1)					 //ִ������ѭ��
;  {
	.dbline 133
;   if(key_up==1){TCNT0=0;j=0;k=0;key_up=0;}
	lds R24,_key_up
	cpi R24,1
	brne L36
	.dbline 133
	.dbline 133
	clr R2
	out 0x32,R2
	.dbline 133
	sts _j,R2
	.dbline 133
	sts _k,R2
	.dbline 133
	sts _key_up,R2
	.dbline 133
L36:
	.dbline 134
	ldi R18,<_Data
	ldi R19,>_Data
	lds R16,_y
	xcall _Process
	.dbline 135
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 136
	xcall _get_key
	.dbline 137
	ldi R18,1
	ldi R19,0
	lds R16,_y
	xcall _Write_EEPROM
	.dbline 138
	ldi R18,2
	ldi R19,0
	lds R16,_j
	xcall _Write_EEPROM
	.dbline 139
	ldi R18,3
	ldi R19,0
	lds R16,_k
	xcall _Write_EEPROM
	.dbline 140
L34:
	.dbline 131
	xjmp L33
X2:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbsym l Load 1 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\���������װ\001��0~999999�������������\����2\iccԴ����\chengxu.c
_key_up::
	.blkb 1
	.dbsym e key_up _key_up c
