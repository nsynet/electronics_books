#include <iom16v.h>
#define uchar unsigned char
#define uint  unsigned int

//��������ͱ���Ӧ0��1��2��3��4��5��6��7��8��9,E//
uchar Table[12]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x79};
uchar Data1[4]={10,0,5,0};      //�����ʼ����ռ�ձȣ�50��
uchar Data2[4]={3,9,1,0};            //�趨PWMƵ�ʣ�8M/2046=3910Hz 
uchar Key1_Flag,Key2_Flag;
            
void DelayMs(uint i)           //Ms����ʱ������iΪ��ʱʱ��
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}

void Display(uchar *p)         //��̬��ʾ����������pΪ����ʾ��������
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {
   PORTC=~sel;                  //ѡͨ���ұߵ������
   PORTA=~(0xff-Table[p[i]]);     //��������
   //PORTA=Table[2];     //��������
   DelayMs(1);                 //��ʾ��ʱ    
   sel=sel<<1;                 //��λ����ʾǰһλ
  }
}

void Add_Process(uchar *p)
{if(p[1]!=1)
  {p[2]=p[2]+1;
   if(p[2]==10) {p[2]=0;p[1]++;}
  }
}

void Sub_Process(uchar *p)
{uchar temp;
 temp=p[1]*10+p[2];
 if(temp!=0)
  {temp=temp-1;
   p[1]=temp/10;
   p[2]=temp-p[1]*10;
  }
}
 
void Key_Process()
{while((PINB&0x01)==0) {Display(Data1);Key1_Flag=1;}  
 while((PINB&0x02)==0) {Display(Data1);Key2_Flag=1;}
 if(Key1_Flag==1)
     {Add_Process(Data1);           
	  Key1_Flag=0;}
 if(Key2_Flag==1)
     {Sub_Process(Data1);
	  Key2_Flag=0;} 
}
	    
void Set_Process(uchar *p)
{uint i;
 i=p[1]*10+p[2];
 i=1023*i/10;
 OCR1AH=i>>8;
 OCR1AL=i&0x00ff;
}

void Init_IO(void)             //��ʼ��I/O��
{DDRA=0xff;                    //����A��Ϊ����1���
 PORTA=0xff;
 DDRC=0xff;                    //����C��Ϊ����1���             
 PORTC=0xff;
 DDRB=0x00;                    //����B��Ϊ��̬����
 PORTB=0x00;
 DDRD=0xff;                    //����D��Ϊ����1���
 PORTD=0xff;    
}

void main(void)
{uchar i;
 Init_IO();                    //��ʼ��I/O��
 PORTA=0xff;                   //�����Բ������е������
 PORTC=0x00;   
 //DelayMs(300);                 //��ʱ
 PORTC=0xff;                   //Ϩ�����е������
 TCCR1A=0xc3;                  //10λPWM,���ϼ������OC1A�����¼�����λOC1A
 TCCR1B=0x02;                  //ʱ��8��Ƶ,��СƵ��1M/2046=0.5KHz       
 while(1)
 {Key_Process();
  Set_Process(Data1);         //����PWMռ�ձ�
  for(i=50;i!=0;i--)
    Display(Data1);
  for(i=50;i!=0;i--)
    Display(Data2);
 }
}