#include <AT89X51.h>
#define uchar unsigned  char
#define uint unsigned int
uchar  idata trdata[]={'8','9','S','5','1',0x0d,0x0a,0x00};
uchar  idata trdata1[]={'R','I','C','H','M','C','U',0x0d,0x0a,0x00};
main()
{
uchar i;
  uint j;
SCON= 0x40;                //���ڷ�ʽ1
PCON=0;                     //SMOD=0
REN=1;                     //�������
TMOD= 0x20;                //��ʱ��1��ʱ��ʽ2
TH1= 0xe6;                //12MHz 1200������
TL1= 0xe6;
TR1= 1;                  //������ʱ��
  while(1)
{
    i=0;
    while(trdata[i]!=0x00)
{
SBUF=trdata[i];
      while(TI==0);
      TI=0;
      i++;
    }
    for (j=0;j<50000;j++); 

	i=0;
	while(trdata1[i]!=0x00)
{
SBUF=trdata1[i];
      while(TI==0);
      TI=0;
      i++;
    }
	 for (j=0;j<50000;j++); 
  }
}
