#include <iom16v.h>
#define uchar unsigned char 
#define uint unsigned int

void delayms(uint i)
{
uint j;
for(;i!=0;i--)
{
for(j=8000;j!=0;j--);
}
}

void horse(uchar i)
{switch (i)
{
case 0:PORTA=0X00;break;
case 1:PORTA=0X01;break;
case 2:PORTA=0X03;break;
case 3:PORTA=0X07;break;
case 4:PORTA=0X0f;break;
case 5:PORTA=0X1f;break;
case 6:PORTA=0X3f;break;
case 7:PORTA=0X7f;break;
case 8:PORTA=0Xff;break;
default:break;
}
}
void main(void)
{
uchar i;
DDRA=0XFF;
PORTA=0XFF;
PORTA=0X00;
delayms(10);
while(1)
{
for(i=0;i<9;i++)
{
horse(i);
delayms(10);
}
for(i=7;i!=0;i--)
{
horse(i);
delayms(10);
}
}
}
