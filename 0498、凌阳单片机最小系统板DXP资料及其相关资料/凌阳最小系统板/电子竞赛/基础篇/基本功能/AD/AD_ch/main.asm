//*****************************************************************************/
// 描述： 通过改变LINE_IN端口的模拟电压来改变IOB口输出的数据，
//        采用读取P_ADC_MUX_Ctrl寄存器启动ADC转换，可以通过发光
//        二极管的点亮了解转换的数据值。
// 日期： 2003/07/08
// 版本:  1.8.0
//*****************************************************************************/
.DEFINE		P_IOB_DATA  	    0x7005 
.DEFINE		P_IOB_DIR   	    0x7007 
.DEFINE		P_IOB_ATTRI			0x7008 
.DEFINE		P_INT_Ctrl		    0x7010 
.DEFINE		P_INT_CLEAR			0x7011 
.DEFINE		P_ADC_Ctrl		    0x7015 
.DEFINE		P_ADC_MUX_Ctrl		0x702b 
.DEFINE		P_ADC_MUX_DATA		0x702C
.DEFINE		P_DAC_Ctrl		    0x702A 
.DEFINE     P_WATCHDOG_CLEAR    0x7012
.CODE

//============================================================================= 
// 函数： main()
// 描述：主函数
//=============================================================================
.PUBLIC _main
_main:  
    R1 = 0xffff 
	[P_IOB_ATTRI] = R1           //IOB口设置为同向输出口
	[P_IOB_DIR] = R1 
	R1 = 0x0000
	[P_IOB_DATA] = R1;
 
    R1 = 0x0001                  //选择通道LINE_IN为IOA0
	[P_ADC_MUX_Ctrl] = R1
    R1 = 0x0003                 //允许A/D转换
    [P_ADC_Ctrl] = R1 		 
    
L_AD: 	 
    R1 = [P_ADC_MUX_Ctrl]        //读寄存器[P_ADC_MUX_Ctrl]的B15位
    TEST R1,0x8000               //判断是否转换完毕
    JZ L_AD                      //否，继续转换
    R1 = [P_ADC_MUX_DATA]          //是，则读出[P_ADC_MUX_DATA]转换结果
    [P_IOB_DATA] = R1              //同时触发A/D重新转换
    R1 = 0x0001
    [P_WATCHDOG_CLEAR] = R1      //清看门狗
    JMP L_AD;
    
//*****************************************************************************/
//  main.asm 结束
//*****************************************************************************/	