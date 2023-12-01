 #include<reg51.h>
							   
//sbit P30=P3^4;
sbit P35=P3^5;
sbit P36=P3^6;
sbit P37=P3^7;
//sbit P21=P2^1;
 unsigned int js;
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





while(1)
{
for(i=0;i<=999;i++)
{
js=i;
 Delay(500);

 //P21=1;
   //Delay500(10);
   //P21=0;

}

  
}


}

//定时器0中断外理中键扫描和显示
void KeyAndDis_Time0(void) interrupt 1 using 2
{
  TH0=0xB1;
	TL0=0xDF;				//设定时值为20000us（20ms)

  P0=LEDDis[js/100];
P35=0;
  Delay500(5);
	  P35=1;
  P0=LEDDis[(js-(js/100)*100)/10];
P36=0;
  Delay500(5);
 P36=1;
 P0=LEDDis[(js-(js/100)*100)-((js-(js/100)*100)/10)*10];
P37=0;
 Delay500(5);
  P37=1;


   //P0=LEDDis[6];
//P33=0;
 //Delay500(5);
  //P33=1;

  





}

