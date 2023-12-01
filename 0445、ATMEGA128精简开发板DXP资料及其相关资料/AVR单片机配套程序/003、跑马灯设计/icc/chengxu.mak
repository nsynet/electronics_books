CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:16 -beeprom:1.4096 -fihx_coff -S2
FILES = chengxu.o 

chengxu:	$(FILES)
	$(CC) -o chengxu $(LFLAGS) @chengxu.lk   -lcatmega
chengxu.o: C:/icc/include/iom128.h
chengxu.o:	F:\NEW光~1\MEGA12~1\AVR单片机配套程序\003、跑马灯设计\icc\chengxu.c
	$(CC) -c $(CFLAGS) F:\NEW光~1\MEGA12~1\AVR单片机配套程序\003、跑马灯设计\icc\chengxu.c
