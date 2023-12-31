/********************************************************************
                            汇诚科技
网址：http://www.ourhc.cn
产品有售淘宝店：http://shop36330473.taobao.com   
*********************************************************************/
#include <iom8v.h>
#include <macros.h> 
#define uchar unsigned char
#define uint  unsigned int
#define uchar unsigned char    //数据类型说明
#define uint  unsigned int     //数据类型说明
/**********************************************************************
								延时函数			

					   	
**********************************************************************/
void DelayMs(uint i)           //Ms级延时函数,参数i：延时时间
{uint j;
 for(;i!=0;i--)
  {for(j=2000;j!=0;j--) {;}
  }
}
/**********************************************************************
								跑马灯函数			

					   	
**********************************************************************/
void Horse(uchar i)            //跑马灯程序，通过步判断点亮相应的LED
{switch(i)                     //高电平点亮LED
 {case 1:PORTB=0xfe;break;     //1111 1110B 点亮LED1
  case 2:PORTB=0xfc;break;     //1111 1100B 点亮LED1~LED2
  case 3:PORTB=0xf8;break;     //1111 1000B 点亮LED1~LED3
  case 4:PORTB=0xf0;break;     //1111 0000B 点亮LED1~LED4
  case 5:PORTB=0xe0;break;     //1110 0000B 点亮LED1~LED5
  case 6:PORTB=0xc0;break;     //1100 0000B 点亮LED1~LED6
  case 7:PORTB=0x80;break;     //1000 0000B 点亮LED1~LED7
  case 8:PORTB=0x00;break;     //0000 0000B 点亮LED1~LED8
  default:break;}
}
/**********************************************************************
								初始化I/0						   	
**********************************************************************/
void Init_IO(void)             //初始化I/O口
{
DDRB=0xff;                    //端口设置：PA口设置为推挽1输出
 PORTB=0xff;
}
/**********************************************************************
								看门狗初始化					   	
**********************************************************************/
void WDT_init(void)
{
 WDR();//WDT 复位 
 WDTCR = 0x0F;//使能看门狗
}
/**********************************************************************/
void init_eatdog(void)
{
 CLI(); //禁止所有中断
 WDT_init();
 SEI();//开全局中断
}

/**********************************************************************
								看门狗关闭(喂狗)				   	
**********************************************************************/
void WDT_off(void)
{
 WDR();//WDT 复位
 WDTCR |= (1<<WDTOE) | (1<<WDE); //置位 WDTOE 和 WDE
 WDTCR = 0x00;//关闭WDT 
}

/**********************************************************************
								主函数						   	
**********************************************************************/
void main(void)               
{uchar i;
 Init_IO();
 PORTB=0x00;                   //PORTA初始值为0，灭掉所有的LED      
 DelayMs(100);                //延时
 WDTCR=0x00;				   //看门狗开启使能  1.9S
 while(1)                      //程序无条件执行
  { 
  
  for(i=1;i<9;i++)           //依次点亮LED1~LED8
      {Horse(i);
	   DelayMs(100);         //延时
	   init_eatdog();		 //看门狗初始化
	   WDT_off();			 //喂狗（如果停止喂狗系统自动复位）
	   }         
	for(i=9;i>0;i--)          //依次熄灭LED8~LED1
      {Horse(i);
	   DelayMs(100);}         //熄灭时间约1秒
	PORTB=0xff;
    DelayMs(100);
  }
}

/**********************************************************************
								程序结束			

					   	
**********************************************************************/