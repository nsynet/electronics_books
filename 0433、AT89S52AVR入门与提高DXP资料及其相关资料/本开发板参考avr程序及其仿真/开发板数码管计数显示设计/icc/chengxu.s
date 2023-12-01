	.module chengxu.c
	.area data(ram, con, rel)
_table::
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
	.dbfile C:\DOCUME~1\Administrator\桌面\数码管计数显示设计\icc\chengxu.c
	.dbsym e table _table A[10:10]c
_cnt::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\数码管计数显示设计\icc\chengxu.c
	.dbsym e cnt _cnt i
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\数码管计数显示设计\icc\chengxu.c
	.dbfunc e delayms _delayms fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_delayms::
	xcall push_gset1
	.dbline -1
	.dbline 15
; #include <iom16v.h>
; #define uchar unsigned char 
; #define uint unsigned int
; #define WEI PORTC
; #define DUAN PORTA
; 
; uchar table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
; 
; uint cnt=0000;//计数初值
; 
; uchar key_up;
; uchar key_down;
; ////////////////////////////////////////////////////////////////////
; void delayms(uint i)//延时
; {
	.dbline 17
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 18
; {
	.dbline 19
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 19
L7:
	.dbline 19
	subi R20,1
	sbci R21,0
L9:
	.dbline 19
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 20
L3:
	.dbline 17
	subi R16,1
	sbci R17,0
L5:
	.dbline 17
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
	.dbfunc e delayus _delayus fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_delayus::
	xcall push_gset1
	.dbline -1
	.dbline 24
; for(j=8000;j!=0;j--);
; }
; }
; ////////////////////////////////////////////////////////////////////
; void delayus(uint i)//延时
; {
	.dbline 26
; uint j;
; for(;i!=0;i--)
	xjmp L14
L11:
	.dbline 27
; {
	.dbline 28
	ldi R20,100
	ldi R21,0
	xjmp L18
L15:
	.dbline 28
L16:
	.dbline 28
	subi R20,1
	sbci R21,0
L18:
	.dbline 28
	cpi R20,0
	cpc R20,R21
	brne L15
X2:
	.dbline 29
L12:
	.dbline 26
	subi R16,1
	sbci R17,0
L14:
	.dbline 26
	cpi R16,0
	cpc R16,R17
	brne L11
X3:
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e Led _Led fV
;              m -> R20
	.even
_Led::
	xcall push_gset1
	.dbline -1
	.dbline 33
; for(j=100;j!=0;j--);
; }
; }
; ////////////////////////////////////////////////////////////////////
; void Led() //显示函数
; {
	.dbline 34
; uchar m=1;//消隐延时
	ldi R20,1
	.dbline 36
; 
; WEI=0x7f; //输出低电平，选通千位数
	ldi R24,127
	out 0x15,R24
	.dbline 37
; DUAN=table[cnt/1000]; //取出千位数，查表，输出。
	ldi R18,1000
	ldi R19,3
	lds R16,_cnt
	lds R17,_cnt+1
	xcall div16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 38
; delayus(m); //延时
	mov R16,R20
	clr R17
	xcall _delayus
	.dbline 39
; WEI=0xbf;
	ldi R24,191
	out 0x15,R24
	.dbline 41
; //delayus(m); //延时
; DUAN=0xff;
	ldi R24,255
	out 0x1b,R24
	.dbline 42
; WEI=0xbf; //输出低电平，选通百位数
	ldi R24,191
	out 0x15,R24
	.dbline 43
; DUAN=table[cnt%1000/100]; //取出百位数，查表，输出。
	ldi R18,1000
	ldi R19,3
	lds R16,_cnt
	lds R17,_cnt+1
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 44
; delayus(m); //延时
	mov R16,R20
	clr R17
	xcall _delayus
	.dbline 45
; WEI=0xff;
	ldi R24,255
	out 0x15,R24
	.dbline 47
; //delayus(m); //延时
; DUAN=0xff;
	out 0x1b,R24
	.dbline 48
; WEI=0xdf; //输出低电平，选通十位数
	ldi R24,223
	out 0x15,R24
	.dbline 49
; DUAN=table[cnt%100/10]; //取出十位数，查表，输出。
	ldi R18,100
	ldi R19,0
	lds R16,_cnt
	lds R17,_cnt+1
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 50
; delayus(m); //延时
	mov R16,R20
	clr R17
	xcall _delayus
	.dbline 51
; WEI=0xff;
	ldi R24,255
	out 0x15,R24
	.dbline 53
; //delayus(m); //延时
; DUAN=0xff;
	out 0x1b,R24
	.dbline 54
; WEI=0xef;
	ldi R24,239
	out 0x15,R24
	.dbline 55
; DUAN=table[cnt%10]; //取出个位数，查表，输出。
	ldi R18,10
	ldi R19,0
	lds R16,_cnt
	lds R17,_cnt+1
	xcall mod16u
	movw R30,R16
	ldi R24,<_table
	ldi R25,>_table
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x1b,R2
	.dbline 56
; delayus(m);
	mov R16,R20
	clr R17
	xcall _delayus
	.dbline 57
; WEI=0xff;
	ldi R24,255
	out 0x15,R24
	.dbline 58
; delayus(m); //延时
	mov R16,R20
	clr R17
	xcall _delayus
	.dbline 59
; DUAN=0xff;
	ldi R24,255
	out 0x1b,R24
	.dbline -2
L19:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r m 20 c
	.dbend
	.dbfunc e init_io _init_io fV
	.even
_init_io::
	.dbline -1
	.dbline 64
; 
; }
; //////////////////////////////////////////////////////////////////
; void init_io(void)//初始化I/O
; {
	.dbline 66
; //设置A口为输出
; DDRA=0XFF;
	ldi R24,255
	out 0x1a,R24
	.dbline 67
; PORTA=0xFF;
	out 0x1b,R24
	.dbline 69
; //设置B口为输出
; DDRB=0XFF;
	out 0x17,R24
	.dbline 70
; PORTB=0xFF;
	out 0x18,R24
	.dbline 72
; //设置C口为输入
; DDRC=0xFF;
	out 0x14,R24
	.dbline 73
; PORTC=0xFF;
	out 0x15,R24
	.dbline 75
; //设置D口为输出
; DDRD=0XFF;
	out 0x11,R24
	.dbline 76
; PORTD=0xFF;
	out 0x12,R24
	.dbline -2
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e get_key _get_key fV
	.even
_get_key::
	.dbline -1
	.dbline 83
; }
; 
; //////////////////////////////////////////////////////////////////
; 
; void get_key(void)//按键扫描函数
; 
; {
	xjmp L23
L22:
	.dbline 85
	.dbline 85
	ldi R24,1
	sts _key_up,R24
	.dbline 86
	xcall _Led
	.dbline 87
L23:
	.dbline 84
; while((PINB&0X01)==0)//按键加计数标志
	sbis 0x16,0
	rjmp L22
	xjmp L26
L25:
	.dbline 89
	.dbline 89
	ldi R24,1
	sts _key_down,R24
	.dbline 90
	xcall _Led
	.dbline 90
L26:
	.dbline 88
; {key_up=1;
; Led();
; }
; while((PINB&0X02)==0)//按键减计数标志
	sbis 0x16,1
	rjmp L25
	.dbline -2
L21:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 94
; {key_down=1;
; Led();}
; }
; //////////////////////////////////////////////////////////////////
; void main(void)
; {
	.dbline 95
; init_io();//初始化I/O
	xcall _init_io
	xjmp L30
L29:
	.dbline 98
	.dbline 99
	xcall _get_key
	.dbline 100
	xcall _Led
	.dbline 101
	ldi R24,1234
	ldi R25,4
	sts _cnt+1,R25
	sts _cnt,R24
	.dbline 120
L30:
	.dbline 97
	xjmp L29
X4:
	.dbline -2
L28:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\数码管计数显示设计\icc\chengxu.c
_key_down::
	.blkb 1
	.dbsym e key_down _key_down c
_key_up::
	.blkb 1
	.dbsym e key_up _key_up c
