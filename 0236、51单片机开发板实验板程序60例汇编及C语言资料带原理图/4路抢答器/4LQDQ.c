#include <reg51.h>
#include <intrins.h>

#define uchar unsigned char
#define uint  unsigned int

sbit  K1 = P1^0; sbit  K2 = P1^1;  // K1对应SW19  K2对应Sw20 K3对应SW21 K4对应Sw22
sbit  K3 = P1^2; sbit  K4 = P1^3;
sbit BEEP = P2^1; //蜂鸣器控制端口P21
uchar  temp;
void beep();              //蜂鸣器
void delay0(uchar x);      //x*0.14MS


 //--------------------------------------------------
/* 延时子程序*/

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
   BEEP=!BEEP;       //BEEP取反
   } 
   BEEP=1;           //关闭蜂鸣器
   delay1(250);       //延时     
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
     P0 = 0xc0;           //显示“0”
  P3 = 0x7f;
  P1 = 0x0f;           //置P1.0-P1.3为输入状态
  _nop_();
  temp = P1;

  while(temp==0x0f)   
  {
    temp = P1;
temp=temp&0x0f;   
  }

     if(K1==0)
  {     beep(); 
       P0 = 0xf9;         //显示”1“ 
delay(4000);

  }
  else  if(K2==0)
  {    beep();
       P0 = 0xa4;        //显示”2“ 
   delay(4000);
  }
  else  if(K3==0)
  {     beep();
       P0 = 0xb0;        //显示“3” 
delay(4000);
  }
  else  if(K4==0)
  {     beep();
       P0 = 0x99;        //显示“4” 
   delay(4000);
  }
   }
}

/*********************************************************/