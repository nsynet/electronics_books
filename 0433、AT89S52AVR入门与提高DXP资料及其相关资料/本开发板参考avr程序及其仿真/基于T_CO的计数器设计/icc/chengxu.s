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
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
_CNT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.dbsym e CNT _CNT c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 10
; #include <iom16v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; uchar Table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};//数字0~9
; uchar Data[4]={0,0,0,0};//位控制
; uchar CNT=0;//计数初值
; 
; ////////////////////////////////////////////////////////////////////
; void DelayMS(uint i)//延时
;    {
	.dbline 12
;     uint j;
;     for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 13
;         {
	.dbline 14
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 14
L7:
	.dbline 14
	subi R20,1
	sbci R21,0
L9:
	.dbline 14
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 15
L3:
	.dbline 12
	subi R16,1
	sbci R17,0
L5:
	.dbline 12
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
	.dbline 19
;           for(j=8000;j!=0;j--);
;         }
;    }
; //////////////////////////////显示函数//////////////////////////////////////
; void Display(uchar *p)
; {
	.dbline 20
; uchar i,sel=0x01;
	ldi R20,1
	.dbline 21
; for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 22
	.dbline 23
	out 0x15,R20
	.dbline 24
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
	out 0x12,R2
	.dbline 25
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 26
	lsl R20
	.dbline 27
L12:
	.dbline 21
	inc R22
L14:
	.dbline 21
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
	.dbline 35
; {
; PORTC=sel;              //选通最右边的数码管
; PORTD=Table[p[i]];      //送数字码
; DelayMS(1);             //显示延时
; sel=sel<<1;             //移动显示位
; }
; }
; ///////////////////////////////计数值处理函数///////////////////////////////////////
; //计数处理函数
; //参数p1：时间数组名
; //参数p2：显示数组名
; //功能：将计数值拆分为BCD码的10分，分；10秒，秒
; void Process(uchar i,uchar *p)
; {
	.dbline 36
; p[0]=i/1000;
	ldi R18,1000
	ldi R19,3
	mov R16,R20
	clr R17
	xcall div16s
	movw R30,R22
	std z+0,R16
	.dbline 37
; i=i%1000;
	ldi R18,1000
	ldi R19,3
	mov R16,R20
	clr R17
	xcall mod16s
	mov R20,R16
	.dbline 38
; p[1]=i/100;
	ldi R17,100
	xcall div8u
	movw R30,R22
	std z+1,R16
	.dbline 39
; i=i%100;
	ldi R17,100
	mov R16,R20
	xcall mod8u
	mov R20,R16
	.dbline 40
; p[2]=i/10;
	ldi R17,10
	xcall div8u
	movw R30,R22
	std z+2,R16
	.dbline 41
; i=i%10;
	ldi R17,10
	mov R16,R20
	xcall mod8u
	mov R20,R16
	.dbline 42
; p[3]=i;
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
	.dbline 46
; }
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 48
; //设置B口为输入
; DDRB=0x00;
	clr R2
	out 0x17,R2
	.dbline 49
; PORTB=0x00;
	out 0x18,R2
	.dbline 51
; //设置C口为输出
; DDRC=0xFF;
	ldi R24,255
	out 0x14,R24
	.dbline 52
; PORTC=0xFF;
	out 0x15,R24
	.dbline 54
; //设置D口为输出
; DDRD=0XFF;
	out 0x11,R24
	.dbline 55
; PORTD=0xFF;
	out 0x12,R24
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
	.dbline 59
; }
; /////////////////////////////主函数/////////////////////////////////////
; void main(void)
; {
	.dbline 61
; uchar Load;
; Init_IO();  //初始化I/O
	xcall _Init_IO
	.dbline 62
; PORTC=0XFF; //点亮数码管
	ldi R24,255
	out 0x15,R24
	.dbline 63
; PORTD=0X00; //点亮数码管
	clr R2
	out 0x12,R2
	.dbline 64
; DelayMS(30);//延时
	ldi R16,30
	ldi R17,0
	xcall _DelayMS
	.dbline 65
; PORTD=0xff; //关闭数码管
	ldi R24,255
	out 0x12,R24
	.dbline 66
; TCCR0=0x06; //T/C0工作方式选择，系统时钟256分频
	ldi R24,6
	out 0x33,R24
	.dbline 67
; TCNT0=CNT; //计数初始值
	lds R2,_CNT
	out 0x32,R2
	xjmp L19
L18:
	.dbline 73
	.dbline 74
	in R20,0x32
	.dbline 75
	ldi R18,<_Data
	ldi R19,>_Data
	mov R16,R20
	xcall _Process
	.dbline 76
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 77
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
