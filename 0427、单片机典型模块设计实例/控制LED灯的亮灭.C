#include <reg51.h>
#define uint unsigned int
sbit gate1=P2^0; 						// 定义P2-0口
sbit gate2=P2^1; 						// 定义P2-1口
sbit gate3=P2^2; 						// 定义P2-2口
sbit gate4=P2^3; 						// 定义P2-3口

void main(void)
{
uint i,j;
while(1)
{
for(i=1000;i>0;i--)
for(j=1000;j>0;j--);				// 双重循环，延时约1秒
    gate1=!gate1;					// 对P-0口取反，控制小灯的亮灭
    gate2=!gate2;					// 对P-1口取反，控制小灯的亮灭
    gate3=!gate3;					// 对P-2口取反，控制小灯的亮灭
    gate4=!gate4;					// 对P-3口取反，控制小灯的亮灭

}
} 

