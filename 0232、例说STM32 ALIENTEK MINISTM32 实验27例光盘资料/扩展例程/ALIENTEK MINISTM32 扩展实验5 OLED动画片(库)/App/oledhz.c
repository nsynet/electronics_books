#include "stm32f10x.h"
#include "oled.h"
#include "bigfont.h"
#include "oledhz.h"	  
//Mini STM32������
//��չ����--OLED������ʾ			 
//����ԭ��@ALIENTEK
//2010/8/22


//��ָ��λ����ʾһ���ַ�,���������ַ�
//x:0~127
//y:0~63
//mode:0,������ʾ;1,������ʾ				 
//22*11��С���ַ�
void OLED_ShowChar22(u8 x,u8 y,u8 chr,u8 mode)
{      			    
	u8 temp,t,t1;
	u8 y0=y;
	chr=chr-' ';//�õ�ƫ�ƺ��ֵ				   
    for(t=0;t<33;t++)
    {   
		temp=asc2_2211[chr][t];  //����2211����	                          
        for(t1=0;t1<8;t1++)
		{
			if(temp&0x80)OLED_DrawPoint(x,y,mode);
			else OLED_DrawPoint(x,y,!mode);
			temp<<=1;
			y++;
			if((y-y0)==22)
			{
				y=y0;
				x++;
				break;
			}
		}  	 
    }          
}
//��ʾ�ַ���
//x,y:�������  
//*p:�ַ�����ʼ��ַ
void OLED_ShowString22(u8 x,u8 y,const u8 *p)
{
#define MAX_CHAR_POSX 117
#define MAX_CHAR_POSY 42          
    while(*p!='\0')
    {       
        if(x>MAX_CHAR_POSX){x=0;y+=22;}
        if(y>MAX_CHAR_POSY){y=x=0;OLED_Clear();}
        OLED_ShowChar22(x,y,*p,1);	 
        x+=11;
        p++;
    }  
}
extern u32 mypow(u8 m,u8 n);  
//��ʾ����
//x,y :�������	 
//len :���ֵ�λ��
//mode:ģʽ	0,���ģʽ;1,����ģʽ
//num:��ֵ(0~4294967295);	 		  
void OLED_ShowNum22(u8 x,u8 y,u32 num,u8 len)
{         	
	u8 t,temp;
	u8 enshow=0;						   
	for(t=0;t<len;t++)
	{
		temp=(num/mypow(10,len-t-1))%10;
		if(enshow==0&&t<(len-1))
		{
			if(temp==0)
			{
				OLED_ShowChar22(x+11*t,y,' ',1);
				continue;
			}else enshow=1; 
		 	 
		}
	 	OLED_ShowChar22(x+11*t,y,temp+'0',1); 
	}
} 
//��ָ��λ����ʾһ������
//x:0~127
//y:0~63
//fno:���ֱ��
//mode:0,������ʾ;1,������ʾ				 
//22*22��С���ַ�
void OLED_ShowFont22(u8 x,u8 y,u8 fno,u8 mode)
{      			    
	u8 temp,t,t1;
	u8 y0=y;				   
    for(t=0;t<66;t++)
    {   
		if(t<33)temp=user_hz[fno*2][t];    //����22*22����	                          
        else temp=user_hz[fno*2+1][t-33];   
		for(t1=0;t1<8;t1++)
		{
			if(temp&0x80)OLED_DrawPoint(x,y,mode);
			else OLED_DrawPoint(x,y,!mode);
			temp<<=1;
			y++;
			if((y-y0)==22)
			{
				y=y0;
				x++;
				break;
			}
		}  	 
    }          
}

























