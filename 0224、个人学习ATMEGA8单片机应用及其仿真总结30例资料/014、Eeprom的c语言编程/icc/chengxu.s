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
	.blkb 2
	.area idata
	.byte 'w,124
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 57,94
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 'y,'q
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\014、Eeprom的c语言编程\icc\chengxu.c
	.dbsym e Table _Table A[16:16]c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\014、Eeprom的c语言编程\icc\chengxu.c
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
; /**********************************************************************
; 								定义数组								   	
; **********************************************************************/
; //数码管字型表，对应0，1，2，3，4，5，6，7，8，9，A,B,C,D,E,F//
; uchar Table[16]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
;                  0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; uchar Read_Data[4];            //定义读出4字节数据
; 
;  uchar i;
; /**********************************************************************
; 								延时函数								   	
; **********************************************************************/
; void DelayMs(uint i)           //Ms级延时，参数i为延时时间
; {uint j;
	.dbline 19
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 20
	.dbline 20
	ldi R20,8000
	ldi R21,31
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
	.dbfunc e Display _Display fV
;            sel -> R20
;              i -> R22
;              p -> R10,R11
	.even
_Display::
	xcall push_gset3
	movw R10,R16
	.dbline -1
	.dbline 27
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            显示函数		
; 注意：使用开发板时sel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0x01;           
	.dbline 27
	ldi R20,1
	.dbline 28
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 29
	.dbline 29
	out 0x15,R20
	.dbline 30
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
	out 0x18,R2
	.dbline 31
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 32
	lsl R20
	.dbline 33
L12:
	.dbline 28
	inc R22
L14:
	.dbline 28
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
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 39
;   {PORTC=sel;                  //选通最右边的数码管
;    PORTB=~Table[p[i]];          //送字型码
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; /**********************************************************************
; 								初始化I/O口								   	
; **********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {DDRB=0xff;                    //设置B口为推挽1输出
	.dbline 39
	ldi R24,255
	out 0x17,R24
	.dbline 40
;  PORTB=0xff;
	out 0x18,R24
	.dbline 41
;  DDRC=0xff;                    //设置C口为推挽1输出             
	out 0x14,R24
	.dbline 42
;  PORTC=0xff;
	out 0x15,R24
	.dbline 43
;  DDRD=0x00;                    //设置C口为推挽1输出             
	clr R2
	out 0x11,R2
	.dbline 44
;  PORTD=0x00;
	out 0x12,R2
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Write_EEPROM _Write_EEPROM fV
;        Address -> R22,R23
;           Data -> R20
	.even
_Write_EEPROM::
	xcall push_gset2
	movw R22,R18
	mov R20,R16
	.dbline -1
	.dbline 52
; }
; /**********************************************************************
; 		  写一字节到EEPROM数据	
; 		参数：Date：写入的数据；  
; 		    Address:写入的地址					   	
; **********************************************************************/
; void Write_EEPROM(uchar Data,uint Address)
; {if(EECR&0x20) DelayMs(4);//判断写使能是否为0
	.dbline 52
	sbis 0x1c,5
	rjmp L17
	.dbline 52
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
L17:
	.dbline 53
;  EEARH=Address>>8;        //送高地址
	movw R2,R22
	mov R2,R3
	clr R3
	out 0x1f,R2
	.dbline 54
;  EEARL=Address&0x00ff;    //送低地址
	movw R24,R22
	andi R25,0
	out 0x1e,R24
	.dbline 55
;  EEDR=Data;               //送数据
	out 0x1d,R20
	.dbline 56
;  EECR=EECR|0x04;          //主写使能置位
	sbi 0x1c,2
	.dbline 57
;  EECR=EECR|0x02;          //写使能置位
	sbi 0x1c,1
	.dbline 58
;  DelayMs(4);              //延时（写入时间约在2.5ms~4ms）
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
	.dbline -2
L16:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r Address 22 i
	.dbsym r Data 20 c
	.dbend
	.dbfunc e Read_EEPROM _Read_EEPROM fc
;              i -> R20
;        Address -> R20,R21
	.even
_Read_EEPROM::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 65
; }
; /**********************************************************************
; 			读一字节到EEPROM数据	
; 		参数:Address：写入的地址；返回值：读取的内容							   	
; **********************************************************************/
; uchar Read_EEPROM(uint Address)
; {uchar i;
	.dbline 66
;  if(EECR&0x01) DelayMs(4);//判断读使能是否为0
	sbis 0x1c,0
	rjmp L20
	.dbline 66
	ldi R16,4
	ldi R17,0
	xcall _DelayMs
L20:
	.dbline 67
;  EEARH=Address>>8;        //送高地址
	movw R2,R20
	mov R2,R3
	clr R3
	out 0x1f,R2
	.dbline 68
;  EEARL=Address&0x00ff;    //送低地址
	movw R24,R20
	andi R25,0
	out 0x1e,R24
	.dbline 69
;  EECR=EECR|0x01;          //读使能置位
	sbi 0x1c,0
	.dbline 70
;  DelayMs(5);              //延时
	ldi R16,5
	ldi R17,0
	xcall _DelayMs
	.dbline 71
;  i=EEDR;                  //读数据
	in R20,0x1d
	.dbline 72
;  return(i);
	mov R16,R20
	.dbline -2
L19:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbsym r Address 20 i
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 78
; }
; /**********************************************************************
; 								主函数								   	
; **********************************************************************/
; void main(void)
; {
	.dbline 80
; 
;  Init_IO();                    //初始化I/O口
	xcall _Init_IO
	.dbline 84
; /**********************************************************************
; 读写多个数据 开始
; **********************************************************************/
;  for(i=0;i<4;i++)              //写四位数据：0x00、0x04、0x08、0x0c
	clr R2
	sts _i,R2
	xjmp L26
L23:
	.dbline 85
	lds R18,_i
	clr R19
	mov R2,R18
	ldi R24,3
	mul R24,R2
	mov R16,R0
	xcall _Write_EEPROM
L24:
	.dbline 84
	lds R24,_i
	subi R24,255    ; addi 1
	sts _i,R24
L26:
	.dbline 84
	lds R24,_i
	cpi R24,4
	brlo L23
	.dbline 86
;     Write_EEPROM(3*i,i);       //写四位数据：0x00、0x04、0x08、0x0c
;  for(i=0;i<4;i++)
	clr R2
	sts _i,R2
	xjmp L30
L27:
	.dbline 87
	lds R16,_i
	clr R17
	xcall _Read_EEPROM
	ldi R24,<_Read_Data
	ldi R25,>_Read_Data
	lds R30,_i
	clr R31
	add R30,R24
	adc R31,R25
	std z+0,R16
L28:
	.dbline 86
	lds R24,_i
	subi R24,255    ; addi 1
	sts _i,R24
L30:
	.dbline 86
	lds R24,_i
	cpi R24,4
	brlo L27
	xjmp L32
L31:
	.dbline 89
	ldi R16,<_Read_Data
	ldi R17,>_Read_Data
	xcall _Display
L32:
	.dbline 88
	xjmp L31
X2:
	.dbline -2
L22:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\014、Eeprom的c语言编程\icc\chengxu.c
_i::
	.blkb 1
	.dbsym e i _i c
_Read_Data::
	.blkb 4
	.dbsym e Read_Data _Read_Data A[4:4]c
