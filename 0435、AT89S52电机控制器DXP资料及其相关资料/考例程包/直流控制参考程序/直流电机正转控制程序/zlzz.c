////////////////////////汇诚科技////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////直流电机正转调试程序/////////////

#include<reg52.h> 

sbit P2_0=P2^0;//M1启动
sbit P2_1=P2^1;//M2启动
sbit P2_2=P2^2;//M1停止
sbit P2_3=P2^3;//M2停止

sbit P1_0=P1^0;//M1
sbit P1_1=P1^1;//M1
sbit P1_2=P1^2;//M2
sbit P1_3=P1^3;//M2
main()
{

while(1)
   {
       if(P2_0==0)//M1启动
         {
          P1_0=1;
	  P1_1=0;
          }
       if(P2_1==0)//M2启动
         {
          P1_2=1;
		  P1_3=0; 
		  }
       if(P2_2==0)//M1停止
          {
           P1_0=1;
		   P1_1=1;
          }
       if(P2_3==0)//M2停止
          {
           P1_2=1;
		   P1_3=1;
          }
    }
}
