	.module chengxu.c
	.area data(ram, con, rel)
_Table::
	.blkb 2
	.area idata
	.byte 192,249
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 164,176
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 153,146
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 130,248
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 128,144
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、模拟采集串口发送程序\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_wei::
	.blkb 2
	.area idata
	.byte 224,208
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、模拟采集串口发送程序\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 176,'p
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、模拟采集串口发送程序\icc\chengxu.c
	.dbsym e wei _wei A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、模拟采集串口发送程序\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 16
; #include <iom8v.h>
; #include <macros.h> 
; #define uchar unsigned char
; #define uint  unsigned int
; /********************************************************************
;                 数码管段码定义0123456789
; *********************************************************************/
; uchar Table[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
; //uchar wei[4]={0X10,0X20,0X40,0X80};  //位的控制端	(仿真) 
; uchar wei[4]={0Xe0,0Xd0,0Xb0,0X70};  //位的控制端	(板子) 
; uint z,x,c,v,date;	//定义数据类型 
; /**********************************************************************
; 								延时函数								   	
; **********************************************************************/
; void DelayMs(uint i)  //0.25ms
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
	.dbfunc e Pre_Display _Pre_Display fV
	.even
_Pre_Display::
	.dbline -1
	.dbline 24
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
;                 数码管动态扫描
; *********************************************************************/
; void Pre_Display()
;  { 
	.dbline 27
; 
;  /***********************数据转换*****************************/ 
;   z=date/1000;			 //求千位
	ldi R18,1000
	ldi R19,3
	lds R16,_date
	lds R17,_date+1
	xcall div16u
	sts _z+1,R17
	sts _z,R16
	.dbline 28
;   x=date%1000/100;		 //求百位
	ldi R18,1000
	ldi R19,3
	lds R16,_date
	lds R17,_date+1
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _x+1,R17
	sts _x,R16
	.dbline 29
;   c=date%100/10;		 //求十位
	ldi R18,100
	ldi R19,0
	lds R16,_date
	lds R17,_date+1
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _c+1,R17
	sts _c,R16
	.dbline 30
;   v=date%10;			 //求个位
	ldi R18,10
	ldi R19,0
	lds R16,_date
	lds R17,_date+1
	xcall mod16u
	sts _v+1,R17
	sts _v,R16
	.dbline 32
; 
;       PORTD=wei[0];
	lds R2,_wei
	out 0x12,R2
	.dbline 33
; 	  PORTB=Table[z];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_z
	lds R31,_z+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 34
; 	  DelayMs(1);  
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 35
;   	  PORTD=wei[1];
	lds R2,_wei+1
	out 0x12,R2
	.dbline 36
;       PORTB=Table[x];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_x
	lds R31,_x+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 37
; 	  DelayMs(1);  
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 38
;    	  PORTD=wei[2];
	lds R2,_wei+2
	out 0x12,R2
	.dbline 39
;       PORTB=Table[c];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_c
	lds R31,_c+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 40
; 	  DelayMs(1);  
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 41
;       PORTD=wei[3];
	lds R2,_wei+3
	out 0x12,R2
	.dbline 42
;       PORTB=Table[v];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_v
	lds R31,_v+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 43
; 	  DelayMs(1);  
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ADC_Convert _ADC_Convert fi
;          temp1 -> R22,R23
;          temp2 -> R20,R21
	.even
_ADC_Convert::
	xcall push_gset2
	.dbline -1
	.dbline 49
;   }
; /**********************************************************************
; 								电压值处理函数								   	
; **********************************************************************/
; uint ADC_Convert(void)
; {uint temp1,temp2;
	.dbline 50
;  temp1=(uint)ADCL;//先读ADCL
	in R22,0x4
	clr R23
	.dbline 51
;  temp2=(uint)ADCH;//再读ADCH
	in R20,0x5
	clr R21
	.dbline 52
;  temp2=(temp2<<8)+temp1;//求值
	movw R2,R20
	mov R3,R2
	clr R2
	add R2,R22
	adc R3,R23
	.dbline 53
;  temp2=temp2*49/10;//求显示的电压值（0~5.12）V
	ldi R16,49
	ldi R17,0
	movw R18,R2
	xcall empy16s
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R20,R16
	.dbline 54
;  return(temp2);
	.dbline -2
L14:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r temp1 22 i
	.dbsym r temp2 20 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 60
; }
; /**********************************************************************
;                       初始化I/O口
; **********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {
	.dbline 61
;  DDRC=0x00;                    //设置C口为不带上拉输入；
	clr R2
	out 0x14,R2
	.dbline 62
;  PORTC=0x00;
	out 0x15,R2
	.dbline 63
;  DDRB=0xff;                    //设置B口为推挽1输出；
	ldi R24,255
	out 0x17,R24
	.dbline 64
;  PORTB=0xff;
	out 0x18,R24
	.dbline 65
;  DDRD=0xFF;                    //设置D口为推挽1输出；
	out 0x11,R24
	.dbline 66
;  PORTD=0xFF;
	out 0x12,R24
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Uart_Init _Uart_Init fV
	.even
_Uart_Init::
	.dbline -1
	.dbline 72
; }
; /********************************************************************
;                       串口初始化子程序
; *********************************************************************/
; void Uart_Init(void)
; {
	.dbline 73
;     UCSRB  =  0x00;     //disable while setting baud rate
	clr R2
	out 0xa,R2
	.dbline 74
;     UCSRA  =  0x00;     //Bit1为1则倍速发送
	out 0xb,R2
	.dbline 75
;     UCSRC  =  0x86;  
	ldi R24,134
	out 0x20,R24
	.dbline 76
;     UBRRL  =  0x33;     //波特率：9600 Bps
	ldi R24,51
	out 0x9,R24
	.dbline 77
;     UBRRH  =  0x00;     //误差率：0.156%
	out 0x20,R2
	.dbline 78
;     UCSRB  =  0x18;  
	ldi R24,24
	out 0xa,R24
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Putchar _Putchar fV
;              c -> R16
	.even
_Putchar::
	.dbline -1
	.dbline 84
; }
; /********************************************************************
;                      串口发送字节子程序
; *********************************************************************/
; void Putchar(unsigned char c)
; {
L18:
	.dbline 85
L19:
	.dbline 85
;    while (!(UCSRA&(1<<UDRE)));
	sbis 0xb,5
	rjmp L18
	.dbline 86
;    UDR=c;
	out 0xc,R16
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbsym r c 16 c
	.dbend
	.dbfunc e main _main fV
;              i -> R20,R21
;            TXD -> R22,R23
	.even
_main::
	.dbline -1
	.dbline 92
; }
; /**********************************************************************
; 								主函数								   	
; **********************************************************************/
; void main(void)
; {uint i;
	.dbline 94
;  uint TXD;
;  Init_IO();
	xcall _Init_IO
	.dbline 95
;  Uart_Init();
	xcall _Uart_Init
	.dbline 96
;  ADMUX=0x00;                   //选择第一通道；
	clr R2
	out 0x7,R2
	.dbline 98
;  /**********************转换速率应在50~200K****************************/
;  ADCSR=0xe6;                   //125K转换速率，自由转换模式；启动AD转换器；
	ldi R24,230
	out 0x6,R24
	.dbline 99
;  DelayMs(1);                //延时待系统稳定；
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	xjmp L23
L22:
	.dbline 101
;  while(1)
;  {
	.dbline 103
;  
;  i=ADC_Convert();   //显示电压值(0~1024)
	xcall _ADC_Convert
	movw R20,R16
	.dbline 104
;  date=i;           
	sts _date+1,R21
	sts _date,R20
	.dbline 105
;  TXD=i/19;          //串口发送数据（0~255）
	ldi R18,19
	ldi R19,0
	xcall div16u
	movw R22,R16
	.dbline 106
;  if(TXD>=255)TXD=255;
	cpi R16,255
	ldi R30,0
	cpc R17,R30
	brlo L25
	.dbline 106
	ldi R22,255
	ldi R23,0
L25:
	.dbline 107
;  if(TXD<=0)TXD=0;
	cpi R22,0
	cpc R22,R23
	brne L27
X2:
	.dbline 107
	clr R22
	clr R23
L27:
	.dbline 108
	mov R16,R22
	xcall _Putchar
	.dbline 109
	xcall _Pre_Display
	.dbline 111
L23:
	.dbline 100
	xjmp L22
X3:
	.dbline -2
L21:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r TXD 22 i
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\020、模拟采集串口发送程序\icc\chengxu.c
_date::
	.blkb 2
	.dbsym e date _date i
_v::
	.blkb 2
	.dbsym e v _v i
_c::
	.blkb 2
	.dbsym e c _c i
_x::
	.blkb 2
	.dbsym e x _x i
_z::
	.blkb 2
	.dbsym e z _z i
