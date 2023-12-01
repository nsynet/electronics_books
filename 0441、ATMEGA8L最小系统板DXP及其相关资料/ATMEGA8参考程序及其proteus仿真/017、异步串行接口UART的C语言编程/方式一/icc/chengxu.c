/********************************************************************
                            汇诚科技
网址：http://www.ourhc.cn
产品有售淘宝店：http://shop36330473.taobao.com   
*********************************************************************/
/********************************************************************
    计算机通过RS232接口向计算机发送1,2,3,4四个数据。单片机收
到四个数据后在数码管上动态显示出来，然后单片机向计算机发送a，b，c，d，四
个字符，使用着通过“串口调试助手 ”等软件观察数据传输过程

*********************************************************************/
#include <iom16v.h>
#include <macros.h>
/********************************************************************
                数据类型定义
*********************************************************************/
#define uchar unsigned char
#define uint  unsigned int
/********************************************************************
                数码管段码定义0123456789
*********************************************************************/
uchar Table[16]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,
                 0x7f,0x6f,0x77,0x7c,0x39,0x5e,0x79,0x71};
uchar Send_Data[]={'a','b','c','d'};//单片机向电脑发送的数据数组
uchar Receive_Data[]={0,0,0,0};	    //单片机接收到电脑的数据数组					
/**********************************************************************
				  MS级延时函数程序，参数i 延时时间					   	
**********************************************************************/            
void DelayMs(uint i)           //Ms级延时，参数i为延时时间
{uint j;
 for(;i!=0;i--)
  {for(j=8000;j!=0;j--) {;}}
}
/**********************************************************************
				            显示函数		
注意：使用开发板时sel=0xef;
**********************************************************************/
void Display(uchar *p)         //动态显示函数，参数p为待显示的数组名
{uchar i,sel=0xef;           
 for(i=0;i<4;i++)
  {PORTC=sel;                  //选通最右边的数码管
   PORTA=~Table[p[i]];          //送字型码
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
				          主函数		
**********************************************************************/
void main(void)
{uchar i;
Init_IO();
 UBRR=51;//9600bps,8MHZ,
 UCSRB=0x18;//RXD.TXD使能；
for(i=0;i<4;i++)
   {while(!(UCSRA&0x80)) 
      {Display(Receive_Data);}            //等待接收完成
    Receive_Data[i]=UDR-48;}              //接收数据
 for(i=0;i<12;i++)						  
   {while(!(UCSRA&0x20)) 				  //等待接收完成
      {Display(Receive_Data); }           //等待移位寄存器空；
    UDR=Send_Data[i];} 
 while(1)
  { Display(Receive_Data);  }
}
/**********************************************************************
				                 结束		
**********************************************************************/