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
                            text   0064   034E =    846. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0032  __text_start
       0032  __start
       0052  _exit
       0053  _delay
       0063  _xianshi
       010D  _Key_Process
       0168  _Init_IO
       0173  _Init_Timer1
       017D  _main
       0185  _Compare
       018F  mod16u
       0191  div16u
       0192  xdiv16u
       01AB  empy16s
       01BB  pop_gset2
       01BE  push_gset1
       01C1  pop_gset1
       01C2  pop
       01D5  push_gset2
       01D9  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0010 =     16. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _duan
       0060  __data_start
       006A  _wei
       006E  _date
       0070  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0070   000B =     11. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0070  __bss_start
       0070  _v
       0072  _c
       0074  _x
       0076  _z
       0078  _Key3_Flag
       0079  _Key2_Flag
       007A  _Key1_Flag
       007B  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   001C =     28. bytes (abs,ovr,rom)

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

