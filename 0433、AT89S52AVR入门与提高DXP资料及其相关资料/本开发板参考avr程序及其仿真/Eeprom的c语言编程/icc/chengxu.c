#include <iom16v.h>
#include <macros.h> 
#define uchar unsigned char
#define uint  unsigned int
/**********************************************************************
								定义数组								   	
**********************************************************************/
//数码管字型表，对应0，1，2，3，4，5，6，7，8，9，A,B,C,D,E,F//
uchar Table[16]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
                 0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
uchar Read_Data[4];            //定义读出4字节数据
/**********************************************************************
								延时函数								   	
**********************************************************************/
void DelayMs(uint i)           //Ms级延时，参数i为延时时间
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}
/**********************************************************************
								动态显示函数								   	
**********************************************************************/
void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
{uchar i,sel=0x01;           
 for(i=0;i<4;i++)
  {PORTC=sel;                  //选通最右边的数码管
   PORTA=0xff-Table[p[i]];     //送字型码
   DelayMs(1);                 //显示延时    
   sel=sel<<1;                 //移位以显示前一位
  }
}
/**********************************************************************
								初始化I/O口								   	
**********************************************************************/
void Init_IO(void)             //初始化I/O口
{DDRA=0xff;                    //设置A口为推挽1输出
 PORTA=0xff;
 DDRC=0xff;                    //设置C口为推挽1输出             
 PORTC=0xff;
}
/**********************************************************************
		  写一字节到EEPROM数据	
		参数：Date：写入的数据；  
		    Address:写入的地址					   	
**********************************************************************/
void Write_EEPROM(uchar Data,uint Address)
{if(EECR&0x20) DelayMs(4);//判断写使能是否为0
 EEARH=Address>>8;        //送高地址
 EEARL=Address&0x00ff;    //送低地址
 EEDR=Data;               //送数据
 EECR=EECR|0x04;          //主写使能置位
 EECR=EECR|0x02;          //写使能置位
 DelayMs(4);              //延时（写入时间约在2.5ms~4ms）
}
/**********************************************************************
			读一字节到EEPROM数据	
		参数:Address：写入的地址；返回值：读取的内容							   	
**********************************************************************/
uchar Read_EEPROM(uint Address)
{uchar i;
 if(EECR&0x01) DelayMs(4);//判断读使能是否为0
 EEARH=Address>>8;        //送高地址
 EEARL=Address&0x00ff;    //送低地址
 EECR=EECR|0x01;          //读使能置位
 DelayMs(5);              //延时
 i=EEDR;                  //读数据
 return(i);
}
/**********************************************************************
								主函数								   	
**********************************************************************/
void main(void)
{uchar i;
 Init_IO();                    //初始化I/O口
 PORTA=0x00;                   //点亮以测试所有的数码管
 PORTC=0xff;   
 DelayMs(300);                 //延时
 PORTC=0xff;                   //熄灭所有的数码管
 for(i=0;i<4;i++)              //写四位数据：0x00、0x04、0x08、0x0c
    Write_EEPROM(4*i,i);       //写四位数据：0x00、0x04、0x08、0x0c
 for(i=0;i<4;i++)
    Read_Data[i]=Read_EEPROM(i);//读出四位数据
 while(1)
 Display(Read_Data);            //显示四位数据 048c
 }
/**********************************************************************
								程序结束								   	
**********************************************************************/