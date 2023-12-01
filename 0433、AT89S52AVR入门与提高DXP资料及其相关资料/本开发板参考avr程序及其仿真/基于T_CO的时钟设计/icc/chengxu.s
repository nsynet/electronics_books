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
_Timer::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.dbsym e Timer _Timer A[2:2]c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 11
; #include <iom16v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; uchar Table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};//数字0~9
; uchar Data[4]={0,0,0,0};//位控制
; uchar CNT=0;//计数初值
; uchar Timer[2]={0x00,0x00};//初始时间00:00
; 
; ////////////////////////////////////////////////////////////////////
; void DelayMS(uint i)//延时
;    {
	.dbline 13
;     uint j;
;     for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 14
;         {
	.dbline 15
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 15
L7:
	.dbline 15
	subi R20,1
	sbci R21,0
L9:
	.dbline 15
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 16
L3:
	.dbline 13
	subi R16,1
	sbci R17,0
L5:
	.dbline 13
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
	.dbline 20
;           for(j=8000;j!=0;j--);
;         }
;    }
; //////////////////////////////显示函数//////////////////////////////////////
; void Display(uchar *p)
; {
	.dbline 21
; uchar i,sel=0x01;
	ldi R20,1
	.dbline 22
; for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 23
	.dbline 24
	out 0x15,R20
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
	out 0x12,R2
	.dbline 26
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 27
	lsl R20
	.dbline 28
L12:
	.dbline 22
	inc R22
L14:
	.dbline 22
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
;             p2 -> R20,R21
;             p1 -> R22,R23
	.even
_Process::
	xcall push_gset2
	movw R20,R18
	movw R22,R16
	.dbline -1
	.dbline 36
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
; void Process(uchar *p1,uchar *p2)
; {
	.dbline 37
; p2[0]=p1[0]/10;
	ldi R17,10
	movw R30,R22
	ldd R16,z+0
	xcall div8u
	movw R30,R20
	std z+0,R16
	.dbline 38
; p2[1]=p1[0]-p2[0]*10;
	ldd R2,z+0
	ldi R24,10
	mul R24,R2
	movw R30,R22
	ldd R2,z+0
	sub R2,R0
	movw R30,R20
	std z+1,R2
	.dbline 39
; p2[2]=p1[1]/10;
	ldi R17,10
	movw R30,R22
	ldd R16,z+1
	xcall div8u
	movw R30,R20
	std z+2,R16
	.dbline 40
; p2[3]=p1[1]-p2[2]*10;
	movw R30,R20
	ldd R2,z+2
	ldi R24,10
	mul R24,R2
	movw R30,R22
	ldd R2,z+1
	sub R2,R0
	movw R30,R20
	std z+3,R2
	.dbline -2
L15:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r p2 20 pc
	.dbsym r p1 22 pc
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 44
; }
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 46
; //设置C口为输出
; DDRC=0xFF;
	ldi R24,255
	out 0x14,R24
	.dbline 47
; PORTC=0xFF;
	out 0x15,R24
	.dbline 49
; //设置D口为输出
; DDRD=0XFF;
	out 0x11,R24
	.dbline 50
; PORTD=0xFF;
	out 0x12,R24
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 54
; }
; /////////////////////////////主函数/////////////////////////////////////
; void main(void)
; {
	.dbline 56
; //uchar Load;
; Init_IO();  //初始化I/O
	xcall _Init_IO
	.dbline 57
; PORTC=0XFF; //点亮数码管
	ldi R24,255
	out 0x15,R24
	.dbline 58
; PORTD=0X00; //点亮数码管
	clr R2
	out 0x12,R2
	.dbline 59
; DelayMS(30);//延时
	ldi R16,30
	ldi R17,0
	xcall _DelayMS
	.dbline 60
; PORTD=0xff; //关闭数码管
	ldi R24,255
	out 0x12,R24
	.dbline 61
; TCCR0=0x04; //T/C0工作方式选择，系统时钟256分频
	ldi R24,4
	out 0x33,R24
	.dbline 63
; //(上一句可以改为)TCCR0 |= (1<<CS02);//T/C0工作于定时方式，系统时钟256分频
; TCNT0=0X06; //计数初始值
	ldi R24,6
	out 0x32,R24
	.dbline 64
; TIMSK=0x01;  //使能T0溢出中断
	ldi R24,1
	out 0x39,R24
	.dbline 66
; //(上一句可以改为)TIMSK |= (1<<TOIE0);  //使能T0溢出中断
; SREG=0x80;  //使能全局中断
	ldi R24,128
	out 0x3f,R24
	xjmp L19
L18:
	.dbline 69
	.dbline 70
	ldi R18,<_Data
	ldi R19,>_Data
	ldi R16,<_Timer
	ldi R17,>_Timer
	xcall _Process
	.dbline 71
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 72
L19:
	.dbline 68
	xjmp L18
X2:
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 36
	jmp _Timer0
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	.dbfunc e Timer0 _Timer0 fV
	.even
_Timer0::
	st -y,R2
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 77
; //(上一句可以改为)SREG |= (1<<7);  //使能全局中断
; while(1)
; {
;  Process(Timer,Data);//计数初值处理
;  Display(Data);      //动态扫秒显示
; }
; }
; //////////////////////////T/CO中断服务函数//////////////////////////////////////////
; #pragma interrupt_handler Timer0:10
; void Timer0(void)
; {
	.dbline 78
; CNT++;           //中断次数累加
	lds R24,_CNT
	subi R24,255    ; addi 1
	sts _CNT,R24
	.dbline 79
; if(CNT==125)     //计数到125次，计数复位
	cpi R24,125
	brne L22
	.dbline 80
; {
	.dbline 81
; CNT=0;
	clr R2
	sts _CNT,R2
	.dbline 82
; Timer[1]++;      //秒加1
	lds R24,_Timer+1
	subi R24,255    ; addi 1
	sts _Timer+1,R24
	.dbline 83
; if(Timer[1]==60)
	cpi R24,60
	brne L25
	.dbline 84
; {
	.dbline 85
; Timer[1]=0;
	sts _Timer+1,R2
	.dbline 86
; Timer[0]++;      //分进位
	lds R24,_Timer
	subi R24,255    ; addi 1
	sts _Timer,R24
	.dbline 87
; }
L25:
	.dbline 88
; if(Timer[0]==60)
	lds R24,_Timer
	cpi R24,60
	brne L29
	.dbline 89
; {
	.dbline 90
; Timer[0]=0;      //计数到最高位置位
	clr R2
	sts _Timer,R2
	.dbline 91
; }
L29:
	.dbline 92
L22:
	.dbline -2
L21:
	ld R2,y+
	out 0x3f,R2
	ld R25,y+
	ld R24,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
