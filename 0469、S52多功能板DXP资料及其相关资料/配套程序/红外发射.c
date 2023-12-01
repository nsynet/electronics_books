/*********************************************
备注：程序参考借鉴：电子工程师之家 www.eehome.cn 
一线工人 的比较经典的自制红外电视遥控器（EE01学习板演示程序）
系统连线图：
           1--a--20	  ->VCC
	key1   2--t--19	  ->>IR sendout
	key2   3--8--18
		   4--9--17
		   5--c--16
	key3   6--2--15
	key4   7--0--14
		   8--5--13
		   9--1--12
		   10-*--11

//发送端有发送信号，接收端解码后为低电平
*********************************************/


#include <reg52.h>
#define uint unsigned int
#define uchar unsigned char
#define data1 59 //编码数据1长度
#define data0 18  //编码数据0长度
bit irout;//红外管状态标志位
sbit ir=P3^5;//红外发射管控制脚
sbit P1_4=P1^4;
uint count, set_count;//中断计数，设定中断次数
bit flag,keyflag;//红外发送标志,按键标志位
uchar irsys[4]={0x1a,0xa1,0xdc,0x03};//26位系统码，最后一个字节只用2位
uchar ircode,irdata ,temp;

/**************新延时子程序12M*****************/
void delay(uint z)//延时1ms，软件仿真为1.002毫秒
  {
    uint x,y;
    for(x=z;x>0;x--)
        for(y=123;y>0;y--);
}

/******************晶振22.1184M*****************
  原延时1ms
***********************************************

void delay(uint z)//延时1ms，原延时子程序11.0592时软件仿真为为两毫秒
  {
    uint x,y;
    for(x=z;x>0;x--)
        for(y=225;y>0;y--);
}

/**********************************************
  按键扫描
**********************************************/
  
 
void keyscan(void)
{  
 P1=0xff; 
      P1_4=0; 
      temp=P1; 
      temp=temp & 0x0f; 
      if (temp!=0x0f) 
        {  delay(10);
          temp=P1; 
          temp=temp & 0x0f; 
          if (temp!=0x0f) 
            { temp=P1; 
              temp=temp & 0x0f; 
			    keyflag=1;//有按键标志
               switch(temp) 
                {    case 0x0e:irdata=1;break;//按键1对应该遥控器P+的键值
                     case 0x0d:irdata=7;break;//按键2对应该遥控器P-的键值
                        case 0x0b:irdata=10;break;//按键3对应该遥控器VOL+的键值
                       case 0x07:irdata=18;break;//按键4对应该遥控器VOL-的键值
                }
			  }
 			 }
			}

    
    
    

 
/*****************发送8位红外数据******************
  0-	 -----	  1-	 ------------
    -----	  --	-----			 --
    0.56 0.56		 0.56   1.69	  (us)
****************************************************/
void sendcode_8(void)
{ 

  uchar i;
  for(i=0;i<8;i++)	//按由低到高位依次发送
  {
  set_count=16;//发送0.56ms  38k红外波
  flag=1;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;	 
  if(ircode&0x01)  //依次判断红外编码最低位
  {
    set_count=data1;  //1为宽的高电平
    }
  else
    {
      set_count=data0;	//0为窄的高电平
    }
  flag=0;
  count=0;
  TR0=1;	 //启动定时器 ，开始计数
  while(count<set_count);
  TR0=0;
  ircode=ircode>>1;
  }
}


/*******************************************
  发送2位红外数据
*******************************************/
void sendcode_2(void)//前26位系统码最后两位
{ 

  uchar i;
  for(i=0;i<2;i++)
  {
  
  set_count=16;
  flag=1;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;
  if(ircode&0x01)
  {
    set_count=data1;
    }
  else
    {
      set_count=data0;
    }
  flag=0;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;
  ircode=ircode>>1;
  }
}

/*******************************************
  发送红外数据
*******************************************/
void sendcode(void)
{

set_count=326;//发送9ms （！=13us*575）38K红外光 ,需要校准
flag=1;		  //启动发送
count=0;	  //初始化中断计数
TR0=1;		  //启动定时器
while(count<set_count);
TR0=0;		  //关闭定时器

set_count=170;//停止发送/间隔4.5ms （！=13us*320） 38K红外光
flag=0;		  //关闭发送
count=0;
TR0=1;		  
while(count<set_count);
TR0=0;

ircode=irsys[0];//发送26位系统码的前1-8位
sendcode_8();  
ircode=irsys[1];//发送26位系统码的前9-16位
sendcode_8();
ircode=irsys[2];//发送26位系统码的前17-24位
sendcode_8();
ircode=irsys[3];//发送26位系统码的前24-26位
sendcode_2();

ircode=irdata;//发送8位数据码
sendcode_8(); 
ircode=~irdata; //发送8位数据反码
sendcode_8();

  set_count=16;//发送0.56ms  38k红外波
  flag=1;
  count=0;
  TR0=1;
  while(count<set_count);
  TR0=0;

ir=1;	   //发送23ms 38K红外光
delay(23); //延时23ms

set_count=326;//发送9ms 38k红外波
flag=1;
count=0;
TR0=1;
while(count<set_count);
TR0=0;

set_count=170;//停止发送/间隔4.5ms
flag=0;
count=0;
TR0=1;
while(count<set_count);
TR0=0;

set_count=16;//发送0.56ms  38k红外波
flag=1;
count=0;
TR0=1;
while(count<set_count);
TR0=0;
ir=1;

}

/*******************************************
  定时器初始化
*******************************************/
void init_timer()
{
  EA=1;		 //开启中断
  TMOD=0X02;//8位自动重载模式
  ET0=1;
  TH0=0XF3;//定时13us,38K红外波，晶振12 0XF3
  TL0=0XF3;
}


/*******************************************
  原定时器初始化
*******************************************
void init_timer()
{
  EA=1;
  TMOD=0X02;//8位自动重载模式
  ET0=1;
  TH0=0XE8;//定时13us(13.0208),38K红外波，晶振22.1184,
  TL0=0XE8;
}

/*******************************************
  主函数
*******************************************/
void main(void)
{
  init_timer();	//初始化定时器
  count=0;	 //初始化中断计数器
  flag=0;	 //发送标志为0
  irout=1;	 //关闭发送
  delay(23); //延时测试
  delay(1);  //新延时子程序
  while(1)
  {
    keyscan();	//键盘扫描
    if(keyflag)//若有新按键
    {
    delay(10);	//延时10ms去抖
    sendcode();//发送红外编码
    delay(500);
    keyflag=0;//按键标志清零
    }
  
}
}
  

/*******************************************
  定时器中断
*******************************************/

void timer0(void) interrupt 1
{
count++;
if(flag==1)
{
  irout=~irout;	 ////低电平发送
}
else
  {
    irout=1;   //高电平不发送
  }
ir=irout;
}