#include<reg52.h>
#define uchar unsigned char

unsigned char N=0;
unsigned char X=20;	//占空比初始值为50%

int a,b;

sbit PWM=P3^6;	//PWM输出脚

sbit P2_0=P2^0;//M1启动
sbit P2_1=P2^1;//M1停止
sbit P2_2=P2^2;//M1加速
sbit P2_3=P2^3;//M2减速

sbit P1_0=P1^0;//M1
sbit P1_1=P1^1;//M1


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

 if(P2_0==0)//M1启动
         {
          P1_0=1;
	      P1_1=0;
          }
 if(P2_1==0)//M1停止
          {
           P1_0=1;
		   P1_1=1;
          }
 if(P2_2==0)
           { 
                X++; 
			 
           }
 if(P2_3==0)
           {
                X--;	 
           }
      }
            N=0;
    }

  }
