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
	.dbfile D:\整理\个人总结的M8程序\008、基于T_CO的计数器设计\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\008、基于T_CO的计数器设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\008、基于T_CO的计数器设计\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
_CNT::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\008、基于T_CO的计数器设计\icc\chengxu.c
	.dbsym e CNT _CNT i
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\008、基于T_CO的计数器设计\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 19
; #include <iom8v.h>
; /********************************************************************
;                 数据类型定义
; *********************************************************************/
; #define uchar unsigned char
; #define uint  unsigned int
; #define WEI PORTC
; #define DUAN PORTB
; /********************************************************************
;                 数码管段码定义0123456789
; *********************************************************************/
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
; uchar Data[4]={0,0,0,0};       //显示初始值：0 0 0 0
; uint  CNT=0;                    //初始计数值：0 
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间					   	
; **********************************************************************/
; void DelayMs(uint i)           //Ms级延时，参数i为延时时间
; {uint j;
	.dbline 20
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 21
	.dbline 21
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 21
	.dbline 21
	.dbline 21
L7:
	.dbline 21
	subi R20,1
	sbci R21,0
L9:
	.dbline 21
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 21
L3:
	.dbline 20
	subi R16,1
	sbci R17,0
L5:
	.dbline 20
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
	.dbline 29
;   {for(j=8000;j!=0;j--) {;}}
; }
; 
; /**********************************************************************
; 				            显示函数		
; 注意：使用开发板时sel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           //注意：使用开发板时sel=0xef;
	.dbline 29
	ldi R20,1
	.dbline 30
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 31
	.dbline 31
	out 0x15,R20
	.dbline 32
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
	.dbline 33
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 34
	lsl R20
	.dbline 35
L12:
	.dbline 30
	inc R22
L14:
	.dbline 30
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
	.dbfunc e Process _Process fV
;              p -> R22,R23
;              i -> R20
	.even
_Process::
	xcall push_gset2
	movw R22,R18
	mov R20,R16
	.dbline -1
	.dbline 41
;   {WEI=sel;                  //选通最右边的数码管
;    DUAN=~Table[p[i]];          //送字型码
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; 
; //计数值处理函数。参数i:计数值；参数p:处理数据存放的数组名//
; //功能：此函数用于将计数值拆分为BCD码的千，百，十，一数据，用于查表显示//
; void Process(uchar i,uchar *p) 
; {p[0]=i/1000;
	.dbline 41
	ldi R18,1000
	ldi R19,3
	mov R16,R20
	clr R17
	xcall div16s
	movw R30,R22
	std z+0,R16
	.dbline 42
;  i=i%1000;
	ldi R18,1000
	ldi R19,3
	mov R16,R20
	clr R17
	xcall mod16s
	mov R20,R16
	.dbline 43
;  p[1]=i/100;
	ldi R17,100
	xcall div8u
	movw R30,R22
	std z+1,R16
	.dbline 44
;  i=i%100;
	ldi R17,100
	mov R16,R20
	xcall mod8u
	mov R20,R16
	.dbline 45
;  p[2]=i/10;
	ldi R17,10
	xcall div8u
	movw R30,R22
	std z+2,R16
	.dbline 46
;  i=i%10;
	ldi R17,10
	mov R16,R20
	xcall mod8u
	mov R20,R16
	.dbline 47
;  p[3]=i;
	movw R30,R22
	std z+3,R20
	.dbline -2
L15:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r p 22 pc
	.dbsym r i 20 c
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 53
; }
; /**********************************************************************
; 				           初始化I/O			   	
; **********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {DDRB=0xff;                    //设置A口为推挽1输出
	.dbline 53
	ldi R24,255
	out 0x17,R24
	.dbline 54
;  DUAN=0xff;
	out 0x18,R24
	.dbline 55
;  DDRD=0x00;                    //设置B口为不带上拉电阻输入
	clr R2
	out 0x11,R2
	.dbline 56
;  PORTD=0x00;    
	out 0x12,R2
	.dbline 57
;  DDRC=0xff;                    //设置C口为推挽1输出；             
	out 0x14,R24
	.dbline 58
;  WEI=0xff;
	out 0x15,R24
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;           Load -> R20
	.even
_main::
	.dbline -1
	.dbline 64
; }
; /**********************************************************************
; 				          主函数		   	
; **********************************************************************/
; void main(void)
; {uchar Load; 
	.dbline 65
;  Init_IO();                    //初始化I/O口
	xcall _Init_IO
	.dbline 66
;  DUAN=0xff;                   //点亮以测试所有的数码管
	ldi R24,255
	out 0x18,R24
	.dbline 67
;  WEI=0x00;                   
	clr R2
	out 0x15,R2
	.dbline 68
;  DelayMs(30);                //延时
	ldi R16,30
	ldi R17,0
	xcall _DelayMs
	.dbline 69
;  PORTC=0xff;                   //熄灭所有的数码管
	ldi R24,255
	out 0x15,R24
	.dbline 70
;  TCCR0=0x06;                   //T/C0工作于计数方式，下降沿计数
	ldi R24,6
	out 0x33,R24
	.dbline 71
;  TCNT0=CNT;                    //计数初始值0    
	lds R2,_CNT
	lds R3,_CNT+1
	out 0x32,R2
	xjmp L19
L18:
	.dbline 73
	.dbline 73
	in R20,0x32
	.dbline 74
	ldi R18,<_Data
	ldi R19,>_Data
	mov R16,R20
	xcall _Process
	.dbline 75
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 76
L19:
	.dbline 72
	xjmp L18
X2:
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbsym r Load 20 c
	.dbend
