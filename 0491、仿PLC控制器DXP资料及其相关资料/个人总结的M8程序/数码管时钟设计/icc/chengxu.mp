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
                            text   0038   01E8 =    488. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       001C  __text_start
       001C  __start
       003B  _exit
       003C  _DelayMS
       004D  _Display
       0068  _Process
       008A  _Init_IO
       0090  _main
       00AD  _Timer0
       00D7  mod8u
       00D9  div8u
       00DA  xdiv8u
       00EF  pop_gset2
       00F1  pop_gset3
       00F3  push_gset1
       00F6  pop_gset1
       00F7  pop
       010A  push_gset2
       010D  push_gset3
       0110  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _Table
       0060  __data_start
       006A  _Data
       006E  _CNT
       006F  _Timer
       0071  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0014 =     20. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtAVR.o	[ crtavr.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div8u.s, gpop2.s, gpop3.s, gpush.s, gpush2.s, gpush3.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x26
data = 0x60
eeprom:1.512

