#include<reg51.h>
#include <absacc.h>
#define uchar unsigned char
#define uint unsigned int
#define addatal 	XBYTE[0xBFFF]
#define addatah 	XBYTE[0xDFFF]
uint datal,datah ;
uchar data BUFFER[1]={0}; 					/*定时器计数变量*/

//设置P1.1，查询MAX526的工作状态
sbit P1_1=P1^1;
main()
{
EA=1; IT1=1; ET0=1;
TMOD=0x01;  							/* T0方式1计时1秒 */
TH0=-5000/256;
TL0=-5000%256;
TR0=1;						 		/* 开中断，启动定时器 */
for (;;); 
}

/* 定时计数器0的中断服务子程序 */
void timer0(void)  interrupt 1 using 1
{
TH0=-5000/256;							// 定时器T0的高四位赋值
TL0=-5000%256;
BUFFER[0]=BUFFER[0]+1; 				// 定时器T0的低四位赋值
if (BUFFER[0]==100)					 	// 百分秒进位
	{
// 使用查询的方法读MAX526的LDAC，检测MAX526是否完成了信号的采集
while(P1_1!=0)
{
// 当数据采集完成时，先读低位；
P1_1=0;
}
datal=addatal;
// 当数据采集完成时，再读高位；
P1_1=1;
datah=addatah;
P1_1=0;
	}
} 

