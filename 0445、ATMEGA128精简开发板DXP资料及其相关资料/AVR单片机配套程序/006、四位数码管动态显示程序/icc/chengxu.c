#include <iom128.h>
/********************************************************************
                数据类型定义
*********************************************************************/
#define uchar unsigned char 
#define uint unsigned int
/********************************************************************
                数码管段码定义0123456789
*********************************************************************/
uchar Table[10]={0xc0,0Xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};	 //所需的段的位码
uchar wei[4]={0X01,0X02,0X04,0X08};  //位的控制端	(仿真)    
//uchar wei[4]={0XEF,0XDF,0XBF,0X7F};  //位的控制端	(开发板使用) 
uint z,x,c,v, date;	//定义数据类型                           
/**********************************************************************
				  MS级延时函数程序，参数i 延时时间					   	
**********************************************************************/
void DelayMS(uint i)
{
uint j;
for(;i!=0;i--)
{
for(j=8000;j!=0;j--);
}
}
/**********************************************************************
                数码管动态扫描
*********************************************************************/
void Pre_Display()
 { 

 /***********************数据转换*****************************/ 
  z=date/1000;			 //求千位
  x=date%1000/100;		 //求百位
  c=date%100/10;		 //求十位
  v=date%10;			 //求个位

      PORTE=wei[0];
	  PORTD=Table[z];
	  DelayMS(1);  
  	  PORTE=wei[1];
      PORTD=Table[x];
	  DelayMS(1);  
   	  PORTE=wei[2];
      PORTD=Table[c];
	  DelayMS(1);  
      PORTE=wei[3];
      PORTD=Table[v];
	  DelayMS(1);  
  }
//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置D口为输出
DDRD=0xFF;
PORTD=0xFF;
//设置E口为输出
DDRE=0xFF;
PORTE=0xFF;
}

/**********************************************************************
				           主函数						  	
**********************************************************************/
void main(void)
{
Init_IO();  //初始化I/O
while(1)
{
date=2345;//数码管显示数值
Pre_Display();
}
}
