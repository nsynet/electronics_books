//实例72：定时器中断控制的独立式键盘扫描实验
#include<reg51.h>    //包含51单片机寄存器定义的头文件
sbit S1=P1^4;        //将S1位定义为P1.4引脚
sbit S2=P1^5;        //将S2位定义为P1.5引脚
sbit S3=P1^6;        //将S3位定义为P1.6引脚
sbit S4=P1^7;        //将S4位定义为P1.7引脚
unsigned char keyval;  //储存按键值
/*************************************************
函数功能：流水灯延时
**************************************************/
void led_delay(void)
{
   unsigned char i,j;
	for(i=0;i<250;i++)
	  for(j=0;j<250;j++)
	    ;
}

/*************************************************
函数功能：软件消抖延时
**************************************************/
void delay20ms(void)
{
   unsigned char i,j;
	for(i=0;i<100;i++)
	  for(j=0;j<60;j++)
	    ;
}
/*************************************************
函数功能：正向流水点亮LED
**************************************************/
void forward(void)
 {
      	P3=0xfe;         //第一个灯亮
		 	led_delay();
		 	 P3=0xfd;         //第二个灯亮
		 	led_delay();
			 P3=0xfb;          //第三个灯亮
		 	led_delay();
			 P3=0xf7;          //第四个灯亮
		 	led_delay();
			P3=0xef;          //第五个灯亮
	   	led_delay();
			P3=0xdf;          //第六个灯亮
	 	   led_delay();
			P3=0xbf;          //第七个灯亮
	   	led_delay();
			P3=0x7f;          //第八个灯亮
	   	led_delay();  
			P3=0xff;
			P3=0xfe;         //第一个灯亮
		 	led_delay();
}
/*************************************************
函数功能：反向流水点亮LED
**************************************************/
  void backward(void)
  {
       	P3=0x7f;          //第八个灯亮
	   	led_delay();  
			P3=0xbf;          //第七个灯亮
	   	led_delay();
			P3=0xdf;          //第六个灯亮
	 	   led_delay();
			P3=0xef;          //第五个灯亮
	   	led_delay();
			 P3=0xf7;          //第四个灯亮
		 	led_delay();
			P3=0xfb;          //第三个灯亮
		 	led_delay();
		   P3=0xfd;         //第二个灯亮
		 	led_delay();
			P3=0xfe;         //第一个灯亮
		 	led_delay();

  }
/*************************************************
函数功能：关闭所有LED
**************************************************/
void stop(void)
{
        P3=0xff;    //关闭8个LED
}
/*************************************************
函数功能：闪烁点亮LED
**************************************************/
void flash(void)
{
  P3=0xff;      //关闭8个LED
  led_delay();
  P3=0x00;      //点亮8个LED
  led_delay();
}


/*************************************************
函数功能：主函数
**************************************************/
void main(void)  //主函数
{
  TMOD=0x01;      //使用定时器T0的模式1
  EA=1;           //开总中断
  ET0=1;          //定时器T0中断允许
  TR0=1;          //启动定时器T0 
 TH0=(65536-1000)/256;    //定时器T0赋初值，每计数200次（217微秒）发送一次中断请求
 TL0=(65536-1000)%256;    //定时器T0赋初值
  keyval=0;              //按键值初始化为0，什么也不做
   while(1)
	   {
		   switch(keyval)
				  {
				     case 1:forward();
					         break;
					  case 2:backward();
					         break;
					  case 3:stop();
					         break;
					  case 4: flash();
					         break;
					 }
		 	
	 }
}

/*************************************************
函数功能：定时器T0的中断服务子程序
**************************************************/
void Time0_serve(void) interrupt 1 using 1
{
 if((P1&0xf0)!=0xf0)         //第一次检测到有键按下
		     {
			      delay20ms();   //延时20ms再去检测
					if(S1==0)      //按键S1被按下
					 keyval=1;
					if(S2==0)      //按键S2被按下
					 keyval=2;
					if(S3==0)      //按键S3被按下
					 keyval=3;
				  	if(S4==0)      //按键S4被按下
					 keyval=4;
				 }	
 TH0=(65536-1000)/256;
 TL0=(65536-1000)%256;
}


