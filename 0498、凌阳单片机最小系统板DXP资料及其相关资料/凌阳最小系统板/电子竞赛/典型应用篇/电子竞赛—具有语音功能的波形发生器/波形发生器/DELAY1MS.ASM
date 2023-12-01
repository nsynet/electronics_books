.external  _Mk_Z6
.INCLUDE hardware.inc


.code
.public _delay
_delay:
   
    
    r1+=1;
    nop
    nop
    nop
    nop
    nop
    nop
    
    retf;
 
 .public _car_wait
_car_wait: .proc
   wait1: 
    r1=0;
        r2=0xffff;
       wait:  r1+=1
             cmp r1,r2
              jb wait
        r3+=1
        cmp r3,r4
        jb wait1
        
        r1=0x0030
     .endp
.public _F_Apwm;
_F_Apwm:.proc

R1=0x0100			 //将IOB8设置成同相输出端口 
[P_IOB_Dir]=R1
[P_IOB_Attrib] = R1
R1=0x000c
[P_IOB_Data]=R1
//设置TimerA的APWMO信号的周期Tapwmo=(12.288MHz / 512) / 16 = 1.5KHz，设
//置信号的占空比APWMO
//Tduty= (3/16)*Tapwmo。详细内容请参见定时器/计数器部分。
R1=[_Mk_Z6]			 //选择计数频率与占空比
[P_TimerA_Ctrl]=R1
R1=0xFDFF            //设置TimerA的计数初值
[P_TimerA_Data]=R1
retf
.end