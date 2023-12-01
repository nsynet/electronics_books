
//DS18B20�Ķ�д����,���ݽ�P2.7                     //
//�¶ȴ�����18B20������,��������Ĭ�ϵ�12λת��   //
//���ת��ʱ��750΢��,��ʾ�¶�-55��+125��,��ʾ���� //
//Ϊ0.1�ȣ���ʾ����4λLED������ʾ����ֵ            //
//P0��Ϊ��������,P34~P37Ϊλѡ                       //
/***************************************************/

#include "reg51.h"
#include "intrins.h"                            //_nop_();��ʱ������
#define  Disdata P0                             //���������
#define  discan  P3                             //ɨ���
#define  uchar unsigned char
#define  uint  unsigned int
sbit     DQ=P2^7;                               //�¶������
sbit     DIN=P0^7;                              //LEDС�������
uint     h; 
uint     temp;
//
//
//**************�¶�С�������ò��***********//
uchar code ditab[16]=
{0x00,0x01,0x01,0x02,0x03,0x03,0x04,0x04,0x05,0x06,0x06,0x07,0x08,0x08,0x09,0x09};
//
uchar code dis_7[12]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xff,0xbf};
//����LED�����        "0"  "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9" "����" "-"              
uchar code scan_con[4]={0x7f,0xbf,0xdf,0xef};    //��ɨ�������
uchar data temp_data[2]={0x00,0x00};             //�����¶��ݷ�
uchar data display[5]={0x00,0x00,0x00,0x00,0x00};     //��ʾ��Ԫ���ݣ���4�����ݺ�һ����������

//
//
//
/*****************11us��ʱ����*************************/
//
void delay(uint t)
{
  for (;t>0;t--);
}
//

/****************��ʾɨ�躯��***************************/
scan()
{
  char k;
     for(k=0;k<4;k++)                     //4λLEDɨ�����
{
  Disdata=dis_7[display[k]];          //������ʾ
  if (k==1){DIN=0;}                   //С������ʾ
  discan=scan_con[k];                 //λѡ
  delay(300);
}
}
//
//
/****************DS18B20��λ����************************/
ow_reset(void)
{
char presence=1;
while(presence)
{
  while(presence)
   {
    DQ=1;_nop_();_nop_();//�Ӹ�������
DQ=0;                                       
delay(50);           //550 us
DQ=1;                                        
delay(6);            //66 us
presence=DQ;         //presence=0 ��λ�ɹ�,������һ��
   } 
   delay(45);            //��ʱ500 us
   presence=~DQ;         
}
DQ=1;                   //���ߵ�ƽ
}
//
//
/****************DS18B20д�����************************/
//��1-WIRE ������д1���ֽ�
void write_byte(uchar val)
{ 
  uchar i;
  for(i=8;i>0;i--)
  {
   DQ=1;_nop_();_nop_();                  //�Ӹ�������
   DQ=0;_nop_();_nop_();_nop_();_nop_();  //5 us
   DQ=val&0x01;                           //���λ�Ƴ�
   delay(6);                              //66 us
   val=val/2;                             //����1λ
   }
   DQ=1;
   delay(1);
}
//
/****************DS18B20��1�ֽں���************************/
//��������ȡ1���ֽ�
uchar read_byte(void)
{
uchar i;
uchar value=0;
for(i=8;i>0;i--)
{
  DQ=1;_nop_();_nop_();
  value>>=1;
  DQ=0;_nop_();_nop_();_nop_();_nop_();         //4 us
  DQ=1;_nop_();_nop_();_nop_();_nop_();         //4 us
  if(DQ)value|=0x80;
  delay(6);                                     //66 us
}
DQ=1;
return(value);
}
//
/****************�����¶Ⱥ���************************/
//
read_temp()
{
  ow_reset();                  //���߸�λ
  delay(200);
  write_byte(0xcc);            //������
  write_byte(0x44);            //��ת������
  ow_reset(); 
  delay(1);
  write_byte(0xcc);            //������
  write_byte(0xbe);
  temp_data[0]=read_byte();    //���¶�ֵ�ĵ��ֽ�
  temp_data[1]=read_byte();    //���¶�ֵ�ĸ��ֽ�
  temp=temp_data[1];
  temp<<=8;                                               
  temp=temp|temp_data[0];      // ���ֽںϳ�һ�����ͱ�����
  return temp;                 //�����¶�ֵ
}
//
/****************�¶����ݴ�����************************/

//�����Ƹ��ֽڵĵͰ��ֽں͵��ֽڵĸ߰��ֽ����һ�ֽ�,���
//�ֽڵĶ�����ת��Ϊʮ���ƺ�,�����¶�ֵ�İ١�ʮ����λֵ,��ʣ
//�µĵ��ֽڵĵͰ��ֽ�ת����ʮ���ƺ�,�����¶�ֵ��С������

/********************************************************/
work_temp(uint tem)
{
uchar n=0;
if(tem>6348)                        // �¶�ֵ�����ж�
     {tem=65536-tem;n=1;}            // ���¶�����,��־λ��1
      display[4]=tem&0x0f;           // ȡС�����ֵ�ֵ
  display[0]=ditab[display[4]];  // ����С��������ʾֵ
      display[4]=tem>>4;             // ȡ�м��λ,���������ֵ�ֵ
  display[3]=display[4]/100;     // ȡ��λ�����ݴ�
  display[1]=display[4]%100;     // ȡ����λ�����ݴ�
  display[2]=display[1]/10;      // ȡʮλ�����ݴ�
  display[1]=display[1]%10;  
/******************����λ��ʾ�ж�**************************/
  if(!display[3]) 
  {
    display[3]=0x0a;           //���λΪ0ʱ����ʾ
    if(!display[2])
{
   display[2]=0x0a;        //�θ�λΪ0ʱ����ʾ
}
  }
  if(n){display[3]=0x0b;}      //���¶�ʱ���λ��ʾ"-"
}
//
//
/****************������************************/
main()
{
  Disdata=0xff;                 //��ʼ���˿�
  discan=0xff;
  for(h=0;h<4;h++)              //������ʾ"0000"
      {display[h]=0;} 
  ow_reset();                   //������ת��һ��
  write_byte(0xcc);             //Skip ROM
  write_byte(0x44);             //��ת������
  for(h=0;h<100;h++)            //������ʾ"0000"
      {scan();}
  while(1)
  {
work_temp(read_temp());     //�����¶�����
scan();                     //��ʾ�¶�ֵ
  }
}
//
//***********************����**************************//
