#include <iom16v.h>
///////////////////��ʱ us//////////////////
void delay_us(int t)
{
do
   t--;
while(t>1);
}

///////////////////��ʱ  ms/////////////////
void delay_ms(unsigned int t)
{
while(t!=0)
{
delay_us(1142);
t--;
}
}
///////////////////������/////////////////////
int main(void)
{
  DDRB=0xFF;  /* all outputs */
  PORTB=0XFF;
 while(1)
{//***IO������͵�ƽ��Ч���磺0X01Ϊʮ���������������Ʊ�ʾΪ00000001B����ȡ��
    ////////A�����//////
	PORTB=~0X01; //  ����ʾȡ�� 
    delay_ms(100);//��ʱN��
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

    PORTB=0X00;//ѭ������ȫ��

      
    }
  }
