#include<reg52.h>
#define uchar unsigned char

unsigned char N=0;
unsigned char X=20;	//占空比初始值为20%

int a,b;

sbit PWM=P3^6;	//PWM输出脚

sbit P3_0=P3^0;//正传
sbit P3_1=P3^1;//反转
sbit P3_2=P3^2;//加速
sbit P3_3=P3^3;//减速

sbit P1_0=P1^0;//M1
sbit P1_1=P1^1;//M1
sbit P1_2=P1^2;//M2
sbit P1_3=P1^3;//M2


void scjs(void)interrupt 3
{
TH1=0Xff;
TL1=0x17;
b++;
}

main()
{
TMOD=0x00;
IE=0X88;
TH1=0Xff;
TL1=0X17;
TR0=1;
TR1=1;
a=0;
b=0;


while(1)
{
 PWM=1;
 while(1)
 {
 b=0;
 while(!b);
 if (N==X)
 PWM=0;
 if (N==100)break;
 N++;

 if(P3_0==0)//正传
         {
          P1_0=1;
	      P1_1=0;
		  P1_2=1;
	      P1_3=0;
          }
 if(P3_1==0)//反转
          {
          P1_0=0;
	      P1_1=1;
		  P1_2=0;
	      P1_3=1;
          }
 if(P3_3==0)   	//速度加
           { 
                X++; 
			 
           }
 if(P3_3==0)	 //速度减
           {
                X--;	 
           }
      }
            N=0;
    }

  }
