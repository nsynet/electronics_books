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
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于T_CO的时钟设计-2\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于T_CO的时钟设计-2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于T_CO的时钟设计-2\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
_CNT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于T_CO的时钟设计-2\icc\chengxu.c
	.dbsym e CNT _CNT c
_Timer::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于T_CO的时钟设计-2\icc\chengxu.c
	.dbsym e Timer _Timer A[2:2]c
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于T_CO的时钟设计-2\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 12
; #include <iom16v.h>
; #define uchar unsigned char
; #define uint  unsigned int
; 
; //数码管字型表，对应0，1，2，3，4，5，6，7，8，9//
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
; uchar Data[4]={0,0,0,0};       //显示初始值：0 0 0 0
; uchar CNT=0;                   //初始计数值：0
; uchar Timer[2]={0x00,0x00};    //初始时间00：00 
; 
; void DelayMs(uint i)           //Ms级延时，参数i为延时时间
; {uint j;
	.dbline 13
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 14
	.dbline 14
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 14
	.dbline 14
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
	.dbline 14
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
	.dbline 18
;   {for(j=8000;j!=0;j--) {;}}
; }
; 
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           
	.dbline 18
	ldi R20,1
	.dbline 19
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 20
	.dbline 20
	out 0x15,R20
	.dbline 21
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
	out 0x1b,R2
	.dbline 22
	ldi R16,2
	ldi R17,0
	xcall _DelayMs
	.dbline 23
	lsl R20
	.dbline 24
L12:
	.dbline 19
	inc R22
L14:
	.dbline 19
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
	.dbline 30
;   {PORTC=sel;                  //选通最右边的数码管
;    PORTA=Table[p[i]];          //送字型码
;    DelayMs(2);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; 
; //计数值处理函数。参数p1:时间数组名；参数p2:显示数组名//
; //功能：此函数用于将计数值拆分为BCD码的10分，分，10秒，秒//
; void Process(uchar *p1,uchar *p2) 
; {p2[0]=p1[0]/10;
	.dbline 30
	ldi R17,10
	movw R30,R22
	ldd R16,z+0
	xcall div8u
	movw R30,R20
	std z+0,R16
	.dbline 31
;  p2[1]=p1[0]-p2[0]*10;
	ldd R2,z+0
	ldi R24,10
	mul R24,R2
	movw R30,R22
	ldd R2,z+0
	sub R2,R0
	movw R30,R20
	std z+1,R2
	.dbline 32
;  p2[2]=p1[1]/10;
	ldi R17,10
	movw R30,R22
	ldd R16,z+1
	xcall div8u
	movw R30,R20
	std z+2,R16
	.dbline 33
;  p2[3]=p1[1]-p2[2]*10;
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
	.dbline 37
; }
; 
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 37
	ldi R24,255
	out 0x1a,R24
	.dbline 38
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 39
;  DDRC=0xff;                    //设置C口为推挽1输出；             
	out 0x14,R24
	.dbline 40
;  PORTC=0xff;
	out 0x15,R24
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;           Load -> <dead>
	.even
_main::
	.dbline -1
	.dbline 44
; }
; 
; void main(void)
; {uchar Load; 
	.dbline 45
;  Init_IO();                    //初始化I/O口
	xcall _Init_IO
	.dbline 46
;  PORTA=0xff;                   //点亮以测试所有的数码管
	ldi R24,255
	out 0x1b,R24
	.dbline 47
;  PORTC=0x00;                   
	clr R2
	out 0x15,R2
	.dbline 48
;  DelayMs(30);                //延时
	ldi R16,30
	ldi R17,0
	xcall _DelayMs
	.dbline 49
;  PORTC=0xff;                   //熄灭所有的数码管
	ldi R24,255
	out 0x15,R24
	.dbline 50
;  TCCR0=0x04;                   //T/C0工作于定时方式，系统时钟256分频
	ldi R24,4
	out 0x33,R24
	.dbline 51
;  TCNT0=0x06;   
	ldi R24,6
	out 0x32,R24
	.dbline 52
;  SREG=0X80;
	ldi R24,128
	out 0x3f,R24
	.dbline 53
;  TIMSK=0X01;                //计数初始值6    
	ldi R24,1
	out 0x39,R24
	xjmp L19
L18:
	.dbline 55
	.dbline 55
	ldi R18,<_Data
	ldi R19,>_Data
	ldi R16,<_Timer
	ldi R17,>_Timer
	xcall _Process
	.dbline 56
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 57
L19:
	.dbline 54
	xjmp L18
X2:
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbsym l Load 1 c
	.dbend
	.area vector(rom, abs)
	.org 36
	jmp _Timer0
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于T_CO的时钟设计-2\icc\chengxu.c
	.dbfunc e Timer0 _Timer0 fV
	.even
_Timer0::
	st -y,R2
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 63
;  while(1)
;  {Process(Timer,Data);          //计数值处理
;   Display(Data);               //动态扫描显示
;  }
; }
; 
; //********************T/C0中断服务函数********************//
; #pragma interrupt_handler Timer0:10 
; void Timer0(void)
; {CNT++;                        //中断次数累加
	.dbline 63
	lds R24,_CNT
	subi R24,255    ; addi 1
	sts _CNT,R24
	.dbline 64
;  if(CNT==125)           
	cpi R24,125
	brne L22
	.dbline 65
;     {CNT=0;                    //计数到125次，计数值复位
	.dbline 65
	clr R2
	sts _CNT,R2
	.dbline 66
; 	 Timer[1]++;               //秒加1
	lds R24,_Timer+1
	subi R24,255    ; addi 1
	sts _Timer+1,R24
	.dbline 67
; 	 if(Timer[1]==60)
	cpi R24,60
	brne L25
	.dbline 68
; 	    {Timer[1]=0;
	.dbline 68
	sts _Timer+1,R2
	.dbline 69
; 		 Timer[0]++;}          //分进位
	lds R24,_Timer
	subi R24,255    ; addi 1
	sts _Timer,R24
	.dbline 69
L25:
	.dbline 70
;      if(Timer[0]==60)
	lds R24,_Timer
	cpi R24,60
	brne L29
	.dbline 71
	clr R2
	sts _Timer,R2
L29:
	.dbline 71
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
