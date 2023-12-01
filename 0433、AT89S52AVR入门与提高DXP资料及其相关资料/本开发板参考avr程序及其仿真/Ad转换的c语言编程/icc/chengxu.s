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
	.dbfile D:\Proteus\ATMEGA16\Ad转换的c语言编程\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA16\Ad转换的c语言编程\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA16\Ad转换的c语言编程\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\Proteus\ATMEGA16\Ad转换的c语言编程\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 14
; #include <iom16v.h>
; #include <macros.h> 
; #define uchar unsigned char
; #define uint  unsigned int
; /**********************************************************************
; 								定义数组								   	
; **********************************************************************/
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
; uchar Data[4]={0,0,0,0};
; /**********************************************************************
; 								延时函数								   	
; **********************************************************************/
; void DelayMs(uint i)  //0.25ms
; {uchar j;
	.dbline 15
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 16
	.dbline 16
	ldi R20,250
	xjmp L9
L6:
	.dbline 16
	.dbline 16
	.dbline 16
L7:
	.dbline 16
	dec R20
L9:
	.dbline 16
	tst R20
	brne L6
	.dbline 16
L3:
	.dbline 15
	subi R16,1
	sbci R17,0
L5:
	.dbline 15
	cpi R16,0
	cpc R16,R17
	brne L2
X0:
	.dbline -2
L1:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 c
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
	.dbline 22
;   {for(j=250;j!=0;j--) {;}}
; }
; /**********************************************************************
; 								显示函数								   	
; **********************************************************************/
; void Display(uchar *p) //间隔5ms显示
; {uchar i,sel=0x01;
	.dbline 22
	ldi R20,1
	.dbline 23
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 24
	.dbline 24
	out 0x12,R20
	.dbline 25
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
	out 0x18,R24
	.dbline 26
	ldi R16,20
	ldi R17,0
	xcall _DelayMs
	.dbline 27
	lsl R20
	.dbline 28
L12:
	.dbline 23
	inc R22
L14:
	.dbline 23
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
	.dbfunc e ADC_Convert _ADC_Convert fi
;          temp1 -> R22,R23
;          temp2 -> R20,R21
	.even
_ADC_Convert::
	xcall push_gset2
	.dbline -1
	.dbline 34
;   {PORTD=sel;
;    PORTB=0xff-Table[p[i]];
;    DelayMs(20);
;    sel=sel<<1;
;   }
; }
; /**********************************************************************
; 								电压值处理								   	
; **********************************************************************/
; uint ADC_Convert(void)
; {uint temp1,temp2;
	.dbline 35
;  temp1=(uint)ADCL;
	in R22,0x4
	clr R23
	.dbline 36
;  temp2=(uint)ADCH;
	in R20,0x5
	clr R21
	.dbline 40
;  //temp1=2;
;  //temp2=1;
;  //temp2=2356;
;  temp2=(temp2<<8)+temp1;
	movw R2,R20
	mov R3,R2
	clr R2
	add R2,R22
	adc R3,R23
	.dbline 41
;  temp2=temp2*4;
	ldi R16,4
	ldi R17,0
	movw R18,R2
	xcall empy16s
	movw R20,R16
	.dbline 42
;  return(temp2);
	.dbline -2
L15:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r temp1 22 i
	.dbsym r temp2 20 i
	.dbend
	.dbfunc e Process _Process fV
;              p -> R20,R21
;              i -> R22,R23
	.even
_Process::
	xcall push_gset2
	movw R20,R18
	movw R22,R16
	.dbline -1
	.dbline 48
; }
; /**********************************************************************
; 								显示处理								   	
; **********************************************************************/
; void Process(uint i,uchar *p)
; {p[0]=i/1000;
	.dbline 48
	ldi R18,1000
	ldi R19,3
	movw R16,R22
	xcall div16u
	movw R30,R20
	std z+0,R16
	.dbline 49
;  i=i%1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 50
;  p[1]=i/100;
	ldi R18,100
	ldi R19,0
	xcall div16u
	movw R30,R20
	std z+1,R16
	.dbline 51
;  i=i%100;
	ldi R18,100
	ldi R19,0
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 52
;  p[2]=i/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R30,R20
	std z+2,R16
	.dbline 53
;  i=i%10;
	ldi R18,10
	ldi R19,0
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 54
;  p[3]=i;
	movw R30,R20
	std z+3,R22
	.dbline -2
L16:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r p 20 pc
	.dbsym r i 22 i
	.dbend
	.dbfunc e main _main fV
;              i -> R20,R21
	.even
_main::
	.dbline -1
	.dbline 60
; }
; /**********************************************************************
; 								主函数								   	
; **********************************************************************/
; void main(void)
; {uint i;
	.dbline 61
;  DDRA=0x00;                    //设置A口为不带上拉输入；
	clr R2
	out 0x1a,R2
	.dbline 62
;  PORTA=0x00;
	out 0x1b,R2
	.dbline 63
;  DDRB=0xff;                    //设置B口为推挽1输出；
	ldi R24,255
	out 0x17,R24
	.dbline 64
;  PORTB=0xff;
	out 0x18,R24
	.dbline 65
;  DDRD=0xff;                    //设置C口为推挽1输出；
	out 0x11,R24
	.dbline 66
;  PORTD=0xff;
	out 0x12,R24
	.dbline 67
;  PORTB=0x00;                   //B口初始化输出1；C口初始化输出0；点亮全部数码管；
	out 0x18,R2
	.dbline 68
;  PORTD=0xff;
	out 0x12,R24
	.dbline 69
;  ADMUX=0x00;                   //选择第一通道；
	out 0x7,R2
	.dbline 70
;  ADCSR=0xe6;                   //125K转换速率，自由转换模式；启动AD转换器；
	ldi R24,230
	out 0x6,R24
	.dbline 71
;  DelayMs(3000);                //延时待系统稳定；
	ldi R16,3000
	ldi R17,11
	xcall _DelayMs
	xjmp L19
L18:
	.dbline 73
	.dbline 74
	xcall _ADC_Convert
	movw R20,R16
	.dbline 76
	ldi R18,<_Data
	ldi R19,>_Data
	xcall _Process
	.dbline 77
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 78
L19:
	.dbline 72
	xjmp L18
X1:
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbend
