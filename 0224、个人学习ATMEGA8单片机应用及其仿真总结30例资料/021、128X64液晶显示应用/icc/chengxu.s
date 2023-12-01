	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc/delay.h
	.dbfunc e delay_1us _delay_1us fV
	.even
_delay_1us::
	.dbline -1
	.dbline 14
; 
; /*
; KS0108 128*64 LCD C语言驱动
; LCD引脚定义
; 1---GND 
; 2---VCC
; 3---VLCD
; 4---D/I
; 5---R/W
; 6---E
; 7到14 D0-D7
; 15--CS1
; 16--CS2
; 17--RESET
	.dbline 15
; 18--VEE
	nop
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay_nus _delay_nus fV
;              i -> R20,R21
;              n -> R22,R23
	.even
_delay_nus::
	xcall push_gset2
	movw R22,R16
	.dbline -1
	.dbline 19
; 19--SW
; 20--NC 
; */
; #include <iom16v.h>
	.dbline 20
; #include <macros.h>
	clr R20
	clr R21
	.dbline 21
; #include "delay.h"
	xjmp L6
L3:
	.dbline 22
	xcall _delay_1us
L4:
	.dbline 21
	subi R20,255  ; offset = 1
	sbci R21,255
L6:
	.dbline 21
	cp R20,R22
	cpc R21,R23
	brlo L3
	.dbline -2
L2:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r n 22 i
	.dbend
	.dbfunc e delay_1ms _delay_1ms fV
;              i -> R16,R17
	.even
_delay_1ms::
	.dbline -1
	.dbline 26
; unsigned char CurOffset,CurRow,CurPage,CurCol;	
; #define uchar unsigned char
; /*  常量定义  */
; #define LCD_STATUS_BUSY 0x80
; #define  START_LINE0   0xc0
	.dbline 28
	clr R16
	clr R17
	xjmp L11
L8:
	.dbline 28
L9:
	.dbline 28
	subi R16,255  ; offset = 1
	sbci R17,255
L11:
	.dbline 28
; #define  DISPLAY_ON    0x3f
; #define  DISPLAY_OFF   0x3e
	cpi R16,116
	ldi R30,4
	cpc R17,R30
	brlo L8
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbsym r i 16 i
	.dbend
	.dbfunc e delay_nms _delay_nms fV
;              i -> R20,R21
;              n -> R22,R23
	.even
_delay_nms::
	xcall push_gset2
	movw R22,R16
	.dbline -1
	.dbline 32
; #define  PARA1         0x40
; //#define BIT(x)  (1<<x)
; //PORTA---数据口  PORTB----控制口
; volatile unsigned char *LCD_DIR_PORT = &DDRA;
	.dbline 33
; volatile unsigned char *LCD_IP_PORT  = &PINA;
	clr R20
	clr R21
	.dbline 34
; volatile unsigned char *LCD_OP_PORT  = &PORTA;
	xjmp L16
L13:
	.dbline 35
	.dbline 36
	xcall _delay_1ms
	.dbline 37
L14:
	.dbline 34
	subi R20,255  ; offset = 1
	sbci R21,255
L16:
	.dbline 34
	cp R20,R22
	cpc R21,R23
	brlo L13
	.dbline -2
L12:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r i 20 i
	.dbsym r n 22 i
	.dbend
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc/delay.h
_LCD_DIR_PORT::
	.blkb 2
	.area idata
	.word 58
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc/delay.h
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_DIR_PORT _LCD_DIR_PORT pc
_LCD_IP_PORT::
	.blkb 2
	.area idata
	.word 57
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_IP_PORT _LCD_IP_PORT pc
_LCD_OP_PORT::
	.blkb 2
	.area idata
	.word 59
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_OP_PORT _LCD_OP_PORT pc
_LCD_EN_PORT::
	.blkb 2
	.area idata
	.word 56
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_EN_PORT _LCD_EN_PORT pc
_LCD_CS2_PORT::
	.blkb 2
	.area idata
	.word 56
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_CS2_PORT _LCD_CS2_PORT pc
_LCD_CS1_PORT::
	.blkb 2
	.area idata
	.word 56
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_CS1_PORT _LCD_CS1_PORT pc
_LCD_RW_PORT::
	.blkb 2
	.area idata
	.word 56
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_RW_PORT _LCD_RW_PORT pc
_LCD_DI_PORT::
	.blkb 2
	.area idata
	.word 56
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_DI_PORT _LCD_DI_PORT pc
_LCD_EN_BIT::
	.blkb 1
	.area idata
	.byte 16
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_EN_BIT _LCD_EN_BIT c
_LCD_CS2_BIT::
	.blkb 1
	.area idata
	.byte 8
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_CS2_BIT _LCD_CS2_BIT c
_LCD_CS1_BIT::
	.blkb 1
	.area idata
	.byte 4
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_CS1_BIT _LCD_CS1_BIT c
_LCD_RW_BIT::
	.blkb 1
	.area idata
	.byte 2
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_RW_BIT _LCD_RW_BIT c
_LCD_DI_BIT::
	.blkb 1
	.area idata
	.byte 1
	.area data(ram, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbsym e LCD_DI_BIT _LCD_DI_BIT c
	.area text(rom, con, rel)
	.dbfile D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c
	.dbfunc e LCD_BUSY _LCD_BUSY fV
;         status -> <dead>
;             lr -> R16
	.even
_LCD_BUSY::
	.dbline -1
	.dbline 69
; 
; volatile unsigned char *LCD_EN_PORT  = &PORTB;
; volatile unsigned char *LCD_CS2_PORT = &PORTB;
; volatile unsigned char *LCD_CS1_PORT = &PORTB;
; volatile unsigned char *LCD_RW_PORT  = &PORTB;
; volatile unsigned char *LCD_DI_PORT  = &PORTB;
; 
; char LCD_EN_BIT  = BIT(4);
; char LCD_CS2_BIT = BIT(3);
; char LCD_CS1_BIT = BIT(2);
; char LCD_RW_BIT  = BIT(1);
; char LCD_DI_BIT  = BIT(0);
; 
; #define SET_LCD_E      	        *LCD_EN_PORT |= LCD_EN_BIT    //LCD使能
; #define CLEAR_LCD_E       	    *LCD_EN_PORT &= ~LCD_EN_BIT   //LCD禁止
; 
; #define SET_LCD_DATA      	    *LCD_DI_PORT |= LCD_DI_BIT    //选择指令端口
; #define SET_LCD_CMD       	    *LCD_DI_PORT &= ~LCD_DI_BIT   //选择数据端口
; 
; #define SET_LCD_READ      	    *LCD_RW_PORT |= LCD_RW_BIT    //读模式
; #define SET_LCD_WRITE      	    *LCD_RW_PORT &= ~LCD_RW_BIT   //写模式
; 
; #define SET_LCD_CS2      	    *LCD_CS2_PORT |= LCD_CS2_BIT  //左屏选择禁止
; #define CLEAR_LCD_CS2      	    *LCD_CS2_PORT &= ~LCD_CS2_BIT //左屏选择使能
; 
; #define SET_LCD_CS1      	    *LCD_CS1_PORT |= LCD_CS1_BIT  //左屏选择禁止
; #define CLEAR_LCD_CS1      	    *LCD_CS1_PORT &= ~LCD_CS1_BIT //左屏选择使能
; 
; #define LEFT 0
; #define RIGHT 1
; #define CMD 0
; #define DATA 1
; 
; void LCD_BUSY(unsigned char lr) //判断忙标志
; {
	.dbline 71
;     unsigned char status;
;     asm("cli");
	cli
	.dbline 72
;     if(lr==LEFT)
	tst R16
	brne L18
	.dbline 73
;     {
	.dbline 74
;         CLEAR_LCD_CS2; //cs2=0
	lds R2,_LCD_CS2_BIT
	com R2
	lds R30,_LCD_CS2_PORT
	lds R31,_LCD_CS2_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 75
;         SET_LCD_CS1;   //cs1=1
	lds R2,_LCD_CS1_BIT
	lds R30,_LCD_CS1_PORT
	lds R31,_LCD_CS1_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 76
;     }
	xjmp L19
L18:
	.dbline 78
;     else
;     {
	.dbline 79
;         SET_LCD_CS2;   //cs2=1
	lds R2,_LCD_CS2_BIT
	lds R30,_LCD_CS2_PORT
	lds R31,_LCD_CS2_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 80
;         CLEAR_LCD_CS1; //cs1=0
	lds R2,_LCD_CS1_BIT
	com R2
	lds R30,_LCD_CS1_PORT
	lds R31,_LCD_CS1_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 81
;     }	
L19:
	.dbline 82
;     SET_LCD_CMD;
	lds R2,_LCD_DI_BIT
	com R2
	lds R30,_LCD_DI_PORT
	lds R31,_LCD_DI_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 83
;     *LCD_DIR_PORT = 0x00;
	clr R2
	lds R30,_LCD_DIR_PORT
	lds R31,_LCD_DIR_PORT+1
	std z+0,R2
	.dbline 84
;     *LCD_OP_PORT = 0xff;		
	ldi R24,255
	lds R30,_LCD_OP_PORT
	lds R31,_LCD_OP_PORT+1
	std z+0,R24
	.dbline 85
;     SET_LCD_READ;
	lds R2,_LCD_RW_BIT
	lds R30,_LCD_RW_PORT
	lds R31,_LCD_RW_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 86
;     SET_LCD_E;					
	lds R2,_LCD_EN_BIT
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 87
;     asm("nop");	
	nop
	.dbline 88
;     asm("nop");
	nop
	.dbline 89
;     asm("nop");
	nop
	.dbline 90
;     asm("nop");
	nop
	xjmp L21
L20:
	.dbline 92
	.dbline 93
	lds R2,_LCD_EN_BIT
	com R2
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 94
	nop
	.dbline 95
	nop
	.dbline 96
	nop
	.dbline 97
	nop
	.dbline 98
	lds R2,_LCD_EN_BIT
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 99
	nop
	.dbline 100
	nop
	.dbline 101
	nop
	.dbline 102
	nop
	.dbline 103
L21:
	.dbline 91
;     while((*LCD_IP_PORT) & LCD_STATUS_BUSY)
	lds R30,_LCD_IP_PORT
	lds R31,_LCD_IP_PORT+1
	ldd R2,z+0
	sbrc R2,7
	rjmp L20
	.dbline 104
;     {
;         CLEAR_LCD_E;	   		
;         asm("nop");
;         asm("nop");
;         asm("nop");
;         asm("nop");
;         SET_LCD_E;
;         asm("nop");
;         asm("nop");
;         asm("nop");
;         asm("nop");
;     }
;     CLEAR_LCD_E;
	lds R2,_LCD_EN_BIT
	com R2
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 105
;     SET_LCD_WRITE;
	lds R2,_LCD_RW_BIT
	com R2
	lds R30,_LCD_RW_PORT
	lds R31,_LCD_RW_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 106
;     *LCD_OP_PORT = 0xff;
	ldi R24,255
	lds R30,_LCD_OP_PORT
	lds R31,_LCD_OP_PORT+1
	std z+0,R24
	.dbline 107
;     asm("sei");//)asm("sei");
	sei
	.dbline -2
L17:
	.dbline 0 ; func end
	ret
	.dbsym l status 1 c
	.dbsym r lr 16 c
	.dbend
	.dbfunc e write_LCD _write_LCD fV
;           data -> y+4
;             cd -> R20
;             lr -> R22
	.even
_write_LCD::
	xcall push_gset2
	mov R20,R18
	mov R22,R16
	.dbline -1
	.dbline 111
; }
; 
; void write_LCD(unsigned char lr,unsigned char cd,unsigned char data) /*写入指令或数据*/
; {	
	.dbline 112
;     asm("cli");//)asm("cli");
	cli
	.dbline 113
;     LCD_BUSY(lr);
	mov R16,R22
	xcall _LCD_BUSY
	.dbline 114
;     if(cd==CMD)
	tst R20
	brne L24
	.dbline 115
;     {
	.dbline 116
;         SET_LCD_CMD;
	lds R2,_LCD_DI_BIT
	com R2
	lds R30,_LCD_DI_PORT
	lds R31,_LCD_DI_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 117
;     }
	xjmp L25
L24:
	.dbline 119
;     else
;     {
	.dbline 120
;         SET_LCD_DATA;
	lds R2,_LCD_DI_BIT
	lds R30,_LCD_DI_PORT
	lds R31,_LCD_DI_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 121
;     }
L25:
	.dbline 122
;     SET_LCD_WRITE; 
	lds R2,_LCD_RW_BIT
	com R2
	lds R30,_LCD_RW_PORT
	lds R31,_LCD_RW_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 123
;     SET_LCD_E;
	lds R2,_LCD_EN_BIT
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 124
;     *LCD_DIR_PORT = 0xff;
	ldi R24,255
	lds R30,_LCD_DIR_PORT
	lds R31,_LCD_DIR_PORT+1
	std z+0,R24
	.dbline 125
;     *LCD_OP_PORT = data;
	lds R30,_LCD_OP_PORT
	lds R31,_LCD_OP_PORT+1
	ldd R0,y+4
	std z+0,R0
	.dbline 126
;     asm("nop");
	nop
	.dbline 127
;     asm("nop");
	nop
	.dbline 128
;     asm("nop");
	nop
	.dbline 129
;     asm("nop");
	nop
	.dbline 130
;     CLEAR_LCD_E;
	lds R2,_LCD_EN_BIT
	com R2
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 131
;     *LCD_OP_PORT = 0xff;
	lds R30,_LCD_OP_PORT
	lds R31,_LCD_OP_PORT+1
	std z+0,R24
	.dbline 132
;     asm("sei");
	sei
	.dbline -2
L23:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym l data 4 c
	.dbsym r cd 20 c
	.dbsym r lr 22 c
	.dbend
	.dbfunc e read_LCD _read_LCD fc
;           data -> R20
;             lr -> R22
	.even
_read_LCD::
	xcall push_gset2
	mov R22,R16
	.dbline -1
	.dbline 135
; }
; unsigned char read_LCD(unsigned char lr)	  /*  读显示数据 */
; {
	.dbline 137
;     unsigned char data;
;     asm("cli");
	cli
	.dbline 138
;     LCD_BUSY(lr);
	mov R16,R22
	xcall _LCD_BUSY
	.dbline 139
;     SET_LCD_DATA;
	lds R2,_LCD_DI_BIT
	lds R30,_LCD_DI_PORT
	lds R31,_LCD_DI_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 140
;     *LCD_DIR_PORT = 0x00;
	clr R2
	lds R30,_LCD_DIR_PORT
	lds R31,_LCD_DIR_PORT+1
	std z+0,R2
	.dbline 141
;     *LCD_OP_PORT = 0xff;
	ldi R24,255
	lds R30,_LCD_OP_PORT
	lds R31,_LCD_OP_PORT+1
	std z+0,R24
	.dbline 142
;     SET_LCD_READ;
	lds R2,_LCD_RW_BIT
	lds R30,_LCD_RW_PORT
	lds R31,_LCD_RW_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 143
;     SET_LCD_E;
	lds R2,_LCD_EN_BIT
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 144
;     asm("nop");
	nop
	.dbline 145
;     asm("nop");
	nop
	.dbline 146
;     asm("nop");
	nop
	.dbline 147
;     asm("nop");
	nop
	.dbline 148
;     data=*LCD_IP_PORT;
	lds R30,_LCD_IP_PORT
	lds R31,_LCD_IP_PORT+1
	ldd R20,z+0
	.dbline 149
;     CLEAR_LCD_E;
	lds R2,_LCD_EN_BIT
	com R2
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 150
;     SET_LCD_WRITE;
	lds R2,_LCD_RW_BIT
	com R2
	lds R30,_LCD_RW_PORT
	lds R31,_LCD_RW_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 151
;     LCD_BUSY(lr);
	mov R16,R22
	xcall _LCD_BUSY
	.dbline 152
;     SET_LCD_DATA; 
	lds R2,_LCD_DI_BIT
	lds R30,_LCD_DI_PORT
	lds R31,_LCD_DI_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 153
;     *LCD_DIR_PORT = 0x00;
	clr R2
	lds R30,_LCD_DIR_PORT
	lds R31,_LCD_DIR_PORT+1
	std z+0,R2
	.dbline 154
;     *LCD_OP_PORT = 0xff;
	ldi R24,255
	lds R30,_LCD_OP_PORT
	lds R31,_LCD_OP_PORT+1
	std z+0,R24
	.dbline 155
;     SET_LCD_READ; 
	lds R2,_LCD_RW_BIT
	lds R30,_LCD_RW_PORT
	lds R31,_LCD_RW_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 156
;     SET_LCD_E;
	lds R2,_LCD_EN_BIT
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	or R3,R2
	std z+0,R3
	.dbline 157
;     asm("nop");	
	nop
	.dbline 158
;     asm("nop");
	nop
	.dbline 159
;     asm("nop");
	nop
	.dbline 160
;     asm("nop");
	nop
	.dbline 161
;     data=*LCD_IP_PORT;
	lds R30,_LCD_IP_PORT
	lds R31,_LCD_IP_PORT+1
	ldd R20,z+0
	.dbline 162
;     CLEAR_LCD_E;
	lds R2,_LCD_EN_BIT
	com R2
	lds R30,_LCD_EN_PORT
	lds R31,_LCD_EN_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 163
;     SET_LCD_WRITE;
	lds R2,_LCD_RW_BIT
	com R2
	lds R30,_LCD_RW_PORT
	lds R31,_LCD_RW_PORT+1
	ldd R3,z+0
	and R3,R2
	std z+0,R3
	.dbline 165
; 
;     asm("sei");
	sei
	.dbline 166
;     return data;
	mov R16,R20
	.dbline -2
L26:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r data 20 c
	.dbsym r lr 22 c
	.dbend
	.dbfunc e set_start_line_L _set_start_line_L fV
;           line -> R20
	.even
_set_start_line_L::
	xcall push_gset1
	mov R20,R16
	sbiw R28,1
	.dbline -1
	.dbline 170
; }
; 
; void set_start_line_L(unsigned char line) /*设置显示起始行*/ //0-63
; {
	.dbline 171
;     write_LCD(LEFT,CMD,0xc0|line); 
	mov R24,R20
	ori R24,192
	std y+0,R24
	clr R18
	clr R16
	xcall _write_LCD
	.dbline -2
L27:
	adiw R28,1
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r line 20 c
	.dbend
	.dbfunc e set_start_line_R _set_start_line_R fV
;           line -> R20
	.even
_set_start_line_R::
	xcall push_gset1
	mov R20,R16
	sbiw R28,1
	.dbline -1
	.dbline 175
; }
; 
; void set_start_line_R(unsigned char line) /*设置显示起始行*/ //0-63
; {
	.dbline 176
;     write_LCD(RIGHT,CMD,0xc0|line); 
	mov R24,R20
	ori R24,192
	std y+0,R24
	clr R18
	ldi R16,1
	xcall _write_LCD
	.dbline -2
L28:
	adiw R28,1
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r line 20 c
	.dbend
	.dbfunc e set_page_L _set_page_L fV
;           page -> R20
	.even
_set_page_L::
	xcall push_gset1
	mov R20,R16
	sbiw R28,1
	.dbline -1
	.dbline 180
; }
; 
; void set_page_L(unsigned char page)	/*设置X地址 设置页*/  //0-7
; {
	.dbline 181
;     write_LCD(LEFT,CMD,0xb8|page);                     
	mov R24,R20
	ori R24,184
	std y+0,R24
	clr R18
	clr R16
	xcall _write_LCD
	.dbline -2
L29:
	adiw R28,1
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r page 20 c
	.dbend
	.dbfunc e set_page_R _set_page_R fV
;           page -> R20
	.even
_set_page_R::
	xcall push_gset1
	mov R20,R16
	sbiw R28,1
	.dbline -1
	.dbline 184
; }
; void set_page_R(unsigned char page)	/*设置X地址 设置页*/ //0-7
; {
	.dbline 185
;     write_LCD(RIGHT,CMD,0xb8|page);                     
	mov R24,R20
	ori R24,184
	std y+0,R24
	clr R18
	ldi R16,1
	xcall _write_LCD
	.dbline -2
L30:
	adiw R28,1
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r page 20 c
	.dbend
	.dbfunc e set_col_addr_L _set_col_addr_L fV
;            col -> R20
	.even
_set_col_addr_L::
	xcall push_gset1
	mov R20,R16
	sbiw R28,1
	.dbline -1
	.dbline 189
; }
; 
; void set_col_addr_L(unsigned char col) /*设置Y地址*/ //0-63
; {
	.dbline 190
;     write_LCD(LEFT,CMD,0x40|col);                     
	mov R24,R20
	ori R24,64
	std y+0,R24
	clr R18
	clr R16
	xcall _write_LCD
	.dbline -2
L31:
	adiw R28,1
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r col 20 c
	.dbend
	.dbfunc e set_col_addr_R _set_col_addr_R fV
;            col -> R20
	.even
_set_col_addr_R::
	xcall push_gset1
	mov R20,R16
	sbiw R28,1
	.dbline -1
	.dbline 194
; }
; 
; void set_col_addr_R(unsigned char col) /*设置Y地址*/ //0-63
; {
	.dbline 195
;     write_LCD(RIGHT,CMD,0x40|col);                     
	mov R24,R20
	ori R24,64
	std y+0,R24
	clr R18
	ldi R16,1
	xcall _write_LCD
	.dbline -2
L32:
	adiw R28,1
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r col 20 c
	.dbend
	.dbfunc e init_lcd _init_lcd fV
	.even
_init_lcd::
	sbiw R28,1
	.dbline -1
	.dbline 199
; }
; 
; void init_lcd(void) /*初始化函数*/
; {
	.dbline 200
;     set_start_line_L(0); /*显示起始行为0*/
	clr R16
	xcall _set_start_line_L
	.dbline 201
;     set_start_line_R(0); /*显示起始行为0*/
	clr R16
	xcall _set_start_line_R
	.dbline 202
;     write_LCD(LEFT,CMD,DISPLAY_ON); /*  开显示  */
	ldi R24,63
	std y+0,R24
	clr R18
	clr R16
	xcall _write_LCD
	.dbline 203
;     write_LCD(RIGHT,CMD,DISPLAY_ON); /*  开显示  */
	ldi R24,63
	std y+0,R24
	clr R18
	ldi R16,1
	xcall _write_LCD
	.dbline -2
L33:
	adiw R28,1
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e clr_lcd _clr_lcd fV
;          pages -> R20
;              i -> R22
	.even
_clr_lcd::
	xcall push_gset2
	sbiw R28,1
	.dbline -1
	.dbline 207
; }
; 
; void clr_lcd(void) /*清屏函数*/
; {
	.dbline 209
;     unsigned char pages,i;
;     for(pages=0;pages<8;pages++)
	clr R20
	xjmp L38
L35:
	.dbline 210
;     {
	.dbline 211
;         set_page_L(pages);  /* X 页地址 */
	mov R16,R20
	xcall _set_page_L
	.dbline 212
;         set_page_R(pages);  /* X 页地址 */
	mov R16,R20
	xcall _set_page_R
	.dbline 213
;         for(i=0;i<64;i++)   
	clr R22
	xjmp L42
L39:
	.dbline 214
	.dbline 215
	mov R16,R22
	xcall _set_col_addr_L
	.dbline 216
	mov R16,R22
	xcall _set_col_addr_R
	.dbline 217
	clr R2
	std y+0,R2
	ldi R18,1
	clr R16
	xcall _write_LCD
	.dbline 218
	clr R2
	std y+0,R2
	ldi R18,1
	ldi R16,1
	xcall _write_LCD
	.dbline 219
L40:
	.dbline 213
	inc R22
L42:
	.dbline 213
	cpi R22,64
	brlo L39
	.dbline 220
L36:
	.dbline 209
	inc R20
L38:
	.dbline 209
	cpi R20,8
	brlo L35
	.dbline -2
L34:
	adiw R28,1
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r pages 20 c
	.dbsym r i 22 c
	.dbend
