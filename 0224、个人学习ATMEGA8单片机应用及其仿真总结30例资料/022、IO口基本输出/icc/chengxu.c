#include <iom8v.h>
#define uchar unsigned char 
#define uint unsigned int
//////////////////////////////��ʼ��////////////////////////////////////
void Init_IO(void)//��ʼ��I/O
{
//����B��Ϊ���
DDRB=0xFF;
PORTB=0xFF;
//����C��Ϊ���
DDRC=0xFF;
PORTC=0xFF;
//����D��Ϊ����
DDRD=0X00;
PORTD=0xFF;
}
/////////////////////////////������/////////////////////////////////////
void main(void)
{
Init_IO();  //��ʼ��I/O
while(1)
{

if((PIND&0X01)==0)//�����Ӽ�����־
{PORTB=0xfe;}
if((PIND&0X02)==0)//�����Ӽ�����־
{PORTB=0xfd;}
if((PIND&0X04)==0)//�����Ӽ�����־
{PORTB=0xfb;}
if((PIND&0X08)==0)//�����Ӽ�����־
{PORTB=0xf7;}
if((PIND&0X10)==0)//�����Ӽ�����־
{PORTC=0xfe;}
if((PIND&0X20)==0)//�����Ӽ�����־
{PORTC=0xfd;}
if((PIND&0X40)==0)//�����Ӽ�����־
{PORTC=0xfb;}
if((PIND&0X80)==0)//�����Ӽ�����־
{PORTC=0xf7;}
}
}
