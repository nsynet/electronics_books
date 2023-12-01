#include <reg52.h>
#include <intrins.h>
#include<stdio.h>
unsigned char tmp;
void send_char(unsigned char txd);
main()
{
	TMOD = 0x20;			// ��ʱ��1������8λ�Զ�����ģʽ, ���ڲ���������
	TH1 = 0xFD;				// ������9600
	TL1 = 0xFD;
	SCON = 0x50;			// �趨���пڹ�����ʽ
	PCON &= 0xef;			// �����ʲ�����	
	TR1 = 1;				// ������ʱ��1
	IE = 0x0;				// ��ֹ�κ��ж�
	P2=0x7f;
	while(1)
	{
	
		if(RI)						// �Ƿ������ݵ���
		{
			RI = 0;
			tmp = SBUF;				// �ݴ���յ�������
			P0 = tmp;				// ���ݴ��͵�P0��
			send_char(tmp);			// �ش����յ�������
		}		
	}
}
void send_char(unsigned char txd)
// ����һ���ַ�
{
	SBUF = txd;
	while(!TI);				// �������ݴ���
	TI = 0;					// ������ݴ��ͱ�־
}

