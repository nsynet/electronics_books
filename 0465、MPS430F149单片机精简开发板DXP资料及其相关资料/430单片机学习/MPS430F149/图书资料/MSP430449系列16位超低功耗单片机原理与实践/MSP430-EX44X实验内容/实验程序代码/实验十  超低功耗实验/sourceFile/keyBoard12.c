/*********************************************************
*     文件名称：
*             keyboard12.c
*      程序功能描述：
*            行列式键盘检测
*   输入：
*            用户的按键事件 
*   输出：
*            存放用户输入的键值                                              
*
*
*********************************************************/

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

#define KEY_BOARD 1

unsigned char key_Pressed,      // 是否有键值按下
              key_val,          // 存放键值
              key_Flag;         // 是否一个按下的按键已经松开，
                                // 即是按键的键值可以读取
                                 
unsigned char key_Map[16] ={    //设置键盘逻辑键值与程序计算键值的映射
                           0,1,2,3,
                           4,5,6,7,
                           8,9,0x0A,0x0B,
                           0x0C,0x0D,0x0E,0x0F
                           };
/********************************************************
*  初始化键盘设备
********************************************************/
/*void init_Keyboard(void){
     
      P1DIR &= 0x01;  // P1.4~P1.7 设置为输入模式
      P1DIR |= 0x0E;  // set p1.1~p1.3 设置为输出模式
      P1OUT |= 0x0E;  // p1.1~p1.3 输出值清零
      key_Flag    = 0;// 初始化key_Flag 
      key_Pressed = 0;// 初始化key_Pressed 
      
}*/
void init_Keyboard(void){
     
      P3DIR |= 0x0f;  // P3.0~P3.3 设置为输出模式
      P3DIR &= 0x0f;  // set p3.4~p3.7设置为输入模式
      P3OUT = 0x00;  // p3.4~p3.7 输出值清零
      key_Flag    = 0;// 初始化key_Flag 
      key_Pressed = 0;// 初始化key_Pressed 
      key_val=0xff;
      
}
/*********************************************
* Check_Key(),检查按键，确认键值
*********************************************/
void check_Key(void){
    
    unsigned char row ,col,tmp1,tmp2;
    // tmp1用来设置P1OUT的值，使P1.1~P1.3中有一个为0
    tmp1 = 0x10;
    for(row=0;row<4;row++){
        P3OUT |= 0xf0;                          // p3.4~P3.7=1
        P3OUT &= ~tmp1;                          // P3.4~p3.7中有一个为0
        tmp1 <<=1;                          // tmp1左移一位      
        if ((P3IN & 0x0f) < 0x0f){              // 是否P1IN的P3.0~P3.3中有一位为0         
           tmp2 = 0x01;                         // tmp2用于检测出那一位为0  
           for(col =0;col<0x04;col++){          // 列检测 
              if((P3IN & tmp2)==0x00){          // 是否是该列
                key_val =key_Map[ row*4 +col] ; // 获取键值
                return;                         // 退出循环
              }
              tmp2<<= 1;                        // tmp2左移 
           }
        }
         if(key_val==0xFF)
        {
           key_Pressed = 0;
        }
    }
         
}


/***********************************************************
* 延迟，用于消除抖动
************************************************************/
void delay(){
     unsigned char tmp;
      for(tmp=0xff;tmp>0;tmp--);
}
/************************************************************
*  key_Event()，检测键盘是否有键按下，如果有获取键值
*************************************************************/
/*void key_Event(void){
     
     unsigned char tmp;
     P1OUT &= 0x01;         // 设置P1OUT输出值
     tmp = P1IN;            // 获取 p1IN
     if ((key_Pressed ==0x00)&&((tmp & 0xf0) < 0xf0)) 
     {                      //是否有键按下
         key_Pressed = 1;   // 如果有按键按下，设置key_Pressed标识
         delay();           //消除抖动
         check_Key();       // 调用check_Key(),获取键值
     }else if ((key_Pressed ==1)&&((tmp & 0xf0) == 0xf0))
     {                      //是否按键已经释放
         key_Pressed = 0;   // 清除key_Pressed标识
         key_Flag    = 1;   // 设置key_Flag标识
     }
     
}*/

void key_Event(void){

     unsigned char tmp;
     //P3OUT = 0xFF;
     P3DIR &= 0xF0;  // P3.0~P3.3 设置为输入模式
     P3DIR |= 0xF0;  // set p3.4~p3.7 设置为输出模式
     P3OUT &= 0x0F;         // 设置P3OUT输出值
      tmp = P3IN;            // 获取 p3IN
     if ((key_Pressed ==0x00)&&((tmp & 0x0F) < 0x0F))
     {                      //是否有键按下
         key_Pressed = 1;   // 如果有按键按下，设置key_Pressed标识
         delay();           //消除抖动
         delay();
         delay();
         check_Key();       // 调用check_Key(),获取键值
     }else if ((key_Pressed ==1)&&((tmp & 0x0F) == 0x0F))
     {                      //是否按键已经释放
         key_Pressed = 0;   // 清除key_Pressed标识
         key_Flag    = 1;   // 设置key_Flag标识
     }

}
