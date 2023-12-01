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
	.dbfile E:\Proteus\AVR单片机应用系统开发经典实例\009、基于T_CO的时钟设计\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR单片机应用系统开发经典实例\009、基于T_CO的时钟设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR单片机应用系统开发经典实例\009、基于T_CO的时钟设计\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
_CNT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR单片机应用系统开发经典实例\009、基于T_CO的时钟设计\icc\chengxu.c
	.dbsym e CNT _CNT c
_Timer::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\AVR单片机应用系统开发经典实例\009、基于T_CO的时钟设计\icc\chengxu.c
	.dbsym e Timer _Timer A[2:2]c
	.area text(rom, con, rel)
	.dbfile E:\Proteus\AVR单片机应用系统开发经典实例\009、基于T_CO的时钟设计\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 19
; #include <iom16v.h>
; /********************************************************************
;                 数据类型定义
; *********************************************************************/
; #define uchar unsigned char
; #define uint  unsigned int
; 
; /********************************************************************
;                 数码管段码定义0123456789
; *********************************************************************/
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
; uchar Data[4]={0,0,0,0};       //显示初始值：0 0 0 0
; uchar CNT=0;                   //初始计数值：0
; uchar Timer[2]={0x00,0x00};    //初始时间00：00 
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
	.dbline 28
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            显示函数		
; 注意：使用开发板时sel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           
	.dbline 28
	ldi R20,1
	.dbline 29
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 30
	.dbline 30
	out 0x15,R20
	.dbline 31
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
	.dbline 32
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 33
	lsl R20
	.dbline 34
L12:
	.dbline 29
	inc R22
L14:
	.dbline 29
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
	.dbline 40
;   {PORTC=sel;                  //选通最右边的数码管
;    PORTA=~Table[p[i]];          //送字型码
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; 
; //计数值处理函数。参数p1:时间数组名；参数p2:显示数组名//
; //功能：此函数用于将计数值拆分为BCD码的10分，分，10秒，秒//
; void Process(uchar *p1,uchar *p2) 
; {
	.dbline 41
; p2[0]=p1[0]/10;
	ldi R17,10
	movw R30,R22
	ldd R16,z+0
	xcall div8u
	movw R30,R20
	std z+0,R16
	.dbline 42
; p2[1]=p1[0]-p2[0]*10;
	ldd R2,z+0
	ldi R24,10
	mul R24,R2
	movw R30,R22
	ldd R2,z+0
	sub R2,R0
	movw R30,R20
	std z+1,R2
	.dbline 43
; p2[2]=p1[1]/10;
	ldi R17,10
	movw R30,R22
	ldd R16,z+1
	xcall div8u
	movw R30,R20
	std z+2,R16
	.dbline 44
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
	.dbline 50
; }
; /**********************************************************************
; 				           初始化I/O			   	
; **********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 50
	ldi R24,255
	out 0x1a,R24
	.dbline 51
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 52
;  DDRC=0xff;                    //设置C口为推挽1输出；             
	out 0x14,R24
	.dbline 53
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
	.dbline 59
; }
; /**********************************************************************
; 				          主函数		   	
; **********************************************************************/
; void main(void)
; {uchar Load; 
	.dbline 60
;  Init_IO();                    //初始化I/O口
	xcall _Init_IO
	.dbline 61
;  TCCR0=0x04;                   //T/C0工作于定时方式，系统时钟256分频
	ldi R24,4
	out 0x33,R24
	.dbline 62
;  TCNT0=0x06;   
	ldi R24,6
	out 0x32,R24
	.dbline 63
;  SREG=0X80;
	ldi R24,128
	out 0x3f,R24
	.dbline 64
;  TIMSK=0X01;                //计数初始值6    
	ldi R24,1
	out 0x39,R24
	xjmp L19
L18:
	.dbline 66
	.dbline 66
	ldi R18,<_Data
	ldi R19,>_Data
	ldi R16,<_Timer
	ldi R17,>_Timer
	xcall _Process
	.dbline 67
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 68
L19:
	.dbline 65
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
	.dbfile E:\Proteus\AVR单片机应用系统开发经典实例\009、基于T_CO的时钟设计\icc\chengxu.c
	.dbfunc e Timer0 _Timer0 fV
	.even
_Timer0::
	st -y,R2
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 74
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
	.dbline 74
	lds R24,_CNT
	subi R24,255    ; addi 1
	sts _CNT,R24
	.dbline 75
;  if(CNT==125)           
	cpi R24,125
	brne L22
	.dbline 76
;     {CNT=0;                    //计数到125次，计数值复位
	.dbline 76
	clr R2
	sts _CNT,R2
	.dbline 77
; 	 Timer[1]++;               //秒加1
	lds R24,_Timer+1
	subi R24,255    ; addi 1
	sts _Timer+1,R24
	.dbline 78
; 	 if(Timer[1]==60)
	cpi R24,60
	brne L25
	.dbline 79
; 	    {Timer[1]=0;
	.dbline 79
	sts _Timer+1,R2
	.dbline 80
; 		 Timer[0]++;}          //分进位
	lds R24,_Timer
	subi R24,255    ; addi 1
	sts _Timer,R24
	.dbline 80
L25:
	.dbline 81
;      if(Timer[0]==60)
	lds R24,_Timer
	cpi R24,60
	brne L29
	.dbline 82
	clr R2
	sts _Timer,R2
L29:
	.dbline 82
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
