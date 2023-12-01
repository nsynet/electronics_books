#include "touch.h" 
#include "lcd.h"
#include "SysTickDelay.h"
#include "stdlib.h"
#include "math.h"
#include "24cxx.h"
	 
//Mini STM32开发板
//ADS7843/7846/UH7843/7846/XPT2046/TSC2046 驱动函数
//正点原子@ALIENTEK
//2010/6/13
//V1.3
	
//2010/6/19
//加入了u8 AI_Read_TP(void)函数,用于读取触点状态	 

Pen_Holder Pen_Point;//定义笔实体
//SPI写数据
//向7843写入1byte数据   
void ADS_Write_Byte(u8 num)    
{  
	u8 count=0;   
	for(count=0;count<8;count++)  
	{ 	  
		if(num&0x80)Set_TOUCH_TDIN  
		else Clr_TOUCH_TDIN;   
		num<<=1;    
		Clr_TOUCH_TCLK;//上升沿有效	   	 
		Set_TOUCH_TCLK;      
	} 			    
} 		 
//SPI读数据 
//从7846/7843/XPT2046/UH7843/UH7846读取adc值
//执行时间最少为6us	   
u16 ADS_Read_AD(u8 CMD)	  
{ 	 
	u8 count=0; 	  
	u16 Num=0; 
	Clr_TOUCH_TCLK;//先拉低时钟 	 
	Clr_TOUCH_TCS; //选中ADS7843	 
	ADS_Write_Byte(CMD);//发送命令字
	delay_us(6);//ADS7846的转换时间最长为6us
	Set_TOUCH_TCLK;//给1个时钟，清除BUSY   	    
	Clr_TOUCH_TCLK; 	 
	for(count=0;count<16;count++)  
	{ 				  
		Num<<=1; 	 
		Clr_TOUCH_TCLK;//下降沿有效  	    	   
		Set_TOUCH_TCLK;
		if(TOUCH_DOUT)Num++; 		 
	}  	
	Num>>=4;   //只有高12位有效.
	Set_TOUCH_TCS;//释放ADS7843	 
	return(Num);   
}
//读取一个坐标值
//连续读取READ_TIMES次数据,对这些数据升序排列,
//然后去掉最低和最高LOST_VAL个数,取平均值
//执行时间最少为6*15=90us 
#define READ_TIMES 12 //读取次数
#define LOST_VAL 4	  //丢弃值
u16 ADS_Read_XY(u8 xy)
{
	u16 i, j;
	u16 buf[READ_TIMES];
	u16 sum=0;
	u16 temp;
	for(i=0;i<READ_TIMES;i++)
	{				 
		buf[i]=ADS_Read_AD(xy);	    
	}				    
	for(i=0;i<READ_TIMES-1; i++)//排序
	{
		for(j=i+1;j<READ_TIMES;j++)
		{
			if(buf[i]>buf[j])//升序排列
			{
				temp=buf[i];
				buf[i]=buf[j];
				buf[j]=temp;
			}
		}
	}	  
	sum=0;
	for(i=LOST_VAL;i<READ_TIMES-LOST_VAL;i++)sum+=buf[i];
	temp=sum/(READ_TIMES-2*LOST_VAL);
	return temp;   
} 
//带滤波的坐标读取
//最小值不能少于100.
//执行时间最少为90*2=180us
u8 Read_ADS(u16 *x,u16 *y)
{
	u16 xtemp,ytemp;			 	 		  
	xtemp=ADS_Read_XY(CMD_RDX);
	ytemp=ADS_Read_XY(CMD_RDY);	  												   
	if(xtemp<100||ytemp<100)return 0;//读数失败
	*x=xtemp;
	*y=ytemp;
	return 1;//读数成功
}	
//2次读取ADS7846,连续读取2次有效的AD值,且这两次的偏差不能超过
//50,满足条件,则认为读数正确,否则读数错误.	   
//该函数能大大提高准确度
//执行时间最少为180*2=360us;
#define ERR_RANGE 50 //误差范围 
u8 Read_ADS2(u16 *x,u16 *y) 
{
	u16 x1,y1;
 	u16 x2,y2;
 	u8 flag;    
    flag=Read_ADS(&x1,&y1);   
    if(flag==0)return(0);
    flag=Read_ADS(&x2,&y2);	   
    if(flag==0)return(0);   
    if(((x2<=x1&&x1<x2+ERR_RANGE)||(x1<=x2&&x2<x1+ERR_RANGE))//前后两次采样在+-50内
    &&((y2<=y1&&y1<y2+ERR_RANGE)||(y1<=y2&&y2<y1+ERR_RANGE)))
    {
        *x=(x1+x2)/2;
        *y=(y1+y2)/2;
        return 1;
    }else return 0;	  
} 
//读取一次坐标值	
//仅仅读取一次,知道PEN松开才返回!					   
u8 Read_TP_Once(void)
{
	u8 t=0;	    
	Pen_Int_Set(0);//关闭中断
	Pen_Point.Key_Sta=Key_Up;
	Read_ADS2(&Pen_Point.X,&Pen_Point.Y);
	while(TOUCH_PEN==0&&t<=250)
	{
		t++;
		delay_ms(10);
	};
	Pen_Int_Set(1);//开启中断		 
	if(t>=250)return 0;//按下2.5s 认为无效
	else return 1;	
}
//得到两个数之差的绝对值
u16 T_abs(u16 m,u16 n)
{
	if(m>n)return m-n;
	else return n-m;
}
//智能读取触摸屏按键		   
//返回值0：没有任何按键按下
//返回值1：按键按下了,并且正在移动中
//返回值2：按键按下,没有移动
//PEN信号用来检测按键是否松开
//2010/6/19 修改了几个小BUG V0.0.2
#define PT_RANGE 3//单次按下点的范围值
u8 AI_Read_TP(void)
{
	static u8 LSTA=0;
	static u16 fx=0,fy=0;
	u8 times;
	u16 tempx,tempy;
	switch(LSTA)
	{
		case 0:	  
		if(Pen_Point.Key_Sta==Key_Down)//有按键按下了
		{				 
			Pen_Int_Set(0);  //关闭中断 
			Convert_Pos();	 
			fx=Pen_Point.X0;//记录第一次按下的按键坐标位置
			fy=Pen_Point.Y0;
			times=0;			 
			do
			{
				Convert_Pos();	   //修改相对坐标系的原点,执行一次需要近10ms左右的时间
				tempx=Pen_Point.X0;
				tempy=Pen_Point.Y0;									 
				if((T_abs(tempx,fx)>PT_RANGE)||(T_abs(tempy,fy)>PT_RANGE))//移动距离大于PT_RANGE
				{					 				 
					LSTA=1;
					return 1;//按键按下,并且在移动
				}else times++;	    
				if(times>20)//规定时间内没有移动超过PT_RANGE范围,则主动返回
				{					 			 
					LSTA=2;
					return 2;
				}
			}while(TOUCH_PEN==0);//按键一直在按着
			//按键按下了又松开了,视为短按  
			LSTA=2;
			return 2;
		}
		break;	  
		case 1://触点在滑动	 
		if(TOUCH_PEN==0)
		{					    
			Convert_Pos(); //读取坐标并转换	
			delay_us(100); //不能少!
			return LSTA;   //仍然在移动中
		}
		Pen_Int_Set(1); //开启中断
	    Pen_Point.Key_Sta=Key_Up; 
		break;		 
		case 2://触点未滑动	   
		if(TOUCH_PEN==0)
		{					    
			Convert_Pos(); //读取坐标并转换
			delay_us(100);
			tempx=Pen_Point.X0;
			tempy=Pen_Point.Y0;	  
			if((T_abs(tempx,fx)>PT_RANGE)||(T_abs(tempy,fy)>PT_RANGE))//移动距离大于PT_RANGE
			{
				LSTA=1;
				return 1;//按键按下,并且在移动
			}
			return 2;   //仍然没有移动
		}
		Pen_Int_Set(1); //开启中断
	    Pen_Point.Key_Sta=Key_Up;  
		break;
	}						    
	LSTA=0;	   
	return 0;  	 
}
//判断触点是不是在指定区域之内
//(x1,y1):起始坐标
//(x2,y2):结束坐标
//返回值 :1,在该区域内.0,不在该区域内.
u8 Is_In_Area(u8 x1,u16 y1,u8 x2,u16 y2)
{
	if(Pen_Point.X0<=x2&&Pen_Point.X0>=x1&&Pen_Point.Y0<=y2&&Pen_Point.Y0>=y1)return 1;
	else return 0;
}  
//////////////////////////////////////////////////
//与LCD部分有关的函数  
//画一个触摸点
//用来校准用的
void Drow_Touch_Point(u8 x,u16 y)
{
	LCD_DrawLine(x-12,y,x+13,y);//横线
	LCD_DrawLine(x,y-12,x,y+13);//竖线
	LCD_DrawPoint(x+1,y+1);
	LCD_DrawPoint(x-1,y+1);
	LCD_DrawPoint(x+1,y-1);
	LCD_DrawPoint(x-1,y-1);
	Draw_Circle(x,y,6);//画中心圈
}	  
//画一个大点
//2*2的点			   
void Draw_Big_Point(u8 x,u16 y)
{	    
	LCD_DrawPoint(x,y);//中心点 
	LCD_DrawPoint(x+1,y);
	LCD_DrawPoint(x,y+1);
	LCD_DrawPoint(x+1,y+1);	 	  	
}
//////////////////////////////////////////////////	 
//转换结果
//根据触摸屏的校准参数来决定转换后的结果,保存在X0,Y0中
//最短需要360us
//实际测试时间在10ms左右
void Convert_Pos(void)
{		 	  
	if(Read_ADS2(&Pen_Point.X,&Pen_Point.Y))
	{
		Pen_Point.X0=Pen_Point.xfac*Pen_Point.X+Pen_Point.xoff;
		Pen_Point.Y0=Pen_Point.yfac*Pen_Point.Y+Pen_Point.yoff;  
	}
}	   
//中断,检测到PEN脚的一个下降沿.
//置位Pen_Point.Key_Sta为按下状态
//中断线0线上的中断检测
void EXTI1_IRQHandler(void)
{ 		   			 
	Pen_Point.Key_Sta=Key_Down;//按键按下  		  				 
	EXTI->PR=1<<1;  //清除LINE1上的中断标志位	
} 
//PEN中断设置	 
void Pen_Int_Set(u8 en)
{
	if(en)EXTI->IMR|=1<<1;   //开启line1上的中断	  	
	else EXTI->IMR&=~(1<<1); //关闭line1上的中断	   
}	  
//////////////////////////////////////////////////////////////////////////
//此部分涉及到使用外部EEPROM,如果没有外部EEPROM,屏蔽此部分即可
#ifdef ADJ_SAVE_ENABLE
//保存在EEPROM里面的地址区间基址,占用13个字节(RANGE:SAVE_ADDR_BASE~SAVE_ADDR_BASE+12)
#define SAVE_ADDR_BASE 40
//保存校准参数										    
void Save_Adjdata(void)
{
	s32 temp;			 
	//保存校正结果!		   							  
	temp=Pen_Point.xfac*100000000;//保存x校正因素      
    AT24CXX_WriteLenByte(SAVE_ADDR_BASE,temp,4);   
	temp=Pen_Point.yfac*100000000;//保存y校正因素    
    AT24CXX_WriteLenByte(SAVE_ADDR_BASE+4,temp,4);
	//保存x偏移量
    AT24CXX_WriteLenByte(SAVE_ADDR_BASE+8,Pen_Point.xoff,2);		    
	//保存y偏移量
	AT24CXX_WriteLenByte(SAVE_ADDR_BASE+10,Pen_Point.yoff,2);	
			     							 
	temp=AT24CXX_ReadOneByte(SAVE_ADDR_BASE+12);
	temp&=0XF0;
	temp|=0X0A;//标记校准过了
	AT24CXX_WriteOneByte(SAVE_ADDR_BASE+12,temp);			 
}
//得到保存在EEPROM里面的校准值
//返回值：1，成功获取数据
//        0，获取失败，要重新校准
u8 Get_Adjdata(void)
{					  
	s32 tempfac;
	tempfac=AT24CXX_ReadOneByte(52);//第五十二字节的第四位用来标记是否校准过！ 		 
	if((tempfac&0X0F)==0X0A)//触摸屏已经校准过了			   
	{    												 
		tempfac=AT24CXX_ReadLenByte(40,4);		   
		Pen_Point.xfac=(float)tempfac/100000000;//得到x校准参数
		tempfac=AT24CXX_ReadLenByte(44,4);			          
		Pen_Point.yfac=(float)tempfac/100000000;//得到y校准参数
	    //得到x偏移量
		tempfac=AT24CXX_ReadLenByte(48,2);			   	  
		Pen_Point.xoff=tempfac;					 
	    //得到y偏移量
		tempfac=AT24CXX_ReadLenByte(50,2);				 	  
		Pen_Point.yoff=tempfac;					 
		return 1;	 
	}
	return 0;
}
#endif		 
//触摸屏校准代码
//得到四个校准参数
void Touch_Adjust(void)
{								 
	u16 pos_temp[4][2];//坐标缓存值
	u8  cnt=0;	
	u16 d1,d2;
	u32 tem1,tem2;
	float fac; 	   
	cnt=0;				
	POINT_COLOR=BLUE;
	BACK_COLOR =WHITE;
	LCD_Clear(WHITE);//清屏   
	POINT_COLOR=RED;//红色 
	LCD_Clear(WHITE);//清屏 
	Drow_Touch_Point(20,20);//画点1 
	Pen_Point.Key_Sta=Key_Up;//消除触发信号 
	Pen_Point.xfac=0;//xfac用来标记是否校准过,所以校准之前必须清掉!以免错误	 
	while(1)
	{
		if(Pen_Point.Key_Sta==Key_Down)//按键按下了
		{
			if(Read_TP_Once())//得到单次按键值
			{  								   
				pos_temp[cnt][0]=Pen_Point.X;
				pos_temp[cnt][1]=Pen_Point.Y;
				cnt++;
			}			 
			switch(cnt)
			{			   
				case 1:
					LCD_Clear(WHITE);//清屏 
					Drow_Touch_Point(220,20);//画点2
					break;
				case 2:
					LCD_Clear(WHITE);//清屏 
					Drow_Touch_Point(20,300);//画点3
					break;
				case 3:
					LCD_Clear(WHITE);//清屏 
					Drow_Touch_Point(220,300);//画点4
					break;
				case 4:	 //全部四个点已经得到
	    		    //对边相等
					tem1=abs(pos_temp[0][0]-pos_temp[1][0]);//x1-x2
					tem2=abs(pos_temp[0][1]-pos_temp[1][1]);//y1-y2
					tem1*=tem1;
					tem2*=tem2;
					d1=sqrt(tem1+tem2);//得到1,2的距离
					
					tem1=abs(pos_temp[2][0]-pos_temp[3][0]);//x3-x4
					tem2=abs(pos_temp[2][1]-pos_temp[3][1]);//y3-y4
					tem1*=tem1;
					tem2*=tem2;
					d2=sqrt(tem1+tem2);//得到3,4的距离
					fac=(float)d1/d2;
					if(fac<0.95||fac>1.05||d1==0||d2==0)//不合格
					{
						cnt=0;
						LCD_Clear(WHITE);//清屏 
						Drow_Touch_Point(20,20);
						continue;
					}
					tem1=abs(pos_temp[0][0]-pos_temp[2][0]);//x1-x3
					tem2=abs(pos_temp[0][1]-pos_temp[2][1]);//y1-y3
					tem1*=tem1;
					tem2*=tem2;
					d1=sqrt(tem1+tem2);//得到1,3的距离
					
					tem1=abs(pos_temp[1][0]-pos_temp[3][0]);//x2-x4
					tem2=abs(pos_temp[1][1]-pos_temp[3][1]);//y2-y4
					tem1*=tem1;
					tem2*=tem2;
					d2=sqrt(tem1+tem2);//得到2,4的距离
					fac=(float)d1/d2;
					if(fac<0.95||fac>1.05)//不合格
					{
						cnt=0;
						LCD_Clear(WHITE);//清屏 
						Drow_Touch_Point(20,20);
						continue;
					}//正确了
								   
					//对角线相等
					tem1=abs(pos_temp[1][0]-pos_temp[2][0]);//x1-x3
					tem2=abs(pos_temp[1][1]-pos_temp[2][1]);//y1-y3
					tem1*=tem1;
					tem2*=tem2;
					d1=sqrt(tem1+tem2);//得到1,4的距离
	
					tem1=abs(pos_temp[0][0]-pos_temp[3][0]);//x2-x4
					tem2=abs(pos_temp[0][1]-pos_temp[3][1]);//y2-y4
					tem1*=tem1;
					tem2*=tem2;
					d2=sqrt(tem1+tem2);//得到2,3的距离
					fac=(float)d1/d2;
					if(fac<0.95||fac>1.05)//不合格
					{
						cnt=0;
						LCD_Clear(WHITE);//清屏 
						Drow_Touch_Point(20,20);
						continue;
					}//正确了
					//计算结果
					Pen_Point.xfac=(float)200/(pos_temp[1][0]-pos_temp[0][0]);//得到xfac		 
					Pen_Point.xoff=(240-Pen_Point.xfac*(pos_temp[1][0]+pos_temp[0][0]))/2;//得到xoff
						  
					Pen_Point.yfac=(float)280/(pos_temp[2][1]-pos_temp[0][1]);//得到yfac
					Pen_Point.yoff=(320-Pen_Point.yfac*(pos_temp[2][1]+pos_temp[0][1]))/2;//得到yoff  
					POINT_COLOR=BLUE;
					LCD_Clear(WHITE);//清屏
					LCD_ShowString(35,110,"Touch Screen Adjust OK!");//校正完成
					delay_ms(1000);
					LCD_Clear(WHITE);//清屏   
					return;//校正完成				 
			}
		}
	} 
}		    
//外部中断初始化函数
void Touch_Init(void)
{			    		   
	NVIC_InitTypeDef NVIC_InitStructure;  //中断
	GPIO_InitTypeDef GPIO_InitStructure;	//GPIO
	EXTI_InitTypeDef EXTI_InitStructure;	//外部中断线
	//注意,时钟使能之后,对GPIO的操作才有效
	//所以上拉之前,必须使能时钟.才能实现真正的上拉输出
	//RCC->APB2ENR|=1<<4;    //PC时钟使能	   
	//RCC->APB2ENR|=1<<0;    //开启辅助时钟	
	/* Enable  GPIOC Portand AFIO clock */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC  | RCC_APB2Periph_AFIO, ENABLE);						  
	//GPIOC->CRL&=0XFFFF0000;//PC0~3
	//GPIOC->CRL|=0X00003883; 
	GPIO_InitStructure.GPIO_Pin = TOUCH_TDIN_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //推挽输出 GPIO_Mode_IPU ;  //上拉输入
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(TOUCH_TDIN_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = TOUCH_TCLK_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //推挽输出 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(TOUCH_TCLK_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = TOUCH_PEN_PIN;
	GPIO_InitStructure.GPIO_Mode =  GPIO_Mode_IPU ;  //上拉输入
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(TOUCH_PEN_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = TOUCH_DOUT_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU ;  //上拉输入
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(TOUCH_DOUT_PORT, &GPIO_InitStructure);
	//GPIOC->CRH&=0XFF0FFFFF;//PC13
	//GPIOC->CRH|=0X00300000;//PC13推挽输出 
	GPIO_InitStructure.GPIO_Pin = TOUCH_TCS_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(TOUCH_TCS_PORT, &GPIO_InitStructure);
	//GPIOC->ODR|=0X200f;    //PC0~3 13 全部上拉	   
	Read_ADS(&Pen_Point.X,&Pen_Point.Y);//第一次读取初始化			 
	//MY_NVIC_Init(2,0,EXTI1_IRQChannel,2);	 
	/* Enable the EXTI1 Interrupt */
	NVIC_InitStructure.NVIC_IRQChannel = EXTI1_IRQn; //使能按键所在的外部中断通道
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2; //先占优先级2级
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0; //从优先级0级
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //使能外部中断通道
	NVIC_Init(&NVIC_InitStructure); //根据NVIC_InitStruct中指定的参数初始化外设NVIC寄存器
	//RCC->APB2ENR|=0x01;    //使能io复用时钟	   
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);				 
	//AFIO->EXTICR[0]|=0X0020; //EXTI1映射到PC1   
	/* Connect Button EXTI Line to Button GPIO Pin */
	GPIO_EXTILineConfig(GPIO_PortSourceGPIOC, GPIO_PinSource1);  	//选择PC1所在的GPIO管脚用作外部中断线路EXIT1
	//EXTI->IMR|=1<<1;        //开启line1上的中断
	//EXTI->EMR|=1<<1;        //不屏蔽line1上的事件
	//EXTI->FTSR|=1<<1;       //line1上事件下降沿触发	
	/* Configure Button EXTI line */
	EXTI_InitStructure.EXTI_Line = EXTI_Line1;	//外部线路EXIT1
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;			//设外外部中断模式:EXTI线路为中断请求
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  //外部中断触发沿选择:设置输入线路下降沿为中断请求
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;		//使能外部中断新状态
	EXTI_Init(&EXTI_InitStructure);		//根据EXTI_InitStruct中指定的参数初始化外设EXTI寄存器	
	#ifdef ADJ_SAVE_ENABLE	  
		AT24CXX_Init();//初始化24CXX
		if(Get_Adjdata())return;//已经校准
		else			   //未校准?
			{ 										    
			LCD_Clear(WHITE);//清屏
			Touch_Adjust();  //屏幕校准 
			Save_Adjdata();	 
			}			
		Get_Adjdata();
	#else
		LCD_Clear(WHITE);//清屏
		Touch_Adjust();  //屏幕校准,带自动保存			   
	#endif
	//	printf("Pen_Point.xfac:%f\n",Pen_Point.xfac);
	//	printf("Pen_Point.yfac:%f\n",Pen_Point.yfac);
	//	printf("Pen_Point.xoff:%d\n",Pen_Point.xoff);
	//	printf("Pen_Point.yoff:%d\n",Pen_Point.yoff);
}

