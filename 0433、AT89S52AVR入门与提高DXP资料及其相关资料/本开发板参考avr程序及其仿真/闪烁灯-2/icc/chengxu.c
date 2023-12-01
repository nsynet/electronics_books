#include <iom16v.h>
unsigned char i, j, k,led=0;
del()  /*ÑÓÊ±*/
{

for(i=20;i>0;i--)
for(j=20;j>0;j--)
for(k=248;k>0;k--);
}
int main( void )
{
DDRB=0xFF; /* all outputs */

while (1)
{
if(led)
PORTB=0Xfe; 
else
PORTB=0Xff; 
led=!led;
del();
}
}
