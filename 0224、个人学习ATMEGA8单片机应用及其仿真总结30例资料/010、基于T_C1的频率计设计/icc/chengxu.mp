NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0054   0011 =     17. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0054  __idata_start
       0065  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0066   0278 =    632. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0033  __start
       0033  __text_start
       0053  _exit
       0054  _DelayMs
       0067  _Display
       0085  _HZ
       00C4  _Init_IO
       00CD  _Init_Timer1
       00DB  _main
       0121  mod16u
       0123  div16u
       0124  xdiv16u
       013D  empy16s
       014D  pop_gset3
       0150  push_gset1
       0153  pop_gset1
       0154  pop
       0167  push_gset2
       016B  push_gset3
       016F  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0060   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0060  _Flag
       0060  __data_start
       0061  _Table
       006B  _Data
       006F  _CNT
       0071  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   0071   0004 =      4. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0071  __bss_start
       0071  _CNT2
       0073  _CNT1
       0075  __bss_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0004 =      4. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

C:\icc\lib\crtatmega.o	[ crtatmega.s ]
chengxu.o	[ chengxu.c ]
<library>	[ div16u.s, emul16s.s, gpop3.s, gpush.s, gpush2.s, gpush3.s ]

User Global Definitions

ram_end = 0x45f
hwstk_size = 0x10

User Base Address Definitions

func_lit = 0x54
data = 0x60
eeprom:1.512

