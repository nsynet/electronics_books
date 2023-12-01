NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   000F =     15. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       0063  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0064   01FE =    510. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0032  __start
       0032  __text_start
       0052  _exit
       0053  _delay
       0063  _xianshi
       00D8  _Init_IO
       00E1  _main
       00F7  mod16u
       00F9  div16u
       00FA  xdiv16u
       0113  pop_gset2
       0116  push_gset1
       0119  pop_gset1
       011A  pop
       012D  push_gset2
       0131  __text_end

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
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div16u.s, gpop2.s, gpush.s, gpush2.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:1.512

