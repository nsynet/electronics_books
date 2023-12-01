CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA  -l -g -Mavr_enhanced 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:16 -beeprom:1.512 -fihx_coff -S2
FILES = chengxu.o 

chengxu:	$(FILES)
	$(CC) -o chengxu $(LFLAGS) @chengxu.lk   -lcatmega
chengxu.o: C:/icc/include/iom8v.h
chengxu.o:	D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
	$(CC) -c $(CFLAGS) D:\Proteus仿真实例\ATMEGA16\个人总结AVR\基于T_CO的计数器设计\icc\chengxu.c
