//实例58：用LED数码显示数字5
#include<reg51.h>           //  包含51单片机寄存器定义的头文件
void main(void)
{
  P2=0xfe;   //P2.0引脚输出低电平，数码显示器接通电源准备点亮
  P0=0x92;   //让P0口输出数字"5"的段码92H
}