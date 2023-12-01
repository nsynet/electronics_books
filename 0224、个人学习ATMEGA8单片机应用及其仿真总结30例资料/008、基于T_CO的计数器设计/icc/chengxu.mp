NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   0010 =     16. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       0064  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0064   0234 =    564. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0032  __text_start
       0032  __start
       0052  _exit
       0053  _DelayMs
       0066  _Display
       0084  _Process
       00B0  _Init_IO
       00B9  _main
       00D5  mod16s
       00D9  div16s
       00F3  mod16u
       00F5  div16u
       00F6  xdiv16u
       010F  mod8u
       0111  div8u
       0112  xdiv8u
       0127  pop_gset2
       012A  pop_gset3
       012D  push_gset1
       0130  pop_gset1
       0131  pop
       0144  push_gset2
       0148  push_gset3
       014C  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _Table
       0060  __data_start
       006A  _Data
       006E  _CNT
       0070  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div16s.s, div16u.s, div8u.s, gpop2.s, gpop3.s, gpush.s, gpush2.s, gpush3.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:1.512

