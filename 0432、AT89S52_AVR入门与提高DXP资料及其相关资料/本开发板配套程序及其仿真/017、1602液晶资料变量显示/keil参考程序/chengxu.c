/************************************/
/*http://www.ourhc.com		 	*/
/*1602LCD测试程序				*/
/*目标器件：AT89S51/52/53		*/
/*晶振:12MHZ					*/
/*编译环境：Keil 7.50A			*/
/************************************/

/*********************************包含头文件********************************/
#include <reg52.h>
#include <intrins.h>
#define	uchar unsigned char      
#define	uint unsigned int
/*********************************端口定义**********************************/
sbit rs	= P1^0;	
sbit rw = P1^1;
sbit ep = P1^2;
sbit P20= P2^0;
sbit P21= P2^1;
sbit P22= P2^2;
uchar x,y;
/********************************显示数据表*********************************/
uchar code dis1[] = {"Input it date: "};
uchar code dis2[] = {'[', ' ', ' ', ' ', ' ', ']', ' ', ' ', ' ', ' '};
uchar code dis3[] = {' ', ']'};
uchar code dis4[] = {'0', '1', '2', '3','4', '5', '6', '7',  '8', '9' };
uchar code dis5[] = {'0', '1', '2', '3','4', '5', '6', '7',  '8', '9' };
/*****************************************************************************
函数功能:LCD延时子程序
入口参数:ms
出口参数:
*****************************************************************************/
void delay(uchar ms)
{							
	unsigned char i;
	while(ms--)
	{
		for(i = 0; i< 250; i++)
		{
			_nop_();
			_nop_();
			_nop_();
			_nop_();
		}
	}
}

/*****************************************************************************
函数功能:测试LCD忙碌状态
入口参数:
出口参数:result
*****************************************************************************/
bit lcd_bz()
{							
	bit result;
	rs = 0;
	rw = 1;
	ep = 1;
	_nop_();
	_nop_();
	_nop_();
	_nop_();
	result = (bit)(P0 & 0x80);
	ep = 0;
	return result;	
}

/*****************************************************************************
函数功能:写指令数据到LCD子程序
入口参数:cmd
出口参数:
*****************************************************************************/
void lcd_wcmd(uchar cmd)
{						
	while(lcd_bz());			//判断LCD是否忙碌
	rs = 0;
	rw = 0;
	ep = 0;
	_nop_();
	_nop_();	
	P0 = cmd;
	_nop_();
	_nop_();
	_nop_();
	_nop_();
	ep = 1;
	_nop_();
	_nop_();
	_nop_();
	_nop_();
	ep = 0;		
}

/*****************************************************************************
函数功能:设定显示位置子程序
入口参数:pos
出口参数:
*****************************************************************************/
void lcd_pos(uchar pos)
{						
	lcd_wcmd(pos | 0x80);
}

/*****************************************************************************
函数功能:写入显示数据到LCD子程序
入口参数:dat
出口参数:
*****************************************************************************/
void lcd_wdat(uchar dat)	
{							
	while(lcd_bz());			//判断LCD是否忙碌
	rs = 1;
	rw = 0;
	ep = 0;
	P0 = dat;
	_nop_();
	_nop_();
	_nop_();
	_nop_();
	ep = 1;
	_nop_();
	_nop_();
	_nop_();
	_nop_();
	ep = 0;	
}

/*****************************************************************************
函数功能:LCD初始化子程序
入口参数:
出口参数:
*****************************************************************************/
void lcd_init()
{							
	lcd_wcmd(0x38);			
	delay(1);
	lcd_wcmd(0x0c);		
	delay(1);
	lcd_wcmd(0x06);		
	delay(1);
	lcd_wcmd(0x01);			
	delay(1);
}

/*****************************************************************************
函数功能:主程序
入口参数:
出口参数:
*****************************************************************************/
void main(void)
{
	
	uchar i;
	x=0;
	y=0;
	lcd_init();					// 初始化LCD			
	delay(10);
	while(1)
	{
		
		if(P20==0)
		{
	 	 x=0;
		 y=1;
		 
		}
		
		if(P21==0)
		{
	 	 x=1;
		 y=2;
		
		}
		if(P22==0)
		{
	 	 x=0;
		 y=4;
		
		}
		
		lcd_pos(0x01);				//设置显示位置
		i = 0;
		while(dis1[i] != '\0')
		{							
			lcd_wdat(dis1[i]);		//显示字符
			i++;
		}
		lcd_pos(0x46);				// 设置显示位置
		i = 0;
		while(dis2[i] != '\0')
		{
		lcd_wdat(dis2[i]);		// 显示字符
		i++;
		}
		lcd_pos(0x48);				// 设置显示位置
		lcd_wdat(dis4[x]);		// 显示字符
		lcd_pos(0x49);				// 设置显示位置
		lcd_wdat(dis5[y]);		// 显示字符
		/*lcd_pos(0x4A);				// 设置显示位置
		i = 0;
		while(dis3[i] != '\0')
		{
		lcd_wdat(dis3[i]);		// 显示字符
		i++;
		} */
		
	delay(5);
	//while(1);
	}				
}


