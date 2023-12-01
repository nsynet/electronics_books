CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:16 -beeprom:1.512 -fihx_coff -S2
FILES = chengxu.o 

chengxu:	$(FILES)
	$(CC) -o chengxu $(LFLAGS) @chengxu.lk   -lcatmega
chengxu.o: C:/icc/include/iom16v.h
chengxu.o:	D:\MYDOCU~1\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\020��4~1\icc\chengxu.c
	$(CC) -c $(CFLAGS) D:\MYDOCU~1\AVR��Ƭ��Ӧ��ϵͳ��������ʵ��\020��4~1\icc\chengxu.c
