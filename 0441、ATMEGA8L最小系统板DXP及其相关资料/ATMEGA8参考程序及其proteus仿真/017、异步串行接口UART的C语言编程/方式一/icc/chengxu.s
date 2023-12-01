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
	.dbfile D:\整理\个人总结的M8程序\017、异步串行接口UART的C语言编程\方式一\icc\chengxu.c
	.dbsym e Table _Table A[16:16]c
_Send_Data::
	.blkb 2
	.area idata
	.byte 'a,'b
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\017、异步串行接口UART的C语言编程\方式一\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 'c,'d
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\017、异步串行接口UART的C语言编程\方式一\icc\chengxu.c
	.dbsym e Send_Data _Send_Data A[4:4]c
_Receive_Data::
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\017、异步串行接口UART的C语言编程\方式一\icc\chengxu.c
	.blkb 2
	.area idata
	.byte 0,0
	.area data(ram, con, rel)
	.dbfile D:\整理\个人总结的M8程序\017、异步串行接口UART的C语言编程\方式一\icc\chengxu.c
	.dbsym e Receive_Data _Receive_Data A[4:4]c
	.area text(rom, con, rel)
	.dbfile D:\整理\个人总结的M8程序\017、异步串行接口UART的C语言编程\方式一\icc\chengxu.c
	.dbfunc e DelayMs _DelayMs fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMs::
	xcall push_gset1
	.dbline -1
	.dbline 25
; /********************************************************************
;     计算机通过RS232接口向计算机发送1,2,3,4四个数据。单片机收
; 到四个数据后在数码管上动态显示出来，然后单片机向计算机发送a，b，c，d，四
; 个字符，使用着通过“串口调试助手 ”等软件观察数据传输过程
; 
; *********************************************************************/
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
; uchar Table[16]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
;                  0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
; uchar Send_Data[]={'a','b','c','d'};//单片机向电脑发送的数据数组
; uchar Receive_Data[]={0,0,0,0};	    //单片机接收到电脑的数据数组					
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间					   	
; **********************************************************************/            
; void DelayMs(uint i)           //Ms级延时，参数i为延时时间
; {uint j;
	.dbline 26
;  for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 27
	.dbline 27
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 27
	.dbline 27
	.dbline 27
L7:
	.dbline 27
	subi R20,1
	sbci R21,0
L9:
	.dbline 27
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 27
L3:
	.dbline 26
	subi R16,1
	sbci R17,0
L5:
	.dbline 26
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
	.dbline 34
;   {for(j=8000;j!=0;j--) {;}}
; }
; /**********************************************************************
; 				            显示函数		
; 注意：使用开发板时sel=0xef;
; **********************************************************************/
; void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
; {uchar i,sel=0xef;           
	.dbline 34
	ldi R20,239
	.dbline 35
;  for(i=0;i<4;i++)
	clr R22
	xjmp L14
L11:
	.dbline 36
	.dbline 36
	out 0x15,R20
	.dbline 37
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
	.dbline 38
	ldi R16,1
	ldi R17,0
	xcall _DelayMs
	.dbline 39
	lsl R20
	.dbline 40
L12:
	.dbline 35
	inc R22
L14:
	.dbline 35
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
	.dbline 46
;   {PORTC=sel;                  //选通最右边的数码管
;    PORTA=~Table[p[i]];          //送字型码
;    DelayMs(1);                 //显示延时    
;    sel=sel<<1;                 //移位以显示前一位
;   }
; }
; /**********************************************************************
; 				         初始化I/O口	
; **********************************************************************/
; void Init_IO(void)             //初始化I/O口
; {DDRA=0xff;                    //设置A口为推挽1输出
	.dbline 46
	ldi R24,255
	out 0x1a,R24
	.dbline 47
;  PORTA=0xff;
	out 0x1b,R24
	.dbline 48
;  DDRC=0xff;                    //设置C口为推挽1输出             
	out 0x14,R24
	.dbline 49
;  PORTC=0xff;
	out 0x15,R24
	.dbline -2
L15:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 56
; 
;  }
; /**********************************************************************
; 				          主函数		
; **********************************************************************/
; void main(void)
; {uchar i;
	.dbline 57
; Init_IO();
	xcall _Init_IO
	.dbline 58
;  UBRR=51;//9600bps,8MHZ,
	ldi R24,51
	out 0x9,R24
	.dbline 59
;  UCSRB=0x18;//RXD.TXD使能；
	ldi R24,24
	out 0xa,R24
	.dbline 60
; for(i=0;i<4;i++)
	clr R20
	xjmp L20
X2:
	.dbline 61
;    {while(!(UCSRA&0x80)) 
L21:
	.dbline 62
	.dbline 62
	ldi R16,<_Receive_Data
	ldi R17,>_Receive_Data
	xcall _Display
	.dbline 62
L22:
	.dbline 61
	sbis 0xb,7
	rjmp L21
	.dbline 63
	ldi R24,<_Receive_Data
	ldi R25,>_Receive_Data
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	in R24,0xc
	subi R24,48
	std z+0,R24
	.dbline 63
L18:
	.dbline 60
	inc R20
L20:
	.dbline 60
	cpi R20,4
	brlo L22
	.dbline 64
;       {Display(Receive_Data);}            //等待接收完成
;     Receive_Data[i]=UDR-48;}              //接收数据
;  for(i=0;i<12;i++)						  
	clr R20
	xjmp L27
X3:
	.dbline 65
;    {while(!(UCSRA&0x20)) 				  //等待接收完成
L28:
	.dbline 66
	.dbline 66
	ldi R16,<_Receive_Data
	ldi R17,>_Receive_Data
	xcall _Display
	.dbline 66
L29:
	.dbline 65
	sbis 0xb,5
	rjmp L28
	.dbline 67
	ldi R24,<_Send_Data
	ldi R25,>_Send_Data
	mov R30,R20
	clr R31
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0xc,R2
	.dbline 67
L25:
	.dbline 64
	inc R20
L27:
	.dbline 64
	cpi R20,12
	brlo L29
	xjmp L32
L31:
	.dbline 69
	.dbline 69
	ldi R16,<_Receive_Data
	ldi R17,>_Receive_Data
	xcall _Display
	.dbline 69
L32:
	.dbline 68
	xjmp L31
X4:
	.dbline -2
L16:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
