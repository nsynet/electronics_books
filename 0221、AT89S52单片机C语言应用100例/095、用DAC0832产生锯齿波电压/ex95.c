//ʵ��95����DAC0832������ݲ���ѹ
#include<reg51.h>       //������Ƭ���Ĵ�����ͷ�ļ�
#include<absacc.h>     //������Ƭ��洢����ַ���в�����ͷ�ļ�
sbit CS=P2^7;          //��CSλ����ΪP2.7����
sbit WR12=P3^6;        //��WR12λ����ΪP3.6����
void main(void)
{
	unsigned char i;
   CS=0;    //����͵�ƽ��ѡ��DAC0832
   WR12=0;  //����͵�ƽ��ѡ��DAC0832
   while(1)
     {
       for(i=0;i<255;i++)
        XBYTE[0x7fff]=i; 	 //������i����Ƭ���ַ07FFFH ��ʵ���Ͼ���ͨ��P0�ڽ���������DAC0832 
	  }
}
