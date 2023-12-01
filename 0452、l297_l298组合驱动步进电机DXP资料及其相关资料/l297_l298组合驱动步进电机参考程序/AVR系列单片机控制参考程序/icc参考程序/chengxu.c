////////////////////////汇诚科技////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////步进电机调试程序/////////////////
#include <iom16v.h>
#include <macros.h>
/**********************************************************************
				  函数数据类型说明							   	
**********************************************************************/
#define uchar unsigned char 
#define uint unsigned int

/**********************************************************************
				   延时函数						   	
**********************************************************************/
void delay(uint MS)		  
{
 uint i,j;
 for( i=0;i<MS;i++)
 for(j=0;j<80;j++);	//1141是在8MHz晶振下，通过软件仿真反复实验得到的数值
}
/**********************************************************************
				主函数						   	
**********************************************************************/
void main()
{	 uint i;
	 i=10;//改变变量 i 的大小可以改变速度，i越大速度越慢
     DDRB=0XFF;
	 //PORTC=0XFF;
	 PORTB|=BIT(0);//00000001  使能控制开
	 PORTB|=BIT(1);//00000010  四拍工作方式
	 PORTB|=BIT(2);//00000100  正方向旋转
     while(1)
     {
	    PORTB|=BIT(3);//00001000 脉冲输出
     	delay(i);
		PORTB&=~BIT(3);
		delay(i);
     }

}
/**********************************************************************
				 结束					   	
**********************************************************************/