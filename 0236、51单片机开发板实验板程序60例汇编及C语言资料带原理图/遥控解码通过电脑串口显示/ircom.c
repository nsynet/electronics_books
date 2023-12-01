

/*    ����11.0569MHz              */
#include <REGX52.h>
#define uchar unsigned char
uchar data    IRcode[4];   //����һ��4�ֽڵ����������洢����
uchar     CodeTemp;   //�����ֽڻ������
uchar     i,j,k;    //��ʱ�õ�ѭ������
sbit     IRsignal=P3^2;   //HS0038����ͷOUT��ֱ����P3.2(INT0)
/**************************��ʱ0.9ms�ӳ���**********************/
void Delay0_9ms(void)
{uchar j,k;
     for(j=18;j>0;j--)
       for(k=20;k>0;k--) ;
}
/***************************��ʱ1ms�ӳ���**********************/
void Delay1ms(void)
{uchar i,j;
   for(i=2;i>0;i--)
      for(j=230;j>0;j--) ;
}
/***************************��ʱ4.5ms�ӳ���**********************/
void Delay4_5ms(void)
{uchar i,j;
     for(i=10;i>0;i--)
      for(j=225;j>0;j--) ;
}
/**************************** ��ʱ�ӳ��� ************************/
void Delay(void)
{uchar i,j,k;
for(i=200;i>0;i--)  
   for(j=200;j>0;j--)
      for(k=3;k>0;k--) ;
}
/************************�ж�0��������ӳ���**********************/
void int0(void) interrupt 0 using 2       
{
EA=0;
for(k=0;k<10;k++)
   {Delay0_9ms();
    if (IRsignal==1)         //���0.9ms��IRsignal=1��˵������������
   {k=10;break;}
    else if(k==9)           //���������10��0.9ms=9ms�ĵ͵�ƽ��˵����������
      {while(IRsignal==0);
         Delay4_5ms();        //��������4.5ms�ĸߵ�ƽ

      for(i=0;i<4;i++)       //�ֱ��ȡ4���ֽ�
         {for(j=1;j<=8;j++)      //ÿ���ֽ�8��bit���ж�
                { while(IRsignal==0);       //�ȴ�������
                  Delay0_9ms();      //����������һʱ�̿�ʼ��ʱ0.9ms�����ж�IRsignal
                  if(IRsignal==1)     //���IRsignal��"1",����������һλ"1"
                    {Delay1ms();
                   CodeTemp=CodeTemp|0x80;
                   if(j<8) CodeTemp=CodeTemp>>1;
                  }
                  else
      if(j<8)CodeTemp=CodeTemp>>1;//���IRsignal��"0",��������һλ���Զ���"0"
                 }
              IRcode[i]=CodeTemp;
              CodeTemp=0;
         }
    for(i=0;i<4;i++)        //ͨ�����ڽ����뷢��
             { 
     SBUF=IRcode[i];
     while(!TI);       //�ȴ�һ���ֽڷ������
     TI=0;
             }
   Delay();
       }
   }
EA=1;
}
/***********************���ڳ�ʼ������*********************/
void initUart(void)
{  
TMOD|=0x20;
SCON=0x50;
PCON|=0x80;
TH1=0xff;     //57600bps @ 11.0592MHz
TL1=0xff;
TR1=1;
}
/**************************������*************************/
void main()
{ initUart();
IT0=1;    //INT0Ϊ�����ش���, (1�������ش�����0���͵�ƽ����)
EX0=1;    //�ⲿ�ж�INT0��, (1������      0����    )
EA=1;    //�������ж�
CodeTemp=0;    //��ʼ����������ֽڻ������
Delay();
while(1);
}
 
