/******************************************************************************
*
* 通过键盘、LCD来进行超低功耗实验
* 在一段时间内，如果用户没有进行按键操作，系统将进入“睡眠”－－低功耗状态
* 用户按键后，系统从低功耗状态转到正常的工作状态
* 在非低功耗状态下，程序接收键盘按键执行加法器操作(因为键盘和LCD限制不能实现复杂
* 的功能,如乘法、减法、除法等）.
*
*******************************************************************************/

#include <msp430x44x.h>

#include "lcd.c"
#include "keyBoard12.c"

/*******************************************************************************/
 unsigned int wait_Time;
 unsigned long  num1,num2;
/*******************************************************************************/

extern void sleep_Mode();
void init_BT();
void show_Data(unsigned long);

/*******************************************************************************
*  main()函数
********************************************************************************/
void main(void)
{
    char len=0;
    WDTCTL = WDTHOLD + WDTPW;         //停止看门狗
    init_BT();                        //初始化Basic Timer 
    init_Keyboard();                  //键盘初始化
    init_LCD();                       //LCD初始化
    _EINT();                          //开中断
    while(1)
    {   
        lcd_Display();                // LCD显示
        key_Event();                  // 检测键盘事件
        if(key_Flag==1)             
        {
            switch (key_val)
           {
             case 0x0A:                 //对应 清零
                    num1=0;     
                    num2=0;  
                    len=0;
                    show_Data(num2);  // 填写0到LCD缓冲区
                    break;
             case 0x0B:                 // 对应 + 
                   num1= num1 + num2;
                   show_Data(num1);   // 显示上次运算结果
                   num2=0;
                   len=0;
                   break;
            default:                  // 数字 0到9
                   len += 1;
                   if(len>7) break;   // 限制输入数字个数
                   num2=num2*10+key_val;
                   show_Data(num2);   // 显示当前输入数字
                   break;             
           }
           
           key_Flag = 0;
           wait_Time = 0;             // 重新设置wait_Time
       }
       
       
    }
    
}
/********************************************************************
*
*   按键触发中断后，设置CPU、LCD、键盘的正常工作
*
*********************************************************************/
#pragma vector = PORT1_VECTOR
__interrupt void active_mode()
{   
    
    P1IFG &= 0x00;   //清除标识
    
    LCDCTL |= 0x01;   // 重新初始化LCD,LCDON = 1
   
    P1IE &= 0x7F; //取消中断使能
    init_Keyboard();
   
    IE2   |= 0x80;  // 使能bt中断                       
   
    __bic_SR_register_on_exit(LPM0_bits); // 退出低功耗模式
}
/********************************************************************
*
*   Basic Timer 中断向量
*********************************************************************/
#pragma vector = BASICTIMER_VECTOR
__interrupt void get_Time()
{
  wait_Time += 1;         //  计数器加1
  if(wait_Time >= 40000)  // 是否等待时间到10s
  {                       //
     wait_Time = 0;       // 等待时间计数器清零
     sleep_Mode();        // 处理设备进入适当状态
    __bis_SR_register_on_exit(LPM0_bits);// cpu进入低功耗
  }
}
/********************************************************************
*
*   初始化Basic Timer 
*
********************************************************************/
void init_BT()
{
    BTCTL  =BT_MDLY_0_25;                   //  Basic Timer 1 中断频率
    IE2   |= 0x80;                          // 使能bt中断
}
/********************************************************************
*
*      把十进制数的每一位都填充到LCD缓冲
*
*********************************************************************/
void show_Data(unsigned long num)
{
    char tmp1;
    for(tmp1=0;tmp1<7;tmp1++)
    {
       lcd_Buf[tmp1] = num%10;   // 依次取数
       num = num/10;             // 数字除以10
    }
}
