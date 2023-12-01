#include<reg52.h>
#include <absacc.h>
#define uchar unsigned char
#define uint unsigned int
/* MAX197片外地址的定义，通过如图5-40所示的硬件连线，可以看出，当单片机的P2.1口的电平
为高时，138译码器的片选信号选中ADCS输出。*/
#define adch0 	XBYTE[0x0200]
//设置P1.7，MAX197输出数据的高低位控制；P1.6，MAX197的中断控制位
uchar ch0datal,ch0datah;
sbit P1_6=P1^6;
sbit P1_7=P1^7;
main()
{
EA=1; 				/*初始化：打开INT0、INT1和T2 */
IT0=1; 
IT1=1; 
EX0=1; 
EX1=1; 
ET2=1;
	T2CON=0x08;			/*设置T2工作方式:允许接收P1.1引脚的下降沿中断，计数器停止*/
	TMOD=0x99;			/*设置T0、T1工作方式：门控方式1定时*/
	TR0=1; TR1=1;
	for (;;); 
}
// 在本例中使用定时中断的方法定时进行数据采集
void intsvr1(void) interrupt 1
{
// 向MAX197的控制字寄存器中写入控制字 0x40；
// MAX197处于正常工作的内部时钟模式，0～5V的测量范围，测量通道为0号；
adch0=0x40;

// 使用查询的方法读MAX197的中断信号，检测MAX197是否完成了信号的采集
	while(P1_6!=0)
{
// 当数据采集完成时，先设置HBEN＝0，即先读低位；
		P1_7=0;
}
	
ch0datal=adch0;

// 当数据采集完成时，设置HBEN＝1，再读高位；
P1_7=1;
	ch0datah=adch0;
	P1_7=0;
}  

