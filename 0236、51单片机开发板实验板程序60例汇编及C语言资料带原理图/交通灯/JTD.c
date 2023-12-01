#include <reg51.h>
#include <intrins.h>

#define uchar unsigned char
#define uint  unsigned int

sbit     RED_ZHU    =  P0^0;//��ӦL1LED ��������·���
sbit     YELLOW_ZHU =  P0^1;//��ӦL2LED ��������·�Ƶ�
sbit     GREEN_ZHU  =  P0^2;//��ӦL3LED ��������·�̵�

sbit     RED_ZHI    =  P0^4;//��ӦL4LED ����֧��·�̵�
sbit     YELLOW_ZHI =  P0^5;//��ӦL5LED ����֧��·�̵�
sbit     GREEN_ZHI  =  P0^6;//��ӦL6LED ����֧��·�̵�

/*********************************************************
   500ms��ʱ����
   ����11.0592MHz
*********************************************************/
void delay(unsigned char j) 
{ 
   unsigned char k;
   unsigned int i;
   for(;j>0;j--)
  {
     for(i=1250;i>0;i--) 
     {
       for(k=180;k>0;k--);
     }
   }
} 

/*********************************************************
   ������
*********************************************************/
main()
{
   uchar t;
   P0=0xff;
   P3=0xff;
   RED_ZHU=0;                    //��һ��״̬
  RED_ZHI=0;
   delay(10);
  while(1)
  {    
     RED_ZHU=1;                   //�ڶ���״̬
   RED_ZHI=0;
    GREEN_ZHU=0;
    delay(60);

     for (t=6;t>0;t--)           //������״̬
    {
        GREEN_ZHU=~GREEN_ZHU;
       delay(1);
      }

    YELLOW_ZHU=0;
    GREEN_ZHU=1;
    delay(10);
    YELLOW_ZHU=1;

     RED_ZHU=0;                  //���ĸ�״̬
   RED_ZHI=1;
    GREEN_ZHI=0;
    delay(50);

     for (t=6;t>0;t--)           //�����״̬
    {
        GREEN_ZHI=~GREEN_ZHI;
        delay(1);
      }

    YELLOW_ZHI=0;
    GREEN_ZHI=1;
    delay(10);

     YELLOW_ZHI=1;
  }

}