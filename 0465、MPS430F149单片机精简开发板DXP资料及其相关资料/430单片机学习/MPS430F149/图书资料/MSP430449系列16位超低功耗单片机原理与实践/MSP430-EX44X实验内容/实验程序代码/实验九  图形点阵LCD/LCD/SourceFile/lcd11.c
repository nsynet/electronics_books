/******************************************************
*   �ļ����ƣ�
*            lcd.c
*  �ļ�˵�����Ե���lcd�Ļ���������ʼ�����ƶ���ʾ���ݵ�λ�á�
*           д���ݡ���ָ���������������з�װ
******************************************************/

#include <msp430x44x.h>

/***************************************************
*  write_Command(),����д���LCD��
* CS(Ƭѡ)�ڴ˺���������
****************************************************/
/*void write_Command(char cmd)
{
     P2OUT &= 0xfb;             //��ֹ EN
     P3DIR =  0xff;
     P2OUT &= 0xfc;             //rs=0 ,r/w=0
     P3OUT  = cmd;
     P2OUT |= 0x04;             //ʹ��
     
     P2OUT &= 0xfb;             //��ֹ
     
}*/
void write_Command(char cmd)
{
     P1OUT &= 0xBF;             //��ֹ EN
     P3DIR =  0xff;
     P1OUT &= 0xCF;             //rs=0 ,r/w=0
     P3OUT  = cmd;
   
     P1OUT |= 0x40;             //ʹ��
     
     P1OUT &= 0xBF;             //��ֹ
     
}

/***************************************************
* ������ʾ��λ��,Ƭѡ�ں����ⲿ����
****************************************************/
/*void move_To(char x,char y)
{
     unsigned char tmp;
     tmp=(y&0x7f);
     if(tmp<64)                       //���λ����Chip1
     {       
        P2OUT &= 0xbf;                //cs2=0
        P2OUT |= 0x08;                //cs1=1 
        write_Command(0xb8 + x);      //���� x
        write_Command(0x40 + tmp);    //���� y 
     }else if(tmp>63)                 //�� chip2
     { 
        P2OUT &= 0xF7;                //cs1=0     
        P2OUT |= 0x40;                //cs2=1
        write_Command(0xb8 + x);      //���� x
        write_Command(0x40 + tmp-64); //���� y
     }
     
}*/
void move_To(char x,char y)
{
     unsigned char tmp;
     tmp=(y&0x7f);
     if(tmp<64)                       //���λ����Chip1
     {       
        P2OUT &= 0x7F;                //cs2=0
        P6OUT |= 0x10;                //cs1=1 
        write_Command(0xb8 + x);      //���� x
        write_Command(0x40 + tmp);    //���� y 
     }else if(tmp>63)                 //�� chip2
     { P2OUT |= 0x80;
        P6OUT &= 0xEF;                //cs1=0     
                        //cs2=1
        write_Command(0xb8 + x);      //���� x
        write_Command(0x40 + tmp-64); //���� y
     }
     
}

/***************************************************
* write data
****************************************************/
/*void write_Data(char content)
{
     P3DIR =  0x00;             // ��λ����ģʽ
     P2OUT |= 0x02;             // r/w=1 ��״̬
     P2OUT |= 0x04;             // chip ʹ��
     while((P3IN & 0x80)==0x80);//���LCD�Ƿ�æ
     P2OUT &= 0xfb;//disable EN
     P3DIR =  0xff;
     P2OUT &= 0xfc;             //rs=0 ,r/w=0
     P2OUT |= 0x01;             //rs=1
     P3OUT  = content;
     P2OUT |= 0x04;             //p2.2=1 ʹ��
     P2OUT &= 0xfb;             //p2.2=0 ��ֹ
     
}*/
void write_Data(char content)
{
     P3DIR =  0x00;             // ��λ����ģʽ
     P1OUT |= 0x20;             // r/w=1 ��״̬
     P1OUT |= 0x40;             // chip ʹ��
     while((P3IN & 0x80)==0x80);//���LCD�Ƿ�æ
     P1OUT &= 0xBF;//disable EN
     P3DIR =  0xff;
     P1OUT &= 0xCF;             //rs=0 ,r/w=0
     P1OUT |= 0x10;             //rs=1
     P3OUT  = content;
     P1OUT |= 0x40;             //p2.2=1 ʹ��
     P1OUT &= 0xBF;             //p2.2=0 ��ֹ
     
}

/****************************************************
*   ���chip1����chip2�ϵ�ĳһ����ѡ�������ֻ����
*   ͬһchip��,x��ҳ��ַ,Y���е�ַ,h�Ƕ�����,w��ָ����
*   ��.�������������Ƭ��ɵ�������κ�λ��
*****************************************************/
void clear_Rect(unsigned char x,unsigned char y,unsigned char h,unsigned char w)
{
     unsigned char tmpv,tmp;
     
        for(tmpv=x;tmpv<(x+h);tmpv++)
        {
           for(tmp=y;tmp<(y+w);tmp++)
           {
             move_To(tmpv,tmp);//�ƶ�
             write_Data(0x00); //�ڵ�ǰλ��д0���������ǰλ�õ���ʾ����
            }
        }
}
/*****************************************************
*  ��ʼ��LCD
******************************************************/
/*void init_LCD()
{
     P3DIR  = 0xff;           // ����P3���ģʽ 
     P3OUT  = 0x00;           // ��ʼֵΪ0
     P2DIR |= 0xcf;           // P2.0~P3,P2.6,p2.7 ��Ϊ���ģʽ
     P2OUT |= 0x48 ;          // cs1,cs2 Ϊ1,reset=0
     _NOP();
     _NOP();
     _NOP();
     P2OUT |= 0x04;           // en=1
     P2OUT |= 0x80;
     write_Command(0xc0);     //
     write_Command(0x3f);     //��ʾ��
     clear_Rect(0,0,8,64);    //�����һ��
     clear_Rect(0,64,8,64);   //����ڶ���
   
}*/
void init_LCD()
{
     P3DIR  = 0xff;           // ����P3���ģʽ 
     P3OUT  = 0x00;           // ��ʼֵΪ0
     P1DIR |= 0X70;
     P2DIR |= 0xc0;
     P6DIR |= 0X50;           // P1.4~P1.6,P2.6,p2.7,P6.4 ��Ϊ���ģʽ
     P2OUT |= 0xC0; 
     P6DIR |= 0X10;           // cs1,cs2 Ϊ1,reset=0
     _NOP();
     _NOP();
     _NOP();
     P1OUT |= 0x40;           // en=1
     P2OUT |= 0x40;           //RET=1
     write_Command(0xc0);     //
     write_Command(0x3f);     //��ʾ��
     clear_Rect(0,0,8,64);    //�����һ��
     clear_Rect(0,64,8,64);   //����ڶ���
   
}
/***************************************************/
