#include <reg51.h>
sbit gate=P2^0; 				// 定义P2-0口
void main(void)
{
unsigned int i,j;
while(1)
{
for(i=1000;i>0;i--)
for(j=1000;j>0;j--);				// 双重循环，延时约1秒
    gate=!gate;					// 对P-0口取反，控制小灯的亮灭
}
}

