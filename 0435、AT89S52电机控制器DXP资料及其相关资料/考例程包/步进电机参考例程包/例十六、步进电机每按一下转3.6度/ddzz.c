
////////////////////////汇诚科技////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////步进电机正转调试程序/////////////

#include<reg52.h>  
/*****************************************************************/
/*设程序的后四位1111对应位为ABCD,0000为abcd那么步进电机就可以细分进行下列组合

Abcd》aBcd》abCd》abcD 对应的数组为 0x08,0x04,0x02,0x01

ABcd》aBCd》abCD》AbcD 对应的数组为 0x0C,0x06,0x03,0x09

ABcd》aBcd》aBCd》abCd》abCD》abcD》AbcD》AbcD 对应的数组为 0x0C,0x04,0x06,0x02,0x03,0x01,0x09，0x08

只要按照ABCD的顺序通电，可以产品多种组合。

/*****************************************************************/ 
code unsigned char run[8]={ 0x03,0x0b,0x09,0x0d,0x0c,0x0e,0x06,0x07}; 
unsigned char a,s,i,j,k;
sbit ANJIAN=P2^0;
sbit chuanganqi=P3^0;
void delay(i)//延时函数
{
for(j=0;j<i;j++)
for(k=0;k<250;k++);
}
main()
{
unsigned char z,y;
y=10;	    //定义延时时间，时间越长电机转速越慢反之则快
a=0;
while(1)
{
if((ANJIAN==0)||(chuanganqi==0))
{
 a++;
while((!ANJIAN)||(!chuanganqi));
//delay(y);

switch(a)
	{
	case 1:P1=run[0];delay(y);P1=run[2];delay(y);break;
	case 2:P1=run[4];delay(y);P1=run[6];delay(y);break;
	case 3:P1=run[0];delay(y);P1=run[2];delay(y);break;
	case 4:P1=run[4];delay(y);P1=run[6];delay(y);break;
	case 5:P1=run[0];delay(y);P1=run[2];delay(y);break;
	case 6:P1=run[4];delay(y);P1=run[6];delay(y);break;
	case 7:P1=run[4];delay(y);P1=run[2];delay(y);break;
	case 8:P1=run[0];delay(y);P1=run[6];delay(y);break;
	case 9:P1=run[4];delay(y);P1=run[2];delay(y);break;
	case 10:P1=run[0];delay(y);P1=run[6];delay(y);break;
	case 11:P1=run[4];delay(y);P1=run[2];delay(y);break;
	case 12:P1=run[0];delay(y);P1=run[6];delay(y);break;
	//case 13:P1=run[0];delay(y);P1=run[1];delay(y);break;
	case 13:a=0;break;

	default:break;	
	}

} 
}
 }
