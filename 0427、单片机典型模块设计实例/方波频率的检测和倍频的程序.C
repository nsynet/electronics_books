#include <reg52.h>
#include <absacc.h>
#define uchar unsigned char
#define uint unsigned int
/*输出给舵机的控制信号：周期18ms，脉宽由原始控制信号输入脉宽和陀螺反馈输入脉宽计算得到的
方波*/
sbit P1_2=P1^2; 
//sbit EXF2=T2CON^6;					/*T2外中断标志位*/
uchar flag_int0;						// 外中断输入的标志位
uint HELMNUM=0;					/*存放输出给舵机的控制信号的脉宽时间*/
uchar N;							// 定时器溢出次数
uchar time_sgn;						// 输入方波的周期变量
uchar T1H,T1L;						// 定时器T1的高低位变量

main()
{
/*初始化：打开INT0、INT1和T2，设置T2的优先级为最高*/
// 这是因为T2所记录的中断是输出信号的控制周期，所以其优先有必要设为最高。
	EA=1;  IT0=1; IT1=1; 
	EX0=1; EX1=1; ET2=1;
T2CON=0x08;			/*设置T2工作方式:允许接收P1.1引脚的下降沿中断，计数器停止*/
	TMOD=0x99;			/*设置T0、T1工作方式：门控方式1定时*/
	TR0=1; TR1=1;
	for (;;); 
}
// 外中断0的控制T1计数子程序
void int0svr(void) interrupt 0 using 1 
{
if (flag_int0==1)
{
flag_int0=0;
T1H=TH1;
T1L=TL1;
time_sgn=N*65536+T1H*256*T1L;
TH1=0;
TL1=0;
}
if (flag_int0==0)
{
flag_int0=1;
TH1=0;
TL1=0;
TR1=1;
}
}

// T1计数子程序
void timer1(void)  interrupt 3 using 1
{
TH1=0;							// 定时器T1的高四位赋值
TL1=0; 							// 定时器T1的低四位赋值
N=N+1; 							// 定时器的溢出次数
}

/* 定时计数器2的中断服务子程序 */
void timer2(void) interrupt 5 using 3
{
// 判断中断类型:EXF2=1时为P1.1引脚下降沿触发的中断；TF2=1为T2定时时间到触发的中断
if (TF2)
	{
		TF2=0;
		TH2=- (time_sgn /4)/256;
		TL2=- (time_sgn /4)%256;
		T2CON=0x0c;
	}
P1_2=!P1_2;
} 

