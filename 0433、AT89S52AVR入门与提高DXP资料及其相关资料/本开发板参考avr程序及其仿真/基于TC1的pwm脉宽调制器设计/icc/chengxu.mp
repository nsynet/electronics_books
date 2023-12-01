NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   0014 =     20. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       0068  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0068   02DA =    730. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0034  __start
       0034  __text_start
       0054  _exit
       0055  _DelayMs
       0068  _Display
       008E  _Add_Process
       00A6  _Sub_Process
       00C4  _Key_Process
       00EB  _Set_Process
       010C  _Init_IO
       0117  _main
       0138  mod16u
       013A  div16u
       013B  xdiv16u
       0154  mod8u
       0156  div8u
       0157  xdiv8u
       016C  empy16s
       017C  pop_gset2
       017F  pop_gset3
       0182  push_gset1
       0185  pop_gset1
       0186  pop
       0199  push_gset2
       019D  push_gset3
       01A1  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0014 =     20. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  __data_start
       0060  _Table
       006C  _Data1
       0070  _Data2
       0074  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0074   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0074  __bss_start
       0074  _Key2_Flag
       0075  _Key1_Flag
       0076  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div16u.s, div8u.s, emul16s.s, gpop2.s, gpop3.s, gpush.s, gpush2.s, gpush3.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:1.512

