NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   000E =     14. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       0062  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0062   0298 =    664. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0031  __text_start
       0031  __start
       0051  _exit
       0052  _DelayMs
       0065  _Pre_Display
       00DE  _ADC_Convert
       00F6  _Init_IO
       00FF  _Uart_Init
       010A  _Putchar
       010E  _main
       0133  mod16u
       0135  div16u
       0136  xdiv16u
       014F  empy16s
       015F  pop_gset2
       0162  push_gset1
       0165  pop_gset1
       0166  pop
       0179  push_gset2
       017D  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   000E =     14. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _Table
       0060  __data_start
       006A  _wei
       006E  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   006E   000A =     10. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       006E  __bss_start
       006E  _date
       0070  _v
       0072  _c
       0074  _x
       0076  _z
       0078  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div16u.s, emul16s.s, gpop2.s, gpush.s, gpush2.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:1.512

