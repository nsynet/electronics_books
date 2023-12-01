
////////////////////////汇诚科技////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////步进电机调试程序/////////////

#include<reg52.h>  

/*****P1.0=A ;P1.1=B ;P1.2=A' ; P1.3=B'****/ 
//////////////////////////////////////////////////////////////////////////////////////////////
/*******************************正转数组**************************************************/
code unsigned char runz[4]={0x0e,0x0d,0x0b,0x07};  //两相四线四拍工作方式
/*******************************反转数组**************************************************/
code unsigned char runf[4]={0x07,0x0b,0x0d,0x0e};  //两相四线四拍工作方式
unsigned char keycan=0;		//键值
unsigned char s,i,j,k,z;

int y=30;//定义转动速度，数值越大电机转速越慢反之则快

sbit P2_0=P2^0;//正转按键
sbit P2_1=P2^1;//反转按键
sbit P2_2=P2^2;//电机加速
sbit P2_3=P2^3;//电机减速

void delay(i)//延时函数
  {
      for(j=0;j<i;j++)
      for(k=0;k<250;k++);
  }



void zrun()// 正转运行
{

   for(z=0;z<4;z++)
       { 
         P1=runz[z];
         delay(y);
       }
}

void frun()// 反转运行
 {
     for(z=0;z<4;z++)
        {
            P1=runf[z];
            delay(y);
         }
}

main()
{
   while(1)
    {
         if(P2_0==0) //如果电机正转按键按下
      {
        keycan=1;	 //键值等于1
      }
         if(P2_1==0) //如果电机反转按键按下
      {
        keycan=2;	 //键值等于2
       }
	             switch (keycan)
	            {
	             case 1: zrun();  //键值等于1 正转
				 break;
	             case 2: frun();  //键值等于2 反转
	             break;

	             }

	     if(P2_2==0)  //  电机加速
      {
        y+=5;
      }
         if(P2_3==0)
      {			 // 电机减速
        y-=5;
       }

   }
}