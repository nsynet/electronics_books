/*****************************************************************************************
*文件名称：ds18b20.c
*说明：数字温度采集器ds18b20驱动函数文件
*功能：驱动函数实例化
*修改：无
*版本：V1.0.0
*作者：YuanDong
*时间：2009.07.03
*****************************************************************************************/
#define   DS18B20_GLOBAL 1
#include  "ds18b20.h"
void serial_set(void);
void process(uchar,uchar);
char volatile xiaoshu_temp[5],zhen_temp[4];
bit flag;
bit  dot_dis=1;
/*****************************************************************************************
*函数名称：delay600us(void)
*函数功能：延时600us
*入口参数：无
*出口参数：无   											
*****************************************************************************************/
void delay600us(void)
{
	uchar i;
	for(i=0;i<255;i++);
}
/*****************************************************************************************
*函数名称：delay60us(void)
*函数功能：延时60us
*入口参数：无
*出口参数：无  										
*****************************************************************************************/
void delay60us(void)
{
	uchar i;
	for(i=0;i<20;i++);
}
/*****************************************************************************************
*函数名称：delay240us(void)
*函数功能：延时240us
*入口参数：无
*出口参数：无
*****************************************************************************************/
void delay240us(void)
{
	uchar i;
	for(i=0;i<80;i++);
}
/*****************************************************************************************
*函数名称：resetpulse(void)
*函数功能：复位脉冲
*入口参数：无
*出口参数：bool,输出端口状态
*****************************************************************************************/
bit resetpulse(void)
{
	
	DQ=0;
	delay600us(); 			//延时500us
	DQ=1;
	delay60us();			// 延时60us
	return(DQ);		 		//读取P1.0的状态
}
/******************************************************************************************函数名称：ds18b20_init(void)
*函数功能：ds18b20的初始化
*入口参数：无
*出口参数：无     											
*****************************************************************************************/
void ds18b20_init(void)
{
	while(1)
	{
		if(!resetpulse())  	//收到ds18b20的应答信号
		{	
			DQ=1;
			delay600us();	//延时240us
			break;		
		}
		else
			resetpulse();	 //否则再发复位信号
	}
}
/*****************************************************************************************
*函数名称：ds18b20_writecommand(uchar command)
*函数功能：向ds18b20写命令
*入口参数：command，命令参数
*出口参数：无     				
*****************************************************************************************/
void ds18b20_writecommand(uchar command)
{	

	uchar   i;
	for(i=0;i<8;i++)
	{
		if((command & 0x01)==0)
		{
			DQ =0;					//写0
			delay60us();			//延时60us
			DQ =1;			   	
		}
		else						//写1
		{
		 	DQ =0;
			_nop_();
			_nop_();				//延时2us
			DQ =1;
			delay60us();			//延时60us
		}
		command=_cror_(command,1); // 右移1位
	 }
}
/*****************************************************************************************
*函数名称：ds18b20_readdata(void)
*函数功能：读ds18b20数据
*入口参数：无
*出口参数：返回读到的数据
*****************************************************************************************/
uchar ds18b20_readdata(void)
{
	uchar readdata;
	uchar i;
	for(i=0;i<8;i++)
	{
		DQ=0;
		_nop_();
		_nop_();
		_nop_();
		DQ=1;		  //释放总线
		//delay15us();	注意不需要
		if(DQ==0)	   //如果读到的是0
		{
			readdata=readdata&0x7f;
			delay60us();
		}
		else			//读到的是1
		{
			readdata=readdata|0x80;
			delay60us();
		}
		if(i<7)
		
		readdata=_cror_(readdata,1);
	}
	return readdata;
}
/*****************************************************************************************
*函数名称：temperature_process(uchar low,uchar high)
*函数功能：温度处理函数
*入口参数：low,high
*出口参数：无							
*****************************************************************************************/
void temperature_process(uchar low,uchar high)
{
	uint temp1,temp2,temp3;
	if(high&0x80)//判断正负
	{
		flag=1;
		temp3=temp3|high;
		temp3=temp3&0x00ff;
		temp3=temp3<<8;
		temp1=temp3;
		temp1=temp1|low;
		
		temp1=(temp1^0xffff);
		temp1=temp1+1;	 //取反加1
		low=temp1&0x000f;
		high=temp1>>4;
		process(high,low);
	}
	else
	{
		flag=0;		 //zhen
		temp1=high;
		temp2=low;
		temp1=temp1<<4;
		temp2=temp2>>4;
		temp3=temp1|temp2;
		high=temp3;
		low=low&0x0f;
		process(high,low);
	}
}
/*****************************************************************************************
*函数名称：process(uchar high,uchar low)
*函数功能：数值处理函数
*入口参数：high,low
*出口参数：无											
*****************************************************************************************/
void process(uchar high,uchar low)
{
	 uint temp1;
	 uchar i;
	 temp1=low*625;
	 xiaoshu_temp[0]=temp1/1000+'0';
	 xiaoshu_temp[1]='\0';
	 dot_dis=1;
	 if(xiaoshu_temp[0]=='0')
   {
		 xiaoshu_temp[0]='\0';
		 dot_dis=0;
	 }
	 else
		 dot_dis=1;
	 zhen_temp[0]=high/100+'0';
	 zhen_temp[1]=high%100/10+'0';
	 zhen_temp[2]=high%10+'0';
	 zhen_temp[3]='\0';
	 for(i=0;i<2;i++)
	 {
	    if(zhen_temp[0]=='0')
		{
		   zhen_temp[0]=zhen_temp[1];
		   zhen_temp[1]=zhen_temp[2];
		   zhen_temp[2]='\0';
		}
		else
		   break;
	 }
	   
}
/*****************************************************************************************
*函数名称：match_rom(uchar *rom)
*函数功能：序列号匹配子程序	
*入口参数：*rom，需要匹配的序列号
*出口参数：返回1								
*****************************************************************************************/
bit match_rom(uchar *rom)
{
	uchar i;
	ds18b20_init();
	ds18b20_writecommand(0x55);
	for(i=8;i>0;i--)
	{
	   ds18b20_writecommand(*(rom+i-1));
	}
	return 1;
}	
