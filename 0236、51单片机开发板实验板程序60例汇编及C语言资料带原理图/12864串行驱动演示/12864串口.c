/*
12864LCD ��ST7920����������
������     2004/12/27

*/

#include <REGx51.H>
  //���Ŷ���
#define CS    P3_0	//Ƭѡ �ߵ�ƽ��Ч ��ƬLCDʹ��ʱ�ɹ̶��ߵ�ƽ
#define SID   P3_1	//����
#define SCLK  P3_2	//ʱ��
#define PSB   P3_3	//�͵�ƽʱ��ʾ�ô����������ɹ̶��͵�ƽ
#define RESET P3_4	//LCD��λ��LCDģ���Դ���λ��·���ɲ���

void write(bit start, unsigned char ddata);
void sendbyte(unsigned char bbyte);
void delaynms(unsigned int di);
void lcdinit(void);
void lcdtest(void);
void lcdcls(void);

unsigned char code ma[] ={"  ������ʾLCD   "};
unsigned char code ma2[]={"�Դ��ֿ�ͼ�Ļ���"};
unsigned char code ma3[]={"����IC��ST7920  "};
unsigned char code ma4[]={"����ǿ��ʹ�÷���"};

void lcdinit(void)	//��ʼ��LCD 
{
  delaynms(10); //�����ȴ�����LCM���빤��״̬
  PSB=0; ;   	 //��������ģʽ
  RESET=0; delaynms(1); RESET=1; // ��λLCD
  CS=1;
  write(0,0x30);  //8 λ���棬����ָ�
  write(0,0x0c);  //��ʾ�򿪣����أ����׹�
  write(0,0x01);  //��������DDRAM�ĵ�ַ����������  
}

void write(bit start, unsigned char ddata) //дָ�������
{
  unsigned char start_data,Hdata,Ldata;
  if(start==0) start_data=0xf8;	 //дָ��
    else       start_data=0xfa;  //д����
  
  Hdata=ddata&0xf0;		  //ȡ����λ
  Ldata=(ddata<<4)&0xf0;  //ȡ����λ
  sendbyte(start_data);	  //������ʼ�ź�
  delaynms(5); //��ʱ�Ǳ����
  sendbyte(Hdata);	      //���͸���λ
  delaynms(1);  //��ʱ�Ǳ����
  sendbyte(Ldata);		  //���͵���λ
  delaynms(1);  //��ʱ�Ǳ����
}

void sendbyte(unsigned char bbyte) //����һ���ֽ�
{
 unsigned char i;
 for(i=0;i<8;i++)
   {
   SID=bbyte&0x80; //ȡ�����λ
   SCLK=1;
   SCLK=0;
   bbyte<<=1; //����
   }  
}

void delaynms(unsigned int di) //��ʱ
{
 unsigned int da,db;
 for(da=0;da<di;da++)
   for(db=0;db<10;db++);
}

void lcdtest(void)	//ͼ�η�ʽ����Ļȫ��
{ 
unsigned char i,j;
for(i=0;i<32;i++)
  { write(0,0x80+i);write(0,0x80);
    for(j=0;j<16;j++) write(1,0xff);
  }

 for(i=0;i<32;i++)
  { write(0,0x80+i);write(0,0x88);
    for(j=0;j<16;j++) write(1,0xff);
  }
}

void lcdcls(void)  //ͼ�η�ʽ������
{ 
unsigned char i,j;
for(i=0;i<32;i++)
  { write(0,0x80+i);write(0,0x80);
    for(j=0;j<16;j++) write(1,0x00);
  }

 for(i=0;i<32;i++)
  { write(0,0x80+i);write(0,0x88);
    for(j=0;j<16;j++) write(1,0x00);
  }
}

void main(void)
{
 unsigned char i;
 lcdinit();

 while(1)
 {
  write(0,0x80); for(i=0;i<16;i++)  write(1,ma[i]);
  write(0,0x90); for(i=0;i<16;i++)  write(1,ma2[i]);
  write(0,0x88); for(i=0;i<16;i++)  write(1,ma3[i]);
  write(0,0x98); for(i=0;i<16;i++)  write(1,ma4[i]);

  write(0,0x36); //ͼ�η�ʽ
  lcdtest();
  lcdcls();
 }

}
 



