//实例15：用P0口显示按位"异或"运算结果
#include<reg51.h>   //包含单片机寄存器的头文件
void main(void)  
{
  P0=0xa2^0x3c;//将条件运算结果送P0口，P0=8=0000 1000B
  while(1)
    ;    //设置无限循环，防止程序“跑飞”
}