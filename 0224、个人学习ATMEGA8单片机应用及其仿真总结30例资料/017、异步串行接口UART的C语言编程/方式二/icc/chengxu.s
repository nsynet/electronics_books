	.module chengxu.c
	.area text(rom, con, rel)
	.dbfile D:\����\�����ܽ��M8����\017���첽���нӿ�UART��C���Ա��\��ʽ��\icc\chengxu.c
	.dbfunc e Uart_Init _Uart_Init fV
	.even
_Uart_Init::
	.dbline -1
	.dbline 7
; #include <iom8v.h>
; #include <macros.h>
; /********************************************************************
;                       ���ڳ�ʼ���ӳ���
; *********************************************************************/
; void Uart_Init(void)
; {
	.dbline 8
;     UCSRB  =  0x00;     //disable while setting baud rate
	clr R2
	out 0xa,R2
	.dbline 9
;     UCSRA  =  0x00;     //Bit1Ϊ1���ٷ���
	out 0xb,R2
	.dbline 10
;     UCSRC  =  0x86;  
	ldi R24,134
	out 0x20,R24
	.dbline 11
;     UBRRL  =  0x33;     //�����ʣ�9600 Bps
	ldi R24,51
	out 0x9,R24
	.dbline 12
;     UBRRH  =  0x00;     //����ʣ�0.156%
	out 0x20,R2
	.dbline 13
;     UCSRB  =  0x18;  
	ldi R24,24
	out 0xa,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Getchar _Getchar fc
	.even
_Getchar::
	.dbline -1
	.dbline 19
; }
; /********************************************************************
;                       ���ڽ����ֽ��ӳ���
; *********************************************************************/
; unsigned char Getchar(void)
; {
L3:
	.dbline 20
L4:
	.dbline 20
;    while(!(UCSRA& (1<<RXC)));
	sbis 0xb,7
	rjmp L3
	.dbline 21
;    return UDR;
	in R16,0xc
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Putchar _Putchar fV
;              c -> R16
	.even
_Putchar::
	.dbline -1
	.dbline 27
; }
; /********************************************************************
;                      ���ڷ����ֽ��ӳ���
; *********************************************************************/
; void Putchar(unsigned char c)
; {
L7:
	.dbline 28
L8:
	.dbline 28
;    while (!(UCSRA&(1<<UDRE)));
	sbis 0xb,5
	rjmp L7
	.dbline 29
;    UDR=c;
	out 0xc,R16
	.dbline -2
L6:
	.dbline 0 ; func end
	ret
	.dbsym r c 16 c
	.dbend
	.dbfunc e Putstr _Putstr fV
;              s -> R20,R21
	.even
_Putstr::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 35
; }
; /********************************************************************
;                      ���ڷ����ַ����ӳ���
; *********************************************************************/
; void Putstr(char *s)
; {
	xjmp L12
L11:
	.dbline 37
	.dbline 38
	movw R30,R20
	ldd R16,z+0
	xcall _Putchar
	.dbline 39
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 40
L12:
	.dbline 36
;    while (*s)
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L11
	.dbline -2
L10:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r s 20 pc
	.dbend
	.dbfunc e Puts _Puts fV
;              s -> R20,R21
	.even
_Puts::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 46
;    {
;       Putchar(*s);
;       s++;
;    }
; }
; /********************************************************************
;                      ���ڷ����ַ����ӳ���(���л��з�)
; *********************************************************************/
; void Puts(char *s)
; {
	xjmp L16
L15:
	.dbline 48
	.dbline 49
	movw R30,R20
	ldd R16,z+0
	xcall _Putchar
	.dbline 50
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 51
L16:
	.dbline 47
;    while (*s)
	movw R30,R20
	ldd R2,z+0
	tst R2
	brne L15
	.dbline 52
;    {
;       Putchar(*s);
;       s++;
;    }
;    Putchar(0x0a);   //�س�����
	ldi R16,10
	xcall _Putchar
	.dbline 53
;    Putchar(0x0d);
	ldi R16,13
	xcall _Putchar
	.dbline -2
L14:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r s 20 pc
	.dbend
	.dbfunc e main _main fV
;              i -> R20
	.even
_main::
	.dbline -1
	.dbline 59
; }
; /********************************************************************
;                             ������
; *********************************************************************/
; void main(void)
; {
	.dbline 60
;    unsigned char i=0;
	clr R20
	.dbline 62
; 
;    Uart_Init();
	xcall _Uart_Init
	.dbline 64
; 
;    Puts("zhang xin chun ");
	ldi R16,<L19
	ldi R17,>L19
	xcall _Puts
	.dbline 65
;    Puts("Http://www.ourhc.cn");
	ldi R16,<L20
	ldi R17,>L20
	xcall _Puts
	.dbline 66
;    Puts("ATMega16 UART TEST");
	ldi R16,<L21
	ldi R17,>L21
	xcall _Puts
	.dbline 67
;    Putchar(0x0a);
	ldi R16,10
	xcall _Putchar
	.dbline 68
;    Putchar(0x0d);
	ldi R16,13
	xcall _Putchar
	xjmp L23
L22:
	.dbline 70
;    while(1)
;    {
	.dbline 71
;       i=Getchar();
	xcall _Getchar
	mov R20,R16
	.dbline 72
;       if (i!=0)    //����0x0F��ʼ����
	tst R16
	breq L25
	.dbline 73
;       {
	.dbline 74
;          i=0;
	clr R20
	.dbline 75
;          Puts("AVR-ARM RS232 TEST CODE");
	ldi R16,<L27
	ldi R17,>L27
	xcall _Puts
	.dbline 76
;          Puts("Http://www.ourhc.cn");
	ldi R16,<L20
	ldi R17,>L20
	xcall _Puts
	.dbline 77
;          Puts("ATMega16 UART TEST");
	ldi R16,<L21
	ldi R17,>L21
	xcall _Puts
	.dbline 78
;          Putchar(0x0a);
	ldi R16,10
	xcall _Putchar
	.dbline 79
;          Putchar(0x0d);
	ldi R16,13
	xcall _Putchar
	.dbline 80
;       }
L25:
	.dbline 81
L23:
	.dbline 69
	xjmp L22
X0:
	.dbline -2
L18:
	.dbline 0 ; func end
	ret
	.dbsym r i 20 c
	.dbend
	.area data(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\017���첽���нӿ�UART��C���Ա��\��ʽ��\icc\chengxu.c
L27:
	.blkb 24
	.area idata
	.byte 'A,'V,'R,45,'A,'R,'M,32,'R,'S,50,51,50,32,'T,'E
	.byte 'S,'T,32,'C,'O,'D,'E,0
	.area data(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\017���첽���нӿ�UART��C���Ա��\��ʽ��\icc\chengxu.c
L21:
	.blkb 19
	.area idata
	.byte 'A,'T,'M,'e,'g,'a,49,54,32,'U,'A,'R,'T,32,'T,'E
	.byte 'S,'T,0
	.area data(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\017���첽���нӿ�UART��C���Ա��\��ʽ��\icc\chengxu.c
L20:
	.blkb 20
	.area idata
	.byte 'H,'t,'t,'p,58,47,47,'w,'w,'w,46,'o,'u,'r,'h,'c
	.byte 46,'c,'n,0
	.area data(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\017���첽���нӿ�UART��C���Ա��\��ʽ��\icc\chengxu.c
L19:
	.blkb 16
	.area idata
	.byte 'z,'h,'a,'n,'g,32,'x,'i,'n,32,'c,'h,'u,'n,32,0
	.area data(ram, con, rel)
	.dbfile D:\����\�����ܽ��M8����\017���첽���нӿ�UART��C���Ա��\��ʽ��\icc\chengxu.c
