//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  工程名称： led10_c.scs
//  功能描述:  用C实现A/D采样数据在发光二极管上点亮
//  文件来源：《61板实验教程》"实验十 A/D采样数据在发光二极管上点亮“
//  硬件连接： 61板SPY0029接口选择3.3V，IOB高8位接至SEG接口控制LED的导通
//             IOB6连至DIG7通过ULN2003A控制8个LED的共阴极电平状态
//  IDE环境：  SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//  main.asm
//
//  日期:  2004/8/17
//===============================================

//*****************************************************************************/
// 文件名称： main.c
// 实现功能： 用C实现A/D采样数据在发光二极管上点亮
//            通过改变LINE_IN端口的模拟电压来改变IOB口输出的数据，
//            采用自动方式执行ADC转换，可以通过发光
//            二极管的点亮了解转换的数据值。
// 日期： 2004/8/17
//*****************************************************************************/
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008

#define	P_ADC_Ctrl		    (volatile unsigned int *)0x7015 
#define	P_ADC_MUX_Ctrl		(volatile unsigned int *)0x702b 
#define	P_ADC_MUX_DATA		(volatile unsigned int *)0x702C
#define	P_DAC_Ctrl		    (volatile unsigned int *)0x702A 


#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012


void Delay();
//============================================================= 
// 函数名称:    int main()  
// 日期：		20040817 	
// 功能描述:    AD采样数据在发光二极管上显示
// 硬件连接：   B口高八位控制8个发光二极管的亮灭，B6控制8个发光二极管的共阴极
//              A口低七位作为AD的输入，61板SPY0029接口选择3.3V，保证AD输入在有效范围之内。
// 语法格式:    int main() 
// 注意事项:    仅为用户模型
//=============================================================
int main()
{
    unsigned ADValue = 0x0000;
	
    *P_IOB_Dir=0xff40;           //设置B口高8位为同向低输出，设置B6口为高电平输出，保证LED共阴极接地
	*P_IOB_Attrib=0xff40;
	*P_IOB_Data=0x0040;
	
	*P_ADC_MUX_Ctrl = 0x0001;    //模拟电压信号通过LINE_IN1输入
	*P_ADC_Ctrl |= 0x0001;       //允许AD转换
    while (1)
    {	
        
        while (!(*P_ADC_MUX_Ctrl & 0x8000)); //等待AD转换完成
        ADValue = *P_ADC_MUX_DATA;           //读取转换值
        ADValue <<= 2;                       //通过led显示AD转换结果
        ADValue |= 0x0040;                   //保证LED阴极共地
        *P_IOB_Data = ADValue;      
        Delay();                             //延时显示
	}
}	

//============================================================= 
// 函数名称:   Delay()
// 功能描述:   实现延时	
//=============================================================
void Delay()
{									//延时子程序
	unsigned int i;
	for(i = 0; i < 0x50; i++){
		*P_Watchdog_Clear=0x0001;	//清WatchDog
	}	
}

//============================================================= 
//main.c结束
//=============================================================
