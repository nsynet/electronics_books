/********************************************************************
                            ��ϿƼ�
��ַ��http://www.ourhc.cn
��Ʒ�����Ա��꣺http://shop36330473.taobao.com   
*********************************************************************/
#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
//////////////////////////////��ʼ��////////////////////////////////////
void Init_IO(void)//��ʼ��I/O
{
//����B��Ϊ����
DDRB=0xFF;
PORTB=0xFF;
//����C��Ϊ���
DDRC=0xFF;
PORTC=0xFF;
//����D��Ϊ���
DDRD=0X00;
PORTD=0xff;
}
/////////////////////////////������/////////////////////////////////////
void main(void)
{
Init_IO();  //��ʼ��I/O
while(1)
{
while((PIND&0X04)==0)//�����Ӽ�����־
{PORTB=0x55;}
while((PIND&0X08)==0)//������������־
{PORTB=0xaa;}
while((PIND&0X10)==0)//�����Ӽ�����־
{PORTB=0x0f;}
while((PIND&0X20)==0)//������������־
{PORTB=0xf0;}
}
}
