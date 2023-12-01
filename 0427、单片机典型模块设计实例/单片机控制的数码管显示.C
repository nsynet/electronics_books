#include <reg52.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#define DIGPORT  		XBYTE [0x8000]		/* 定义字位口 */
#define WORDPORT  	XBYTE [0x4000]		/* 定义字型口 */
#define uchar unsigned char
/* 定义共阴极字型编码表（数字0～9）*/
uchar code TABLE[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
// 显示：得到字型和字位口的地址后，向不同的字位送数据，进行数据的显示。
// 数码管显示计数值个位
uchar digit;
uchar disp,delay; 								// 对计数值取余数

main()
{
	TMOD=0x60;  							/* T0方式1计时0.01秒 */
	TH1=0;
	TL1=0;
	EA=1; ET1=0; TR1=1;  					/* 开中断,启动定时器 */
	for (;;)
	{
										/* 数码管显示计数值低位 */
		digit=0x08;
		disp=TL1%10;
		DIGPORT=digit;
		WORDPORT=TABLE[disp];
		for (delay=0;delay<=200;delay++);
		//…显示其它位的数据
}
} 

