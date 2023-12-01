CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:16 -beeprom:1.512 -fihx_coff -S2
FILES = chengxu.o 

chengxu:	$(FILES)
	$(CC) -o chengxu $(LFLAGS) @chengxu.lk   -lcatmega
chengxu.o: C:/icc/include/iom16v.h C:/icc/include/macros.h
chengxu.o:	E:\Proteus\AVR单片机应用系统开发经典实例\010、基于T_C1的频率计设计\icc\chengxu.c
	$(CC) -c $(CFLAGS) E:\Proteus\AVR单片机应用系统开发经典实例\010、基于T_C1的频率计设计\icc\chengxu.c
