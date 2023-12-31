
////////////////////////汇诚科技////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////步进电机调试程序/////////////////

#include<reg52.h> 
#define uchar unsigned char
#define uint unsigned int
uchar Y=1; //初始化速度
/********************************************************
 						控制位定义
********************************************************/

sbit shi_neng=P1^0;  //	使能控制位
sbit fang_shi=P1^1;  //	工作方式控制位
sbit fang_xiang=P1^2;//	旋转方向控制位
sbit mai_chong=P1^3; // 脉冲控制位

sbit zheng_zhuan=P2^0;  //	正转
sbit fan_zhuan=P2^1;    //	反转
sbit jia_su=P2^2;	 // 加速
sbit jian_su=P2^3;   // 减速

/********************************************************
 						延时函数
********************************************************/
void delay(uchar i)//延时函数
{
	uchar j,k;
	for(j=0;j<i;j++)
	for(k=0;k<180;k++);
}
/********************************************************
 						加速函数
********************************************************/
void jia()
{

Y=Y-1;
if(Y<=1){Y=1;}//如果速度值小于等于1，值保持不变

}
/********************************************************
 						减速函数
********************************************************/
void jian()
{

Y=Y+1;
if(Y>=100){Y=100;}

}
/********************************************************
 						主函数
********************************************************/

main()
{
	shi_neng=1;  //	使能控制位
	fang_shi=1;  //	工作方式控制位
	fang_xiang=1;//	旋转方向控制位
	mai_chong=1; // 脉冲控制位
	while(1)
	{

		if(zheng_zhuan==0){fang_xiang=1;}
		if(fan_zhuan==0){fang_xiang=0;}
		if(jia_su==0){delay(10);while(!jia_su);jia();}
		if(jian_su==0){delay(10);while(!jian_su);jian();}

		mai_chong=~mai_chong; //输出时钟脉冲
		delay(Y);			  //延时(括号内数值越小，电机转动速度越快)
		
	}
}