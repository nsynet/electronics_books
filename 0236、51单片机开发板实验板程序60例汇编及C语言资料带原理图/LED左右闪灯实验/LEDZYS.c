#include<reg51.h>
#include <intrins.h>


void delayms(unsigned char ms) 
// ��ʱ�ӳ���
{ 
unsigned char i;
while(ms--)
{
for(i = 0; i < 120; i++);
}
}


flash()
{                   P0=0x00;
delayms(250);
                    P0=0xff;
delayms(250);
                    P0=0x00;
delayms(250);
                    P0=0xff;
delayms(250);
}

main()
{
unsigned char LED;
LED = 0xfe;
P0 = LED;

while(1)
{

LED = _crol_(LED,1); //ѭ������1λ��������һ��LED
P0 = LED;
delayms(250);
if(LED==0x7f)

{  flash();

  P0=0x7f;

while(P0!=0xfe)
{

P0=P0<<7|P0>>1;//ѭ������
delayms(250);
}
              
flash(); 

}

}
}