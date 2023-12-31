//24c08地址为0xa0
#include <reg52.h>
#define uchar unsigned char 
unsigned char code table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90}; 
unsigned char sec=0; //定义计数值,每过1秒,sec加1   
unsigned int count; //定时中断次数	  
bit  write=0; //写24C08的标志;
sbit gewei=P3^7; //个位选通定义	     
sbit shiwei=P3^6; //十位选通定义     
/////////24C08读写驱动程序////////////////////
sbit scl=P2^2; // 24c08 SCL		     
sbit sda=P2^3; // 24c08 SDA	
sbit K1=P1^0;  //清0按键	     

/***********************************************/
void delay()   //delay 5us
{ ;; }

/**********************************************/
void delay1(uchar x)
{
	uchar a,b;
	for(a=x;a>0;a--)
	 for(b=100;b>0;b--);
}
/**********************************************/
void start()  //开始信号
{	
	sda=1;
	delay();
	scl=1;
	delay();
	sda=0;
	delay();
}

/************************************************/
void stop()   //停止信号
{
	sda=0;
	delay();
	scl=1;
	delay();
	sda=1;
	delay();
}
/**************************************************/
void respons()  //应答
{
	uchar i;
	scl=1;
	delay();
	while((sda==1)&&(i<250))i++;
	scl=0;
	delay();
}

/**************************************************/
void init_24c08()  //初始化24C02
{
	sda=1;
	delay();
	scl=1;
	delay();
}
/************************************************/
void write_byte(uchar date)
{
	uchar i,temp;
	temp=date;
	for(i=0;i<8;i++)
	{
		temp=temp<<1;
		scl=0;
	    delay();
		sda=CY;
		delay();
		scl=1;
		delay();
	//	scl=0;
     // delay();
	}
	scl=0;
	delay();
	sda=1;
	delay();
}
/**********************************************/
uchar read_byte()
{
	uchar i,k;
	scl=0;
	delay();
	sda=1;
	delay();
	for(i=0;i<8;i++)
	{
		scl=1;
		delay();	
		k=(k<<1)|sda;
		scl=0;
		delay();	
	}
	return k;
}

/*****************************************************************/

void write_24c08(uchar address,uchar shuju) //给指定地址中写入数据
{
	start();
	write_byte(0xa0);    //  最低位为0写，1读
	respons();
	write_byte(address);
	respons();
	write_byte(shuju);
	respons();
	stop();
}

/*****************************************************************/
uchar read_24c08(uchar address) //从24c08指定地址中读出数据 
{
	uchar date;
	start();
	write_byte(0xa0);
	respons();
	write_byte(address);
	respons();

	start();
	write_byte(0xa1);
	respons();
	date=read_byte();
	stop();
	return date;
}

/////////////24C02读写驱动程序完/////////////////////


/***********************************************************/
void LEDshow() //LED显示函数    
{
	
    P0=table[sec/10]; 
    shiwei=0; 
	delay1(40); 
	shiwei=1;

	P0=table[sec%10];
    gewei=0; 
	delay1(40); 
	gewei=1;	
}

/***********************************************************/
void main(void) 
{ 

	init_24c08(); //初始化24C08
	sec=read_24c08(2);//读出保存的数据赋于sec
	   sec++;
			write_24c08(2,sec); //在24c08的地址2中写入数据sec	   
		while(1){

		LEDshow();

		  if(K1==0){
		  	delay1(10);
			if(K1==0){
			  sec=0;
			 write_24c08(2,0); //在24c08的地址2中写入数据sec
			}
	  }
		}
}


/**************************************************************/

