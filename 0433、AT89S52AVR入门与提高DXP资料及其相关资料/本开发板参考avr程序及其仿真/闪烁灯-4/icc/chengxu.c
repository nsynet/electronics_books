#include <iom16v.h>
int main( void )
{
unsigned char i, j, k,led=0;
DDRA=0xFF;//为输出
DDRB=0xFF;
DDRC=0XFF;
DDRD=0XFF;
while (1)
{
if(led)
{
PORTA|=0XFF;
PORTB|=0XFF;
PORTC|=0XFF;
PORTD|=0XFF;
}
else
{
PORTA&=0X00;
PORTB&=0X00;
PORTC&=0X00;
PORTD&=0X00;
}
led=!led;//取反

////////////延时////////////////
for (i=0; i<255; i++)
for(j=0; j<255;j++)
k++;
}
}
