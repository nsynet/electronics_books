#include <iom128.h>
/********************************************************************
                数据类型定义
*********************************************************************/
#define uchar unsigned char 
#define uint unsigned int
/********************************************************************
                数码管段码定义0123456789
*********************************************************************/
uchar Table[16]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e };	 //所需的段的位码
uchar k;           
/**********************************************************************
				  MS级延时函数程序，参数i 延时时间					   	
**********************************************************************/
void DelayMS(uint i)
{
uint j;
for(;i!=0;i--)
{
for(j=800;j!=0;j--);
}
}
/**********************************************************************
                矩阵键盘函数
*********************************************************************/  
void Getch ( )
{ 
unsigned char X,Y,Z;
DDRF=0xF0;
PORTF=0x0F;
if(PINF!=0x0F) //判断是否有键按下
{
DelayMS(1); //延时,软件去干扰
if(PINF!=0x0F) //确认按键按下
{
X=PINF|0xF0;
DelayMS(1);
DDRF=0x0f;
PORTF=0xf0;
if(PINF!=0xf0) //判断是否有键按下
{
DelayMS(1); //延时,软件去干扰
if(PINF!=0xf0) //确认按键按下
{
Y=PINF|0x0F;
Z=X&Y; //取出键值
switch ( Z ) //判断键值（那一个键按下）
{
case 0xee: k=0; break; //对键值赋值
case 0xde: k=1; break;
case 0xbe: k=2; break;
case 0x7e: k=3; break;
case 0xed: k=4; break;
case 0xdd: k=5; break;
case 0xbd: k=6; break;
case 0x7d: k=7; break;
case 0xeb: k=8; break;
case 0xdb: k=9; break;
case 0xbb: k=10;break;
case 0x7b: k=11;break;
case 0xe7: k=12;break;
case 0xd7: k=13;break;
case 0xb7: k=14;break;
case 0x77: k=15;break;
} } } }}} //请注意写程序时的格式规范，此处是为了节省纸张  
//////////////////////////////初始化////////////////////////////////////
void Init_IO(void)//初始化I/O
{
//设置D口为输出
DDRD=0xFF;
PORTD=0xFF;
//设置E口为输出
DDRE=0xFF;
PORTE=0xFF;
//设置F口为输入
DDRF=0x00;
PORTF=0xff;

}

/**********************************************************************
				           主函数						  	
**********************************************************************/
void main(void)
{
Init_IO();  //初始化I/O
while(1)
{
Getch();
PORTD=Table[k]; //查表LED输出
PORTE=0x0f; //输出相同的四位数据//仿真

}
}
/**********************************************************************
				            结束				  	
**********************************************************************/

