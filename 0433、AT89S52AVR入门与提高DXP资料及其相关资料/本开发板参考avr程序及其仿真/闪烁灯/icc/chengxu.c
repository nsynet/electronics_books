#include <iom16v.h>
int main( void )
{
unsigned char i, j, k,led=0;
DDRB=0xFF; /* all outputs */
while (1)
{
if(led)
PORTB|=0X01; /* |ʹ���һλΪ1 */
else
PORTB&=0XFE; /*&���һλΪ0 */
led=!led;
//��ʱ
for (i=0; i<255; i++)
for(j=0; j<255;j++)
k++;
}
}
