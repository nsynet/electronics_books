#include <iom16v.h>
#define uchar unsigned char
#define uint  unsigned int

//��������ͱ���Ӧ0��1��2��3��4��5��6��7��8��9//
uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
uchar Data[4]={0,0,0,0};       //��ʾ��ʼֵ��0 0 0 0
uint  CNT=0;                    //��ʼ����ֵ��0 

void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}

void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {PORTC=sel;                  //ѡͨ���ұߵ������
   PORTA=~Table[p[i]];          //��������
   DelayMs(2);                 //��ʾ��ʱ    
   sel=sel<<1;                 //��λ����ʾǰһλ
  }
}

//����ֵ������������i:����ֵ������p:�������ݴ�ŵ�������//
//���ܣ��˺������ڽ�����ֵ���ΪBCD���ǧ���٣�ʮ��һ���ݣ����ڲ����ʾ//
void Process(uchar i,uchar *p) 
{p[0]=i/1000;
 i=i%1000;
 p[1]=i/100;
 i=i%100;
 p[2]=i/10;
 i=i%10;
 p[3]=i;
}

void Init_IO(void)             //��ʼ��I/O��
{DDRA=0xff;                    //����A��Ϊ����1���
 PORTA=0xff;
 DDRB=0x00;                    //����B��Ϊ����������������
 PORTB=0x00;    
 DDRC=0xff;                    //����C��Ϊ����1�����             
 PORTC=0xff;
}

void main(void)
{uchar Load; 
 Init_IO();                    //��ʼ��I/O��
 PORTA=0xff;                   //�����Բ������е������
 PORTC=0x00;                   
 DelayMs(30);                //��ʱ
 PORTC=0xff;                   //Ϩ�����е������
 TCCR0=0x06;                   //T/C0�����ڼ�����ʽ���½��ؼ���
 TCNT0=CNT;                    //������ʼֵ0    
 while(1)
 {Load=TCNT0;
  Process(Load,Data);          //����ֵ����
  Display(Data);               //��̬ɨ����ʾ
 }
}