	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\Proteus����ʵ��\ATMEGA16\�����ܽ�AVR\TEMP\icc\chengxu.c
	.dbfunc e timer1_init _timer1_init fV
	.even
_timer1_init::
	.dbline -1
	.dbline 8
; #include <iom16v.h>
; #include <macros.h> 
; 
; #define DISP_DDR   DDRD
; #define DISP_PORT  PORTD 
; 
; void timer1_init(void)
; {
	.dbline 9
;  TCCR1B = 0x00;  //stop timer 
	clr R2
	out 0x2e,R2
	.dbline 11
; 
;  TCNT1H = 0xE3;  //���� TC1 �� �����Ĵ��� ��8λֵ������7.3728M����
	ldi R24,227
	out 0x2d,R24
	.dbline 12
;  TCNT1L = 0xE1;  //���� TC1 �� �����Ĵ��� ��8λֵ������7.3728M���� 
	ldi R24,225
	out 0x2c,R24
	.dbline 14
; 
;  TCCR1A = 0x00;
	out 0x2f,R2
	.dbline 15
;  TCCR1B = 0x05;  //����TC1 Ϊ CLK/1024��Ƶ������TC1 
	ldi R24,5
	out 0x2e,R24
	.dbline 17
; 
;  MCUCR = 0x00;  //���� MCU �� ���ƼĴ���
	out 0x35,R2
	.dbline 18
;  GICR  = 0x00;  //���� �жϿ��ƼĴ���
	out 0x3b,R2
	.dbline 19
;  TIMSK = 0x04;  //���� ��ʱ������ �� ���μĴ���
	ldi R24,4
	out 0x39,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 32
	jmp _timer1_ovf_isr
	.area text(rom, con, rel)
	.dbfile D:\Proteus����ʵ��\ATMEGA16\�����ܽ�AVR\TEMP\icc\chengxu.c
	.dbfunc e timer1_ovf_isr _timer1_ovf_isr fV
	.even
_timer1_ovf_isr::
	st -y,R24
	st -y,R25
	in R24,0x3f
	st -y,R24
	.dbline -1
	.dbline 24
;  }
; 
; #pragma interrupt_handler timer1_ovf_isr:9
; void timer1_ovf_isr(void)
; {
	.dbline 25
;  TCNT1H = 0xE3;  //reload counter high value
	ldi R24,227
	out 0x2d,R24
	.dbline 26
;  TCNT1L = 0xE1;  //reload counter low value
	ldi R24,225
	out 0x2c,R24
	.dbline 27
;  DISP_PORT++;  //ÿ��1S����ʾ��1
	in R24,0x12
	subi R24,255    ; addi 1
	out 0x12,R24
	.dbline -2
L2:
	ld R24,y+
	out 0x3f,R24
	ld R25,y+
	ld R24,y+
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 31
; }
; 
; void main(void)
; {
	.dbline 32
;  DISP_DDR = 0XFF; //������ʾ��Ϊ���
	ldi R24,255
	out 0x11,R24
	.dbline 33
;  timer1_init();
	xcall _timer1_init
	.dbline 34
;  SEI();
	sei
L4:
	.dbline 35
L5:
	.dbline 35
	xjmp L4
X0:
	.dbline -2
L3:
	.dbline 0 ; func end
	ret
	.dbend
