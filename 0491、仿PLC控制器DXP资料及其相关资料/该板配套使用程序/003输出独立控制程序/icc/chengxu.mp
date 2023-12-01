NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0026   020E =    526. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0013  __text_start
       0013  __start
       0032  _exit
       0033  _DelayMS
       0044  _WDT_init
       0048  _init_eatdog
       004C  _WDT_off
       0053  _get_key
       0084  _Init_IO
       008E  _main
       0103  push_gset1
       0106  pop_gset1
       0107  pop
       011A  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0060   0008 =      8. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _KEY_PB3
       0060  __bss_start
       0061  _KEY_PB2
       0062  _KEY_PB1
       0063  _KEY_PB0
       0064  _KEY_PC3
       0065  _KEY_PC2
       0066  _KEY_PC1
       0067  _KEY_PC0
       0068  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtAVR.o	[ crtavr.s ]
chengxu.o	[ chengxu.c ]
<library>	[ gpush.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x26
data = 0x60
eeprom:1.512

