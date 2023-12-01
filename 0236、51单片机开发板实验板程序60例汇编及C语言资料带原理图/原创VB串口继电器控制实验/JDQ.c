
//��K1 �̵�������
//��K2 �̵����Ͽ�
/*********************************************************/

#include <reg52.h>
sbit  K1 =P1^0 ;                    //K1
sbit  K2 =P1^1 ;                    //K2
sbit JDQ=P2^0;					   //�̵���
unsigned char inbuf2[5];//���ջ�����
unsigned char count3;
void init_serialcomm( void )
{
SCON = 0x50 ; //SCON: serail mode 1, 8-bit UART, enable ucvr
TMOD |= 0x20 ; //TMOD: timer 1, mode 2, 8-bit reload
PCON |= 0x80 ; //SMOD=1;
TH1 = 0xFA ; //Baud:4800 fosc=11.0592MHz
IE |= 0x90 ; //Enable Serial Interrupt
TR1=1;
}
//���ڽ����жϺ���
void serial () interrupt 4 using 3
{
if (RI) //RI==��ʼ����
{
unsigned char ch;
RI = 0 ; //���RI=0
ch=SBUF;
if (ch>1)
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


/*********************************************************/
void Delay(unsigned int ii)	//1MS
{
unsigned int jj;
for(;ii>0;ii--)
for(jj=0;jj<125;jj++)
{;}
}
void main()
{  init_serialcomm();
   EA = 1;					//����CPU�ж�
   while(1){
  
   	 if (inbuf2[0]==0x31){ 
	 JDQ=0;//����
 P0=0x00;//P0��LED��

	 }

	 if (inbuf2[0]==0x32){
	 JDQ=1;//�ͷ�
 P0=0xff;//P0��LED��
	 }

   if (K1==0) 
{
Delay(10);
if(K1==0){
 inbuf2[0]=0x00; 
 JDQ=0;//����
 P0=0x00;//P0��LED��
 }
}

if (K2==0){
Delay(10);
if(K2==0){
 inbuf2[0]=0x00; 
	 JDQ=1;	//�ͷ�
	 P0=0xff; //P0��LED����
} 
} 
   }
}
