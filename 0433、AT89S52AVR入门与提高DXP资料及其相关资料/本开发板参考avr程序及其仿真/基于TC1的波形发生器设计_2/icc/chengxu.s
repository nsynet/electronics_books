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
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的波形发生器设计_2\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的波形发生器设计_2\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,1
	.area data(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的波形发生器设计_2\icc\chengxu.c
	.dbsym e Data _Data A[4:4]c
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的波形发生器设计_2\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 11
; #include <iom16v.h>
; #define uchar unsigned char
; #define uint  unsigned int
; 
; //数码管字型表，对应0，1，2，3，4，5，6，7，8，9//
; uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
; uchar Data[4]={0,0,0,1};       //定义初始方波频率：1KHz
; uchar Key1_Flag,Key2_Flag,Key3_Flag;
; 
; void DelayMs(uint i)           //Ms级延时，参数i为延时时间
; {uint j;
	.dbline 12
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 13
	.dbline 13
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 13
	.dbline 13
	.dbline 13
L7:
	.dbline 13
	subi R20,1
	sbci R21,0
L9:
	.dbline 13
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 13
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
	.dbline 17
;   {for(j=8000;j!=0;j--) {;}}
; }
; 
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           
	.dbline 17
	ldi R20,1
	.dbline 18
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 19
	.dbline 19
	out 0x15,R20
	.dbline 20
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
	out 0x1b,R24
	.dbline 21
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 22
	lsl R20
	.dbline 23
L12:
	.dbline 18
	inc R22
L14:
	.dbline 18
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
;              k -> <dead>
;              j -> <dead>
;              i -> <dead>
;              p -> R20,R21
	.even
_Key_Process::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 27
;   {PORTC=sel;                  //选通最右边的数码管
;    PORTA=0xff-Table[p[i]];          //送字型码
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; 
; void Key_Process(uchar *p)
; {uchar i,j,k;
	xjmp L17
L16:
	.dbline 28
	.dbline 28
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 28
	ldi R24,1
	sts _Key1_Flag,R24
	.dbline 28
L17:
	.dbline 28
;  while((PINB&0x01)==0) {Display(Data);Key1_Flag=1;}                //处理频率百位，最高5
	sbis 0x16,0
	rjmp L16
	xjmp L20
L19:
	.dbline 29
	.dbline 29
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 29
	ldi R24,1
	sts _Key2_Flag,R24
	.dbline 29
L20:
	.dbline 29
;  while((PINB&0x02)==0) {Display(Data);Key2_Flag=1;}
	sbis 0x16,1
	rjmp L19
	xjmp L23
L22:
	.dbline 30
	.dbline 30
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 30
	ldi R24,1
	sts _Key3_Flag,R24
	.dbline 30
L23:
	.dbline 30
;  while((PINB&0x04)==0) {Display(Data);Key3_Flag=1;}
	sbis 0x16,2
	rjmp L22
	.dbline 31
;  if(Key1_Flag==1)
	lds R24,_Key1_Flag
	cpi R24,1
	brne L25
	.dbline 32
;    {p[3]++;
	.dbline 32
	movw R24,R20
	adiw R24,3
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 33
; 	if(p[3]==10) p[3]=0;
	movw R30,R20
	ldd R24,z+3
	cpi R24,10
	brne L27
	.dbline 33
	clr R2
	movw R30,R20
	std z+3,R2
L27:
	.dbline 34
; 	Key1_Flag=0;}   
	clr R2
	sts _Key1_Flag,R2
	.dbline 34
L25:
	.dbline 35
;  if(Key2_Flag==1)                 //处理频率十位，最高9
	lds R24,_Key2_Flag
	cpi R24,1
	brne L29
	.dbline 36
;     {p[2]++;
	.dbline 36
	movw R24,R20
	adiw R24,2
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 37
; 	 if(p[2]==10) p[2]=0;
	movw R30,R20
	ldd R24,z+2
	cpi R24,10
	brne L31
	.dbline 37
	clr R2
	movw R30,R20
	std z+2,R2
L31:
	.dbline 38
; 	 Key2_Flag=0;}
	clr R2
	sts _Key2_Flag,R2
	.dbline 38
L29:
	.dbline 39
;  if(Key3_Flag==1)                 //处理频率各位，最高9
	lds R24,_Key3_Flag
	cpi R24,1
	brne L33
	.dbline 40
;     {p[1]++;
	.dbline 40
	movw R24,R20
	adiw R24,1
	movw R30,R24
	ldd R24,z+0
	subi R24,255    ; addi 1
	std z+0,R24
	.dbline 41
; 	 if(p[1]==10) p[1]=0;
	movw R30,R20
	ldd R24,z+1
	cpi R24,10
	brne L35
	.dbline 41
	clr R2
	movw R30,R20
	std z+1,R2
L35:
	.dbline 42
	clr R2
	sts _Key3_Flag,R2
	.dbline 42
L33:
	.dbline -2
L15:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym l k 1 c
	.dbsym l j 1 c
	.dbsym l i 1 c
	.dbsym r p 20 pc
	.dbend
	.dbfunc e Set_Process _Set_Process fV
;              i -> R20,R21
;              j -> R20,R21
	.even
_Set_Process::
	xcall push_gset1
	.dbline -1
	.dbline 46
; 	 Key3_Flag=0;}
; }
; 
; void Set_Process(void)
; {uint i,j;
	.dbline 47
;  i=Data[0]*1000+Data[1]*100+Data[2]*10+Data[3];
	lds R2,_Data+1
	ldi R24,100
	mul R24,R2
	movw R2,R0
	lds R18,_Data
	clr R19
	ldi R16,1000
	ldi R17,3
	xcall empy16s
	movw R20,R16
	add R20,R2
	adc R21,R3
	lds R2,_Data+2
	ldi R24,10
	mul R24,R2
	add R20,R0
	adc R21,R1
	lds R2,_Data+3
	clr R3
	add R20,R2
	adc R21,R3
	.dbline 48
;  j=500/i;
	ldi R16,500
	ldi R17,1
	movw R18,R20
	xcall div16u
	movw R20,R16
	.dbline 49
;  OCR1AH=j>>8;
	movw R2,R20
	mov R2,R3
	clr R3
	out 0x2b,R2
	.dbline 50
;  OCR1AL=j&0x00ff;
	movw R24,R20
	andi R25,0
	out 0x2a,R24
	.dbline -2
L37:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r j 20 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 54
; }
; 
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 54
	ldi R24,255
	out 0x1a,R24
	.dbline 55
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 56
;  DDRC=0xff;                    //设置C口为推挽1输出             
	out 0x14,R24
	.dbline 57
;  PORTC=0xff;
	out 0x15,R24
	.dbline 58
;  DDRB=0x00;                    //设置B口为三态输入
	clr R2
	out 0x17,R2
	.dbline 59
;  PORTB=0x00;
	out 0x18,R2
	.dbline 60
;  DDRD=0xff;                    //设置D口为推挽1输出
	out 0x11,R24
	.dbline 61
;  PORTD=0xff;    
	out 0x12,R24
	.dbline -2
L41:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_Timer1 _Init_Timer1 fV
	.even
_Init_Timer1::
	.dbline -1
	.dbline 65
; }
; 
; void Init_Timer1(void)         //初始化T/C1的输入捕获中断
; {TIMSK=TIMSK|0x10;             //输出比较使能
	.dbline 65
	in R24,0x39
	ori R24,16
	out 0x39,R24
	.dbline 66
;  TCCR1B=0x0a;                  //时钟1                                                               频,输出比较匹配清除定时器值
	ldi R24,10
	out 0x2e,R24
	.dbline 67
;  TCNT1H=0x00;                  //清除定时器值
	clr R2
	out 0x2d,R2
	.dbline 68
;  TCNT1L=0x00;
	out 0x2c,R2
	.dbline 69
;  Set_Process();                //OCR1A,OCR1B置初值
	xcall _Set_Process
	.dbline 70
;  SREG=SREG|0x80;               //全局中断开
	bset 7
	.dbline -2
L42:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 74
; } 
; 
; void main(void)
; {Init_IO();                    //初始化I/O口
	.dbline 74
	xcall _Init_IO
	.dbline 75
;  PORTA=0xff;                   //点亮以测试所有的数码管
	ldi R24,255
	out 0x1b,R24
	.dbline 76
;  PORTC=0x00;   
	clr R2
	out 0x15,R2
	.dbline 77
;  Init_Timer1();                
	xcall _Init_Timer1
	.dbline 78
;  DelayMs(30);                //延时
	ldi R16,30
	ldi R17,0
	xcall _DelayMs
	.dbline 79
;  PORTC=0xff;                   //熄灭所有的数码管
	ldi R24,255
	out 0x15,R24
	xjmp L45
L44:
	.dbline 81
	.dbline 81
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Key_Process
	.dbline 82
	xcall _Set_Process
	.dbline 83
	ldi R16,<_Data
	ldi R17,>_Data
	xcall _Display
	.dbline 84
L45:
	.dbline 80
	xjmp L44
X2:
	.dbline -2
L43:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 24
	jmp _Compare
	.area text(rom, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的波形发生器设计_2\icc\chengxu.c
	.dbfunc e Compare _Compare fV
	.even
_Compare::
	st -y,R2
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 89
;  while(1)
;  {Key_Process(Data);
;   Set_Process();
;   Display(Data);               //动态扫描显示
;  }
; }
; 
; #pragma interrupt_handler Compare:7
; void Compare(void)
; {PORTD=~PORTD;}
	.dbline 89
	in R2,0x12
	com R2
	out 0x12,R2
	.dbline -2
L47:
	ld R2,y+
	out 0x3f,R2
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
	.area bss(ram, con, rel)
	.dbfile E:\Proteus\ATMEGA16\个人总结的M16程序\基于TC1的波形发生器设计_2\icc\chengxu.c
_Key3_Flag::
	.blkb 1
	.dbsym e Key3_Flag _Key3_Flag c
_Key2_Flag::
	.blkb 1
	.dbsym e Key2_Flag _Key2_Flag c
_Key1_Flag::
	.blkb 1
	.dbsym e Key1_Flag _Key1_Flag c
