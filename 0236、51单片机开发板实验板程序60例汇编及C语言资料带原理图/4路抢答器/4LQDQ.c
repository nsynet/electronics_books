#include <reg51.h>
#include <intrins.h>

#define uchar unsigned char
#define uint  unsigned int

sbit  K1 = P1^0; sbit  K2 = P1^1;  // K1��ӦSW19  K2��ӦSw20 K3��ӦSW21 K4��ӦSw22
sbit  K3 = P1^2; sbit  K4 = P1^3;
sbit BEEP = P2^1; //���������ƶ˿�P21
uchar  temp;
void beep();              //������
void delay0(uchar x);      //x*0.14MS


 //--------------------------------------------------
/* ��ʱ�ӳ���*/

void  delay1(uchar x)
{ uchar j;
    while((x--)!=0)
    { for(j=0;j<125;j++)
         {;}
    }
}
//--------------------------------------------------


/**********************************************************/
void delay(uint ms) 
{
   uchar t;
   while(ms--)
   { 
     for(t = 0; t < 120; t++);
   }
}

/*********************************************************/
void beep()
{
  unsigned char i;
  for (i=0;i<100;i++)
   {
   delay0(4);
   BEEP=!BEEP;       //BEEPȡ��
   } 
   BEEP=1;           //�رշ�����
   delay1(250);       //��ʱ     
}
//--------------------------------------------------
void delay0(uchar x)    //x*0.14MS
{
 unsigned char i;
  while(x--)
 {
  for (i = 0; i<13; i++) {}
 }
}
main()
{
   P0 = 0xff;
   P3 = 0xff;
   while(1)
   {
     P0 = 0xc0;           //��ʾ��0��
  P3 = 0x7f;
  P1 = 0x0f;           //��P1.0-P1.3Ϊ����״̬
  _nop_();
  temp = P1;

  while(temp==0x0f)   
  {
    temp = P1;
temp=temp&0x0f;   
  }

     if(K1==0)
  {     beep(); 
       P0 = 0xf9;         //��ʾ��1�� 
delay(4000);

  }
  else  if(K2==0)
  {    beep();
       P0 = 0xa4;        //��ʾ��2�� 
   delay(4000);
  }
  else  if(K3==0)
  {     beep();
       P0 = 0xb0;        //��ʾ��3�� 
delay(4000);
  }
  else  if(K4==0)
  {     beep();
       P0 = 0x99;        //��ʾ��4�� 
   delay(4000);
  }
   }
}

/*********************************************************/