#include <reg51.h>
#include <absacc.h>
#define uchar unsigned char
#define uint unsigned int
void delays(void);
uchar kbscan(void);
main()
{

	bit CRT; 						/*密码正确标志，=1密码正确*/
	bit PRT; 						/*密码部分输入标志，=1密码部分输入*/
	uchar COUNT; 					/*计数单元，存放密码正确的位数*/
	uchar KEY; 					/*被按下的键的编码*/

	CRT=0;
	PRT=0;
	COUNT=0;
KEY=kbscan();					/*键扫描函数*/
delays();						/*键消抖的延时函数*/
	switch (KEY)
	{
		case 0xb7: 				/*0键*/
		{
			if (CRT) 
			{
				
			}
			else								/*密码不正确时*/
			{
				if (PRT) 						/*部分密码正确时*/
				{
					COUNT=COUNT+1; 			/*密码正确的位数加1*/
					if (COUNT==3)				/*密码所有位都正确*/
					{
						CRT=1;
						PRT=0;
						COUNT=0;
					}					
				}
			}
		}; break;				
		case 0x7e: 								/*1键*/
		{
			if (CRT) 
			{
									/*密码正确时的操作内容*/
			}
			else 								/*密码不正确时*/
			{
				PRT=0;
				COUNT=0;
			}
		}; break;
		case 0xbe: 							/*2键*/
		{
			if (CRT) 
			{
								/*密码正确时的操作内容*/
			}
			else 							/*密码不正确时*/
			{
				if (PRT) 					/*部分密码正确时，说明密码错误*/ 
				{
					PRT=0;
					COUNT=0;
				}
				else 						/*密码正确位数为0时，说明密码第一位正确*/
				{
					PRT=1;
					COUNT=1;
				}
			}
		}; break;				
		case 0xd7: 						/*#键*/
		{
			if (CRT) 						/*密码正确时，锁定键盘*/
			{
				CRT=0;
				PRT=0;
				COUNT=0;
			}
		}; break;
					
		
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


