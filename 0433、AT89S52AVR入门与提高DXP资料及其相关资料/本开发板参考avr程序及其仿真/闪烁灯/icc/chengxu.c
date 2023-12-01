#include <iom16v.h>
int main( void )
{
unsigned char i, j, k,led=0;
DDRB=0xFF; /* all outputs */
while (1)
{
if(led)
PORTB|=0X01; /* |使最后一位为1 */
else
PORTB&=0XFE; /*&最后一位为0 */
led=!led;
//延时
for (i=0; i<255; i++)
for(j=0; j<255;j++)
k++;
}
}
