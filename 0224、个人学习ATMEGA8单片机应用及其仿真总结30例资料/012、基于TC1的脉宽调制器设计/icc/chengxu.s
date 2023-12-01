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
	.blkb 1
	.area idata
	.byte 'y
	.area data(ram, con, rel)
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\012、基于TC1的脉宽调制器设计\icc\chengxu.c
	.dbsym e Table _Table A[12:12]c
_Data1::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\012、基于TC1的脉宽调制器设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\012、基于TC1的脉宽调制器设计\icc\chengxu.c
	.dbsym e Data1 _Data1 A[4:4]c
_PWM::
	.blkb 2
	.area idata
	.word 500
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\012、基于TC1的脉宽调制器设计\icc\chengxu.c
	.dbsym e PWM _PWM i
	.area text(rom, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\012、基于TC1的脉宽调制器设计\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 20
; #include <iom16v.h>
; #include <macros.h>
; /********************************************************************
;                 数据类型定义
; *********************************************************************/
; #define uchar unsigned char
; #define uint  unsigned int
; /********************************************************************
;                 数码管段码定义0123456789
; *********************************************************************/
; //数码管字型表，对应0，1，2，3，4，5，6，7，8，9,E//
; uchar Table[12]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x79};
; uchar Data1[4]={0,0,0,0};      //定义初始值
; uint PWM=500;				   //定义初始方波占空比：50％
; uchar Key1_Flag,Key2_Flag;	   //加减按键标识
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间					   	
; **********************************************************************/            
; void DelayMs(uint i)           //Ms级延时，参数i为延时时间
; {uint j;
	.dbline 21
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 22
	.dbline 22
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 22
	.dbline 22
	.dbline 22
L7:
	.dbline 22
	subi R20,1
	sbci R21,0
L9:
	.dbline 22
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 22
L3:
	.dbline 21
	subi R16,1
	sbci R17,0
L5:
	.dbline 21
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
; /**********************************************************************
; 				            显示函数		
; 注意：使用开发板时sel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           
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
	out 0x1b,R2
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
	.dbfunc e Key_Process _Key_Process fV
	.even
_Key_Process::
	.dbline -1
	.dbline 41
	xjmp L17
L16:
	.dbline 41
	.dbline 41
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Display
	.dbline 41
	ldi R24,1
	sts _Key1_Flag,R24
	.dbline 41
L17:
	.dbline 41
;   {PORTC=sel;                  //选通最右边的数码管
;    PORTA=~Table[p[i]];          //送字型码
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; /**********************************************************************
; 				         按键处理函数
; **********************************************************************/
; void Key_Process()
; {while((PINB&0x01)==0) {Display(Data1);Key1_Flag=1;}  //加标识位
	sbis 0x16,0
	rjmp L16
	xjmp L20
L19:
	.dbline 42
	.dbline 42
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Display
	.dbline 42
	ldi R24,1
	sts _Key2_Flag,R24
	.dbline 42
L20:
	.dbline 42
;  while((PINB&0x02)==0) {Display(Data1);Key2_Flag=1;}  //减标识位
	sbis 0x16,1
	rjmp L19
	.dbline 43
;  if(Key1_Flag==1)
	lds R24,_Key1_Flag
	cpi R24,1
	brne L22
	.dbline 44
;      {
	.dbline 45
; 	 if(PWM<=1020)//设定最大值
	ldi R24,1020
	ldi R25,3
	lds R2,_PWM
	lds R3,_PWM+1
	cp R24,R2
	cpc R25,R3
	brlo L24
	.dbline 46
; 	 PWM=PWM+10;           
	movw R24,R2
	adiw R24,10
	sts _PWM+1,R25
	sts _PWM,R24
L24:
	.dbline 47
; 	  Key1_Flag=0;}
	clr R2
	sts _Key1_Flag,R2
	.dbline 47
L22:
	.dbline 48
;  if(Key2_Flag==1)
	lds R24,_Key2_Flag
	cpi R24,1
	brne L26
	.dbline 49
;      {
	.dbline 50
; 	 if(PWM>=0)	 //设定最小值
	ldi R24,1
	tst R24
	breq L28
	.dbline 51
; 	 PWM=PWM-10;
	lds R24,_PWM
	lds R25,_PWM+1
	sbiw R24,10
	sts _PWM+1,R25
	sts _PWM,R24
L28:
	.dbline 52
	clr R2
	sts _Key2_Flag,R2
	.dbline 52
L26:
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Set_Process _Set_Process fV
;              i -> R20,R21
;              p -> R20,R21
	.even
_Set_Process::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 58
; 	 Key2_Flag=0;} 
; }
; /**********************************************************************
; 				         设置输出比较寄存器值
; **********************************************************************/	    
; void Set_Process(uchar *p)
; {uint i;
	.dbline 59
; p[0]=PWM/1000;		   //求千位
	ldi R18,1000
	ldi R19,3
	lds R16,_PWM
	lds R17,_PWM+1
	xcall div16u
	movw R30,R20
	std z+0,R16
	.dbline 60
; p[1]=PWM%1000/100;	   //求百位
	ldi R18,1000
	ldi R19,3
	lds R16,_PWM
	lds R17,_PWM+1
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	movw R30,R20
	std z+1,R16
	.dbline 61
; p[2]=PWM%100/10;	   //求十位
	ldi R18,100
	ldi R19,0
	lds R16,_PWM
	lds R17,_PWM+1
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R30,R20
	std z+2,R16
	.dbline 62
; p[3]=PWM%10;		   //求个位
	ldi R18,10
	ldi R19,0
	lds R16,_PWM
	lds R17,_PWM+1
	xcall mod16u
	movw R30,R20
	std z+3,R16
	.dbline 63
;  i=PWM;				   
	lds R20,_PWM
	lds R21,_PWM+1
	.dbline 64
;  OCR1AH=i>>8;		   //寄存器求值
	movw R2,R20
	mov R2,R3
	clr R3
	out 0x2b,R2
	.dbline 65
;  OCR1AL=i&0x00ff;	   //寄存器求值
	movw R24,R20
	andi R25,0
	out 0x2a,R24
	.dbline -2
L30:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r p 20 pc
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 71
; }
; /**********************************************************************
; 				         初始化I/O口	
; **********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 71
	ldi R24,255
	out 0x1a,R24
	.dbline 72
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 73
;  DDRC=0xff;                    //设置C口为推挽1输出             
	out 0x14,R24
	.dbline 74
;  PORTC=0xff;
	out 0x15,R24
	.dbline 75
;  DDRB=0x00;                    //设置B口为三态输入
	clr R2
	out 0x17,R2
	.dbline 76
;  PORTB=0x00;
	out 0x18,R2
	.dbline 77
;  DDRD=0xff;                    //设置D口为推挽1输出
	out 0x11,R24
	.dbline 78
;  PORTD=0xff;    
	out 0x12,R24
	.dbline -2
L31:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> <dead>
	.even
_main::
	.dbline -1
	.dbline 84
; }
; /**********************************************************************
; 				          主函数		
; **********************************************************************/
; void main(void)
; {uchar i;
	.dbline 85
;  Init_IO();                    //初始化I/O口
	xcall _Init_IO
	.dbline 86
;  TCCR1A=0xc3;                  //10位PWM,向上计数清除OC1A，向下计数置位OC1A
	ldi R24,195
	out 0x2f,R24
	.dbline 87
;  TCCR1B=0x02;                  //时钟8分频,最小频率1M/2046=500Hz       
	ldi R24,2
	out 0x2e,R24
	xjmp L34
L33:
	.dbline 89
	.dbline 89
	xcall _Key_Process
	.dbline 90
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Set_Process
	.dbline 91
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Display
	.dbline 92
L34:
	.dbline 88
	xjmp L33
X2:
	.dbline -2
L32:
	.dbline 0 ; func end
	ret
	.dbsym l i 1 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\012、基于TC1的脉宽调制器设计\icc\chengxu.c
_Key2_Flag::
	.blkb 1
	.dbsym e Key2_Flag _Key2_Flag c
_Key1_Flag::
	.blkb 1
	.dbsym e Key1_Flag _Key1_Flag c
