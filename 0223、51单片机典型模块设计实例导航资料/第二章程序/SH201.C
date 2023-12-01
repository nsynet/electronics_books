#include <reg51.h>
#include <absacc.h>
#define uchar unsigned char
#define uint unsigned int
void delays(void);
uchar kbscan(void);
void main(void)
{
uchar key;
while(1)
{ 
key=kbscan();				/*键扫描函数*/
delays();					/*键消抖的延时函数*/
}
}

// 键消抖的延时函数
void delays(void)
{
uchar i;
for(i=300;i>0;i--);
}

//  kbscan(void) 键扫描函数
uchar kbscan(void)  
{
uchar sccode,recode;
P1=0xf0;								/*发全"0"行扫描码，列线输入*/
if((P1&0xf0)!=0xf0)						/*若有键按下*/
{
delays();    						/*延时去抖动*/
if((P1&0xf0)!=0xf0)
{
sccode=0xfe;					/*逐行扫描初值*/
while((sccode&0x10)!=0)
{
P1=sccode;					/*输出行扫描码*/
if((P1&0xf0)!=0xf0)    		/*本行有键按下*/
{
recode=(P1&0xf0)|0x0f;
return((~sccode)+(~recode)); /*返回特征字节码*/
}
else sccode=(sccode<<1)|0x01;	/*行扫描码左移一位*/
}
}
}
return(0);								/*无键按下，返回值为0*/
} 

