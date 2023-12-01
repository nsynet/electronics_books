#include <reg51.h>
#include <absacc.h>
#include <stdio.h>
#include <math.h>
#define uchar unsigned char
#define uint unsigned int

sbit P3_5=P3^5;
uchar TEMP;									// 温度值的变量；
uchar flag1;									// 结果为负和正的标志位。		

void delay (unsigned int count)
{									
	unsigned int i;	
	while (count)	
	{
		i =200;
		while (i>0) i--;
		count--;
    }
}

void tmreset (void)								 // 发送复位和初始化
{
	unsigned int i;
	P3_5 = 0;	
	i = 103;
	while (i>0) i--;         						// 延时
	P3_5 = 1;	
	i = 4;	
	while (i>0) i--;	
}

bit tmpread (void)								// 读取数据的一位
{ 
	unsigned int i;
	bit dat;
	P3_5 = 0; i++;	
	P3_5 = 1; i++; i++;							//延时	
	dat = P3_5;	
	i = 8; while (i>0) i--;							// 延时
	return (dat);
}	

unsigned char tmpread2 (void) 			 			//读一个字节
{
	unsigned char i,j,dat;	
	dat = 0;	
	for (i=1;i<=8;i++)
	{
		j = tmpread ();	
		dat = (j << 7) | (dat >> 1);	
	}
	return (dat);
}	

void tmpwrite (unsigned char dat)					//写一个字节
{   
	unsigned int i;
	unsigned char j;
	bit testb;	
	for (j=1;j<=8;j++)
	{	
		testb = dat & 0x01;
		dat = dat >> 1;	
		if (testb)
		{	
			P3_5 = 0; 						// 写0 
			i++; i++;  
			P3_5 = 1;	
			i = 8; while (i>0) i--; 
		}
		else	
		{
			P3_5 = 0; 						// 写0 
			i = 8; while (i>0) i--; 
			P3_5 = 1;
			i++; i++;  
		}
	}
}

void tmpchange(void)							// ds1820 开始转换
{  
	tmreset ();								// 复位
	//tmpre ();								// 等待存在脉冲	
	delay (1);								// 延时
	tmpwrite (0xcc);							// 跳过序列号命令
	tmpwrite (0x44); 						// 发转换命令 44H,	
}

void tmp (void)								// 读取温度
{ 
	unsigned char a,b;
	tmreset ();								// 复位
	delay (1);								// 延时
	tmpwrite (0xcc); 						// 跳过序列号命令
	tmpwrite (0xbe); 						// 发送读取命令
	a = tmpread2 ();							// 读取低位温度	
	b = tmpread2 ();  						//读取高位温度	
	flag1=b;								//若b为1则为负温
	if(flag1)
	{
		TEMP=~a+1;						//如果为负温则去除其补码
	}
	else	
	{
		TEMP=a;	
	}
}
rom()										// 读取器件序列号子程序
{
	tmreset ();								//复位
	delay (1);								//延时
	tmpwrite(0x33);							//发送读序列号子程序

}     

main()
{
	do{	
		tmpchange();							// 开始温度转换
		delay(200);								// 读取延时
		tmp();								//读取温度
	}while(1);	
}	


