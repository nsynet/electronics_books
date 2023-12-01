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
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的时钟设计\icc\chengxu.c
	.dbsym e duan _duan A[10:10]c
_wei::
	.blkb 2
	.area idata
	.byte 8,4
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的时钟设计\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 2,1
	.area data(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的时钟设计\icc\chengxu.c
	.dbsym e wei _wei A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的时钟设计\icc\chengxu.c
	.dbfunc e delay _delay fV
;              i -> R20
;              j -> R22
;              t -> R16
	.even
_delay::
	rcall push_gset2
	.dbline -1
	.dbline 14
; #include <iom8v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; uchar duan[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
; //uchar wei[4]={0XFE,0XFD,0XFB,0XF7};                                 //位的控制端	(开发板)
; uchar wei[4]={0X08,0X04,0X02,0X01};                                 //位的控制端	(仿真)
; uint z,x,c,v, date;	//定义数据类型
; /******************************************************************
; 
; 延时函数
; 
; ******************************************************************/
; void delay(uchar t)
; {
	.dbline 16
;   uchar i,j;
;    for(i=0;i<t;i++)
	clr R20
	rjmp L5
L2:
	.dbline 17
;    {
	.dbline 18
	ldi R22,13
	rjmp L9
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
	.dbline 20
	.dbline 21
L3:
	.dbline 16
	inc R20
L5:
	.dbline 16
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
	.dbline 28
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
	.dbline 30
;  /*****************数据转换*****************************/ 
;   z=date/1000;			 //求千位
	ldi R18,1000
	ldi R19,3
	lds R16,_date
	lds R17,_date+1
	rcall div16u
	sts _z+1,R17
	sts _z,R16
	.dbline 31
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
	.dbline 32
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
	.dbline 33
;   v=date%10;			 //求个位
	ldi R18,10
	ldi R19,0
	lds R16,_date
	lds R17,_date+1
	rcall mod16u
	sts _v+1,R17
	sts _v,R16
	.dbline 35
; 
;       PORTC=wei[0];
	lds R2,_wei
	out 0x15,R2
	.dbline 36
; 	  PORTB=duan[z];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_z
	lds R31,_z+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 37
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline 38
;   	  PORTC=wei[1];
	lds R2,_wei+1
	out 0x15,R2
	.dbline 39
;       PORTB=duan[x];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_x
	lds R31,_x+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 40
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline 41
;    	  PORTC=wei[2];
	lds R2,_wei+2
	out 0x15,R2
	.dbline 42
;       PORTB=duan[c];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_c
	lds R31,_c+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 43
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline 44
;       PORTC=wei[3];
	lds R2,_wei+3
	out 0x15,R2
	.dbline 45
;       PORTB=duan[v];
	ldi R24,<_duan
	ldi R25,>_duan
	lds R30,_v
	lds R31,_v+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 46
; 	  delay(50);  
	ldi R16,50
	rcall _delay
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e csh _csh fV
	.even
_csh::
	.dbline -1
	.dbline 52
;  			               
; 
;  }
; /***********************************初始化*****************************/
; void csh()
; {
	.dbline 53
;  DDRB=0XFF;
	ldi R24,255
	out 0x17,R24
	.dbline 54
;  DDRD=0XFF;
	out 0x11,R24
	.dbline 55
;  DDRC=0X0F;
	ldi R24,15
	out 0x14,R24
	.dbline -2
L14:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 61
; }
;  /*************************************************************************
;                                 主函数	
; **************************************************************************/
;  void main()
; {  
	.dbline 62
;     csh();
	rcall _csh
	rjmp L17
L16:
	.dbline 64
	.dbline 65
	ldi R24,5678
	ldi R25,22
	sts _date+1,R25
	sts _date,R24
	.dbline 66
	rcall _xianshi
	.dbline 67
L17:
	.dbline 63
	rjmp L16
X0:
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的时钟设计\icc\chengxu.c
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
