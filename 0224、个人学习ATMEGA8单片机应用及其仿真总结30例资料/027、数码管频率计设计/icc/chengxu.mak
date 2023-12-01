CC = iccavr
CFLAGS =  -IC:\icc\include\ -e  -l -g -Mavr_enhanced_small -Wa-W 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -Wl-W -bfunc_lit:0x26.0x2000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:16 -beeprom:1.512 -fihx_coff -S2
FILES = chengxu.o 

chengxu:	$(FILES)
	$(CC) -o chengxu $(LFLAGS) @chengxu.lk  
chengxu.o: C:/icc/include/iom8v.h
chengxu.o:	D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
	$(CC) -c $(CFLAGS) D:\Proteus\ATMEGA8\数码管频率计设计\icc\chengxu.c
