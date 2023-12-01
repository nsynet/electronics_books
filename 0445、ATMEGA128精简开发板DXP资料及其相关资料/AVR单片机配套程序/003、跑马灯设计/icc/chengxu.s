	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile F:\NEW光~1\MEGA12~1\AVR单片机配套程序\003、跑马灯设计\icc\chengxu.c
	.dbfunc e DelayMS _DelayMS fV
;              j -> R20,R21
;              i -> R16,R17
	.even
_DelayMS::
	xcall push_gset1
	.dbline -1
	.dbline 11
; #include <iom128.h>
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
	.dbline 13
; uint j;
; for(;i!=0;i--)
	xjmp L5
L2:
	.dbline 14
; {
	.dbline 15
	ldi R20,8000
	ldi R21,31
	xjmp L9
L6:
	.dbline 15
L7:
	.dbline 15
	subi R20,1
	sbci R21,0
L9:
	.dbline 15
	cpi R20,0
	cpc R20,R21
	brne L6
X0:
	.dbline 16
L3:
	.dbline 13
	subi R16,1
	sbci R17,0
L5:
	.dbline 13
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
	.dbfunc e horse _horse fV
;              i -> R16
	.even
_horse::
	xcall push_gset1
	.dbline -1
	.dbline 23
; for(j=8000;j!=0;j--);
; }
; }
; /**********************************************************************
; 				  跑马灯程序，通过跑过的步数进行判断来点亮相应的LED
; 				  低电平点亮LED								   	
; **********************************************************************/
; void horse(uchar i)
; {switch (i)
	.dbline 23
	mov R20,R16
	clr R21
	cpi R20,0
	cpc R20,R21
	breq L14
X2:
	cpi R20,1
	ldi R30,0
	cpc R21,R30
	breq L15
	cpi R20,2
	ldi R30,0
	cpc R21,R30
	breq L16
	cpi R20,3
	ldi R30,0
	cpc R21,R30
	breq L17
	cpi R20,4
	ldi R30,0
	cpc R21,R30
	breq L18
	cpi R20,5
	ldi R30,0
	cpc R21,R30
	breq L19
	cpi R20,6
	ldi R30,0
	cpc R21,R30
	breq L20
	cpi R20,7
	ldi R30,0
	cpc R21,R30
	breq L21
	cpi R20,8
	ldi R30,0
	cpc R21,R30
	breq L22
	xjmp L12
X3:
	.dbline 24
; {
L14:
	.dbline 25
; case 0:PORTD=0X00;break;//0000 0000B 点亮LED1~LED8
	clr R2
	out 0x12,R2
	.dbline 25
	xjmp L12
L15:
	.dbline 26
; case 1:PORTD=0X01;break;//0000 0001B 点亮LED2~LED8
	ldi R24,1
	out 0x12,R24
	.dbline 26
	xjmp L12
L16:
	.dbline 27
; case 2:PORTD=0X03;break;//0000 0011B 点亮LED3~LED8
	ldi R24,3
	out 0x12,R24
	.dbline 27
	xjmp L12
L17:
	.dbline 28
; case 3:PORTD=0X07;break;//0000 0111B 点亮LED4~LED8
	ldi R24,7
	out 0x12,R24
	.dbline 28
	xjmp L12
L18:
	.dbline 29
; case 4:PORTD=0X0f;break;//0000 1111B 点亮LED5~LED8
	ldi R24,15
	out 0x12,R24
	.dbline 29
	xjmp L12
L19:
	.dbline 30
; case 5:PORTD=0X1f;break;//0001 1111B 点亮LED6~LED8
	ldi R24,31
	out 0x12,R24
	.dbline 30
	xjmp L12
L20:
	.dbline 31
; case 6:PORTD=0X3f;break;//0011 1111B 点亮LED7~LED8
	ldi R24,63
	out 0x12,R24
	.dbline 31
	xjmp L12
L21:
	.dbline 32
; case 7:PORTD=0X7f;break;//0111 1111B 点亮LED8
	ldi R24,127
	out 0x12,R24
	.dbline 32
	xjmp L12
L22:
	.dbline 33
	ldi R24,255
	out 0x12,R24
	.dbline 33
	.dbline 34
L12:
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r i 16 c
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 41
; case 8:PORTD=0Xff;break;//1111 1111B 全熄灭
; default:break;
; }
; }
; /**********************************************************************
; 				   主函数						   	
; **********************************************************************/
; void main(void)
; {
	.dbline 43
; uchar i;
; DDRD=0XFF;//端口设置，PA口设置为推挽1输出
	ldi R24,255
	out 0x11,R24
	.dbline 44
; PORTD=0XFF;
	out 0x12,R24
	.dbline 45
; PORTD=0XFF;//PORTD初始化为1,灭掉所有的LED
	out 0x12,R24
	.dbline 46
; DelayMS(10);
	ldi R16,10
	ldi R17,0
	xcall _DelayMS
	xjmp L25
L24:
	.dbline 48
; while(1)//程序无条件执行
; {
	.dbline 49
; for(i=0;i<9;i++)
	clr R20
	xjmp L30
L27:
	.dbline 50
	.dbline 51
	mov R16,R20
	xcall _horse
	.dbline 52
	ldi R16,10
	ldi R17,0
	xcall _DelayMS
	.dbline 53
L28:
	.dbline 49
	inc R20
L30:
	.dbline 49
	cpi R20,9
	brlo L27
	.dbline 54
; {
; horse(i);
; DelayMS(10);//延时时间约10MS
; }
; for(i=7;i!=0;i--)
	ldi R20,7
	xjmp L34
L31:
	.dbline 55
	.dbline 56
	mov R16,R20
	xcall _horse
	.dbline 57
	ldi R16,10
	ldi R17,0
	xcall _DelayMS
	.dbline 58
L32:
	.dbline 54
	dec R20
L34:
	.dbline 54
	tst R20
	brne L31
	.dbline 59
L25:
	.dbline 47
	xjmp L24
X4:
	.dbline -2
L23:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
