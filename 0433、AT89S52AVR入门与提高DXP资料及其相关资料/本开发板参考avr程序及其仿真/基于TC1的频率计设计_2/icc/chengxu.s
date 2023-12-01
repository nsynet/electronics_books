	.module chengxu.c
	.area data(ram, con, rel)
_Flag::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.dbsym e Flag _Flag c
_Table::
	.blkb 2
	.area idata
	.byte 63,6
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 91,'O
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 'f,'m
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 125,7
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 127,'o
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 4
	.area idata
	.byte 0,0,0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.dbsym e Table _Table A[20:20]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
_CNT::
	.blkb 2
	.area idata
	.word 100
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.dbsym e CNT _CNT i
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 18
; #include <iom16v.h>
; #include <macros.h>          
; #define uchar unsigned char
; #define uint  unsigned int
; 
; #define CON 1000      //频率常数定义
; uchar Flag=0;         //捕获次数定义
; 
; //数码管字型表，对应0，1，2，3，4，5，6，7，8，9,A,b,C,d,E,F//
; uchar Table[20]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
;                  0x7f,0x6f,0x77,0x7c,0x39,0x5E,0x79,0x71};
; uchar Data[4]={0,0,0,0};       //显示初始值：0 0 0 0
; uint  CNT1;                    //第一次捕获值
; uint  CNT2;                    //第二此捕获值
; uint  CNT=100;                 //捕获差值 
;       
; void DelayMs(uint i)           //Ms级延时，参数i为延时时间
; {uint j;
	.dbline 19
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 20
	.dbline 20
	ldi R20,2000
	ldi R21,7
	xjmp L9
L6:
	.dbline 20
	.dbline 20
	.dbline 20
L7:
	.dbline 20
	subi R20,1
	sbci R21,0
L9:
	.dbline 20
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 20
L3:
	.dbline 19
	subi R16,1
	sbci R17,0
L5:
	.dbline 19
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
;              i -> R20
	.even
_Pre_Display::
	xcall push_gset1
	.dbline -1
	.dbline 24
;   {for(j=2000;j!=0;j--) {;}}
; }
; 
; void Pre_Display(void)         //预显示函数，数码管显示检测
; {uchar i;
	.dbline 25
;  for(i=0;i<16;i++)
	clr R20
	xjmp L14
L11:
	.dbline 26
	.dbline 26
	clr R2
	out 0x15,R2
	.dbline 27
	ldi R24,<_Table
	ldi R25,>_Table
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 28
	ldi R16,100
	ldi R17,0
	xcall _DelayMs
	.dbline 29
L12:
	.dbline 25
	inc R20
L14:
	.dbline 25
	cpi R20,16
	brlo L11
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
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
	.dbline 33
;   {PORTC=0x00;
;    PORTA=Table[i];
;   DelayMs(100);
;   }
; }
; 
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           
	.dbline 33
	ldi R20,1
	.dbline 34
;  for(i=0;i<4;i++)
	clr R22
	xjmp L19
L16:
	.dbline 35
	.dbline 35
	out 0x15,R20
	.dbline 36
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
	.dbline 37
	ldi R16,2
	ldi R17,0
	xcall _DelayMs
	.dbline 38
	lsl R20
	.dbline 39
L17:
	.dbline 34
	inc R22
L19:
	.dbline 34
	cpi R22,4
	brlo L16
	.dbline -2
L15:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r sel 20 c
	.dbsym r i 22 c
	.dbsym r p 10 pc
	.dbend
	.dbfunc e HZ _HZ fV
;            TEM -> R22,R23
;              p -> R20,R21
;              i -> R10,R11
	.even
_HZ::
	xcall push_gset3
	movw R20,R18
	movw R10,R16
	.dbline -1
	.dbline 43
;   {PORTC=sel;                  //选通最右边的数码管
;    PORTA=~Table[p[i]];          //送字型码
;    DelayMs(2);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; 
; void HZ(uint i,uchar *p)
; {uint TEM;
	.dbline 44
;  p[0]=CON/i;
	ldi R16,1000
	ldi R17,3
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+0,R16
	.dbline 45
;  TEM=CON%i;
	ldi R16,1000
	ldi R17,3
	movw R18,R10
	xcall mod16u
	movw R22,R16
	.dbline 46
;  TEM=TEM*10;
	ldi R16,10
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R22,R16
	.dbline 47
;  p[1]=TEM/i;
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+1,R16
	.dbline 48
;  TEM=TEM%i;
	movw R18,R10
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 49
;  TEM=TEM*10;
	ldi R16,10
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R22,R16
	.dbline 50
;  p[2]=TEM/i;
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+2,R16
	.dbline 51
;  TEM=TEM%i;
	movw R18,R10
	movw R16,R22
	xcall mod16u
	movw R22,R16
	.dbline 52
;  TEM=TEM*10;
	ldi R16,10
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R22,R16
	.dbline 53
;  p[3]=TEM/i;
	movw R18,R10
	xcall div16u
	movw R30,R20
	std z+3,R16
	.dbline -2
L20:
	xcall pop_gset3
	.dbline 0 ; func end
	ret
	.dbsym r TEM 22 i
	.dbsym r p 20 pc
	.dbsym r i 10 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 57
; }
; 
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 57
	ldi R24,255
	out 0x1a,R24
	.dbline 58
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 59
;  DDRC=0xff;                    //设置C口为推挽1输出             
	out 0x14,R24
	.dbline 60
;  PORTC=0xff;
	out 0x15,R24
	.dbline 61
;  DDRD=0x00;                    //设置D口为带上拉电阻输入
	clr R2
	out 0x11,R2
	.dbline 62
;  PORTD=0x00;    
	out 0x12,R2
	.dbline -2
L21:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_Timer1 _Init_Timer1 fV
	.even
_Init_Timer1::
	.dbline -1
	.dbline 66
; }
; 
; void Init_Timer1(void)         //初始化T/C1的输入捕获中断
; {
	.dbline 67
;  TIMSK=TIMSK|0x20;             //输入捕获使能
	in R24,0x39
	ori R24,32
	out 0x39,R24
	.dbline 68
;  TCCR1B=0xC2;                  //输入捕获噪音使能，下降沿捕获，时钟8分频1uS计数一次。
	ldi R24,194
	out 0x2e,R24
	.dbline 69
;  TIFR=0x20;                    //清中断标志
	ldi R24,32
	out 0x38,R24
	.dbline 70
;  SREG=SREG&0x7f;               //全局中断关
	in R24,0x3f
	andi R24,127
	out 0x3f,R24
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 74
;  } 
; 
; void main(void)
; {uchar i;
	.dbline 75
;  Init_IO();                    //初始化I/O口
	xcall _Init_IO
	.dbline 82
;  //PORTA=0xff;                   //点亮以测试所有的数码管
;  //PORTC=0xf0;   
;  //DelayMs(30);
;  //PORTC=0xff;                   //熄灭所有的数码管
;  //Pre_Display();                //预显示，数码管显示测试
;  //PORTC=0xff;
;  Init_Timer1();                //T/C1初试化 
	xcall _Init_Timer1
	xjmp L25
X2:
	.dbline 84
;  while(1)
;   {
L27:
	.dbline 86
	.dbline 86
	in R24,0x38
	ori R24,32
	out 0x38,R24
	.dbline 87
	in R2,0x26
	clr R3
	sts _CNT+1,R3
	sts _CNT,R2
	.dbline 88
	in R2,0x26
	in R3,0x27
	sts _CNT2+1,R3
	sts _CNT2,R2
	.dbline 89
	lds R2,_CNT1
	lds R3,_CNT1+1
	lds R4,_CNT2
	lds R5,_CNT2+1
	sub R4,R2
	sbc R5,R3
	sts _CNT+1,R5
	sts _CNT,R4
	.dbline 90
	lds R2,_CNT2
	lds R3,_CNT2+1
	sts _CNT1+1,R3
	sts _CNT1,R2
	.dbline 91
	lds R24,_Flag
	subi R24,255    ; addi 1
	sts _Flag,R24
	.dbline 91
L28:
	.dbline 85
;   while(TIFR&0x20)             //捕获检测
	in R2,0x38
	sbrc R2,5
	rjmp L27
	.dbline 92
;       {TIFR|=0x20;             //清除捕获标志
; 	   CNT=ICR1L;              //CNT暂存
;        CNT2=(ICR1H<<8)+ICR1L;  //CNT2存放当前捕获值
;        CNT=CNT2-CNT1;          //CNT存放两次时间差
;        CNT1=CNT2;              //CNT1存放上次捕获值
;        Flag++;}                //检测到第一次捕获
;    if(Flag==2)                 //检测到第二此捕获
	lds R24,_Flag
	cpi R24,2
	brne L30
	.dbline 93
;       {Flag=0;                 //清除捕获检测标志
	.dbline 93
	clr R2
	sts _Flag,R2
	.dbline 94
; 	   HZ(CNT,Data);           //数据处理
	ldi R18,<_Data
	ldi R19,>_Data
	lds R16,_CNT
	lds R17,_CNT+1
	xcall _HZ
	.dbline 95
; 	   for(i=0;i<100;i++)      //频率显示
	clr R20
	xjmp L35
L32:
	.dbline 96
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
L33:
	.dbline 95
	inc R20
L35:
	.dbline 95
	cpi R20,100
	brlo L32
	.dbline 97
	clr R2
	clr R3
	sts _CNT+1,R3
	sts _CNT,R2
	.dbline 97
	sts _CNT1+1,R3
	sts _CNT1,R2
	.dbline 97
	sts _CNT2+1,R3
	sts _CNT2,R2
	.dbline 97
L30:
	.dbline 97
L25:
	.dbline 83
	xjmp L28
X3:
	.dbline -2
L23:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的频率计设计_2\icc\chengxu.c
_CNT2::
	.blkb 2
	.dbsym e CNT2 _CNT2 i
_CNT1::
	.blkb 2
	.dbsym e CNT1 _CNT1 i
