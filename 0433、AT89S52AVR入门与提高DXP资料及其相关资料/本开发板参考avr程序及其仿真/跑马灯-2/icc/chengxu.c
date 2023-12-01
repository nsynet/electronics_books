#include <iom16v.h>
#define uchar unsigned char 
#define uint unsigned int
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
void delayms(uint i)//—” ±
{
uint j;
for(;i!=0;i--)
{
for(j=8000;j!=0;j--);
}
}
////////////////////////////////////////////////////////////////////
void delayus(uint i)//—” ±
{
uint j;
for(;i!=0;i--)
{
for(j=100;j!=0;j--);
}
}
////////////////////////////////////////////////////////////////////
void main(void)
{
 DDRA=0XFF; 

 while(1)
 {
uint i,j;
  for(i=0;i<4;i++)
  {
  PORTA=0xFF;  //Œ“…¡£°ﬁ’√¸…¡£°
   delayms(10);
  }
  j=0x01;
  for(i=0;i<8;i++)
  {
   j<<=1;   
  PORTA=j;  //Œ“◊Û…¡£°
   delayms(10);
  }
  j=0x80;
  for(i=0;i<8;i++)
  {
   j>>=1;   
   PORTA=j;  //Œ“”“…¡£°
   delayms(10);
  }
 }  
} 