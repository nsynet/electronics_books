#include <absacc.h>
#include <stdio.h>
#include<reg51.h>
#define uchar unsigned char
#define uint unsigned int

uchar data BUFFER[1]={0}; 					/*定时器计数变量*/

sbit PR=P2^2;								// 定义语音芯片的控制端口，下同
sbit EOM=P2^2;
sbit PD=P2^4;
sbit CE=P2^5;

void delays(void)							// 延时程序
{
uchar i;
for(i=300;i>0;i--);
} 

void play( void)
{
PD=1;									// 打开芯片电源开关
CE=0;									// 选中该芯片
PR=1;									// 开始播放
while(!EOM);							// 等待播放内容结束信号
delays( );								// 延时
PD=0;
CE=0;
PR=0;
}

/* 定时计数器0的中断服务子程序 */
void timer0(void)  interrupt 1 using 1
{
TH0=-5000/256;							// 定时器T0的高四位赋值
TL0=-5000%256;
BUFFER[0]=BUFFER[0]+1; 				// 定时器T0的低四位赋值
if (BUFFER[0]==1000)					// 百分秒进位
	{
play( );							// 调用播放程序
	}
}


main()
{
EA=1; IT1=1; ET0=1;
TMOD=0x01;  							/* T0方式1计时1秒 */
TH0=-5000/256;
TL0=-5000%256;
TR0=1;						 		/* 开中断，启动定时器 */
for (;;);
}


