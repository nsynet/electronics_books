//实例16：用P0显示左移运算结果
#include<reg51.h>   //包含单片机寄存器的头文件
void main(void)  
{
  P0=0x3b<<2;//将左移运算结果送P0口，P0=1110 1100B=0xec
  while(1)
    ;    //无限循环，防止程序“跑飞”
}