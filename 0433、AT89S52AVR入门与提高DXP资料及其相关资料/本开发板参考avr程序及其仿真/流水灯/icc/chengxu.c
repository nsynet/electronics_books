#include <iom16v.h>
///////////////////延时 us//////////////////
void delay_us(int t)
{
do
   t--;
while(t>1);
}

///////////////////延时  ms/////////////////
void delay_ms(unsigned int t)
{
while(t!=0)
{
delay_us(1142);
t--;
}
}
///////////////////主程序/////////////////////
int main(void)
{
  DDRB=0xFF;  /* all outputs */
  PORTB=0XFF;
 while(1)
{//***IO口输出低电平有效，如：0X01为十六进制数，二进制表示为00000001B，再取反
    ////////A口输出//////
	PORTB=~0X01; //  ～表示取反 
    delay_ms(100);//延时N秒
    PORTB=~0X02;
    delay_ms(100);
    PORTB=~0X04;
    delay_ms(100);
    PORTB=~0X08;
    delay_ms(100);
    PORTB=~0X10;
    delay_ms(100);
    PORTB=~0X20;
    delay_ms(100);
    PORTB=~0X40;
    delay_ms(100);
    PORTB=~0X80;
    delay_ms(100);

    PORTB=0X00;//循环结束全亮

      
    }
  }
