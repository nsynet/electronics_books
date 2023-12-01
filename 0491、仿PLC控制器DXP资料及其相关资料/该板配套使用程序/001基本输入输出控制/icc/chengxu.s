	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\NEW光~1\八路输入输出继电器控制板\基本输入输出控制\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	rcall push_gset1
	.dbline -1
	.dbline 12
; #include <iom8v.h>
; #include <macros.h> 
; /**********************************************************************
; 				  函数数据类型说明							   	
; **********************************************************************/
; #define uchar unsigned char 
; #define uint unsigned int
; /**********************************************************************
; 				  MS级延时函数程序，参数i 延时时间								   	
; **********************************************************************/
; void DelayMS(uint i)
; {
	.dbline 14
; uint j;
; for(;i!=0;i--)
	rjmp L5
L2:
	.dbline 15
; {
	.dbline 16
	ldi R20,1000
	ldi R21,3
	rjmp L9
L6:
	.dbline 16
L7:
	.dbline 16
	subi R20,1
	sbci R21,0
L9:
	.dbline 16
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 17
L3:
	.dbline 14
	subi R16,1
	sbci R17,0
L5:
	.dbline 14
	cpi R16,0
	cpc R16,R17
	brne L2
X1:
	.dbline -2
L1:
	rcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e Init_IO _Init_IO fV
	.even
_Init_IO::
	.dbline -1
	.dbline 23
; for(j=1000;j!=0;j--);
; }
; }
; /**********************************************************************
; 				   初始化					   	
; **********************************************************************/
; void Init_IO(void)//初始化I/O
; {
	.dbline 25
; //设置B口为输出
; DDRB=0x3F;
	ldi R24,63
	out 0x17,R24
	.dbline 26
; PORTB=0x3F;
	out 0x18,R24
	.dbline 28
; //设置C口为输出
; DDRC=0xFF;
	ldi R24,255
	out 0x14,R24
	.dbline 29
; PORTC=0xFF;
	out 0x15,R24
	.dbline 31
; //设置D口为输入
; DDRD=0X00;
	clr R2
	out 0x11,R2
	.dbline 32
; PORTD=0x00;
	out 0x12,R2
	.dbline -2
L10:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 38
; }
; /**********************************************************************
; 				  主函数				   	
; **********************************************************************/
; void main(void)
; {
	.dbline 39
; Init_IO();  //初始化I/O
	rcall _Init_IO
	rjmp L13
L12:
	.dbline 41
; while(1)
; {
	.dbline 42
; WDR();//WDT 复位 
	wdr
	.dbline 43
; if((PIND&0X01)==0)//按下PD0,PC0闭合
	sbic 0x10,0
	rjmp L15
	.dbline 44
; {PORTC=0xFE;PORTB=0xFF;}
	.dbline 44
	ldi R24,254
	out 0x15,R24
	.dbline 44
	ldi R24,255
	out 0x18,R24
	.dbline 44
L15:
	.dbline 45
; if((PIND&0X02)==0)//按下PD1,PC1闭合
	sbic 0x10,1
	rjmp L17
	.dbline 46
; {PORTC=0xFD;PORTB=0xFF;}
	.dbline 46
	ldi R24,253
	out 0x15,R24
	.dbline 46
	ldi R24,255
	out 0x18,R24
	.dbline 46
L17:
	.dbline 47
; if((PIND&0X04)==0)//按下PD2,PC2闭合
	sbic 0x10,2
	rjmp L19
	.dbline 48
; {PORTC=0xFB;PORTB=0xFF;}
	.dbline 48
	ldi R24,251
	out 0x15,R24
	.dbline 48
	ldi R24,255
	out 0x18,R24
	.dbline 48
L19:
	.dbline 49
; if((PIND&0X08)==0)//按下PD3,PC3闭合
	sbic 0x10,3
	rjmp L21
	.dbline 50
; {PORTC=0xF7;PORTB=0xFF;}
	.dbline 50
	ldi R24,247
	out 0x15,R24
	.dbline 50
	ldi R24,255
	out 0x18,R24
	.dbline 50
L21:
	.dbline 51
; if((PIND&0X10)==0)//按下PD4,PB0闭合
	sbic 0x10,4
	rjmp L23
	.dbline 52
; {PORTB=0xFE;PORTC=0xFF;}
	.dbline 52
	ldi R24,254
	out 0x18,R24
	.dbline 52
	ldi R24,255
	out 0x15,R24
	.dbline 52
L23:
	.dbline 53
; if((PIND&0X20)==0)//按下PD5,PB1闭合
	sbic 0x10,5
	rjmp L25
	.dbline 54
; {PORTB=0xFD;PORTC=0xFF;}
	.dbline 54
	ldi R24,253
	out 0x18,R24
	.dbline 54
	ldi R24,255
	out 0x15,R24
	.dbline 54
L25:
	.dbline 55
; if((PIND&0X40)==0)//按下PD6,PB2闭合
	sbic 0x10,6
	rjmp L27
	.dbline 56
; {PORTB=0xFB;PORTC=0xFF;}
	.dbline 56
	ldi R24,251
	out 0x18,R24
	.dbline 56
	ldi R24,255
	out 0x15,R24
	.dbline 56
L27:
	.dbline 57
; if((PIND&0X80)==0)//按下PD7,PB3闭合
	sbic 0x10,7
	rjmp L29
	.dbline 58
; {PORTB=0xF7;PORTC=0xFF;}
	.dbline 58
	ldi R24,247
	out 0x18,R24
	.dbline 58
	ldi R24,255
	out 0x15,R24
	.dbline 58
L29:
	.dbline 59
L13:
	.dbline 40
	rjmp L12
X2:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbend
