
#include <reg52.h> //51оƬ�ܽŶ���ͷ�ļ� 
#include <intrins.h>//�ڲ�������ʱ���� _nop_(); 

#define uchar unsigned char 
#define uint unsigned int 

uchar display[ ]={0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,

 0xBF,0xBF,0x89,0x86,0xC7,0xC7,0xC0,0xBF,0xBF, 

// --H E L L O -


0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff}; 

uchar shift,j=0; 

/********************************************************

 ms��ʱ���� 

********************************************************/ 

void delayms(uint ms) 

{

 uchar t; 

while(ms--)


 { 
for(t = 0; t < 120; t++); 
} 
} 

/******************************************************* 
��ʾ���� 
*******************************************************/ 

void disp(void) 

{ 
uchar i; 
shift=0x7f; 

for(i=8; i>0; i--)

 { 
P0=display[i+j]; 
P3=shift; 
shift=(shift>>1)|0x80; 
delayms(1);


 } 
P3=0xff ; 
} 

/******************************************************* 
������ 
*******************************************************/ 

void main() 
{ 
uchar k;

 P0=0xFF; 
P3=0xFF; 


while(1)


 { 
for(j=0;j<17;j++) 
{ 


for(k=0;k<125;k++) 
disp(); 
} 
} 
} 


