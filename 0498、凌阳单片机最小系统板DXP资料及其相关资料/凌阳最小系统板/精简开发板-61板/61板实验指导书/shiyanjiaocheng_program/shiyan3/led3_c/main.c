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
//  工程名称： led3_C.scs
//  功能描述:  用C实现按键点亮发光二极管
//  文件来源：《61板实验教程》"实验三 按键点亮发光二极管“
//  硬件连接： IOA低8位接至SEG接口控制LED的导通
//             IOA高8位连接到LED键盘模组的1*8KEY接口管脚上，读取相应按键值
//             1*8key中ROW1与DGND相连，IOB6连至DIG7通过ULN2003A控制8个LED的共阴极电平状态
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	main.c
//
//  日期:  2004/8/16
//===============================================================
#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008

#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

extern unsigned GetKey(void);


//============================================================= 
// 函数名称:    int main()  
// 日期：		20040816 		
// 功能描述:    按键点亮发光二极管
// 语法格式:    int main() 
// 入口参数:    无
// 出口参数:    无
// 注意事项:    仅为用户模型
//=============================================================
int main()
{
	unsigned Key = 0x0000;
	
	
    *P_IOA_Dir = 0x00ff;         //设置A口低8位为同向低输出，高8位为同向上拉输入
	*P_IOA_Attrib = 0x00ff;
	*P_IOA_Data = 0xff00;
    *P_IOB_Dir=0x0040;           //设置B6口为高电平输出，保证LED共阴极接地
	*P_IOB_Attrib=0x0040;
	*P_IOB_Data=0x0040;
	
	while(1) 
	{
	    Key = GetKey();          //取键值
	    Key = Key >> 8;          //取LED显示初值
        *P_IOA_Data = Key;
	}
}

//============================================================= 
// main.c 结束
//=============================================================		