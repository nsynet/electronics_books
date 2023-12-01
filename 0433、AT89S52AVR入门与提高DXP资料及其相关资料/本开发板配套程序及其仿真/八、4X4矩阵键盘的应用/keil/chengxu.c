/********************************************************************
                            汇诚科技
					  http://www.ourhc.cn
*********************************************************************/
#include<reg52.h>  	       //库文件
#define uchar unsigned char//宏定义无符号字符型
#define uint unsigned int  //宏定义无符号整型
/********************************************************************
                            初始定义
*********************************************************************/
unsigned char code seg7code[16]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e };
unsigned char k;
/********************************************************************
                            延时函数
*********************************************************************/
void delay10ms(void) //延时程序
{
	unsigned char i,j;
	for(i=20;i>0;i--)
	for(j=248;j>0;j--);
}

/********************************************************************
                            键盘函数
*********************************************************************/        
 void Getch ( )	//取键值函数
{ 
unsigned char X,Y,Z;
P1=0x0f; //先对P3 置数 行扫描
if(P1!=0x0f) //判断是否有键按下
	{
	delay10ms(); //延时,软件去干扰
	if(P1!=0x0f) //确认按键按下
		{
		X=P1; //保存行扫描时有键按下时状态
		P1=0xf0; //列扫描
		Y=P1;    //保存列扫描时有键按下时状态
		Z=X|Y; //取出键值
/*********************************************************************/
switch ( Z ) //判断键值（那一个键按下）
			{
				case 0xee: k=0; break; //对键值赋值
				case 0xed: k=1; break;
				case 0xeb: k=2; break;
				case 0xe7: k=3; break;
				case 0xde: k=4; break;
				case 0xdd: k=5; break;
				case 0xdb: k=6; break;
				case 0xd7: k=7; break;
				case 0xbe: k=8; break;
				case 0xbd: k=9; break;
				case 0xbb: k=10;break;
				case 0xb7: k=11;break;
				case 0x7e: k=12;break;
				case 0x7d: k=13;break;
				case 0x7b: k=14;break;
				case 0x77: k=15;break;
			}
		 }
	}
} 
/********************************************************************
                            主函数
*********************************************************************/
void main()
{
while(1)
	{
		P1=0xff;
		Getch();		//调用取键值函数
		P0=seg7code[k]; //查表LED输出
		P2=0X0F;		//点亮数码管
	}
}

	
/********************************************************************
                              结束
*********************************************************************/
 