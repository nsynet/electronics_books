#include "chinese.h"
#include "chfont.h"
#include "lcd.h"
//Mini STM32�����塪����չʵ��
//�Զ��庺����ʾ ����			 
//����ԭ��@ALIENTEK
//2010/7/6
			    
//��LCD�ϵģ�x��y��������
//color�������ɫ
void LCD_Draw_Point(u16 x,u16 y,u16 color)
	{
	u16 temp;
	temp=POINT_COLOR;
	POINT_COLOR=color;
	LCD_DrawPoint(x,y);
	POINT_COLOR=temp;
	}

//��ָ��λ�� ��ʾ1��16*16�ĺ���
//(x,y):������ʾ��λ��
//index:tfont��������ĵڼ�������
//color:������ֵ���ɫ
void Test_Show_CH_Font16(u16 x,u16 y,u8 index,u16 color)
	{   			    
	u8 temp,t,t1;
	u16 y0=y;				   
	for(t=0;t<32;t++)//ÿ��16*16�ĺ��ֵ��� ��32���ֽ�(8+8)*2
		{   
		//��ά����ÿһά���16�ֽ�
		if(t<16)temp=tfont16[index*2][t];      //ǰ16���ֽ�
		else temp=tfont16[index*2+1][t-16];    //��16���ֽ�	                          
		for(t1=0;t1<8;t1++)	 //ÿ���ֽ�8λ����
			{
			if(temp&0x80)LCD_Draw_Point(x,y,color);//��ʵ�ĵ�
			else LCD_Draw_Point(x,y,BACK_COLOR);   //���հ׵㣨ʹ�ñ���ɫ��
			temp<<=1;
			y++;
			if((y-y0)==16)	 //�ﵽ��������ֵ��ʼ�µ�һ��
				{
				y=y0;
				x++;
				break;
				}
			}  	 
		}          
	}


//��ָ��λ�� ��ʾ1��24*24�ĺ���
//(x,y):������ʾ��λ��
//index:tfont��������ĵڼ�������
//color:������ֵ���ɫ
void Test_Show_CH_Font24(u16 x,u16 y,u8 index,u16 color)
	{   			    
	u8 temp,t,t1;
	u16 y0=y;				   
	for(t=0;t<72;t++)//ÿ��24*24�ĺ��ֵ��� ��72���ֽ�
		{   
		//��ά����ÿһά���24�ֽ�
		if(t<24)temp=tfont24[index*3][t];           //ǰ24���ֽ�
		else if(t<48)temp=tfont24[index*3+1][t-24]; //��24���ֽ�	                          
		else temp=tfont24[index*3+2][t-48];         //��24���ֽ�
		for(t1=0;t1<8;t1++)	 //ÿ���ֽ�8λ����
			{
			if(temp&0x80)LCD_Draw_Point(x,y,color);//��ʵ�ĵ�
			else LCD_Draw_Point(x,y,BACK_COLOR);   //���հ׵㣨ʹ�ñ���ɫ��
			temp<<=1;
			y++;
			if((y-y0)==24)	  //�ﵽ��������ֵ��ʼ�µ�һ��
				{
				y=y0;
				x++;
				break;
				}
			}  	 
		}          
	}

//����2��������ʾ����
void TEST_FONT(void)
	{
	u8 t;
	u8 x,x1;
	x=x1=50;
	for(t=0;t<7;t++)//6������
		{
		Test_Show_CH_Font16(x ,50,t,RED);
		Test_Show_CH_Font24(x1,70,t,RED);
		x+=16;
		x1+=24;
		}
	}







