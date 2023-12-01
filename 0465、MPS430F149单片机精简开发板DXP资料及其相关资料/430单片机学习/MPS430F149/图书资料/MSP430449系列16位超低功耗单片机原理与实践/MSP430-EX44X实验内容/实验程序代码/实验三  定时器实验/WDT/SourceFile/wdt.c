/*************************************************************
*  文件名称：
*        WDT.c
*  文件说明：
*        设置看门狗的两种模式 
*        在系统加电后，默认的子系统频率是1M，设置WDT延迟为250ms
*        那么系统执行0x1ffff 条指令后系统如果没有重新设置WDT，
*        WDT将导致系统复位
*************************************************************/

#include <msp430x44x.h>

void setWDT(int mode){
     
     unsigned int tmp;
     if(mode==1){        //定时器模式
         WDTCTL = WDT_ADLY_250;    //250ms中断间隔
         IE1   |= WDTIE;           //使能 WDT 中断
         P5DIR |= 0x02;            // P5.1 output mode
         _EINT();                  // 开中断
     }else if(mode==0){  //看门狗模式 
       
       WDTCTL = WDT_ARST_250;       //设置看门狗时间间隔为250ms
                                    //在系统加电后，默认子系统时钟频率是1M
       for(tmp=0x7fff;tmp>0;tmp--); //延迟
       P5DIR |= 0x02;               //P5.1 output mode
       P5OUT |= 0x02;               //light LED4 
       for(tmp=0x7fff;tmp>0;tmp--); //延迟， 执行一次tmp--至少要用2个指令   
     }
}
/**************************************************************************
*  函数说明：
*          WDT中断函数
*
***************************************************************************/
#pragma vector = WDT_VECTOR 
 __interrupt void  WDT_Interrupt(void){
     P5OUT ^= 0x02;    
 }

