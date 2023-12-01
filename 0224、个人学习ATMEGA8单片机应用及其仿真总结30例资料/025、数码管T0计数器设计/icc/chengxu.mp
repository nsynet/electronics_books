NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0026   000F =     15. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0026  __idata_start
       0035  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0036   01EE =    494. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       001B  __start
       001B  __text_start
       003A  _exit
       003B  _delay
       0049  _xianshi
       00B8  _Init_IO
       00C1  _main
       00DA  mod16u
       00DC  div16u
       00DD  xdiv16u
       00F6  pop_gset2
       00F8  push_gset1
       00FB  pop_gset1
       00FC  pop
       010F  push_gset2
       0112  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _duan
       0060  __data_start
       006A  _wei
       006E  _CNT
       006F  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   006F   000A =     10. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       006F  __bss_start
       006F  _date
       0071  _v
       0073  _c
       0075  _x
       0077  _z
       0079  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0002 =      2. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtAVR.o	[ crtavr.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div16u.s, gpop2.s, gpush.s, gpush2.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x26
data = 0x60
eeprom:1.512

