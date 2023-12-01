#include "stm32f10x.h"
#include "oled.h"
#include "movie.h" 
#include "m_data.h"   
//Mini STM32������
//��չ����5--OLED������ʾ			 
//����ԭ��@ALIENTEK
//2010/8/22

//�������������嶯��ÿ֡�ĳ���
#define MOVIE_XSIZE	100 
#define MOVIE_YSIZE 40  
#define FRAME_SIZE MOVIE_XSIZE*MOVIE_YSIZE/8   
							  
//x:0~127
//y:0~63
//picx:ͼƬ���		 
void Movie_Show_Img(u16 x,u16 y,u32 picx)
{      			    
	u16 temp,t,t1;
	u16 y0=y;	
	picx*=FRAME_SIZE;				    				   
    for(t=0;t<FRAME_SIZE;t++)
    {   
		temp=movie_data[picx+t];  //�õ�ͼƬ��һ���ֽ�����	                          
        for(t1=0;t1<8;t1++)
		{
			if(temp&0x80)OLED_DrawPoint(x,y,1); 
			else OLED_DrawPoint(x,y,0);		   
			temp<<=1;
			y++;
			if((y-y0)==MOVIE_YSIZE)
			{
				y=y0;
				x++;
				break;
			}
		}  	 
    }          
}
 

























