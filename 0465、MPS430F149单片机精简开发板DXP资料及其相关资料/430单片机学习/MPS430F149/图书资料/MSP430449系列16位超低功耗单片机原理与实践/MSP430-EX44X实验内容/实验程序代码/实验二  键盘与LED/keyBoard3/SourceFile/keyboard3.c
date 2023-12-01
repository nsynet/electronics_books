/*****************************************************
*  文件名称：
*          key3.c
*   文件说明：
*        独立按键式键盘
*****************************************************/
#ifndef _MSP430XF449H_
#include <msp430x44x.h>
#endif
#define KEYBOARD_3 3
unsigned char key_Flag;
unsigned char key_val;
/********************************************************
*  初始化独立按键键盘 
********************************************************/
void init_Keyboard(void)
{
     key_Flag=0;                        // 清零 key_Flag
     P1DIR &= 0xf1;                     // p1.1,p1.2,p1.3 置位输入模式 
     
}
/*********************************************
* Check_Key(),检查按键，确认键值
*********************************************/
void check_Key(void)
{
    key_val =(0x0e - (P1IN & 0x0e))/2;  // 获取键值
    if (key_val==4) key_val=0x03;       //如果是第三个键按下，
                                        //设置键值为3
}
void key_Event(void)
{
    P1DIR |= 0xf1;
    if((P1IN & 0x0e) != 0x0e)           // 是否有键按下
    {          
        if(key_Flag == 1)
        {
           check_Key();                 // 获取键值
        }else{ 
           key_Flag = 1;                //进入消抖状态
        }
    }else if((key_Flag == 1)&&((P1IN &0x0e)==0x0e))
    {
        key_Flag = 2;                   // 设置键值可读
    }
}
