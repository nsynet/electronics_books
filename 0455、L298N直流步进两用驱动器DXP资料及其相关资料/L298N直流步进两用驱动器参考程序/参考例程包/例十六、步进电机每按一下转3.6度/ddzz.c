
////////////////////////��ϿƼ�////////////////////
//////////////////http://www.ourhc.cn///////////////
///////////////////���������ת���Գ���/////////////

#include<reg52.h>  
/*****************************************************************/
/*�����ĺ���λ1111��ӦλΪABCD,0000Ϊabcd��ô��������Ϳ���ϸ�ֽ����������

Abcd��aBcd��abCd��abcD ��Ӧ������Ϊ 0x08,0x04,0x02,0x01

ABcd��aBCd��abCD��AbcD ��Ӧ������Ϊ 0x0C,0x06,0x03,0x09

ABcd��aBcd��aBCd��abCd��abCD��abcD��AbcD��AbcD ��Ӧ������Ϊ 0x0C,0x04,0x06,0x02,0x03,0x01,0x09��0x08

ֻҪ����ABCD��˳��ͨ�磬���Բ�Ʒ������ϡ�

/*****************************************************************/ 
code unsigned char run[8]={ 0x03,0x0b,0x09,0x0d,0x0c,0x0e,0x06,0x07}; 
unsigned char a,s,i,j,k;
sbit ANJIAN=P2^0;
sbit chuanganqi=P3^0;
void delay(i)//��ʱ����
{
for(j=0;j<i;j++)
for(k=0;k<250;k++);
}
main()
{
unsigned char z,y;
y=10;	    //������ʱʱ�䣬ʱ��Խ�����ת��Խ����֮���
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
