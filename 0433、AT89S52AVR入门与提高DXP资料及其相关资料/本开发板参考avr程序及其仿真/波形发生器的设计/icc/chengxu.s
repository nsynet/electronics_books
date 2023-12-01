	.module chengxu.c
	.area data(ram, con, rel)
_duan::
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
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\波形发生器的设计\icc\chengxu.c
	.dbsym e duan _duan A[10:10]c
_wei::
	.blkb 2
	.area idata
	.byte 14,13
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\波形发生器的设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 11,7
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\波形发生器的设计\icc\chengxu.c
	.dbsym e wei _wei A[4:4]c
_date::
	.blkb 2
	.area idata
	.word 1
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\波形发生器的设计\icc\chengxu.c
	.dbsym e date _date i
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\波形发生器的设计\icc\chengxu.c
	.dbfunc e delay _delay fV
;              i -> R20
;              j -> R22
;              t -> R16
	.even
_delay::
	xcall push_gset2
	.dbline -1
	.dbline 14
; #include <iom16v.h> 
; #define uchar unsigned char 
; #define uint unsigned int
; uchar duan[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};	 //所需的段的位码
; //uchar wei[4]={0XFE,0XFD,0XFB,0XF7}; //位的控制端	(开发板)
; uchar wei[4]={0X0e,0X0d,0X0b,0X07};   //位的控制端	(仿真)
; uchar Key1_Flag,Key2_Flag,Key3_Flag;  //按键控制频率加减复位                          
; uint z,x,c,v, date;	//定义数据类型
; uint date=1;        //频率初始值1K
; /******************************************************************
; 延时函数
; ******************************************************************/
; void delay(uchar t)
; {
	.dbline 16
;   uchar i,j;
;    for(i=0;i<t;i++)
	clr R20
	xjmp L5
L2:
	.dbline 17
;    {
	.dbline 18
	ldi R22,13
	xjmp L9
L6:
	.dbline 18
L7:
	.dbline 18
	dec R22
L9:
	.dbline 18
	clr R2
	cp R2,R22
	brlo L6
	.dbline 19
	.dbline 19
	.dbline 19
	.dbline 20
L3:
	.dbline 16
	inc R20
L5:
	.dbline 16
	cp R20,R16
	brlo L2
	.dbline -2
L1:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbsym r t 16 c
	.dbend
	.dbfunc e xianshi _xianshi fV
;              i -> R20,R21
;              j -> R20,R21
	.even
_xianshi::
	xcall push_gset1
	.dbline -1
	.dbline 26
;    	 for(j=13;j>0;j--);
; 	 { ; }
;    }
; }
; /**********************************************************************
;                 数码管动态扫描
; *********************************************************************/
; void xianshi()
;  { 
	.dbline 29
;  uint i,j;
;  /*************************数据转换*****************************/ 
;   z=date/1000;			 //求千位
	ldi R18,1000
	ldi R19,3
	lds R16,_date
	lds R17,_date+1
	xcall div16u
	sts _z+1,R17
	sts _z,R16
	.dbline 30
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
	.dbline 31
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
	.dbline 32
;   v=date%10;			 //求个位
	ldi R18,10
	ldi R19,0
	lds R16,_date
	lds R17,_date+1
	xcall mod16u
	sts _v+1,R17
	sts _v,R16
	.dbline 34
;  /*****************设置比较寄存器值*****************************/ 
;  i=z*1000+x*100+c*10+v;
	lds R18,_x
	lds R19,_x+1
	ldi R16,100
	ldi R17,0
	xcall empy16s
	movw R2,R16
	lds R18,_z
	lds R19,_z+1
	ldi R16,1000
	ldi R17,3
	xcall empy16s
	movw R20,R16
	add R20,R2
	adc R21,R3
	lds R18,_c
	lds R19,_c+1
	ldi R16,10
	ldi R17,0
	xcall empy16s
	add R20,R16
	adc R21,R17
	lds R2,_v
	lds R3,_v+1
	add R20,R2
	adc R21,R3
	.dbline 35
;  j=500/i;
	ldi R16,500
	ldi R17,1
	movw R18,R20
	xcall div16u
	movw R20,R16
	.dbline 36
;  OCR1AH=j>>8;
	movw R2,R20
	mov R2,R3
	clr R3
	out 0x2b,R2
	.dbline 37
;  OCR1AL=j&0x00ff;
	movw R24,R20
	andi R25,0
	out 0x2a,R24
	.dbline 40
;  /********************数码管扫描显示****************************/ 
; 
;       PORTC=wei[0];
	lds R2,_wei
	out 0x15,R2
	.dbline 41
; 	  PORTA=duan[z];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_z
	lds R31,_z+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 42
; 	  delay(50);  
	ldi R16,50
	xcall _delay
	.dbline 43
;   	  PORTC=wei[1];
	lds R2,_wei+1
	out 0x15,R2
	.dbline 44
;       PORTA=duan[x];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_x
	lds R31,_x+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 45
; 	  delay(50);  
	ldi R16,50
	xcall _delay
	.dbline 46
;    	  PORTC=wei[2];
	lds R2,_wei+2
	out 0x15,R2
	.dbline 47
;       PORTA=duan[c];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_c
	lds R31,_c+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 48
; 	  delay(50);  
	ldi R16,50
	xcall _delay
	.dbline 49
;       PORTC=wei[3];
	lds R2,_wei+3
	out 0x15,R2
	.dbline 50
;       PORTA=duan[v];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_v
	lds R31,_v+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 51
; 	  delay(50);  
	ldi R16,50
	xcall _delay
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r j 20 i
	.dbend
	.dbfunc e Key_Process _Key_Process fV
	.even
_Key_Process::
	.dbline -1
	.dbline 57
;  	}
; /**********************************************************************
;                           频率调节按键控制
; *********************************************************************/
; void Key_Process()
; {
	xjmp L16
L15:
	.dbline 58
	.dbline 58
	xcall _xianshi
	.dbline 58
	ldi R24,1
	sts _Key1_Flag,R24
	.dbline 58
L16:
	.dbline 58
;  while((PINB&0x01)==0) {xianshi();Key1_Flag=1;}
	sbis 0x16,0
	rjmp L15
	xjmp L19
L18:
	.dbline 59
	.dbline 59
	xcall _xianshi
	.dbline 59
	ldi R24,1
	sts _Key2_Flag,R24
	.dbline 59
L19:
	.dbline 59
;  while((PINB&0x02)==0) {xianshi();Key2_Flag=1;}
	sbis 0x16,1
	rjmp L18
	xjmp L22
L21:
	.dbline 60
	.dbline 60
	xcall _xianshi
	.dbline 60
	ldi R24,1
	sts _Key3_Flag,R24
	.dbline 60
L22:
	.dbline 60
;  while((PINB&0x04)==0) {xianshi();Key3_Flag=1;}
	sbis 0x16,2
	rjmp L21
	.dbline 61
;  if(Key1_Flag==1) //处理频率百位，最高4
	lds R24,_Key1_Flag
	cpi R24,1
	brne L24
	.dbline 62
;    {
	.dbline 63
;     date++;//设置频率值加
	lds R24,_date
	lds R25,_date+1
	adiw R24,1
	sts _date+1,R25
	sts _date,R24
	.dbline 64
; 	if(date>=30) date=30;//设置最大值为30KHZ
	cpi R24,30
	ldi R30,0
	cpc R25,R30
	brlo L26
	.dbline 64
	ldi R24,30
	ldi R25,0
	sts _date+1,R25
	sts _date,R24
L26:
	.dbline 65
; 	Key1_Flag=0;
	clr R2
	sts _Key1_Flag,R2
	.dbline 66
; 	}   
L24:
	.dbline 67
;  if(Key2_Flag==1) //处理频率十位，最高9
	lds R24,_Key2_Flag
	cpi R24,1
	brne L28
	.dbline 68
;     {
	.dbline 69
; 	if(date<=0) date=1;  //设置最大值为0HZ
	lds R2,_date
	lds R3,_date+1
	tst R2
	brne L30
	tst R3
	brne L30
X0:
	.dbline 69
	ldi R24,1
	ldi R25,0
	sts _date+1,R25
	sts _date,R24
L30:
	.dbline 70
; 	date--;//设置频率值减
	lds R24,_date
	lds R25,_date+1
	sbiw R24,1
	sts _date+1,R25
	sts _date,R24
	.dbline 71
; 	Key2_Flag=0;
	clr R2
	sts _Key2_Flag,R2
	.dbline 72
; 	 }
L28:
	.dbline 73
	lds R24,_Key3_Flag
	cpi R24,1
	brne L32
	.dbline 74
	.dbline 75
	ldi R24,1
	ldi R25,0
	sts _date+1,R25
	sts _date,R24
	.dbline 76
	clr R2
	sts _Key3_Flag,R2
	.dbline 77
L32:
	.dbline -2
L14:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 85
;  if(Key3_Flag==1) //处理频率各位，最高9
;     {
; 	date=1;//设置频率复位
; 	Key3_Flag=0;
; 	 }
; }
; /******************************************************************
; 
; /**********************************************************************
;                          初始化I/O口
; *********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 85
	ldi R24,255
	out 0x1a,R24
	.dbline 86
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 87
;  DDRC=0xff;                    //设置C口为推挽1输出             
	out 0x14,R24
	.dbline 88
;  PORTC=0xff;
	out 0x15,R24
	.dbline 89
;  DDRB=0x00;                    //设置B口为三态输入
	clr R2
	out 0x17,R2
	.dbline 90
;  PORTB=0x00;
	out 0x18,R2
	.dbline 91
;  DDRD=0xff;                    //设置D口为推挽1输出
	out 0x11,R24
	.dbline 92
;  PORTD=0xff;    
	out 0x12,R24
	.dbline -2
L34:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_Timer1 _Init_Timer1 fV
	.even
_Init_Timer1::
	.dbline -1
	.dbline 98
; }
; /**********************************************************************
;                          初始化I/O口
; *********************************************************************/
; void Init_Timer1(void)         //初始化T/C1的输入捕获中断
; {TIMSK=TIMSK|0x10;             //输出比较使能
	.dbline 98
	in R24,0x39
	ori R24,16
	out 0x39,R24
	.dbline 99
;  TCCR1B=0x0a;                  //时钟1频,输出比较匹配清除定时器值
	ldi R24,10
	out 0x2e,R24
	.dbline 100
;  TCNT1H=0x00;                  //清除定时器值
	clr R2
	out 0x2d,R2
	.dbline 101
;  TCNT1L=0x00;
	out 0x2c,R2
	.dbline 102
;  SREG=SREG|0x80;               //全局中断开
	bset 7
	.dbline -2
L35:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 108
; } 
; /**********************************************************************
;                           主函数
; *********************************************************************/
; void main(void)
; {
	.dbline 109
;  Init_IO(); //初始化I/O口
	xcall _Init_IO
	.dbline 110
;  xianshi(); //显示初始值
	xcall _xianshi
	.dbline 111
;  Init_Timer1();//初始化T/C1的输入捕获中断 
	xcall _Init_Timer1
	xjmp L38
L37:
	.dbline 114
	.dbline 116
	xcall _Key_Process
	.dbline 117
	xcall _xianshi
	.dbline 119
L38:
	.dbline 113
	xjmp L37
X1:
	.dbline -2
L36:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 24
	jmp _Compare
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\波形发生器的设计\icc\chengxu.c
	.dbfunc e Compare _Compare fV
	.even
_Compare::
	st -y,R2
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 126
;  
;  while(1)
;  {
; 
; Key_Process();//按键值函数
; xianshi();//频率值显示
; 
;  }
; }
; /**********************************************************************
;                           中断服务函数
; *********************************************************************/
; #pragma interrupt_handler Compare:7
; void Compare(void)
; {
	.dbline 127
; PORTD=~PORTD;//PD口输出
	in R2,0x12
	com R2
	out 0x12,R2
	.dbline -2
L40:
	ld R2,y+
	out 0x3f,R2
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\波形发生器的设计\icc\chengxu.c
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
_Key3_Flag::
	.blkb 1
	.dbsym e Key3_Flag _Key3_Flag c
_Key2_Flag::
	.blkb 1
	.dbsym e Key2_Flag _Key2_Flag c
_Key1_Flag::
	.blkb 1
	.dbsym e Key1_Flag _Key1_Flag c
