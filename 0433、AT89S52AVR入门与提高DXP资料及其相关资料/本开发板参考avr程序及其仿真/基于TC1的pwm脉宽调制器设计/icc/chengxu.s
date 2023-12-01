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
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的pwm脉宽调制器设计\icc\chengxu.c
	.dbsym e Table _Table A[12:12]c
_Data1::
	.blkb 2
	.area idata
	.byte 10,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的pwm脉宽调制器设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 5,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的pwm脉宽调制器设计\icc\chengxu.c
	.dbsym e Data1 _Data1 A[4:4]c
_Data2::
	.blkb 2
	.area idata
	.byte 3,9
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的pwm脉宽调制器设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 1,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的pwm脉宽调制器设计\icc\chengxu.c
	.dbsym e Data2 _Data2 A[4:4]c
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的pwm脉宽调制器设计\icc\chengxu.c
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
; //数码管字型表，对应0，1，2，3，4，5，6，7，8，9,E//
; uchar Table[12]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x79};
; uchar Data1[4]={10,0,5,0};      //定义初始方波占空比：50％
; uchar Data2[4]={3,9,1,0};            //设定PWM频率：8M/2046=3910Hz 
; uchar Key1_Flag,Key2_Flag;
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
	.dbline 21
	mov R2,R20
	com R2
	out 0x15,R2
	.dbline 22
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
	com R24
	com R25
	out 0x1b,R24
	.dbline 24
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 25
	lsl R20
	.dbline 26
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
	.dbfunc e Add_Process _Add_Process fV
;              p -> R16,R17
	.even
_Add_Process::
	.dbline -1
	.dbline 30
;   {
;    PORTC=~sel;                  //选通最右边的数码管
;    PORTA=~(0xff-Table[p[i]]);     //送字型码
;    //PORTA=Table[2];     //送字型码
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; 
; void Add_Process(uchar *p)
; {if(p[1]!=1)
	.dbline 30
	movw R30,R16
	ldd R24,z+1
	cpi R24,1
	breq L16
	.dbline 31
;   {p[2]=p[2]+1;
	.dbline 31
	movw R24,R16
	adiw R24,2
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 32
;    if(p[2]==10) {p[2]=0;p[1]++;}
	movw R30,R16
	ldd R24,z+2
	cpi R24,10
	brne L18
	.dbline 32
	.dbline 32
	clr R2
	movw R30,R16
	std z+2,R2
	.dbline 32
	movw R24,R16
	adiw R24,1
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 32
L18:
	.dbline 33
L16:
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbsym r p 16 pc
	.dbend
	.dbfunc e Sub_Process _Sub_Process fV
;           temp -> R22
;              p -> R20,R21
	.even
_Sub_Process::
	xcall push_gset2
	movw R20,R16
	.dbline -1
	.dbline 37
	.dbline 38
	movw R30,R20
	ldd R2,z+1
	ldi R24,10
	mul R24,R2
	mov R22,R0
	movw R30,R20
	ldd R2,z+2
	add R22,R2
	.dbline 39
	breq L21
	.dbline 40
	.dbline 40
	dec R22
	.dbline 41
	ldi R17,10
	mov R16,R22
	xcall div8u
	movw R30,R20
	std z+1,R16
	.dbline 42
	movw R30,R20
	ldd R2,z+1
	ldi R24,10
	mul R24,R2
	mov R2,R22
	sub R2,R0
	movw R30,R20
	std z+2,R2
	.dbline 43
L21:
	.dbline -2
L20:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r temp 22 c
	.dbsym r p 20 pc
	.dbend
	.dbfunc e Key_Process _Key_Process fV
	.even
_Key_Process::
	.dbline -1
	.dbline 47
	xjmp L25
L24:
	.dbline 47
	.dbline 47
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Display
	.dbline 47
	ldi R24,1
	sts _Key1_Flag,R24
	.dbline 47
L25:
	.dbline 47
;   }
; }
; 
; void Sub_Process(uchar *p)
; {uchar temp;
;  temp=p[1]*10+p[2];
;  if(temp!=0)
;   {temp=temp-1;
;    p[1]=temp/10;
;    p[2]=temp-p[1]*10;
;   }
; }
;  
; void Key_Process()
; {while((PINB&0x01)==0) {Display(Data1);Key1_Flag=1;}  
	sbis 0x16,0
	rjmp L24
	xjmp L28
L27:
	.dbline 48
	.dbline 48
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Display
	.dbline 48
	ldi R24,1
	sts _Key2_Flag,R24
	.dbline 48
L28:
	.dbline 48
;  while((PINB&0x02)==0) {Display(Data1);Key2_Flag=1;}
	sbis 0x16,1
	rjmp L27
	.dbline 49
;  if(Key1_Flag==1)
	lds R24,_Key1_Flag
	cpi R24,1
	brne L30
	.dbline 50
;      {Add_Process(Data1);           
	.dbline 50
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Add_Process
	.dbline 51
; 	  Key1_Flag=0;}
	clr R2
	sts _Key1_Flag,R2
	.dbline 51
L30:
	.dbline 52
	lds R24,_Key2_Flag
	cpi R24,1
	brne L32
	.dbline 53
	.dbline 53
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Sub_Process
	.dbline 54
	clr R2
	sts _Key2_Flag,R2
	.dbline 54
L32:
	.dbline -2
L23:
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
;  if(Key2_Flag==1)
;      {Sub_Process(Data1);
; 	  Key2_Flag=0;} 
; }
; 	    
; void Set_Process(uchar *p)
; {uint i;
	.dbline 59
;  i=p[1]*10+p[2];
	movw R30,R20
	ldd R2,z+1
	ldi R24,10
	mul R24,R2
	movw R2,R0
	movw R30,R20
	ldd R4,z+2
	clr R5
	add R2,R4
	adc R3,R5
	.dbline 60
;  i=1023*i/10;
	ldi R16,1023
	ldi R17,3
	movw R18,R2
	xcall empy16s
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R20,R16
	.dbline 61
;  OCR1AH=i>>8;
	movw R2,R20
	mov R2,R3
	clr R3
	out 0x2b,R2
	.dbline 62
;  OCR1AL=i&0x00ff;
	movw R24,R20
	andi R25,0
	out 0x2a,R24
	.dbline -2
L34:
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
	.dbline 66
; }
; 
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 66
	ldi R24,255
	out 0x1a,R24
	.dbline 67
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 68
;  DDRC=0xff;                    //设置C口为推挽1输出             
	out 0x14,R24
	.dbline 69
;  PORTC=0xff;
	out 0x15,R24
	.dbline 70
;  DDRB=0x00;                    //设置B口为三态输入
	clr R2
	out 0x17,R2
	.dbline 71
;  PORTB=0x00;
	out 0x18,R2
	.dbline 72
;  DDRD=0xff;                    //设置D口为推挽1输出
	out 0x11,R24
	.dbline 73
;  PORTD=0xff;    
	out 0x12,R24
	.dbline -2
L35:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 77
; }
; 
; void main(void)
; {uchar i;
	.dbline 78
;  Init_IO();                    //初始化I/O口
	xcall _Init_IO
	.dbline 79
;  PORTA=0xff;                   //点亮以测试所有的数码管
	ldi R24,255
	out 0x1b,R24
	.dbline 80
;  PORTC=0x00;   
	clr R2
	out 0x15,R2
	.dbline 82
;  //DelayMs(300);                 //延时
;  PORTC=0xff;                   //熄灭所有的数码管
	out 0x15,R24
	.dbline 83
;  TCCR1A=0xc3;                  //10位PWM,向上计数清除OC1A，向下计数置位OC1A
	ldi R24,195
	out 0x2f,R24
	.dbline 84
;  TCCR1B=0x02;                  //时钟8分频,最小频率1M/2046=0.5KHz       
	ldi R24,2
	out 0x2e,R24
	xjmp L38
L37:
	.dbline 86
;  while(1)
;  {Key_Process();
	.dbline 86
	xcall _Key_Process
	.dbline 87
;   Set_Process(Data1);         //设置PWM占空比
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Set_Process
	.dbline 88
;   for(i=50;i!=0;i--)
	ldi R20,50
	xjmp L43
L40:
	.dbline 89
	ldi R16,<_Data1
	ldi R17,>_Data1
	xcall _Display
L41:
	.dbline 88
	dec R20
L43:
	.dbline 88
	tst R20
	brne L40
	.dbline 90
;     Display(Data1);
;   for(i=50;i!=0;i--)
	ldi R20,50
	xjmp L47
L44:
	.dbline 91
	ldi R16,<_Data2
	ldi R17,>_Data2
	xcall _Display
L45:
	.dbline 90
	dec R20
L47:
	.dbline 90
	tst R20
	brne L44
	.dbline 92
L38:
	.dbline 85
	xjmp L37
X2:
	.dbline -2
L36:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的pwm脉宽调制器设计\icc\chengxu.c
_Key2_Flag::
	.blkb 1
	.dbsym e Key2_Flag _Key2_Flag c
_Key1_Flag::
	.blkb 1
	.dbsym e Key1_Flag _Key1_Flag c
