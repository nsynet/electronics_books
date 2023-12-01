/*********************************************
��ע������ο���������ӹ���ʦ֮�� www.eehome.cn 
һ�߹��� �ıȽϾ�������ƺ������ң������EE01ѧϰ����ʾ����
ϵͳ����ͼ��
           1--a--20	  ->VCC
	key1   2--t--19	  ->>IR sendout
	key2   3--8--18
		   4--9--17
		   5--c--16
	key3   6--2--15
	key4   7--0--14
		   8--5--13
		   9--1--12
		   10-*--11

//���Ͷ��з����źţ����ն˽����Ϊ�͵�ƽ
*********************************************/


#include <reg52.h>
#define uint unsigned int
#define uchar unsigned char
#define data1 59 //��������1����
#define data0 18  //��������0����
bit irout;//�����״̬��־λ
sbit ir=P3^5;//���ⷢ��ܿ��ƽ�
sbit P1_4=P1^4;
uint count, set_count;//�жϼ������趨�жϴ���
bit flag,keyflag;//���ⷢ�ͱ�־,������־λ
uchar irsys[4]={0x1a,0xa1,0xdc,0x03};//26λϵͳ�룬���һ���ֽ�ֻ��2λ
uchar ircode,irdata ,temp;

/**************����ʱ�ӳ���12M*****************/
void delay(uint z)//��ʱ1ms���������Ϊ1.002����
  {
    uint x,y;
    for(x=z;x>0;x--)
        for(y=123;y>0;y--);
}

/******************����22.1184M*****************
  ԭ��ʱ1ms
***********************************************

void delay(uint z)//��ʱ1ms��ԭ��ʱ�ӳ���11.0592ʱ�������ΪΪ������
  {
    uint x,y;
    for(x=z;x>0;x--)
        for(y=225;y>0;y--);
}

/**********************************************
  ����ɨ��
**********************************************/
  
 
void keyscan(void)
{  
 P1=0xff; 
      P1_4=0; 
      temp=P1; 
      temp=temp & 0x0f; 
      if (temp!=0x0f) 
        {  delay(10);
          temp=P1; 
          temp=temp & 0x0f; 
          if (temp!=0x0f) 
            { temp=P1; 
              temp=temp & 0x0f; 
			    keyflag=1;//�а�����־
               switch(temp) 
                {    case 0x0e:irdata=1;break;//����1��Ӧ��ң����P+�ļ�ֵ
                     case 0x0d:irdata=7;break;//����2��Ӧ��ң����P-�ļ�ֵ
                        case 0x0b:irdata=10;break;//����3��Ӧ��ң����VOL+�ļ�ֵ
                       case 0x07:irdata=18;break;//����4��Ӧ��ң����VOL-�ļ�ֵ
                }
			  }
 			 }
			}

    
    
    

 
/*****************����8λ��������******************
  0-	 -----	  1-	 ------------
    -----	  --	-----			 --
    0.56 0.56		 0.56   1.69	  (us)
****************************************************/
void sendcode_8(void)
{ 

  uchar i;
  for(i=0;i<8;i++)	//���ɵ͵���λ���η���
  {
  set_count=16;//����0.56ms  38k���Ⲩ
  flag=1;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;	 
  if(ircode&0x01)  //�����жϺ���������λ
  {
    set_count=data1;  //1Ϊ��ĸߵ�ƽ
    }
  else
    {
      set_count=data0;	//0Ϊխ�ĸߵ�ƽ
    }
  flag=0;
  count=0;
  TR0=1;	 //������ʱ�� ����ʼ����
  while(count<set_count);
  TR0=0;
  ircode=ircode>>1;
  }
}


/*******************************************
  ����2λ��������
*******************************************/
void sendcode_2(void)//ǰ26λϵͳ�������λ
{ 

  uchar i;
  for(i=0;i<2;i++)
  {
  
  set_count=16;
  flag=1;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;
  if(ircode&0x01)
  {
    set_count=data1;
    }
  else
    {
      set_count=data0;
    }
  flag=0;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;
  ircode=ircode>>1;
  }
}

/*******************************************
  ���ͺ�������
*******************************************/
void sendcode(void)
{

set_count=326;//����9ms ����=13us*575��38K����� ,��ҪУ׼
flag=1;		  //��������
count=0;	  //��ʼ���жϼ���
TR0=1;		  //������ʱ��
while(count<set_count);
TR0=0;		  //�رն�ʱ��

set_count=170;//ֹͣ����/���4.5ms ����=13us*320�� 38K�����
flag=0;		  //�رշ���
count=0;
TR0=1;		  
while(count<set_count);
TR0=0;

ircode=irsys[0];//����26λϵͳ���ǰ1-8λ
sendcode_8();  
ircode=irsys[1];//����26λϵͳ���ǰ9-16λ
sendcode_8();
ircode=irsys[2];//����26λϵͳ���ǰ17-24λ
sendcode_8();
ircode=irsys[3];//����26λϵͳ���ǰ24-26λ
sendcode_2();

ircode=irdata;//����8λ������
sendcode_8(); 
ircode=~irdata; //����8λ���ݷ���
sendcode_8();

  set_count=16;//����0.56ms  38k���Ⲩ
  flag=1;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;

ir=1;	   //����23ms 38K�����
delay(23); //��ʱ23ms

set_count=326;//����9ms 38k���Ⲩ
flag=1;
count=0;
TR0=1;
while(count<set_count);
TR0=0;

set_count=170;//ֹͣ����/���4.5ms
flag=0;
count=0;
TR0=1;
while(count<set_count);
TR0=0;

set_count=16;//����0.56ms  38k���Ⲩ
flag=1;
count=0;
TR0=1;
while(count<set_count);
TR0=0;
ir=1;

}

/*******************************************
  ��ʱ����ʼ��
*******************************************/
void init_timer()
{
  EA=1;		 //�����ж�
  TMOD=0X02;//8λ�Զ�����ģʽ
  ET0=1;
  TH0=0XF3;//��ʱ13us,38K���Ⲩ������12 0XF3
  TL0=0XF3;
}


/*******************************************
  ԭ��ʱ����ʼ��
*******************************************
void init_timer()
{
  EA=1;
  TMOD=0X02;//8λ�Զ�����ģʽ
  ET0=1;
  TH0=0XE8;//��ʱ13us(13.0208),38K���Ⲩ������22.1184,
  TL0=0XE8;
}

/*******************************************
  ������
*******************************************/
void main(void)
{
  init_timer();	//��ʼ����ʱ��
  count=0;	 //��ʼ���жϼ�����
  flag=0;	 //���ͱ�־Ϊ0
  irout=1;	 //�رշ���
  delay(23); //��ʱ����
  delay(1);  //����ʱ�ӳ���
  while(1)
  {
    keyscan();	//����ɨ��
    if(keyflag)//�����°���
    {
    delay(10);	//��ʱ10msȥ��
    sendcode();//���ͺ������
    delay(500);
    keyflag=0;//������־����
    }
  
}
}
  

/*******************************************
  ��ʱ���ж�
*******************************************/

void timer0(void) interrupt 1
{
count++;
if(flag==1)
{
  irout=~irout;	 ////�͵�ƽ����
}
else
  {
    irout=1;   //�ߵ�ƽ������
  }
ir=irout;
}