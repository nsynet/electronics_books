NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   008C   000E =     14. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __idata_start
       009A  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   009A   01E2 =    482. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       004D  __start
       004D  __text_start
       006D  _exit
       006E  _DelayMS
       0081  _Pre_Display
       00FA  _Init_IO
       0100  _main
       010B  mod16u
       010D  div16u
       010E  xdiv16u
       0127  push_gset1
       012A  pop_gset1
       012B  pop
       013E  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  _Table
       0100  __data_start
       010A  _wei
       010E  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   010E   000A =     10. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       010E  __bss_start
       010E  _date
       0110  _v
       0112  _c
       0114  _x
       0116  _z
       0118  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div16u.s, gpush.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:1.4096

