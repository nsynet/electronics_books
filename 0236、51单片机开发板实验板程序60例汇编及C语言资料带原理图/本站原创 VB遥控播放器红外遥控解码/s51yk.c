#include <regX52.h>

#define c(x) (x*110592/120000)
  sbit Ir_Pin=P3^2;
	  sbit beep=P2^1;
	  //sbit RELAY=P2^0;
#define INBUF_LEN 4 //���ݳ���
unsigned char inbuf1[INBUF_LEN]={'0','0','0','0'};//���ͻ�����
unsigned char inbuf2[50];//���ջ�����
unsigned char count3;
void init_serialcomm( void )
{
SCON = 0x50 ; //SCON: serail mode 1, 8-bit UART, enable ucvr
T2CON=0x30;
TH2=0x00;
TL2=0x00;
RCAP2H=0xFF;
RCAP2L=0xDC;
TR2=1;
}
//�򴮿ڷ���һ���ַ�
void send_char_com( unsigned char ch)
{
SBUF=ch;
while (TI== 0 );
TI= 0 ;
}
//�򴮿ڷ���һ���ַ�����strlen Ϊ���ַ�������
void send_string_com( unsigned char *str, unsigned int strlen)
{
unsigned int k= 0 ;
do
{
send_char_com(*(str + k));
k++;
} while (k < strlen);
}
//���ڽ����жϺ���
void serial () interrupt 4 using 3
{
if (RI) //RI==��ʼ����
{
unsigned char ch;
RI = 0 ; //���RI=0
ch=SBUF;
if (ch> 1 )
{
count3= 0 ;
inbuf2[count3]=ch;
}
else
{
count3++;
inbuf2[count3]=ch;
}
}
}	 

    
      unsigned char code Led_Tab[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,
      0xf8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E};                        //������������ʾ��0-F.
      unsigned char code Led_Sel[]={0x7f,0xbf,0xdf,0xef};
	  unsigned char dis_8[17]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','-'};

      unsigned char Led_Buf[4]; //��ʾ������
      char Led_Index;                   //λѡ         

      unsigned char Ir_Buf[4]; //���ڱ��������
		 void delay_50ms(unsigned int t)
{
 unsigned int j;   
 for(;t>0;t--) 
  for(j=6245;j>0;j--) 
{;}
}

      //==============================================================
      //�����ɨ��
      timer0() interrupt 1 using 1
      {
      TL0=65536-1000;
      TH0=(65536-1000)/256; //��ʱ��0�趨Լ1000us�ж�һ�Σ����������ɨ��
      P0=0xff;
      P3=Led_Sel[Led_Index];                            //λѡ
      P0=Led_Tab[Led_Buf[Led_Index]];                    //��ѡ

      if(++Led_Index>3) Led_Index=0;                    //�ĸ�ɨ������,����һ�������
      }
      //==============================================================
      unsigned int Ir_Get_Low()
      {
      TL1=0;
      TH1=0;
      TR1=1;
      while(!Ir_Pin && (TH1&0x80)==0);                
      TR1=0;           
      return TH1*256+TL1;
      }
      //=============================================================
      unsigned int Ir_Get_High()
      {
      TL1=0;
      TH1=0;
      TR1=1;
      while(Ir_Pin && (TH1&0x80)==0);
      TR1=0;
      return TH1*256+TL1;
      }
      //==============================================================
      main()
      {
      unsigned int temp;
      char i,j;
      Led_Index=1;
	   init_serialcomm(); //��ʼ������
      TMOD=0x11;
      TL0=65536-1000;
      TH0=(65536-1000)/256; //��ʱ��0�趨Լ1000us�ж�һ�Σ����������ɨ��
      EA=1;
      ET0=1;
      TR0=1;

      Led_Buf[0]=0;
      Led_Buf[1]=0;
      Led_Buf[2]=0;
      Led_Buf[3]=0; //��ʾ�����0
      do{
      restart:
      while(Ir_Pin);
      temp=Ir_Get_Low();
      if(temp<c(8500) || temp>c(9500)) continue;//��������͵�ƽ9000
      temp=Ir_Get_High();
      if(temp<c(4000) || temp>c(5000)) continue;//��������ߵ�ƽ4500
      for(i=0;i<4;i++) //4���ֽ�
      for(j=0;j<8;j++) //ÿ���ֽ�8λ
      {
      temp=Ir_Get_Low();
      if(temp<c(200) || temp>c(800)) goto restart;
      temp=Ir_Get_High();
      if(temp<c(200) || temp>c(2000)) goto restart;
      Ir_Buf[i]>>=1;
      if(temp>c(1120)) Ir_Buf[i]|=0x80;
      }
      Led_Buf[0]=Ir_Buf[2]&0xf;
      Led_Buf[1]=(Ir_Buf[2]/16)&0xf;
      Led_Buf[2]=Ir_Buf[3]&0xf;
      Led_Buf[3]=(Ir_Buf[3]/16)&0xf; //��ʾ���
	  	inbuf1[0]=dis_8[Led_Buf[1]];
  inbuf1[1]=dis_8[Led_Buf[0]];
  inbuf1[2]=0x0d;
  inbuf1[3]=0x0a;
  send_string_com(inbuf1,INBUF_LEN);
	  P1=Ir_Buf[2];
	 beep=0;
	 delay_50ms(2);
	 beep=1;
	 //RELAY=0;
	 //delay_50ms(50);
	 //RELAY=1;
		

//while ( 1 )
//{

      }
	 

	  while(1);
   		
      }
	 