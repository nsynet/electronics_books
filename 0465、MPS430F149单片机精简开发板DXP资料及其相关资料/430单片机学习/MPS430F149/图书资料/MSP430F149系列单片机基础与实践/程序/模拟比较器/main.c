#include <msp430x14x.h>
#define   uint  unsigned int
#define   uchar unsigned char
#define   beef   BIT6
uchar flag=0;
void int_clk()
{
    uchar i;
    BCSCTL1&=~XT2OFF;  //��XT����
    BCSCTL2|=SELM1+SELS;//MCLK 8M and SMCLK 1M  
    do
	{
        IFG1 &= ~OFIFG;                 //����񵴴����־ 
        for(i = 0; i < 100; i++)
	  _NOP();			//��ʱ�ȴ�
        }
    while ((IFG1 & OFIFG) != 0);	//�����־Ϊ1����ѭ���ȴ�
    IFG1&=~OFIFG;
}
void int_COMPARATORA()
{
  P2SEL|=0X14;//P22��P24�ֱ���Ϊ�Ƚ��������������
  P2DIR|=0X04;//����P22��Ϊ���
  CACTL1&=~CAEX;//���ȡ��
  CACTL1|=CARSEL+CAREF0+CAON+CAIE+CAIES;//ѡ��ο���ѹ�Ӹ��ˡ�CA1�����ˣ������ж��½��ش����жϣ��ο���ѹΪ0��25��VCC
  CACTL2|=CAF+P2CA1;//ʹ������˲�����CA1��Ϊ�Ƚ����빦��
}


#pragma vector=COMPARATORA_VECTOR
__interrupt void COMPARATORA(void)	//�жϷ������
{
  flag=1;			//���жϱ�־Ϊ1
}
void delay()		        //�����ʱ
{
  uint i,j;
  for(i=0;i<=100;i++)
    {
      for(j=0;j<100;j++)
            ;
    }     
}
void main()
{   
  WDTCTL=WDTPW+WDTHOLD;//�ؿ��Ź�
  int_clk();  //��ʼ��ʱ��  
  delay();    //���������ʱ�ӳ���
  int_COMPARATORA();//��ʼ���Ƚ���
  _EINT(); 
  while(1)
  {
    while(flag)
        {
        P4DIR|=beef;
        P4OUT&=~beef;		//P4.6����͵�ƽ
        delay();                //���������ʱ�ӳ���
        P4OUT|=beef;        	//P4.6����ߵ�ƽ
        flag=0;			//��־����
        }
   }
 } 
