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
code uchar seg7code[10]={ 0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90}; //显示段码 数码管字跟
uchar wei[4]={0XEf,0XDf,0XBf,0X7f};  //位的控制端
uchar sec; //定义计数值，每过1/10 秒，sec 加一
uchar keycnt=0;//按下次数值
uint tcnt; //键值判断
sbit P3_0=P3^0;
/********************************************************************
                            延时函数
*********************************************************************/
void delay(uchar t)
{
  uchar i,j;
   for(i=0;i<t;i++)
   {
   	 for(j=13;j>0;j--);
	 { ;
	 }
   }
}

/********************************************************************
                            显示函数
*********************************************************************/        
void Led(int date) //显示函数
{
/*****************数据转换*****************************/ 
 uint z,x,c,v;
  z=date/1000;			 //求千位
  x=date%1000/100;		 //求百位
  c=date%100/10;		 //求十位
  v=date%10;			 //求个位

      P2=0XFF;
	  P0=seg7code[z];
	  P2=wei[0];
	  delay(80);
	  P2=0XFF;  
      P0=seg7code[x];
	  P2=wei[1];
	  delay(80);
	  P2=0XFF;  
   	  P0=seg7code[c];
	  P2=wei[2];
	  delay(80);
	  P2=0XFF;  
      P0=seg7code[v];
	  P2=wei[3];
	  delay(80); 
	  P2=0XFF;
}
/********************************************************************
                            按键扫描函数
*********************************************************************/
void KEY() //按键扫描程序
{
uchar i,j;
if(P3_0==0)
	{
	delay(20);
	if(P3_0==0)
		{
			keycnt++;
/********************************************************************
                            按下次数判断函数
*********************************************************************/
switch(keycnt) //按下次数判断
	{
	case 1: //第一次按下
	TH0=0x06; //对TH0 TL0 赋值
	TL0=0x06;
	TR0=1; //开始定时
	break;
	case 2: //第二次按下
	TR0=0; //定时结束
	break;
	case 3: //第三次按下
	keycnt=0; //重新开始判断键值
	sec=0; //计数重新从零开始
	break;
	}
	while(P3_0==0);
		} 
	}
}
/********************************************************************
                            定时中断服务函数
*********************************************************************/
void t0(void) interrupt 1 using 0 //定时中断服务函数
{
	tcnt++; //每过250ust tcnt 加一
	if(tcnt==400) //计满400 次（1/10 秒）时
	{
		tcnt=0; //重新再计
		sec++;
		if(sec==100) //定时10 秒，在从零开始计时
		{
			sec=0;
		}
	}
}

/********************************************************************
                            主函数
*********************************************************************/
void main()
{
	TMOD=0x02; //定时器工作在方式2
	ET0=1;
	EA=1;
	sec=0;
	while(1)
	{
		KEY();
		Led(sec);
	}
}		

	
/********************************************************************
                              结束
*********************************************************************/
