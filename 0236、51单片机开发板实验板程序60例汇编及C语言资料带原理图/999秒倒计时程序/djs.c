#include<reg51.h>
sbit Key_UP=P1^0;
sbit Key_DOWN=P1^1;
unsigned char KeyV,TempKeyV; 							   
sbit P35=P3^5;//数码管第5位
sbit P36=P3^6;//数码管第6位
sbit P37=P3^7;//数码管第7位
sbit JDQ=P2^0;//继电器
sbit beep=P2^1;//蜂鸣器
 unsigned int js;
 unsigned int ds;//倒计时初始时间 
 unsigned char jsflag;
static unsigned int i;
unsigned char code LEDDis[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90,0xFF,0xBF};

void Delay(unsigned int ii)
{
unsigned int jj;
for(;ii>0;ii--)
for(jj=0;jj<125;jj++)
{;}

}
void Delay500(unsigned int iii)
{
unsigned int jjj;
for(;iii>0;iii--)
for(jjj=0;jjj<60;jjj++)
{;}

}

  

void main()
{
    
	EA = 1;					//允许CPU中断
	ET0 = 1; 				//定时器0中断打开
	TMOD = 0x1;			//设定时器0为模式1，16位模式
	TH0=0xB1;
	TL0=0xDF;				//设定时值为20000us（20ms）
	TR0 = 1;
	ds=999;
	KeyV = 0;
	TempKeyV = 0;
	jsflag=0;


while(1);
  



}

//定时器0中断外理中键扫描和显示
void KeyAndDis_Time0(void) interrupt 1 using 2
{
  TH0=0xB1;
	TL0=0xDF;				//设定时值为20000us（20ms)
	if (!Key_UP)
    KeyV = 1;
  if (!Key_DOWN)
    KeyV = 2;

   if (KeyV!= 0)      //有键按下
    {
      Delay(10);   //延时防抖  按下10ms再测
      if (!Key_UP)
        TempKeyV = 1;
	
      if (!Key_DOWN)
        TempKeyV = 2;
		
		 if (KeyV == TempKeyV)   //两次值相等为确定接下了键
	   {
	   	   if (KeyV == 1){
		   jsflag=0;
		   				   if(ds==0){
						   ds=600;
						   }
						 	js=js+1;
							JDQ=0;   //继电器吸合
							if(js==45){
							beep=0;}
	if(js==50){
	js=0;
	 ds=ds-1;
	  beep=1;
	
	}
	  

						  }
						  	if(KeyV==2){
	  jsflag=1;
	   
	
	}
						  }
						 }




   if(jsflag==1){
   JDQ=1;
   }

   if(ds==0){
   JDQ=1;
   jsflag=1;
   KeyV=0;
   }
  
  P0=LEDDis[ds/100];
P35=0;
  Delay500(5);
	  P35=1;
  P0=LEDDis[(ds-(ds/100)*100)/10];
P36=0;
  Delay500(5);
 P36=1;
 P0=LEDDis[(ds-(ds/100)*100)-((ds-(ds/100)*100)/10)*10];
P37=0;
 Delay500(5);
  P37=1;

 






}

