//实例92：对SPI总线上挂接多个X5045的读写操作
#include<reg51.h>    //包含单片机寄存器的头文件
#include<intrins.h>  //包含_nop_()函数定义的头文件
sbit SCK=P3^4;       //将SCK位定义为P3.4引脚
sbit SI=P3^5;        //将SI位定义为P3.5引脚
sbit SO=P3^6;        //将SO位定义为P3.6引脚
sbit CS1=P3^7;        //将CS定义为P3.7引脚
sbit CS2=P3^3;        //将CS1位定义为P3.7引脚
#define WREN 0x06    //写使能锁存器允许
#define WRDI 0x04    //写使能锁存器禁止
#define READ 0x03    //读出
#define WRITE 0x02   //写入
/*****************************************************
函数功能：延时1ms
(3j+2)*i=(3×33+2)×10=1010(微秒)，可以认为是1毫秒
***************************************************/
void delay1ms()
{
   unsigned char i,j;	
	 for(i=0;i<10;i++)
	  for(j=0;j<33;j++)
	   ;		 
 }
 /*****************************************************
函数功能：延时若干毫秒
入口参数：n
***************************************************/
 void delaynms(unsigned char n)
 {
   unsigned char i;
	for(i=0;i<n;i++)
	   delay1ms();
 }
/*****************************************************
函数功能：从X5045的当前地址读出数据
出口参数：x
***************************************************/
unsigned char ReadCurrent(void)
{
  	unsigned char i;
	unsigned char x=0x00;      //储存从X5045中读出的数据
	SCK=1;                     //将SCK置于已知的高电平状态
   for(i = 0; i < 8; i++)
	{
	   SCK=1;                 //拉高SCK
	   SCK=0;                 //在SCK的下降沿输出数据	
	   x<<=1;  //将x中的各二进位向左移一位，因为首先读出的是字节的最高位数据	   
		x|=(unsigned char)SO;  //将SO上的数据通过按位“或“运算存入 x      
	}
	return(x);   //将读取的数据返回
 }
/*****************************************************
函数功能：写数据到X5045的当前地址
入口参数：dat
***************************************************/
void WriteCurrent(unsigned char dat)
{
   unsigned char i;
	SCK=0;                 //将SCK置于已知的低电平状态
  for(i = 0; i < 8; i++)  // 循环移入8个位
	{
	 SI=(bit)(dat&0x80);   //通过按位“与”运算将最高位数据送到S
		                    //因为传送时高位在前，低位在后
	 SCK=0;
	 SCK=1;               //在SCK上升沿写入数据
    dat<<=1;   //将y中的各二进位向左移一位，因为首先写入的是字节的最高位
  }
}
/*****************************************************
函数功能：写数据到第一个X5045的指定地址
入口参数：addr
***************************************************/
void WriteSet1(unsigned char dat,unsigned char addr)
{
   CS2=1;                 //使第二个X5045的片选无效
   SCK=0;                 //将SCK置于已知状态
   CS1=0;                  //拉低CS，选中X5045
	WriteCurrent(WREN);    //写使能锁存器允许
	CS1=1;                  //拉高CS
   CS1=0;                  //重新拉低CS，否则下面的写入指令将被丢弃
	WriteCurrent(WRITE);   //写入指令
	WriteCurrent(addr);    //写入指定地址
	WriteCurrent(dat);     //写入数据
	CS1=1;                  //拉高CS
   SCK=0;                 //将SCK置于已知状态
}
/*****************************************************
函数功能：写数据到第二个X5045的指定地址
入口参数：addr
***************************************************/
void WriteSet2(unsigned char dat,unsigned char addr)
{
   CS1=1;                 //使第一个X5045的片选无效
   SCK=0;                 //将SCK置于已知状态
   CS2=0;                  //拉低CS，选中X5045
	WriteCurrent(WREN);    //写使能锁存器允许
	CS2=1;                  //拉高CS
   CS2=0;                  //重新拉低CS，否则下面的写入指令将被丢弃
	WriteCurrent(WRITE);   //写入指令
	WriteCurrent(addr);    //写入指定地址
	WriteCurrent(dat);     //写入数据
	CS2=1;                  //拉高CS
   SCK=0;                 //将SCK置于已知状态
}

/*****************************************************
函数功能：从第一个X5045的指定地址读出数据
入口参数：addr
出口参数：dat
***************************************************/
unsigned char ReadSet1(unsigned char addr)
{
 unsigned char dat;
 CS2=1;                 //使第二个X5045的片选无效
 SCK=0;                 //将SCK置于已知状态
 CS1=0;                  //拉低CS，选中X5045
 WriteCurrent(READ);   //开始读
 WriteCurrent(addr);   //写入指定地址
 dat=ReadCurrent();    //读出数据
 CS1=1;                 //拉高CS
 SCK=0;                //将SCK置于已知状态
 return dat;           //返回读出的数据
 }
/*****************************************************
函数功能：从第二个X5045的指定地址读出数据
入口参数：addr
出口参数：dat
***************************************************/
unsigned char ReadSet2(unsigned char addr)
{
 unsigned char dat;
 CS1=1;                 //使第一个X5045的片选无效
 SCK=0;                 //将SCK置于已知状态
 CS2=0;                 //拉低CS，选中X5045
 WriteCurrent(READ);   //开始读
 WriteCurrent(addr);   //写入指定地址
 dat=ReadCurrent();    //读出数据
 CS2=1;                //拉高CS
 SCK=0;                //将SCK置于已知状态
 return dat;           //返回读出的数据
 }
/*****************************************************
函数功能：看门狗复位程序
***************************************************/
void WatchDog1(void)
{
 CS1=1;    //拉高CS
 CS1=0;    //CS引脚的一个下降沿复位看门狗定时器
 CS1=1;    //拉高CS
}
/*****************************************************
函数功能：看门狗复位程序
***************************************************/
void WatchDog2(void)
{
 CS2=1;    //拉高CS
 CS2=0;    //CS引脚的一个下降沿复位看门狗定时器
 CS2=1;    //拉高CS
}

/*****************************************************
函数功能：主程序
***************************************************/
void main(void)
{ 
  unsigned char x;
  while(1)
  {
	  WriteSet1(0xf0,0x10);   //将数据“0xaa”写入第一个X5045的指定地址“0x10”
	  delaynms(10);           //X5045的写入周期为约10ms
	  x=ReadSet1(0x10);       //将数据从第一个X5045中的指定地址读出来
	  WriteSet2(x,0x20);     //将数据x写入第二个X5045的指定地址“0x20
	  delaynms(10);          //X5045的写入周期为约10ms
	  P1=ReadSet2(0x20);     //将数据从第二个X5045中的指定地址读出来，送P1口显示
	  delaynms(100);         //延时100ms
	  WatchDog1();          //复位第一个X5045的看门狗   
	  WatchDog2();          //复位第二个X5045的看门狗   
  } 
}

