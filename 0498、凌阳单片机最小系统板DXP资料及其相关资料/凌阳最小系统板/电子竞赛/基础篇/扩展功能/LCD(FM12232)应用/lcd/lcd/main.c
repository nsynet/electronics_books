
//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//          (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                       ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称：lcd.scs
//  功能描述:LCD带有文字和动态图片显示，动态图片显示同时配有背景音乐
  
//  文件来源：电子竞赛专集---液晶显示模块
//     
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//         SACMV32.lib
//  组成文件:
//          sp_lib.asm
//          spce.asm
//    	    isr.asm  
//          system.asm
//          sacmV32.asm     
//          sacm_user.asm
//          dvr.h       
//          
//  日期:          2003-7-7
//===============================================
//============================================================
// 文件名称：main.c
// 实现功能：文字和动态图片显示，同时配有背景音乐
// 日期： 2003/7/7
//============================================================
#include "sacmv32.h"
#include "sp_lib.h"
#define		SPEECH_1	    0
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_Up_On		1
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2
#define		Mode			1
 
 
 const int  CH_MODE[16*5] = 
{
	      0x2000,0x0018,0x0406,0x1615,0x7c14,0x1614,0x1535,0x0004,0x4000,0x807c,0x9202,0xf422,0x4800,0x6454,0x8242,0x0002,//凌
          0x0000,0x203f,0x3926,0x3f00,0x2121,0x2121,0x7f21,0x0020,0x0000,0x20fe,0xe010,0xfe00,0x0808,0x0808,0xfc08,0x0000,//阳
          0x0800,0x0808,0x097f,0x0900,0x0909,0x097f,0x1909,0x0008,0x4000,0x8244,0x00fc,0x0202,0x28c4,0x2810,0x8244,0x0002,//科
          0x1400,0x1414,0x643f,0x0024,0x1102,0x000c,0x007f,0x0000,0x1000,0x8060,0x80fe,0x2040,0xa020,0x2020,0x40fe,0x0040,//技
          0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,//clear
};
const int GRA_MODE[17*8] =
{
0x061f,0x1f1f,0x3f3f,0x3f3f,0x3f3f,0xbf7f,0x9f1f,0x234e,0x1318,0x070b,0x070b,0x130f,0x1c1c,0x263e,0x3e2e,0x5cfe,0xc44c,//gra1
0x8402,0x9088,0xc0e0,0xc0c0,0xc2c1,0x8682,0x3088,0x00c0,0xd000,0xe0d0,0xc0c0,0xa2e0,0x8884,0x4040,0x1844,0x0008,0x0000,
0x1f06,0x1f1f,0x3f3f,0x3f3f,0x3f3f,0x7fbf,0x1f9f,0x4e23,0x1813,0x070b,0x070b,0x130f,0x1c1c,0x263e,0x3e2e,0x5cfe,0xc44c,//gra2
0x8201,0xbe82,0xc0c0,0xc0c0,0xc1c1,0x8681,0xd088,0x0000,0xd000,0xe0d0,0xe1c0,0x97a1,0x8098,0x4040,0x3c44,0x000,0x0000,
0x1f06,0x1f1f,0x3f3f,0x3f3f,0x3f3f,0xbf7f,0x9f1f,0x234e,0x1318,0x070b,0x070b,0x130f,0x1c1c,0x263e,0x3e2e,0x5cfe,0xc44c,//gra3
0xc0c0,0xc4c0,0xe8c4,0xe0f0,0xc0e0,0xc1c1,0x308e,0x00c0,0xe0e8,0xe0f0,0xf0e0,0x41d0,0x4649,0x2020,0x0a02,0x0004,0x0000,
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,//clear
0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000,0x0000 //clear

};
extern  RES_A32_16K_A20_SA;
extern  RES_A32_16K_A20_EA;
int gra_No = 0;
unsigned int column = 61;
unsigned int flag = 1;
int Ret;
int iAddr;
/////////////////////////////////////////////////////////
//函数：16*16
//描述：在E2上显示汉字
//入口参数：1.page_addr 2.col_addr 3.chinese number
//出口参数：no
////////////////////////////////////////////////////////   
void Chinese_graphic_display_E2(int page_addr,int col_addr,int n,int flag)
{
	int i,j;
	int *P_ch ;
	int temp;
	int addr;
	if(flag){	    
	    addr   = 16;	    	
	    P_ch = CH_MODE + n*16;
	}
	else{	     
	     addr = 34;	    	
	     P_ch = GRA_MODE + n*34;
	}	
	temp = *P_ch; 
	for(i = page_addr;i>page_addr-2;i--){
		Write_command_E2(i|0xb8);//write page address		
		for(j = col_addr;j>col_addr-addr; j--){
		    if((j%2))   temp = *P_ch ;		   		   
			Write_command_E2(j); //write col address
			Write_display_data_function_E2(temp&0x00ff);
			if(!(j%2))  P_ch++;
			else   temp >>= 8;		
        } 
    } 
} 
/////////////////////////////////////////////////////////
//函数：
//描述：在E1上显示汉字
//入口参数：1.page_addr 2.col_addr 3.chinese number
//出口参数：no
////////////////////////////////////////////////////////
void Chinese_graphic_display_E1(int page_addr,int col_addr,int n,int flag)
{
	int i,j,temp;
	int *P_ch;
	int addr;
	temp = 0;
	if(flag){	    
	    addr   = 16;	    	
	    P_ch = CH_MODE + n*16;
	 }
	 else{	     
	     addr   = 34;	    	
	     P_ch = GRA_MODE + n*34;
	 }
	temp = *P_ch; 
	for(i = page_addr;i>page_addr-2;i--){
		Write_command_E1(i|0xb8);//write page address		
		for(j = col_addr;j>col_addr - addr;j--){
		    if((j%2))   temp = *P_ch ;		   		   
			Write_command_E1(j); //write col address
			Write_display_data_function_E1(temp&0x00ff);
			if(!(j%2))  P_ch++;
			else   temp >>= 8;		
        } 
    }  
}
/////////////////////////////////////////////////////////
//函数：
//描述：清屏
//入口参数：no
//出口参数：no
////////////////////////////////////////////////////////   

void graphic_flash_display(void)
{
      static int gra_No_copy;

		  		 
		if(gra_No_copy != gra_No){ 
			              //清除上一帧图片
		   if(flag == 1)
	    		Chinese_graphic_display_E2(1,column,3,0); 
		   if(flag == 2)
		        Chinese_graphic_display_E1(3,column,3,0);
		   if(flag == 3)
		        Chinese_graphic_display_E2(3,column,3,0); 
		   if(flag == 4)
		        Chinese_graphic_display_E1(1,column,3,0);
		                   //修改显示位置
        	column = column -1;		 
	    	if(column == 34) {
	    	    column = 61;
		        flag ++;
		        if(flag == 5) flag = 1;
            } 
	     	gra_No_copy = gra_No;         
                             //显示图片
    	if (flag == 1)
			Chinese_graphic_display_E2(1,column,gra_No,0); 
		if (flag == 2 )
		    Chinese_graphic_display_E1(3,column,gra_No,0);
		if (flag == 3 )
		    Chinese_graphic_display_E2(3,column,gra_No,0);  
		if (flag == 4 )
		    Chinese_graphic_display_E1(1,column,gra_No,0); 	   
    }
}
/////////////////////////////////////////////////////////
//函数：
//描述：清屏
//入口参数：no
//出口参数：no
////////////////////////////////////////////////////////    
void Clear_Screen()
{
	int page,col;
	int *p;
	int temp = 0;
	*p = temp;		
	for(page=0; page<4;page++){
		Write_command_E1(page|0xb8);
	    Write_command_E2(page|0xb8);
		for(col=0;col<62;col++){
		    Write_command_E1(col);
		    Write_command_E2(col);
		    Write_display_data_function_E1(*p);
		    Write_display_data_function_E2(*p);
	    }
   }
}   
delay(int n){
  for(;n>0;n--);
}
/////////////////////////////////////////////////
//主函数
////////////////////////////////////////////////
main()
{

   
   iAddr = RES_A32_16K_A20_SA;
   LCD_INIT();
   Clear_Screen();
          
   Chinese_graphic_display_E1(3,61,0,1);//凌	
   Chinese_graphic_display_E1(3,45,1,1);//阳    
   Chinese_graphic_display_E1(1,29,2,1);//科
   Chinese_graphic_display_E1(1,45,3,1);//技
   
   Chinese_graphic_display_E2(3,61,0,1);//凌	
   Chinese_graphic_display_E2(3,45,1,1);//阳    
   Chinese_graphic_display_E2(1,29,2,1);//科
   Chinese_graphic_display_E2(1,45,3,1);//技  
   delay(0xffff);
   SP_INT();
   Clear_Screen();
   Ret = SACM_A2000_Initial(Auto);	
   SACM_A2000_Play(0,DAC1+DAC2,Ramp_Up_On+Ramp_Dn_On);		// Play speech  	
   while(1){        
    	graphic_flash_display();	
   }
   
}
 
