#include<reg51.h>
#include <intrins.h>
#define uchar unsigned char
#define uint unsigned int
#define ulong unsigned long


#define		Nop()		{_nop_(); _nop_(); _nop_(); _nop_(); _nop_();}



volatile ulong IRcode=0x00000000;  //32λ�ļ�����
volatile ulong Irdcode=0x00000000;
volatile uint customcode=0x0000;      //16λ�û���
volatile uint time_us=0x0000;      //�����½���֮���ʱ��

volatile uchar timeH,timeL;  //����TH1 TL��ֵ

uchar Lcustomcode;      //��8�û���
uchar Hcustomcode;     //��8
uchar datacode;    //8λ��������
uchar mycode;
uchar Rdatacode;      //8λ�����ݷ���
uchar uc1ms;
uchar uc10ms;
uchar uc3ms;


uchar  ucDispTime;
uchar  ucDispOrder;
uchar  ucDispCon;
uchar ucSpeakerTime;
unsigned char code LedData[16] = { 0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};
unsigned char code LedCon[2] = {0x8f,0x4f};
unsigned char ucDispData[2];	// �����ʾ����
sbit led1 = P3^7;
sbit led2 = P3^6;
sbit power=P1^0;  //��Դ����
sbit BEEP= P2^1;
bit NewIRcode=0;  //ָʾ����������32λ��󣬾������µ�ң����
bit DataRight=0;   //Ϊ1ʱ��ȡ������ȷ
bit bSampleOk;
bit bSampling;
bit b10msInt;
bit  b1msInt;
bit bKeySound;
bit b1msMain;
bit IR_E;           //��ʾ���µ�ң�ؼ����¾͸���ɨ������
bit b3msint;

void SendDataToDispDevice();
void Ir_process();
void display();
void beeping();

/****** ����Ϊ12 MHZ*******/
/**��ʱ��1,12 MHZ���ʱΪ65.53ms***/
//------------------------------------------------------------------------------
void init()
{ 
  IP=0x09;   //��ʱ��1���ⲿ�ж�0���ȼ���
  TMOD=0x11; //��ʱ��0��������ʽ1 ;  ��ʱ��1��������ʽ1
  TCON=0x01; //���ж�0�½��ش�����������TR1=0��TR0=0��
  TH0=0xff;  //��ʼ����ʱ��0,��ʱ0.2ms 
  TL0=0x47;
  TH1=0x00;  //��ʼ����ʱ��1
  TL1=0x00;

  EA=1;    //��ȫ�ж�
  ET0=1;   //����T0�ж�
  ET1=1;      //����T1�ж�
  EX0=1;   //����INT0
  TR1=0;
  TR0=1;

}
//--------------------------------------
void TimeProg(void)
{       
	b1msMain = b1msInt;
   	b1msMain=0;	
	b10msInt = 0;


	if(b1msInt == 1)
	{  
         b1msMain=1;
	   if(++uc10ms == 10)	
		{
			uc10ms = 0;
			b10msInt = 1;
			if(bKeySound==1)
		  {	beeping();
			bKeySound=0;
			}
		}	
	
	}
}//void TimeProg(void)
//-------------------------------------interrupt0-------------------------------------
void IR_ISR() interrupt 0 using 1 //ң�����жϴ�����
{
  static uchar cn;

  TR1=0;
  timeH=TH1;
  timeL=TL1;
  TH1=0;
  TL1=0;
  TR1=1;                     //����ʱ���ж�1

  time_us=(unsigned int)timeH;
  time_us=time_us<<8;
  time_us=time_us|timeL;
 
  if(time_us>12200&&time_us<13000) {cn=1;IRcode=0;}  //����������,�Ͱ�cn��0��IRcode��0
        //�������ʱ�䳤��Ϊ9ms+4.5ms
  if(cn<34)
      {
          if(time_us>950&&time_us<1120)                   //0
           {
             IRcode=IRcode|0x00000000;
             if(cn<33) IRcode=IRcode>>1;
           }

      else if(time_us>1920&&time_us<2120)        //1t > 1950 && t < 2150
          { 
             IRcode=IRcode|0x80000000;
             if(cn<33) IRcode=IRcode>>1;
           }
  

  //else if(time_us>10000&&time_us<11000) {Irdcode=IRcode;cn=34; }   //�����ظ���
                                               //cn���ڼ�¼���յ�������λ
    }
	cn++;
  if(cn==34) 
   { NewIRcode=1;
     TR1=0;  
	
     Irdcode= IRcode;  cn=0;  
	}  //����32λ�룬�����������

}

//--------------------------------------timer_ISR------------------------------
void Timer0_ISR() interrupt 1 using 2  //��ʱ��0�жϺ���
{
  TR0=0;
  TH0=0xff;  //��ʼ����ʱ��0,��ʱ0.2ms  ����Ϊ11.0592 MHZ
  TL0=0x47;
  TR0=1;
  if(++uc1ms == 5)
	{
		uc1ms = 0;
        b1msInt=1;
		 if(++uc3ms==8)
		  {
		   uc3ms=0;
		   b3msint=1;
		   SendDataToDispDevice();     //n* ms��һ����ʾ
		   }
				
		
	}
}//void Timer0IntProg() interrupt 1 using 1

void Timer1_ISR() interrupt 3 using 3  //��ʱ��1�жϺ���
{ 
  TR1=0;
  TH1=0x00;  //��ʼ����ʱ��1
  TL1=0x00;
  TR1=1;

}
//--------------------SendDataToDispDevice----------
void SendDataToDispDevice()
{
 unsigned char n;
    //watchdog();
	if(++ucDispOrder >= 2)  ucDispOrder = 0; // ��һ��ʾѲ��
	
	// ����Ϊ���Ϳ�������	  λ��
    
         if(ucDispOrder==0) 
	      {led1=0;
           led2=1;
	       Nop();
            Nop();
		  
		   }
	 if(b3msint==1)
       {if(ucDispOrder==1) 
	       {led2=0;
            led1=1;
		    Nop();
            Nop();
		    }
		}
	// ����Ϊ������ʾ����
      n = LedData[ucDispData[ucDispOrder]];
      P0=n;

  
	
} //void SendDataToDispDevice()

//------------------------------------main()----------------------------------------------
void main()
{

    init();
  beeping();
 while(1)
  {
     TimeProg();
     Ir_process();
     display(); 
    
  }

}

void Ir_process()

 {
 
  if(NewIRcode==1)    //������µ�ң����Ͷ�
  {
    NewIRcode=0; //����֮�����㣬��ʾ�����Ѷ�
    customcode=(Irdcode>>16);    //ȡ�������еİ����
                    //ȡ��8λ�û���
      Lcustomcode=customcode>>8;//ȡ��8λ�����
    datacode=(unsigned char)(customcode&0x00ff);  //ȡ��8λ�����
     
   
       Rdatacode=Lcustomcode;   //ȡ��8λ������ķ���

      if(~Rdatacode!=datacode) 
	  {  DataRight=0;
	     Irdcode=0;
	     datacode=Rdatacode=0;
	  } //У���û��룬����

     else 
	 { DataRight=1;
	   IR_E=1;
	   mycode=datacode;}
     if(DataRight==1)  { bKeySound = 1;DataRight=0;  }
     
     }

   
 
}

void display()
  {
  /*  unsigned char a[2];
	a[0] = mycode & 0x0f;
	mycode = mycode >> 4;
	a[1] = mycode & 0x0f;
	ET0 = 0;
	ucDispData[0] = a[0];
	ucDispData[1] = a[1];
	ET0 = 1;*/
	if(IR_E==1)
	{
	ET0 = 0;
	ucDispData[0] = mycode & 0x0f;
	mycode = mycode >> 4;
	ucDispData[1] = mycode & 0x0f;
    IR_E=0;
	ET0 = 1;
	}
}

/**********************************************************/
void delay(unsigned char x)    //x*0.14MS
{
 unsigned char a;
  while(x--)
 {
  for (a = 0; a<13; a++) {;}
 }
}


/**********************************************************/
void beeping()
{
  unsigned char i;
  
  for (i=0;i<100;i++)
   {
     delay(4);
     BEEP=!BEEP;                 //BEEPȡ��
   } 
  BEEP=1;
                    //�رշ�����
}

