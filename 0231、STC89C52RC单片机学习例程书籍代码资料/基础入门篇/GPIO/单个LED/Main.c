/*
 ----------------------------------------------------
 *作    者：温子祺
 ----------------------------------------------------
 */
#include "stc.h"           //加载stc.h头文件

sbit Led0=P2^0;            //定义位变量Led0

/****************************************
*函数名称:Delay
*输    入:无
*输    出:无
*功    能:延时一小段时间 
******************************************/
void Delay(void)           //软件延时函数(500ms)
{
	unsigned char i,j;     //声明变量i,j

	for(i=0;i<255;i++)     //进行循环操作,以达到延时的效果
		for(j=0;j<255;j++);

	for(i=0;i<255;i++)	   //进行循环操作,以达到延时的效果
		for(j=0;j<255;j++);

	for(i=0;i<255;i++)     //进行循环操作,以达到延时的效果
		for(j=0;j<140;j++);

}
/****************************************
*函数名称:main
*输    入:无
*输    出:无
*功    能:函数主体
******************************************/
void main(void)            //主函数,程序是在这里运行的
{

	P2=0xFF;               //P2口置高电平即所有LED灯熄灭

	while(1)               //进入死循环
	{

        Led0=1;          //Led0灭
		Delay();         //延时	
        Led0=0;          //Led0亮
		Delay();         //延时

    }
}
