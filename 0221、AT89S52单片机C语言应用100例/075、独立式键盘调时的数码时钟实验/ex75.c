//实例75：独立式键盘调时的数码时钟实验
#include<reg51.h>    //  包含51单片机寄存器定义的头文件
unsigned char code Tab[ ]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};  //数字0~9的段码
unsigned char int_time ; //中断次数计数变量
unsigned char second;    //秒计数变量
unsigned char minute;    //分钟计数变量
unsigned char hour;     //小时计数变量

sbit S1=P1^4;          //将S1位定义为P1.4
sbit S2=P1^5;          //将S2位定义为P1.5
sbit S3=P1^6;          //将S3位定义为P1.6
sbit S4=P1^7;          //将S4位定义为P1.7

/******************************************************************
函数功能：数码管扫描延时
********************************************************************/
 void delay(void)     
 {
   unsigned char j;
	for(j=0;j<200;j++)
	 ;
  }
/******************************************************************
函数功能：键盘扫描延时
********************************************************************/
  void delay60ms(void)
  {
    unsigned char i,j;
	 for(i=0;i<200;i++)
	 for(j=0;j<100;j++)
	   ;
  }

/******************************************************************
函数功能：显示秒
入口参数：s
********************************************************************/
 void DisplaySecond(unsigned char s)
{
   P2=0xbf;        //P2.6引脚输出低电平， DS6点亮 
   P0=Tab[s/10];          //显示十位
   delay();

   P2=0x7f;       //P2.7引脚输出低电平， DS7点亮 
   P0=Tab[s%10];         //显示个位
	delay();
	P2=0xff;     //关闭所有数码管
   
 }
 
/******************************************************************
函数功能：显示分钟
入口参数：m
********************************************************************/
void DisplayMinute(unsigned char m)
{
     P2=0xf7;   // P2.3引脚输出低电平， DS3点亮 
     P0=Tab[m/10];//显示个位
	  delay();
	  P2=0xef;   // P2.4引脚输出低电平， DS4点亮 
	  P0=Tab[m%10];
	  delay();
	  P2=0xdf;   //P2.5引脚输出低电平， DS5点亮 
	  P0=0xbf;   //分隔符“-”的段码
	  delay();
	  P2=0xff;   //关闭所有数码管
}
/******************************************************************
函数功能：显示小时的子程序
入口参数：h
********************************************************************/
void DisplayHour(unsigned char h)
{
   
   P2=0xfe;        //P2.0引脚输出低电平， DS0点亮 
   P0=Tab[h/10];          //显示十位 
   delay();
 
   P2=0xfd;       //P2.1引脚输出低电平， DS1点亮 
   P0=Tab[h%10];    //显示个位
	delay();    
	P2=0xfb;     //P2.2引脚输出低电平， DS2点亮 
	P0=0xbf;     //分隔符“-”的段码
	delay();
   P2=0xff;     //关闭所有数码管
    
 }
/******************************************************************
函数功能：键盘扫描
********************************************************************/
void key_scan(void)
{
     P1=0xf0;   //将P1口高4位置高电平“1”
	  if((P1&0xf0)!=0xf0)         //有键按下
	   {
		     delay60ms();         //延时60ms再检测
			     if((P1&0xf0)!=0xf0)         //确实有键按下
			     {
			          if(S1==0)      //如果是S1键按下
			             second++;   //秒加1
					   if(S2==0)      //如果是S2键按下
			           minute++;    //分钟加1
						 if(S3==0)     //如果是S3键按下
			           hour++;      //小时加1
						 if(S4==0)     //如果是S4键按下
			           {
						    second=0;   //秒清0
						    minute=0;   //分钟清0
						    hour=0;     //小时清0
						  }
              }
	   }
}

/******************************************************************
函数功能：主函数
********************************************************************/

 void main(void)
   {
	    	
			TMOD=0x01;             //使用定时器T0		
			EA=1;                  //开中断总允许
			ET0=1;                 //允许T0中断
			TH0=(65536-46083)/256;  //定时器高八位赋初值
			TL0=(65536-46083)%256;  //定时器低八位赋初值
			TR0=1;                 //启动定时器T0 
			int_time=0;    //中断计数变量初始化
			second=0;      //秒计数变量初始化
			minute=0;     //分钟计数变量初始化
			hour=0;       //小时计数变量初始化
        
         while(1)
			{	      
	 				 DisplaySecond(second);    //调用秒显示子程序
				    DisplayMinute(minute);   //调用分钟显示子程序
					 DisplayHour(hour);       //调用小时显示子程序
				    							  
		   }
  }

/******************************************************************
函数功能：定时器T0的中断服务子程序
********************************************************************/
  void interserve(void ) interrupt 1 using 1  //using Time0
  {
     TR0=0;                 //关闭定时器T0
     int_time++;           //中断次数加1
		 if(int_time==20)    //如果中断次数满20
		   {
              int_time=0;    //中断计数变量清0
		        second++;      //秒计数变量加1
			}
		 if(second==60)      //如果秒计满60
		    {
				 second=0;    //如果秒计满60，将秒计数变量清0
				 minute++;    //分钟计数变量加1
			 }
		 if(minute==60)    //如果分钟计满60
		   {
			   minute=0;    //如果分钟计满60，将分钟计数变量清0
			   hour++;      //小时计数变量加1
		   }
		 if(hour==24)     //如果小时计满24
		   {
			hour=0;              //如果小时计满24，将小时计数变量清0
	       }
      key_scan();               //执行键盘扫描 
      TH0=(65536-46083)/256;    //定时器T0高四位赋值
		TL0=(65536-46083)%256;    //定时器T0低四位赋值
      TR0=1;                   //启动定时器T0
		
  }  





 

 

