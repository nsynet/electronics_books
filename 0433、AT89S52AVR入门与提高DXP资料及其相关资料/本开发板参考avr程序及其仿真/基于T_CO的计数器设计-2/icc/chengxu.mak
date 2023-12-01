CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:16 -beeprom:1.512 -fihx_coff -S2
FILES = chengxu.o 

chengxu:	$(FILES)
	$(CC) -o chengxu $(LFLAGS) @chengxu.lk   -lcatmega
chengxu.o: C:/icc/include/iom8v.h
chengxu.o:	D:\Proteus����ʵ��\ATMEGA16\�����ܽ�AVR\����T_CO�ļ��������\icc\chengxu.c
	$(CC) -c $(CFLAGS) D:\Proteus����ʵ��\ATMEGA16\�����ܽ�AVR\����T_CO�ļ��������\icc\chengxu.c
