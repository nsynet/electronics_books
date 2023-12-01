#include <REG51.H>
#include <intrins.h>
#define uint unsigned int
#define uchar unsigned char
//��ʱ�ӳ���ģ��
//**********************************************
void mdelay(uint delay)
{	uint i;
 	for(;delay>0;delay--)
   		{for(i=0;i<80;i++) //1ms��ʱ.
       		{;}
   		}
}

//************************************************

void show();   //Һ����ʾ����
//****************************************
//12864Һ����ʾ�����ӳ���ģ��
//****************************************
sbit rs		= P3^0;
sbit rw		= P3^1;
sbit e  	= P3^2;
#define lcddata P0
sbit busy=P0^7;   //lcd busy bit
void wr_d_lcd(uchar content);
void wr_i_lcd(uchar content);
void clrram_lcd (void);
void init_lcd(void);
void busy_lcd(void);
void rev_row_lcd(uchar row);
void rev_co_lcd(uchar row,uchar col,uchar mode);
void clr_lcd(void);
void wr_co_lcd(uchar row,uchar col,uchar lcddata1,uchar lcddtta2);
void wr_row_lcd(uchar row,char *p);
//**********************************
//Һ����ʼ��
//**********************************
void init_lcd(void)
{
	wr_i_lcd(0x06);  /*�����ƶ�����*/
	wr_i_lcd(0x0c);  /*����ʾ�����α�*/
}
//***********************************
//���Һ��DDRAMȫΪ�ո�
//**********************************
void clrram_lcd (void)
{
	wr_i_lcd(0x30);
	wr_i_lcd(0x01);
}
//***********************************
//��Һ��д����
//contentΪҪд�������
//***********************************
void wr_d_lcd(uchar content)
{
	busy_lcd();
	rs=1;
    rw=0;
	lcddata=content;
	e=1;
	;
	e=0;
}
//********************************
//��Һ��дָ��
//contentΪҪд���ָ�����
//*****************************
void wr_i_lcd(uchar content)
{
	busy_lcd();
	rs=0;
    rw=0;
	lcddata=content;
	e=1;
	;
	e=0;
}
//********************************
//Һ�����æ״̬
//��д��֮ǰ����ִ��
//********************************
void busy_lcd(void)
{
  lcddata=0xff;
  rs=0;
  rw=1;
  e =1;
  while(busy==1);
  e =0;
}
//********************************
//ָ��Ҫ��ʾ�ַ�������
//*******************************
void gotoxy(unsigned char y, unsigned char x)
{
	if(y==1)
		wr_i_lcd(0x80|x);
	if(y==2)
        wr_i_lcd(0x90|x);
	if(y==3)
		wr_i_lcd((0x80|x)+8);
	if(y==4)
        wr_i_lcd((0x90|x)+8);
}
//**********************************
//Һ����ʾ�ַ�������
//**********************************
void print(uchar *str)
{
	while(*str!='\0')
	{
		wr_d_lcd(*str);
		str++;
	}
}

//***************************************
//Һ����ʾ������ģ��
//***************************************
void show()   
{
  
  gotoxy(1,0);
  print("��ӭ������־����");
    mdelay(200);             
  gotoxy(2,0);
  print("����־���ӡ�");
  mdelay(200);                 //ɨ����ʱ

gotoxy(3,0);
  print("WWW.RICHMCU.COM");
  mdelay(200);                 //ɨ����ʱ
gotoxy(4,0);
  print("12864 Һ������");
  mdelay(200);                 //ɨ����ʱ
}


//************************************
//������
//*************************************
main()
{
  
	init_lcd();
	clrram_lcd();
	
	while(1)
	{   
        
            show();                //Һ����ʾ����
          			
 		}		
	
}




