NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0026   0011 =     17. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0026  __idata_start
       0037  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0038   0254 =    596. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       001C  __start
       001C  __text_start
       003B  _exit
       003C  _delay
       004A  _xianshi
       00B9  _Init_IO
       00C2  _main
       00E2  _Timer0
       010E  mod16u
       0110  div16u
       0111  xdiv16u
       012A  pop_gset2
       012C  push_gset1
       012F  pop_gset1
       0130  pop
       0143  push_gset2
       0146  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _duan
       0060  __data_start
       006A  _wei
       006E  _CNT
       006F  _lck
       0071  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0071   000C =     12. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0071  __bss_start
       0071  _Load
       0073  _date
       0075  _v
       0077  _c
       0079  _x
       007B  _z
       007D  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0014 =     20. bytes (abs,ovr,rom)

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

