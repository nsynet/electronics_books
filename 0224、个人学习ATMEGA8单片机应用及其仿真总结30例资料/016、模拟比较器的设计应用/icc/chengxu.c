#include <iom16v.h>
/********************************************************************
                数据类型定义
*********************************************************************/
#define uchar unsigned char
#define uint  unsigned int
/**********************************************************************
				          主函数		
**********************************************************************/
void main(void)
{uchar i;
 DDRB=0xFF;                    //设置PB7输出输入
 PORTB=0xFF;
 DDRD=0x00;                    //设置PB7输出输入
 PORTD=0x00;
 ACSR=0x00;                    //模拟比较器使能
 while(1)
  {if((ACSR&0x20)==0x20)
       PORTB=PORTB|0xf0;
   else PORTB=PORTB&0x0f;}
}
/**********************************************************************
				                 结束		
**********************************************************************/