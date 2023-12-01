#include "stm32f10x.h"
#include "oled.h"
#include "bigfont.h"
#include "oledhz.h"	  
//Mini STM32开发板
//扩展例程--OLED汉字显示			 
//正点原子@ALIENTEK
//2010/8/22


//在指定位置显示一个字符,包括部分字符
//x:0~127
//y:0~63
//mode:0,反白显示;1,正常显示				 
//22*11大小的字符
void OLED_ShowChar22(u8 x,u8 y,u8 chr,u8 mode)
{      			    
	u8 temp,t,t1;
	u8 y0=y;
	chr=chr-' ';//得到偏移后的值				   
    for(t=0;t<33;t++)
    {   
		temp=asc2_2211[chr][t];  //调用2211字体	                          
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
//显示字符串
//x,y:起点坐标  
//*p:字符串起始地址
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
//显示数字
//x,y :起点坐标	 
//len :数字的位数
//mode:模式	0,填充模式;1,叠加模式
//num:数值(0~4294967295);	 		  
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
//在指定位置显示一个汉字
//x:0~127
//y:0~63
//fno:汉字编号
//mode:0,反白显示;1,正常显示				 
//22*22大小的字符
void OLED_ShowFont22(u8 x,u8 y,u8 fno,u8 mode)
{      			    
	u8 temp,t,t1;
	u8 y0=y;				   
    for(t=0;t<66;t++)
    {   
		if(t<33)temp=user_hz[fno*2][t];    //调用22*22汉字	                          
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

























