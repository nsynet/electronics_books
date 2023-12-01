#include <iom16v.h>
#define uchar unsigned char
#define uint  unsigned int

//��������ͱ���Ӧ0��1��2��3��4��5��6��7��8��9//
uchar Table[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
uchar Data[4]={0,0,0,0};       //��ʾ��ʼֵ��0 0 0 0
uchar CNT=0;                   //��ʼ����ֵ��0
uchar Timer[2]={0x00,0x00};    //��ʼʱ��00��00 

void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}

void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {PORTC=sel;                  //ѡͨ���ұߵ������
   PORTA=Table[p[i]];          //��������
   DelayMs(2);                 //��ʾ��ʱ    
   sel=sel<<1;                 //��λ����ʾǰһλ
  }
}

//����ֵ������������p1:ʱ��������������p2:��ʾ������//
//���ܣ��˺������ڽ�����ֵ���ΪBCD���10�֣��֣�10�룬��//
void Process(uchar *p1,uchar *p2) 
{p2[0]=p1[0]/10;
 p2[1]=p1[0]-p2[0]*10;
 p2[2]=p1[1]/10;
 p2[3]=p1[1]-p2[2]*10;
}

void Init_IO(void)             //��ʼ��I/O��
{DDRA=0xff;                    //����A��Ϊ����1���
 PORTA=0xff;
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
 TCCR0=0x04;                   //T/C0�����ڶ�ʱ��ʽ��ϵͳʱ��256��Ƶ
 TCNT0=0x06;   
 SREG=0X80;
 TIMSK=0X01;                //������ʼֵ6    
 while(1)
 {Process(Timer,Data);          //����ֵ����
  Display(Data);               //��̬ɨ����ʾ
 }
}

//********************T/C0�жϷ�����********************//
#pragma interrupt_handler Timer0:10 
void Timer0(void)
{CNT++;                        //�жϴ����ۼ�
 if(CNT==125)           
    {CNT=0;                    //������125�Σ�����ֵ��λ
	 Timer[1]++;               //���1
	 if(Timer[1]==60)
	    {Timer[1]=0;
		 Timer[0]++;}          //�ֽ�λ
     if(Timer[0]==60)
	     Timer[0]=0;}          //�����������λ��������λ
}
