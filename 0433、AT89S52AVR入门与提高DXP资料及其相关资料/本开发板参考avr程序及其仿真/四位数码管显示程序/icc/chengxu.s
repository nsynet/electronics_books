	.module chengxu.c
	.area data(ram, con, rel)
_Flag::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.dbsym e Flag _Flag c
_CNT::
	.blkb 2
	.area idata
	.word 100
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.dbsym e CNT _CNT i
_duan::
	.blkb 2
	.area idata
	.byte 192,249
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 164,176
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 153,146
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 130,248
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 128,144
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.dbsym e duan _duan A[10:10]c
_wei::
	.blkb 2
	.area idata
	.byte 8,4
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 2,1
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.dbsym e wei _wei A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 20
; #include <iom16v.h>
; #include <macros.h>
; #define uchar unsigned char 
; #define uint unsigned int
; #define CON 1000   
; //频率常数定义
; uchar Flag=0;   //捕获次数定义
; uint CNT1;
; uint CNT2;
; uint CNT=100;
; ///////////////////////////////////////////////////////////////////////////////
; uchar duan[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
; //uchar wei[4]={0XEf,0XDf,0XBf,0X7f};                                 //位的控制端	(开发板)
; uchar wei[4]={0X08,0X04,0X02,0X01};                                 //位的控制端	(仿真)
; uint z,x,c,v, date;	//定义数据类型
; ////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////
; //////////////////////////////显示函数//////////////////////////////////////
; void DelayMS(uint i)
; {
	.dbline 22
; uint j;
; for (;i!=0;i--)
	xjmp L5
L2:
	.dbline 23
	.dbline 23
	ldi R20,2000
	ldi R21,7
	xjmp L9
L6:
	.dbline 23
	.dbline 23
	.dbline 23
L7:
	.dbline 23
	subi R20,1
	sbci R21,0
L9:
	.dbline 23
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 23
L3:
	.dbline 22
	subi R16,1
	sbci R17,0
L5:
	.dbline 22
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
	.even
_Pre_Display::
	.dbline -1
	.dbline 30
; {for(j=2000;j!=0;j--){;}}
; }
; ////////////////////////////////////////////////////////////////////////////////
; /**********************************************************************
;                 数码管动态扫描
; *********************************************************************/
; void Pre_Display()
;  { 
	.dbline 32
;  /*****************数据转换*****************************/ 
;   z=date/1000;			 //求千位
	ldi R18,1000
	ldi R19,3
	lds R16,_date
	lds R17,_date+1
	xcall div16u
	sts _z+1,R17
	sts _z,R16
	.dbline 33
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
	.dbline 34
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
	.dbline 35
;   v=date%10;			 //求个位
	ldi R18,10
	ldi R19,0
	lds R16,_date
	lds R17,_date+1
	xcall mod16u
	sts _v+1,R17
	sts _v,R16
	.dbline 37
; 
;       PORTC=wei[0];
	lds R2,_wei
	out 0x15,R2
	.dbline 38
; 	  PORTA=duan[z];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_z
	lds R31,_z+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 39
; 	  DelayMS(3);  
	ldi R16,3
	ldi R17,0
	xcall _DelayMS
	.dbline 40
;   	  PORTC=wei[1];
	lds R2,_wei+1
	out 0x15,R2
	.dbline 41
;       PORTA=duan[x];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_x
	lds R31,_x+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 42
; 	  DelayMS(3);  
	ldi R16,3
	ldi R17,0
	xcall _DelayMS
	.dbline 43
;    	  PORTC=wei[2];
	lds R2,_wei+2
	out 0x15,R2
	.dbline 44
;       PORTA=duan[c];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_c
	lds R31,_c+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 45
; 	  DelayMS(3);  
	ldi R16,3
	ldi R17,0
	xcall _DelayMS
	.dbline 46
;       PORTC=wei[3];
	lds R2,_wei+3
	out 0x15,R2
	.dbline 47
;       PORTA=duan[v];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_v
	lds R31,_v+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 48
; 	  DelayMS(3);  
	ldi R16,3
	ldi R17,0
	xcall _DelayMS
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 70
;  			               
; 
;        }
; ///////////////////////////////计数值处理函数///////////////////////////////////
; /*void HZ(uint i;uchar *p)
; {
; uint TEM;
; p[0]=CON/i;
; TEM=CON%i;
; TEM=CON*10;
; p[1]=TEM/i;
; TEM=TEM%i;
; TEM=TEM*10;
; p[2]=TEM/i;
; TEM=TEM%i;
; TEM=TEM*10;
; p[3]=TEM/i;
; }*/
; 
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 72
; //设置A口为输入
; DDRA=0xFF;
	ldi R24,255
	out 0x1a,R24
	.dbline 73
; PORTA=0xFF;
	out 0x1b,R24
	.dbline 75
; //设置C口为输出
; DDRC=0xFF;
	out 0x14,R24
	.dbline 76
; PORTC=0xFF;
	out 0x15,R24
	.dbline 78
; //设置D口为输出
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 79
; PORTD=0x00;
	out 0x12,R2
	.dbline -2
L14:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> <dead>
	.even
_main::
	.dbline -1
	.dbline 91
; }
; //////////////////////////////////////////////////////////////////////
; /*void Init_Timer1(void)
; {
; TIMSK=TIMSK|0x20;
; TCCR1B=0xc2;
; TIFR=0x20;
; SREG=SREG&0x7f;
; }*/
; /////////////////////////////主函数/////////////////////////////////////
; void main(void)
; {
	.dbline 93
; uchar i;
; Init_IO();  //初始化I/O
	xcall _Init_IO
	.dbline 94
; PORTA=0X00; //点亮数码管
	clr R2
	out 0x1b,R2
	.dbline 95
; PORTC=0X0f; //点亮数码管
	ldi R24,15
	out 0x15,R24
	.dbline 96
; DelayMS(300);//延时
	ldi R16,300
	ldi R17,1
	xcall _DelayMS
	.dbline 97
; PORTC=0x00; //关闭数码管
	clr R2
	out 0x15,R2
	xjmp L17
L16:
	.dbline 102
	.dbline 103
	ldi R24,2345
	ldi R25,9
	sts _date+1,R25
	sts _date,R24
	.dbline 104
	xcall _Pre_Display
	.dbline 122
L17:
	.dbline 101
	xjmp L16
X2:
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbsym l i 1 c
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_C1的频率计设计\icc\chengxu.c
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
_CNT2::
	.blkb 2
	.dbsym e CNT2 _CNT2 i
_CNT1::
	.blkb 2
	.dbsym e CNT1 _CNT1 i
