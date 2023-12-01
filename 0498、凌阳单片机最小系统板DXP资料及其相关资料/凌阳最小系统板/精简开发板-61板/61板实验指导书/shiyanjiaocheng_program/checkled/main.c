//===============================================================
//
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//
//    The entire notice above must be reproduced on all authorized copies.
//
//==============================================================
//============================================================
//  工程名称： checkled.scs
//  功能描述:  LED模组自检程序
//  文件来源：《61板实验教程》"LED模组自检程序"
//  硬件连接： IOA低8位接至SEG接口控制LED的导通,IOA高8位接至1*8接口获取键盘的状态值
//             IOB低8位连至DIG通过ULN2003A控制8个LED的共阴极电平状态和数码管驱动
//             1*8KEY中ROW1直接连至gnd,2*4KEY中D_DP接高电平
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	main.c
//
//  日期:  2004/8/23
//===============================================
//*****************************************************************************/
// 文件名称： main.c
// 实现功能： 用C实现LED模组自检功能 
//            发光二极管循回点亮并数码管计数（LED巡回闪烁，同时数码管从左至右显示0~8，
//                                  全部显示完成后，LED停止闪烁，数码管全亮，之后全灭）
//            之后人为按8个按键，顺序自选，按键相对应的数码管将点亮，8次检测结束后，二极管全亮
//            以上功能完成说明LED模组功能完全正常
// 日期： 2004/8/23
//*****************************************************************************/
#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008
#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define KEY_ALL 0xff00		

int Led_Disp(unsigned int Led, unsigned int Loop);
unsigned int GetKey(void);
	                                                        //显示段码存放区
int DispTbl[10] = { 0x003F,0x0006,0x005B,0x004F,0x0066,		//0，1，2，3，4
			        0x006D,0x007D,0x0007,0x007F,0x00FF};	//5，6，7，8，全亮
	
unsigned int LedControl = 0x0001;     	
//============================================================= 
// 函数名称:    int main()  
// 日期：		20040823
// 功能描述:    LED键盘模组自检程序
// 语法格式:    int main() 
// 入口参数:    无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=============================================================
int main()
{
	int Loop_Numb = 0x0000;        //循环次数
	int Led_Numb = 0x0000;         //显示数字个数	
	unsigned int Key = 0x0000;
	int  time = 0;
	int i=0;
		
    *P_IOA_Dir = 0x00ff;           //设置A口低8位为同向低输出，控制LED和数码管的显示状态
	*P_IOA_Attrib = 0x00ff;        //设置A口高8位为同向高输入，获取按键的状态值
	*P_IOA_Data = 0xff00;
    *P_IOB_Dir = 0x00ff;           //设置B0~B7口为同相低电平输出，LED和数码管的片选
	*P_IOB_Attrib = 0x00ff;
	*P_IOB_Data = 0x0000;
		
	for (Loop_Numb = 0; Loop_Numb < 6; Loop_Numb++)
	{
	      *P_IOB_Data = LedControl << Loop_Numb; //对应数码管显示0
	      *P_IOA_Data = DispTbl[0];    
	      Delay();
	      
	      for (Led_Numb = 0; Led_Numb<8; Led_Numb++)
	      {
	          Led_Disp(Led_Numb, Loop_Numb);     //点亮发光二极管并显示数字1~8	      
	      }
	}
	
	*P_IOB_Data = 0x00bf;                        //数码管全亮
	*P_IOA_Data = DispTbl[9]; 
	  
    Delay();
    
    *P_IOB_Data = 0x00bf;                        //数码管全灭
	*P_IOA_Data = 0x0000;   
    Delay();  
    
    *P_IOB_Data = 0x0040;                
    for(time = 0; time < 8; time++)              //按键点亮发光二极管
	{
	    Key = GetKey();                          //取键值
	    Key = Key >> 4;                          //取发光二极管显示值
	    Key = Key >> 4;                     
        *P_IOA_Data = Key;                       //发光二极管点亮并延时
        i++;
        Delay();
        Delay();
	}  

	*P_IOA_Data &= 0xff00;                       //发光二极管全灭
	Delay();
	*P_IOA_Data |= 0x00ff;                       //发光二极管全亮
	while(1)
	    Delay();
}

//============================================================= 
// 函数名称:    void Delay()  
// 日期：		20040819		
// 功能描述:    延时并清看门狗
//=============================================================
int Delay() 
{
    int DelayValue = 0;
    
    for (DelayValue = 0; DelayValue < 0x2000; DelayValue++)
        *P_Watchdog_Clear = 1;
}
//============================================================= 
// 函数名称:    void Led_Disp()  
// 日期：		20040819		
// 功能描述:    发光二极管循回点亮并数码管计数
// 入口参数:    Led 点亮的发光二极管号码，Loop 显示对应数字的数码管号码
//=============================================================
int Led_Disp(unsigned int Led, unsigned int Loop) 
{
	*P_IOB_Data = 0x0040;               //LED点亮
	*P_IOA_Data = LedControl << Led;    
	Delay();
	
	*P_IOB_Data = LedControl << Loop;   //对应数字显示在数码管上
	*P_IOA_Data = DispTbl[Led + 1];    
	Delay();
}

//============================================================= 
//	函数名称:   GetKey()
//	日期：		20040816
//	功能描述:	等待直到有键按下并抬起，返回键值，没有去抖处理
//	输入：		无
//	输出：		返回16位键值
//=============================================================
unsigned int GetKey(void)          //使用IOA8~IOA15作为键盘输入口
{
	unsigned KeyValue=0;

	//初始化IOA的相应端口为上拉输入
	*P_IOA_Dir &= ~KEY_ALL;
	*P_IOA_Attrib &= ~KEY_ALL;
	*P_IOA_Buffer |= KEY_ALL;
	
	//等待有键按下，即有端口变为0
	//while(!(((*P_IOA_Data) & KEY_ALL) ^ KEY_ALL))
	//{	
	//	*P_Watchdog_Clear=1;		//清看门狗
	//}
	
	while(KeyValue==0)
	{
		KeyValue=(*P_IOA_Data & KEY_ALL)^KEY_ALL;
		*P_Watchdog_Clear=1;
	}
	
	KeyValue = ((*P_IOA_Data) & KEY_ALL) ^ KEY_ALL;
	//等待按键抬起
	while(((*P_IOA_Data)&KEY_ALL)^KEY_ALL)
	{
		*P_Watchdog_Clear=1;
	}
	return KeyValue;
}
//============================================================= 
// main.c 结束
//=============================================================	