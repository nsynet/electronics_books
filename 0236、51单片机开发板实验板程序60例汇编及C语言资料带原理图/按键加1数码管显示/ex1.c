#include<reg52.h>
#define uint unsigned int 
#define uchar unsigned char 
sbit P37=P3^7;
//sbit d1=P2^1;
sbit P10=P1^0;
uchar num;
uchar code table[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E};
void delay(uint z);
void main()
{
//P37=1;
P1=0xff;
 while(1){
   if(P10==0){
delay(20);
if(P10==0){
num++;
if(num==16){
num=0;
  } 

while(!P10);

}
}
P37=0;
P0=table[num];  
}
}


void delay(uint z)
{
uint x,y;
for(x=z;x>0;x--)
for(y=110;y>0;y--);	
}


