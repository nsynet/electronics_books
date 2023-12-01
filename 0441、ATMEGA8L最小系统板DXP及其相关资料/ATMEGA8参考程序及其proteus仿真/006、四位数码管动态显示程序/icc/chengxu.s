	.module chengxu.c
	.area data(ram, con, rel)
_Table::
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
	.dbfile D:\整理\个人总结的M8程序\006、四位数码管动态显示程序\icc\chengxu.c
	.dbsym e Table _Table A[10:10]c
_wei::
	.blkb 2
	.area idata
	.byte 1,2
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\006、四位数码管动态显示程序\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 4,8
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\006、四位数码管动态显示程序\icc\chengxu.c
	.dbsym e wei _wei A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\006、四位数码管动态显示程序\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 18
; #include <iom8v.h>
; /********************************************************************
;                 数据类型定义
; *********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; /********************************************************************
;                 数码管段码定义0123456789
; *********************************************************************/
; uchar Table[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
; uchar wei[4]={0X01,0X02,0X04,0X08};  //位的控制端	(仿真)    
; //uchar wei[4]={0XEF,0XDF,0XBF,0X7F};  //位的控制端	(开发板使用) 
; uint z,x,c,v, date;	//定义数据类型                           
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间					   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 20
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 21
; {
	.dbline 22
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
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
	.dbline 23
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
	.dbfunc e Pre_Display _Pre_Display fV
	.even
_Pre_Display::
	.dbline -1
	.dbline 29
; for(j=8000;j!=0;j--);
; }
; }
; /**********************************************************************
;                 数码管动态扫描
; *********************************************************************/
; void Pre_Display()
;  { 
	.dbline 32
; 
;  /***********************数据转换*****************************/ 
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
; 	  PORTB=Table[z];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_z
	lds R31,_z+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 39
; 	  DelayMS(1);  
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 40
;   	  PORTC=wei[1];
	lds R2,_wei+1
	out 0x15,R2
	.dbline 41
;       PORTB=Table[x];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_x
	lds R31,_x+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 42
; 	  DelayMS(1);  
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 43
;    	  PORTC=wei[2];
	lds R2,_wei+2
	out 0x15,R2
	.dbline 44
;       PORTB=Table[c];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_c
	lds R31,_c+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 45
; 	  DelayMS(1);  
	ldi R16,1
	ldi R17,0
	xcall _DelayMS
	.dbline 46
;       PORTC=wei[3];
	lds R2,_wei+3
	out 0x15,R2
	.dbline 47
;       PORTB=Table[v];
	ldi R24,<_Table
	ldi R25,>_Table
	lds R30,_v
	lds R31,_v+1
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 48
; 	  DelayMS(1);  
	ldi R16,1
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
	.dbline 52
;   }
; //////////////////////////////初始化////////////////////////////////////
; void Init_IO(void)//初始化I/O
; {
	.dbline 54
; //设置B口为输出
; DDRB=0xFF;
	ldi R24,255
	out 0x17,R24
	.dbline 55
; PORTB=0xFF;
	out 0x18,R24
	.dbline 57
; //设置C口为输出
; DDRC=0xFF;
	out 0x14,R24
	.dbline 58
; PORTC=0xFF;
	out 0x15,R24
	.dbline -2
L14:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 65
; }
; 
; /**********************************************************************
; 				           主函数						  	
; **********************************************************************/
; void main(void)
; {
	.dbline 66
; Init_IO();  //初始化I/O
	xcall _Init_IO
	xjmp L17
L16:
	.dbline 68
	.dbline 69
	ldi R24,2345
	ldi R25,9
	sts _date+1,R25
	sts _date,R24
	.dbline 70
	xcall _Pre_Display
	.dbline 71
L17:
	.dbline 67
	xjmp L16
X2:
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\006、四位数码管动态显示程序\icc\chengxu.c
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
