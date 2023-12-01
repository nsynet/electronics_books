//======================================================
//  Filename:    	Key_and_LED.c
//  Author:      	guangyuan wei    (email: guangyuan/sunnorth)    
//  Date:        	2003,4,20
//  Description:	This program is an example for chapter 10 of <Programming Sunplus-16bit-MCU in C>  
//				 
//  Reference:
//  Revision:
//  -----------------------------------------------------------------------------------
//  Version   Year-Month-Day-Index   Modified By    Description
//					2003-04-20:  First Version
//  -----------------------------------------------------------------------------------
// Note:
//   Input :	Key in IOA0~IOA7
//   Output: 	LED on IOB0~IOB7
//======================================================
#include	"SPCE061.H"
int main()
{
 	unsigned int I_Key;
	 
	//设置A口为带下拉电阻的输入	 
	Set_IOA_Dir(0x0000);
	Set_IOA_Attrib(0x0000);
	Set_IOA_Data(0x0000);
	
	//设置B口为同相低电平输出 
	Set_IOB_Dir(0xffff);
	Set_IOB_Attrib(0xffff);
	Set_IOB_Data(0x0000);
	
	while(1)
	{
		I_Key = Get_IOA_Data();						//获取A口输入的键值
		switch(I_Key)
		{
			case 0x0000:				            //无键按下
				break;	
			case 0x0001:				        	// I_Key 1
			case 0x0002:				        	// I_Key 2
			case 0x0004:					        // I_Key 3
			case 0x0008:				        	// I_Key 4
			case 0x0010:				        	// I_Key 5
			case 0x0020:				        	// I_Key 6
			case 0x0040:					        // I_Key 7
			case 0x0080:					        // I_Key 8
			Set_IOB_Buffer(I_Key);					//在B口显示键值
				break;
			default:
				break;	   
		}	
  }  
}

	
	