#include <stdio.h>
#include <absacc.h>
#include <reg51.h>                          
/* define variable type */
#define uchar unsigned char
void INITIAL(void);					/*液晶显示初始化*/
void CLEAR(void);					/*液晶显示清屏*/
void locate(uchar page, column);			/*指定首字符显示位置*/
void KEY(void);						/*按键识别*/
void show(void);					/*从当前位置开始显示显示缓冲区BUFFER中的内容*/
char data 	BUFFER[15];				/*显示缓冲区*/
uchar data 	NDIG;					/*待显示的字符数*/
uchar data 	KEYSTATE;				/*键值*/
/*存放每个键被按下的次数*/
int xdata 	k1=0,k2=0,k3=0,k4=0,k5=0,k6=0,k7=0,k8=0;
int xdata	k9=0,k0=0,kx=0,kj=0,km1=0,km2=0,km3=0,km4=0;
int xdata 	sumup=0;					/*测试用的变量*/

/* main()主函数， 初始化变量和液晶的初始显示内容。*/
void main(void)
{	
uchar i;
	INITIAL();						/*显示初始化*/
	CLEAR();						/*清屏*/
	/*从page 3，column 4开始显示"sumup=rdy"*/
	/*固定长度的字符串显示*/
	locate(3,4);
	NDIG=sprintf(BUFFER,"sumup=rdy");
	show();						/*显示子函数*/
	sumup=12345;
	/*从page 2，column 4开始显示"sumup=12345"，为含数值的长度不确定的字符串显示*/
	locate(2,4);
	NDIG=sprintf(BUFFER,"sumup=%d",sumup);
	show(); 						/*显示子函数*/
	/*按键查询方式显示初始内容*/
	for (;;)
	{
		KEY();					/*按键识别*/
		while (KEYSTATE)			/*有键被按下时，根据键值处理*/
		{
			switch (KEYSTATE)
			{				
				case 0xb7: k0+=1; break;			/*0*/
				case 0x7e: k1+=1; break;			/*1*/
				case 0xbe: k2+=1; break;			/*2*/
				case 0xde: k3+=1; break;			/*3*/
				case 0x7d: k4+=1; break;			/*4*/
				case 0xbd: k5+=1; break;			/*5*/
				case 0xdd: k6+=1; break;			/*6*/
				case 0x7b: k7+=1; break;			/*7*/
				case 0xbb: k8+=1; break;			/*8*/
				case 0xdb: k9+=1; break;			/*9*/
				case 0xee: km1+=1; break;			/*m1*/
				case 0xed: km2+=1; break;			/*m2*/
				case 0xeb: km3+=1; break;			/*m3*/
				case 0xe7: km4+=1; break;			/*m4*/
				case 0x77: kx+=1; break;			/***/
				case 0xd7: kj+=1; break;			/*#*/
			}
			KEYSTATE=0;
		}
		locate(0,2); 				/*从page 0，column 2开始显示"k1:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k1:%d    ",k1);
		show();
		locate(0,32);				/*从page 0，column 32开始显示"k2:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k2:%d    ",k2);
		show();
		locate(0,62); 				/*从page 0，column 62开始显示"k3:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k3:%d    ",k3);
		show();
		locate(0,92); 				/*从page 0，column 92开始显示"k4:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k4:%d    ",k4);
		show();
		locate(1,2); 				/*从page 1，column 2开始显示"k5:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k5:%d    ",k5);
		show();
		locate(1,32); 				/*从page 1，column 32开始显示"k6:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k6:%d    ",k6);
		show();
		locate(1,62); 				/*从page 1，column 62开始显示"k7:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k7:%d    ",k7);
		show();
		locate(1,92); 				/*从page 1，column 92开始显示"k8:<被按下的次数>"*/
		NDIG=sprintf(BUFFER,"k8:%d    ",k8);
		show();
	}
}
