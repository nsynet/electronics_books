/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"
#include "rtx51tny.h"

#define TASKINIT       0          //任务ID
#define LEDCTRLTASK1  1
#define LEDCTRLTASK2  2
#define LEDCTRLTASK3  3
#define LEDCTRLTASK4  4

#define LED_PORT      P2

/******************************************
*函数名称:Taskinit
*输    入:无
*输    出:无
*功    能:初始化任务
*******************************************/
void Taskinit(void) _task_ TASKINIT
{

     os_create_task(TASKINIT);    //创建Taskinit任务
     os_create_task(LEDCTRLTASK1);//创建LEDCtrlTask1任务
     os_create_task(LEDCTRLTASK2);//创建LEDCtrlTask2任务
     os_create_task(LEDCTRLTASK3);//创建LEDCtrlTask3任务
     os_create_task(LEDCTRLTASK4);//创建LEDCtrlTask4任务
     os_send_signal(LEDCTRLTASK1);//向LEDCtrlTask1任务发送信号
     os_delete_task(TASKINIT);    //删除Taskinit任务
     
}
/******************************************
*函数名称:LEDCtrlTask1
*输    入:无
*输    出:无
*功    能:流水灯任务1
*******************************************/
void LEDCtrlTask1(void) _task_ LEDCTRLTASK1
{
     unsigned char i=0;

     while(1)
     {
        os_wait(K_SIG,LEDCTRLTASK1,0);//等待LEDCtrlTask1任务信号
  
        for(i=0;i<=7;i++)
        {
            LED_PORT|=1<<i;
            os_wait (K_TMO,10,0);//延时100ms
        }

        os_send_signal(LEDCTRLTASK2);//向LEDCtrlTask2任务发送信号

     }

}
/******************************************
*函数名称:LEDCtrlTask2
*输    入:无
*输    出:无
*功    能:流水灯任务2
*******************************************/
void LEDCtrlTask2(void) _task_ LEDCTRLTASK2
{
     unsigned char i=0;

     while(1)
     {
        
        os_wait(K_SIG,LEDCTRLTASK2,0);//等待LEDCtrlTask2任务信号

        for(i=0;i<=7;i++)
        {
            LED_PORT&=~(1<<i);
            os_wait (K_TMO,10,0); //延时100ms
        }
   
        os_send_signal(LEDCTRLTASK3);//向LEDCtrlTask3任务发送信号
     }
}
/******************************************
*函数名称:LEDCtrlTask3
*输    入:无
*输    出:无
*功    能:流水灯任务3
*******************************************/
void LEDCtrlTask3(void) _task_ LEDCTRLTASK3
{
     unsigned char i=0;

     while(1)
     {
         os_wait(K_SIG,LEDCTRLTASK3,0);//等待LEDCtrlTask3任务信号

        for(i=0;i<=7;i++)
        {
            LED_PORT|=1<<(7-i);
            os_wait (K_TMO,10,0); //延时100ms
        }

        os_send_signal(LEDCTRLTASK4);//向LEDCtrlTask4任务发送信号

     }


}
/******************************************
*函数名称:LEDCtrlTask4
*输    入:无
*输    出:无
*功    能:流水灯任务4
*******************************************/
void LEDCtrlTask4(void) _task_ LEDCTRLTASK4
{
     unsigned char i=0;

     while(1)
     {
        
         os_wait(K_SIG,LEDCTRLTASK4,0);//等待LEDCtrlTask4任务信号
        for(i=0;i<=7;i++)
        {
            LED_PORT&=~(1<<(7-i));
            os_wait (K_TMO,10,0); //延时100ms
        }

        os_send_signal(LEDCTRLTASK1);//向LEDCtrlTask1任务发送信号

     }

}

