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
	.dbfile D:\整理\个人总结的M8程序\015、AD转换的c语言编程\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\015、AD转换的c语言编程\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\015、AD转换的c语言编程\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\015、AD转换的c语言编程\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 14
; #include <iom8v.h>
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
	.dbline 23
;   {for(j=250;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            显示函数		
; 注意：使用开发板时sel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           
	.dbline 23
	ldi R20,1
	.dbline 24
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 25
;   {PORTB=sel;                  //选通最右边的数码管
	.dbline 25
	out 0x18,R20
	.dbline 26
;    PORTD=~Table[p[i]];         //送字型码
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
	out 0x12,R2
	.dbline 27
;    if(i==0){PORTB=PORTB&0X7f;} //增加小数点
	tst R22
	brne L15
	.dbline 27
	.dbline 27
	in R24,0x18
	andi R24,127
	out 0x18,R24
	.dbline 27
L15:
	.dbline 28
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 29
	lsl R20
	.dbline 30
L12:
	.dbline 24
	inc R22
L14:
	.dbline 24
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
	.dbline 36
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; /**********************************************************************
; 								电压值处理函数								   	
; **********************************************************************/
; uint ADC_Convert(void)
; {uint temp1,temp2;
	.dbline 37
;  temp1=(uint)ADCL;//先读ADCL
	in R22,0x4
	clr R23
	.dbline 38
;  temp2=(uint)ADCH;//再读ADCH
	in R20,0x5
	clr R21
	.dbline 39
;  temp2=(temp2<<8)+temp1;//求值
	movw R2,R20
	mov R3,R2
	clr R2
	add R2,R22
	adc R3,R23
	.dbline 40
;  temp2=temp2*49/10;//求显示的电压值（0~5.12）V
	ldi R16,49
	ldi R17,0
	movw R18,R2
	xcall empy16s
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R20,R16
	.dbline 41
;  return(temp2);
	.dbline -2
L17:
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
	.dbline 47
; }
; /**********************************************************************
; 								显示处理函数										   	
; **********************************************************************/
; void Process(uint i,uchar *p)
; {p[0]=i/1000;
	.dbline 47
	ldi R18,1000
	ldi R19,3
	movw R16,R22
	xcall div16u
	movw R30,R20
	std z+0,R16
	.dbline 48
;  i=i%1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 49
;  p[1]=i/100;
	ldi R18,100
	ldi R19,0
	xcall div16u
	movw R30,R20
	std z+1,R16
	.dbline 50
;  i=i%100;
	ldi R18,100
	ldi R19,0
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 51
;  p[2]=i/10;
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R30,R20
	std z+2,R16
	.dbline 52
;  i=i%10;
	ldi R18,10
	ldi R19,0
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 53
;  p[3]=i;
	movw R30,R20
	std z+3,R22
	.dbline -2
L18:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r p 20 pc
	.dbsym r i 22 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 59
; }
; /**********************************************************************
;                       初始化I/O口
; **********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {
	.dbline 60
;  DDRC=0x00;                    //设置A口为不带上拉输入；
	clr R2
	out 0x14,R2
	.dbline 61
;  PORTC=0x00;
	out 0x15,R2
	.dbline 62
;  DDRB=0xff;                    //设置B口为推挽1输出；
	ldi R24,255
	out 0x17,R24
	.dbline 63
;  PORTB=0xff;
	out 0x18,R24
	.dbline 64
;  DDRD=0xff;                    //设置C口为推挽1输出；
	out 0x11,R24
	.dbline 65
;  PORTD=0xff;
	out 0x12,R24
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R20,R21
	.even
_main::
	.dbline -1
	.dbline 71
; }
; /**********************************************************************
; 								主函数								   	
; **********************************************************************/
; void main(void)
; {uint i;
	.dbline 72
;  Init_IO();
	xcall _Init_IO
	.dbline 73
;  ADMUX=0x00;                   //选择第一通道；
	clr R2
	out 0x7,R2
	.dbline 75
;  /**********************转换速率应在50~200K****************************/
;  ADCSR=0xe6;                   //125K转换速率，自由转换模式；启动AD转换器；
	ldi R24,230
	out 0x6,R24
	.dbline 76
;  DelayMs(300);                //延时待系统稳定；
	ldi R16,300
	ldi R17,1
	xcall _DelayMs
	xjmp L22
L21:
	.dbline 78
	.dbline 79
	xcall _ADC_Convert
	movw R20,R16
	.dbline 80
	ldi R18,<_Data
	ldi R19,>_Data
	xcall _Process
	.dbline 81
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 82
L22:
	.dbline 77
	xjmp L21
X1:
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbend
