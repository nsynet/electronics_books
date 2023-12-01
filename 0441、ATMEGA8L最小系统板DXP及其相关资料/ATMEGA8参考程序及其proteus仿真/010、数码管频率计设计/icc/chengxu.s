	.module chengxu.c
	.area data(ram, con, rel)
_duan::
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
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	.dbsym e duan _duan A[10:10]c
_wei::
	.blkb 2
	.area idata
	.byte 8,4
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 2,1
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	.dbsym e wei _wei A[4:4]c
_CNT::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	.dbsym e CNT _CNT c
_lck::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	.dbsym e lck _lck i
	.area text(rom, con, rel)
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	.dbfunc e delay _delay fV
;              i -> R20
;              j -> R22
;              t -> R16
	.even
_delay::
	rcall push_gset2
	.dbline -1
	.dbline 17
; #include <iom8v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; uchar duan[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
; //uchar wei[4]={0XFE,0XFD,0XFB,0XF7};                                 //位的控制端	(开发板)
; uchar wei[4]={0X08,0X04,0X02,0X01};                                 //位的控制端	(仿真)
; uint z,x,c,v, date;	//定义数据类型
; uchar CNT=0;//计数初值
; uint lck=0;
; uint Load;
; /******************************************************************
; 
; 延时函数
; 
; ******************************************************************/
; void delay(uchar t)
; {
	.dbline 19
;   uchar i,j;
;    for(i=0;i<t;i++)
	clr R20
	rjmp L5
L2:
	.dbline 20
;    {
	.dbline 21
	ldi R22,13
	rjmp L9
L6:
	.dbline 21
L7:
	.dbline 21
	dec R22
L9:
	.dbline 21
	clr R2
	cp R2,R22
	brlo L6
	.dbline 22
	.dbline 22
	.dbline 23
	.dbline 24
L3:
	.dbline 19
	inc R20
L5:
	.dbline 19
	cp R20,R16
	brlo L2
	.dbline -2
L1:
	rcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r j 22 c
	.dbsym r t 16 c
	.dbend
	.dbfunc e xianshi _xianshi fV
	.even
_xianshi::
	.dbline -1
	.dbline 31
;    	 for(j=13;j>0;j--);
; 	 { ;
; 	 }
;    }
; }
; 
; /**********************************************************************
;                 数码管动态扫描
; *********************************************************************/
; void xianshi()
;  { 
	.dbline 33
;  /*****************数据转换*****************************/ 
;   z=date/1000;			 //求千位
	ldi R18,1000
	ldi R19,3
	lds R16,_date
	lds R17,_date+1
	rcall div16u
	sts _z+1,R17
	sts _z,R16
	.dbline 34
;   x=date%1000/100;		 //求百位
	ldi R18,1000
	ldi R19,3
	lds R16,_date
	lds R17,_date+1
	rcall mod16u
	ldi R18,100
	ldi R19,0
	rcall div16u
	sts _x+1,R17
	sts _x,R16
	.dbline 35
;   c=date%100/10;		 //求十位
	ldi R18,100
	ldi R19,0
	lds R16,_date
	lds R17,_date+1
	rcall mod16u
	ldi R18,10
	ldi R19,0
	rcall div16u
	sts _c+1,R17
	sts _c,R16
	.dbline 36
;   v=date%10;			 //求个位
	ldi R18,10
	ldi R19,0
	lds R16,_date
	lds R17,_date+1
	rcall mod16u
	sts _v+1,R17
	sts _v,R16
	.dbline 38
; 
;       PORTC=wei[0];
	lds R2,_wei
	out 0x15,R2
	.dbline 39
; 	  PORTB=duan[z];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_z
	lds R31,_z+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 40
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline 41
;   	  PORTC=wei[1];
	lds R2,_wei+1
	out 0x15,R2
	.dbline 42
;       PORTB=duan[x];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_x
	lds R31,_x+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 43
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline 44
;    	  PORTC=wei[2];
	lds R2,_wei+2
	out 0x15,R2
	.dbline 45
;       PORTB=duan[c];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_c
	lds R31,_c+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 46
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline 47
;       PORTC=wei[3];
	lds R2,_wei+3
	out 0x15,R2
	.dbline 48
;       PORTB=duan[v];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_v
	lds R31,_v+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 49
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 56
;  			               
; 
;  }
; 
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 58
; //设置B口为输入
; DDRB=0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 59
; PORTB=0xFF;
	out 0x18,R24
	.dbline 61
; //设置C口为输出
; DDRC=0xFF;
	out 0x14,R24
	.dbline 62
; PORTC=0xFF;
	out 0x15,R24
	.dbline 64
; //设置D口为输出
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 65
; PORTD=0x00;
	out 0x12,R2
	.dbline -2
L14:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 69
; }
; /////////////////////////////主函数/////////////////////////////////////
; void main(void)
; {
	.dbline 71
; 
; Init_IO();  //初始化I/O
	rcall _Init_IO
	.dbline 72
; PORTC=0XFF; //点亮数码管
	ldi R24,255
	out 0x15,R24
	.dbline 73
; PORTB=0X00; //点亮数码管
	clr R2
	out 0x18,R2
	.dbline 74
; delay(30);//延时
	ldi R16,30
	rcall _delay
	.dbline 75
; PORTB=0xff; //关闭数码管
	ldi R24,255
	out 0x18,R24
	.dbline 77
; 
; TCCR0=0x02; //T/C0工作方式选择，8分频
	ldi R24,2
	out 0x33,R24
	.dbline 78
; TCNT0=0x9c; //计数初始值9c
	ldi R24,156
	out 0x32,R24
	.dbline 80
; 
; TCCR1B=0x06; //T/C0工作方式选择，下降沿
	ldi R24,6
	out 0x2e,R24
	.dbline 81
; TCNT1H=0X00;
	clr R2
	out 0x2d,R2
	.dbline 82
; TCNT1L=0X00;
	out 0x2c,R2
	.dbline 83
; TIMSK=0x01;  //使能T0溢出中断
	ldi R24,1
	out 0x39,R24
	.dbline 85
; 
; SREG=0x80;  //使能全局中断
	ldi R24,128
	out 0x3f,R24
	rjmp L17
L16:
	.dbline 87
	.dbline 88
	lds R2,_Load
	lds R3,_Load+1
	sts _date+1,R3
	sts _date,R2
	.dbline 89
	rcall _xianshi
	.dbline 90
L17:
	.dbline 86
	rjmp L16
X0:
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 18
	rjmp _Timer0
	.area text(rom, con, rel)
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	.dbfunc e Timer0 _Timer0 fV
	.even
_Timer0::
	st -y,R2
	st -y,R3
	st -y,R4
	st -y,R5
	st -y,R16
	st -y,R17
	st -y,R18
	st -y,R19
	st -y,R24
	st -y,R25
	st -y,R30
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 95
	.dbline 96
	ldi R24,160
	out 0x32,R24
	.dbline 97
	lds R24,_lck
	lds R25,_lck+1
	adiw R24,1
	sts _lck+1,R25
	sts _lck,R24
	.dbline 98
	cpi R24,232
	ldi R30,3
	cpc R25,R30
	brne L20
	.dbline 99
	.dbline 100
	in R18,0x2d
	clr R19
	ldi R16,256
	ldi R17,1
	rcall empy16s
	movw R2,R16
	in R4,0x2c
	clr R5
	add R2,R4
	adc R3,R5
	sts _Load+1,R3
	sts _Load,R2
	.dbline 101
	clr R2
	clr R3
	sts _lck+1,R3
	sts _lck,R2
	.dbline 102
	out 0x2d,R2
	.dbline 103
	out 0x2c,R2
	.dbline 104
L20:
	.dbline -2
L19:
	ld R2,y+
	out 0x3f,R2
	ld R30,y+
	ld R25,y+
	ld R24,y+
	ld R19,y+
	ld R18,y+
	ld R17,y+
	ld R16,y+
	ld R5,y+
	ld R4,y+
	ld R3,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
_Load::
	.blkb 2
	.dbsym e Load _Load i
_date::
	.blkb 2
	.dbsym e date _date i
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
