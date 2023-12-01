#include <reg52.h>
#include <absacc.h>
#define unit unsigned int
#define uchar unsigned char

/*定义字型字位口*/
#define DIGPORT  XBYTE [0x8000]
#define WORDPORT  XBYTE [0x4000]

/*定义P1口各管脚*/
sbit K0=P1^0;
sbit K1=P1^1;
sbit K2=P1^2;
sbit BEEP=P1^3;
sbit L0=P1^4;
sbit L1=P1^5;
sbit L2=P1^6;
sbit L3=P1^7;

uchar data BUFFER[2]={0,0}; 		/*显示缓冲区(依次为低位,高位)*/
uchar data CLOCK[4]={0,0,0,0};		/*存放时钟时间(依次为百分秒,秒,分和时位)*/
uchar data SECOND[2]={0,0};		/*存放秒表时间(依次为百分秒,秒)*/
uchar data REVERSE[4]={0,0,0,0};	/*存放倒计时时间(依次为百分秒,秒,分和时位)*/

/*定义运行状态*/
uchar data STATE=0;
/*STATE=0,秒表*/
/*STATE=1,倒计时分调整*/
/*STATE=2,倒计时小时调整*/
/*STATE=3,倒计时运行*/
/*STATE=4 or 7,时钟运行*/
/*STATE=5,时钟分调整*/
/*STATE=6,时钟时调整*/

bit bdata SND=0;					/*秒表START*/
bit bdata RST=0;					/*秒表RESET*/
bit bdata STP=0;					/*倒计时STOP*/

/*数码管显示编码"0"－"9","A","-"*/
uchar code TABLE[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f,0x77,0x40};

void display(void)
{	
	uchar i; 					/*显示缓冲区首址*/
	uchar delay;					/*显示延时*/
	uchar disp; 					/*显示内容*/
	uchar digit; 					/*定义数码管显示位*/
	digit=0x08;
	for (i=0;i<2;i++) 				/*秒表,显示百分秒和秒*/
	{
		if (BUFFER[i]>100) disp=BUFFER[i]%10+10;
		else disp=BUFFER[i]%10;		
		
		DIGPORT=digit;
		WORDPORT=TABLE[disp];
		
		for (delay=0;delay<=200;delay++);
		digit=digit>>1;
		disp=BUFFER[i]/10;
		
		DIGPORT=digit;
		WORDPORT=TABLE[disp];
		
		for (delay=0;delay<=200;delay++);
		digit=digit>>1;
	}
}


void timer0(void)  interrupt 1 using 1
{
	/*重置定时初值*/
	TH0=-5000/256;
	TL0=-5000%256;
	
	/*时钟处理*/
	CLOCK[0]=CLOCK[0]+1;
	if ((CLOCK[0]==50) && (STATE>=4))
		{
		L0=!L0;
		}
	if (CLOCK[0]==100)
		{	
		if (STATE>=4) L0=!L0;
		CLOCK[0]=0;
		CLOCK[1]=CLOCK[1]+1;
		
		if (CLOCK[1]==60) 
		{
			CLOCK[1]=0;
			CLOCK[2]=CLOCK[2]+1;
			if (CLOCK[2]==60)
			{
				CLOCK[2]=0;
				CLOCK[3]=CLOCK[3]+1;
				if (CLOCK[3]==24)
				{	
				CLOCK[3]=0;	
				}
			}
		}
	}	
}

void timer2(void) interrupt 5 using 3
{
	TF2=0;
	TH2=-5000/256; 
	TL2=-5000%256;
	/*秒表处理*/
	if (STATE==0)
	{
		SECOND[0]=SECOND[0]+1;
		if (SECOND[0]==50)
		{	
		L1=!L1;
		}
		if (SECOND[0]==100)
		{	
			L1=!L1;
			SECOND[0]=0;
			SECOND[1]=SECOND[1]+1;
			if (SECOND[1]==100) 
			{
				SECOND[1]=0; 
			}
		}		
	}
	
	/*倒计时处理*/
	if (STATE==3)
	{
		REVERSE[0]=REVERSE[0]+1;
		if (REVERSE[0]==50)
		{	
		L2=!L2;
		}
		
	if (REVERSE[0]==100)
	{	
			L2=!L2;
			REVERSE[0]=0;
			REVERSE[1]=REVERSE[1]+1;
			if (REVERSE[1]==60) 
			{
			REVERSE[1]=00;
			REVERSE[2]=REVERSE[2]-1;
				
	if ((REVERSE[2]==0) && (REVERSE[3]==0)) 
	{
					TR2=0;
					STP=1;
					BEEP=0;
				}
	else if (REVERSE[2]==0xff)
				{	
				REVERSE[2]=59;
				REVERSE[3]=REVERSE[3]-1; 
				}
			}
		}		
	}
}


void intsvr1(void)  interrupt 2 using 2
{
	if (STATE==5)
	{	
		CLOCK[2]=CLOCK[2]+1;
		if (CLOCK[2]==60) CLOCK[2]=0; 
	}
	if (STATE==6)
	{	
	CLOCK[3]=CLOCK[3]+1;
	if (CLOCK[3]==24) CLOCK[3]=0; 
	}
}

void timer1(void)  interrupt 3 using 3
{
	if (STATE==0)
	{
		if (RST)
		{	
			SECOND[0]=0;
			SECOND[1]=0;
			L1=1;
			RST=0;	
		}
		
	else 
		{
			if (SND) TR2=1;
	else  
		{	
			L1=1;
			TR2=0;
			RST=1;
			}
			SND=!SND;	
		}
	}
	
	else if (STATE==1)
		{
		REVERSE[2]=REVERSE[2]+1;
		if (REVERSE[2]==60) REVERSE[2]=0; 
		}
	
else if (STATE==2)
	{
		REVERSE[3]=REVERSE[3]+1;
		if (REVERSE[3]==24) REVERSE[3]=0;	
	}
	
else 
	{
		if (STP) 
		{	
			BEEP=1;
			L2=1;
			STP=0;  
		}
		else TR2=0;	
	}
}


void main(void)
{
	uchar stabak;				/*上一次程序运行的状态*/
	P1=0x0f;
	EA=1; IT1=1; ET0=1;
	
	TMOD=0x61;				/*T1方式2计数，T0方式1计时*/
	TH0=-5000/256; TL0=-5000%256;
	TH1=0xff; TL1=0xff;
	T2CON=0; TH2=-5000/256; TL2=-5000%256;
	
	K0=1; K1=1; K2=1;
	STATE=P1&0x07;
	stabak=STATE;
		
	for (;;)
	{	
	switch (STATE)
		{
		case 0:					/*STATE=0,秒表*/
			{
				EX1=0; ET1=1; ET2=1; TR1=1;  SND=1;
				L1=1; L0=0; L2=0;
				SECOND[0]=0;
				SECOND[1]=0;
			} break;
			
		case 1:					/*STATE=1,倒计时分调整*/
			{
				EX1=0; ET1=1; ET2=1; TR1=1; TR2=0;
				L2=1; L0=0; L1=0;
				REVERSE[0]=0;
				REVERSE[1]=0;
			} break;
			
		case 2:					/*STATE=2,倒计时小时调整*/
			{
				EX1=0; ET1=1; ET2=1; TR1=1; TR2=0;
				L2=1; L0=0; L1=0;
				REVERSE[0]=0;
				REVERSE[1]=0;
			} break;
			
		case 3:					/*STATE=3,倒计时运行*/
			{
				EX1=0; ET1=1; ET2=1; TR1=1; 
				if ((REVERSE[2]==0)&&(REVERSE[3]==0)) L2=1;
				else TR2=1;
				L0=0; L1=0;
			} break;
			
		case 5:					/*STATE=5,时钟分调整*/
			{
				IE1=0; EX1=1; ET1=0; ET2=1; TR0=0; 
				L0=1; L1=0; L2=0;
			} break;
			
		case 6:/*STATE=6,时钟时调整*/
			{
				IE1=0; EX1=1; ET1=0; ET2=1; TR0=0; 
				L0=1; L1=0; L2=0;
			} break;
			
		default:					/*STATE=4 or 7,时钟运行*/
			{
				EX1=0; ET1=0; ET2=1; TR0=1;
				L1=0; L2=0;
			}
		}
		
	while (STATE==stabak) 
		{
			switch (STATE)
				{
				case 0:				/*STATE=0,秒表*/
				{
					BUFFER[0]=SECOND[0];
					BUFFER[1]=SECOND[1];
				} break;
				
				case 1:				/*STATE=1,倒计时分调整*/
				{
					BUFFER[0]=REVERSE[2];
					BUFFER[1]=101;/*A-*/
				} break;
				
				case 2:				/*STATE=2,倒计时小时调整*/
				{
					BUFFER[0]=110;/*-A*/
					BUFFER[1]=REVERSE[3];
				} break;
				
				case 3:				/*STATE=3,倒计时运行*/
				{					
					BUFFER[0]=REVERSE[2];
					BUFFER[1]=REVERSE[3];
				} break;
				
				case 5:				/*STATE=5,时钟分调整*/
				{
					BUFFER[0]=CLOCK[2];
					BUFFER[1]=101;/*A-*/
				} break;
				
				case 6:				/*STATE=6,时钟时调整*/
				{
					BUFFER[0]=110;/*-A*/
					BUFFER[1]=CLOCK[3];
				} break;
				
				default:				/*STATE=4 or 7,时钟运行*/
				{
					BUFFER[0]=CLOCK[2];
					BUFFER[1]=CLOCK[3];				
				}
			}
			
			display();
			K0=1; K1=1; K2=1;
			STATE=P1&0x07;			
		}
		stabak=STATE;
	}	
}