	.module chengxu.c
	.area data(ram, con, rel)
_run::
	.blkb 2
	.area idata
	.byte 14,12
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 13,9
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 11,3
	.area data(ram, con, rel)
	.blkb 2
	.area idata
	.byte 7,6
	.area data(ram, con, rel)
	.dbfile D:\Proteus\ATMEGA16\个人总结AVR\AVR控制步进电机程序\L298N步进电机正转程序\chengxu.c
	.dbsym e run _run A[8:8]c
	.area text(rom, con, rel)
	.dbfile D:\Proteus\ATMEGA16\个人总结AVR\AVR控制步进电机程序\L298N步进电机正转程序\chengxu.c
	.dbfunc e port_init _port_init fV
	.even
_port_init::
	.dbline -1
	.dbline 15
; ////////////////////////汇诚科技////////////////////
; //////////////////http://www.ourhc.cn///////////////
; ///////////////////步进电机正转调试程序/////////////
; #include <iom16v.h>
; #include <macros.h>
; 
; /*------宏定义------*/
; #define uchar unsigned char
; #define uint unsigned int
; uchar run[8]={0x0e,0x0c,0x0d,0x09,0x0b,0x03,0x07,0x06};  //两相四线八拍工作方式数组
; /*******************************************************************
;                              端口初始化
; *******************************************************************/
; void port_init(void)
; {
	.dbline 16
;  PORTB = 0xFF;
	ldi R24,255
	out 0x18,R24
	.dbline 17
;  DDRB  = 0xFF;
	out 0x17,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e delay _delay fV
;              j -> R20,R21
;              k -> R22,R23
;              i -> R16,R17
	.even
_delay::
	xcall push_gset2
	.dbline -1
	.dbline 23
;  }
; /*******************************************************************
;                              延时函数
; *******************************************************************/
; void delay(uint i)//延时函数
; {
	.dbline 25
; uint j,k;
; for(j=0;j<i;j++)
	clr R20
	clr R21
	xjmp L6
L3:
	.dbline 26
	clr R22
	clr R23
	xjmp L10
L7:
	.dbline 26
L8:
	.dbline 26
	subi R22,255  ; offset = 1
	sbci R23,255
L10:
	.dbline 26
	cpi R22,232
	ldi R30,3
	cpc R23,R30
	brlo L7
L4:
	.dbline 25
	subi R20,255  ; offset = 1
	sbci R21,255
L6:
	.dbline 25
	cp R20,R16
	cpc R21,R17
	brlo L3
	.dbline -2
L2:
	xcall pop_gset2
	.dbline 0 ; func end
	ret
	.dbsym r j 20 i
	.dbsym r k 22 i
	.dbsym r i 16 i
	.dbend
	.dbfunc e main _main fI
;              y -> R20,R21
;              z -> R22,R23
	.even
_main::
	.dbline -1
	.dbline 32
; for(k=0;k<1000;k++);
; }
; /*******************************************************************
;                              主函数
; *******************************************************************/
; main()
; {
	.dbline 34
; uint z,y;
; y=40;	    //定义延时时间，时间越长电机转速越慢反之则快
	ldi R20,40
	ldi R21,0
	.dbline 35
; port_init();
	xcall _port_init
	xjmp L13
L12:
	.dbline 37
; while(1)
; {
	.dbline 38
; for(z=0;z<8;z++)  //改变数组的长度值需改变这个数字8，8为数组的长度。
	clr R22
	clr R23
	xjmp L18
L15:
	.dbline 39
	.dbline 40
	ldi R24,<_run
	ldi R25,>_run
	movw R30,R22
	add R30,R24
	adc R31,R25
	ldd R2,z+0
	out 0x18,R2
	.dbline 41
	movw R16,R20
	xcall _delay
	.dbline 42
L16:
	.dbline 38
	subi R22,255  ; offset = 1
	sbci R23,255
L18:
	.dbline 38
	cpi R22,8
	ldi R30,0
	cpc R23,R30
	brlo L15
	.dbline 43
L13:
	.dbline 36
	xjmp L12
X0:
	.dbline -2
L11:
	.dbline 0 ; func end
	ret
	.dbsym r y 20 i
	.dbsym r z 22 i
	.dbend
