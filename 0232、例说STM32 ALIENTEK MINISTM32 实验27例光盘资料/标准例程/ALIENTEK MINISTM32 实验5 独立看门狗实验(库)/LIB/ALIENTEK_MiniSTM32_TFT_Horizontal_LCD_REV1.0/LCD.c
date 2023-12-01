//ģ����ʾ��LCD
/*
�޶�:

1.2010-10-26:

	//V1.0
	//������ԭ�ӵĿ��������޸Ĺ���



*/

#include "lcd.h"
#include "stdlib.h"
#include "font.h" 
#include "UART_INTERFACE.h"
//#include "stm32f10x.h"
//#include "usart.h"	 
//2.4/2.8��TFTҺ������(ILI9325/RM68021/ILI9320 Verision)
//Mini STM32������
//TFTLCD ��������			 
//����ԭ��@ALIENTEK
//2010/6/5

//������ɫ,������ɫ
u16 POINT_COLOR = 0x0000,BACK_COLOR = 0xFFFF;  
u16 DeviceCode;	 

//д�Ĵ�������
void LCD_WR_REG(u8 data)
	{ 
	Clr_Rs;//д��ַ  
	Clr_Cs; 
	Write_Data(data); 
	Clr_nWr; 
	Set_nWr; 
	Set_Cs;  
	}  

//д�Ĵ���
void LCD_WriteReg(u8 LCD_Reg, u16 LCD_RegValue)
	{	
	LCD_WR_REG(LCD_Reg);  
	LCD_WR_DATA(LCD_RegValue);	    		 
	}	 
  
//���Ĵ���
u16 LCD_ReadReg(u8 LCD_Reg)
	{										   
	GPIO_InitTypeDef GPIO_InitStructure;
	u16 t;
	LCD_WR_REG(LCD_Reg);   //д��Ҫ���ļĴ�����  
	//GPIOB->CRL=0X88888888; //PB0-7  ��������
	//GPIOB->CRH=0X88888888; //PB8-15 ��������
	//GPIOB->ODR=0X0000;     //ȫ�����0
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_DATA_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU ;// ��������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(LCD_GPIO_DATA_PORT, &GPIO_InitStructure);
	Write_Data(0x0000);
	Set_Rs;
	Clr_Cs;
	//��ȡ����(���Ĵ���ʱ,������Ҫ��2��)
	Clr_nRd;					   
	Set_nRd;
	//t=Read_Data;   //���������
	//t=GPIO_ReadInputData(GPIOB);  //���������	  
	t=GPIOB->IDR;   //��������
	Set_Cs;   
	//GPIOB->CRL=0X33333333; //PB0-7  �������
	//GPIOB->CRH=0X33333333; //PB8-15 �������
	//GPIOB->ODR=0XFFFF;    //ȫ�������
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_DATA_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(LCD_GPIO_DATA_PORT, &GPIO_InitStructure);
	Write_Data(0xffff);
	return t;  
	}   
//u16 LCD_ReadReg(u8 LCD_Reg)
//{										   
//	u16 t;
//	LCD_WR_REG(LCD_Reg);   //д��Ҫ���ļĴ�����  
//	GPIOB->CRL=0X88888888; //PB0-7  ��������
//	GPIOB->CRH=0X88888888; //PB8-15 ��������
//	GPIOB->ODR=0X0000;     //ȫ�����0
//	Set_Rs;
//	Clr_Cs;
//	//��ȡ����(���Ĵ���ʱ,������Ҫ��2��)
//	Clr_nRd;					   
//	Set_nRd;
//	//t=GPIOB->IDR;   //��������
//	t=Read_Data;  
//	Set_Cs;   
//	GPIOB->CRL=0X33333333; //PB0-7  �������
//	GPIOB->CRH=0X33333333; //PB8-15 �������
//	GPIOB->ODR=0XFFFF;    //ȫ�������
//	return t;  
//}  

//��ʼдGRAM
void LCD_WriteRAM_Prepare(void)
	{
	LCD_WR_REG(R34);
	}	
 
//LCDдGRAM
void LCD_WriteRAM(u16 RGB_Code)
	{							    
	LCD_WR_DATA(RGB_Code);//дʮ��λGRAM
	}

//��ILI93xx����������ΪGBR��ʽ��������д���ʱ��ΪRGB��ʽ��
//ͨ���ú���ת��
//c:GBR��ʽ����ɫֵ
//����ֵ��RGB��ʽ����ɫֵ
u16 LCD_BGR2RGB(u16 c)
	{
	u16  r,g,b,rgb;   
	b=(c>>0)&0x1f;
	g=(c>>5)&0x3f;
	r=(c>>11)&0x1f;	 
	rgb=(b<<11)+(g<<5)+(r<<0);		 
	return(rgb);
	}	
		 
//��ȡ��ĳ�����ɫֵ	 
//x:0~239
//y:0~319
//����ֵ:�˵����ɫ
u16 LCD_ReadPoint(u16 x,u16 y)
	{
	GPIO_InitTypeDef GPIO_InitStructure;
	u16 t;	
	if(x>=LCD_W||y>=LCD_H)return 0;//�����˷�Χ,ֱ�ӷ���		   
	LCD_SetCursor(x,y);
	LCD_WR_REG(R34);       //ѡ��GRAM��ַ 
	//GPIOB->CRL=0X88888888; //PB0-7  ��������
	//GPIOB->CRH=0X88888888; //PB8-15 ��������
	//GPIOB->ODR=0XFFFF;     //ȫ�������
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_DATA_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU ;// ��������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(LCD_GPIO_DATA_PORT, &GPIO_InitStructure);
	Write_Data(0xFFFF);
	Set_Rs;
	Clr_Cs;
	//��ȡ����(��GRAMʱ,��Ҫ��2��)
	Clr_nRd;					   
	Set_nRd;
	//dummy READ
	Clr_nRd;					   
	Set_nRd;
	//t=Read_Data;   //���������
	//t=GPIO_ReadInputData(GPIOB);  //���������	  
	t=GPIOB->IDR;   //��������
	Set_Cs;   
	//GPIOB->CRL=0X33333333; //PB0-7  �������
	//GPIOB->CRH=0X33333333; //PB8-15 �������
	//GPIOB->ODR=0XFFFF;    //ȫ�������  
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_DATA_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(LCD_GPIO_DATA_PORT, &GPIO_InitStructure);
	Write_Data(0xFFFF);
	if(DeviceCode==0X4531)return t;//4531����IC
	else return LCD_BGR2RGB(t);
	}

//LCD������ʾ
void LCD_DisplayOn(void)
	{					   
	LCD_WriteReg(R7, 0x0173); //26��ɫ��ʾ����
	}	 
	
//LCD�ر���ʾ
void LCD_DisplayOff(void)
	{	   
	LCD_WriteReg(R7, 0x0);//�ر���ʾ 
	}    

//LCD��ʱ���� 10MS
void LCD_Delay (u32 nCount)
	{
	volatile int i;	 	
	for (i=0;i<nCount*100;i++);
	}

//���ù��λ��
//Xpos:������
//Ypos:������
__inline void LCD_SetCursor(u8 Xpos, u16 Ypos)
	{
	#ifdef USE_HORIZONTAL
		LCD_WriteReg(R32, Ypos);
		LCD_WriteReg(R33, 319-Xpos);
	#else
		LCD_WriteReg(R32, Xpos);
		LCD_WriteReg(R33, Ypos);
	#endif
	} 

//����
//x:0~239
//y:0~319
//POINT_COLOR:�˵����ɫ
void LCD_DrawPoint(u16 x,u16 y)
	{
	LCD_SetCursor(x,y);//���ù��λ�� 
	LCD_WR_REG(R34);//��ʼд��GRAM
	LCD_WR_DATA(POINT_COLOR); 
	} 	 

//��ʼ��lcd
//�ó�ʼ���������Գ�ʼ������ILI93XXҺ��,�������������ǻ���ILI9320��!!!
//�������ͺŵ�����оƬ��û�в���! 
void LCD_Init(void)
	{ 
	GPIO_InitTypeDef GPIO_InitStructure;
	//RCC->APB2ENR|=1<<3;//��ʹ������PORTBʱ��
	//RCC->APB2ENR|=1<<4;//��ʹ������PORTCʱ��
	//RCC->APB2ENR|=1<<0;    //��������ʱ��
	/* Enable clock for GPIOx. */
	RCC_APB2PeriphClockCmd(LCD_GPIO_LED_CLK, ENABLE);
	RCC_APB2PeriphClockCmd(LCD_GPIO_CS_CLK, ENABLE);
	RCC_APB2PeriphClockCmd(LCD_GPIO_RS_CLK, ENABLE);
	RCC_APB2PeriphClockCmd(LCD_GPIO_NWR_CLK, ENABLE);
	RCC_APB2PeriphClockCmd(LCD_GPIO_RD_CLK, ENABLE);
	RCC_APB2PeriphClockCmd(LCD_GPIO_DATA_CLK, ENABLE);	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);  //���ù���ʱ��
	//JTAG_Set(SWD_ENABLE);  //����SWD
	/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
	GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable , ENABLE);	//JTAG-DP ʧ�� + SW-DPʹ�� 
	/* Disable the Serial Wire Jtag Debug Port SWJ-DP */
	//GPIO_PinRemapConfig(GPIO_Remap_SWJ_Disable, ENABLE);	//SWJ��ȫʧ��(JTAG+SW-DP)
									 
	////PORTC6~10����������� 	
	//GPIOC->CRH&=0XFFFFF000;
	//GPIOC->CRH|=0X00000333; 
	//GPIOC->CRL&=0X00FFFFFF;
	//GPIOC->CRL|=0X33000000;  
	//GPIOC->ODR|=0X07C0; 	 
	////PORTB ������� 	
	//GPIOB->CRH=0X33333333;
	//GPIOB->CRL=0X33333333; 	 
	//GPIOB->ODR=0XFFFF;
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_LED_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(LCD_GPIO_LED_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_DATA_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(LCD_GPIO_DATA_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_CS_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //�������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(LCD_GPIO_CS_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_RS_PIN;
	GPIO_Init(LCD_GPIO_RS_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_NWR_PIN;
	GPIO_Init(LCD_GPIO_NWR_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = LCD_GPIO_RD_PIN;
	GPIO_Init(LCD_GPIO_RD_PORT, &GPIO_InitStructure);
	
	//cs,rs,wr,rd = 1;
	GPIO_WriteBit(LCD_GPIO_LED_PORT,LCD_GPIO_LED_PIN,Bit_SET);
	GPIO_WriteBit(LCD_GPIO_CS_PORT,LCD_GPIO_CS_PIN,Bit_SET);
	GPIO_WriteBit(LCD_GPIO_RS_PORT,LCD_GPIO_RS_PIN,Bit_SET);
	GPIO_WriteBit(LCD_GPIO_NWR_PORT,LCD_GPIO_NWR_PIN,Bit_SET);
	GPIO_WriteBit(LCD_GPIO_RD_PORT,LCD_GPIO_RD_PIN,Bit_SET);
	
				 
	LCD_Delay(5); // LCD_Delay 50 ms 
	LCD_WriteReg(0x0000,0x0001);
	LCD_Delay(5); // LCD_Delay 50 ms 
	DeviceCode = LCD_ReadReg(0x0000);   
	//printf("ID:%d\n",DeviceCode);   
	if(DeviceCode==0x9325||DeviceCode==0x9328)//ILI9325
		{
		LCD_WriteReg(0x00e7,0x0010);      
		LCD_WriteReg(0x0000,0x0001);//�����ڲ�ʱ��
		LCD_WriteReg(0x0001,0x0100);     
		LCD_WriteReg(0x0002,0x0700);//��Դ����                    
		//LCD_WriteReg(0x0003,(1<<3)|(1<<4) ); 	//65K  RGB
		//DRIVE TABLE(�Ĵ��� 03H)
		//BIT3=AM BIT4:5=ID0:1
		//AM ID0 ID1   FUNCATION
		// 0  0   0	   R->L D->U
		// 1  0   0	   D->U	R->L
		// 0  1   0	   L->R D->U
		// 1  1   0    D->U	L->R
		// 0  0   1	   R->L U->D
		// 1  0   1    U->D	R->L
		// 0  1   1    L->R U->D �����������.
		// 1  1   1	   U->D	L->R
		LCD_WriteReg(0x0003,(1<<12)|(3<<4)|(0<<3) );//65K    
		LCD_WriteReg(0x0004,0x0000);                                   
		LCD_WriteReg(0x0008,0x0207);	           
		LCD_WriteReg(0x0009,0x0000);         
		LCD_WriteReg(0x000a,0x0000);//display setting         
		LCD_WriteReg(0x000c,0x0001);//display setting          
		LCD_WriteReg(0x000d,0x0000);//0f3c          
		LCD_WriteReg(0x000f,0x0000);
		//��Դ����
		LCD_WriteReg(0x0010,0x0000);   
		LCD_WriteReg(0x0011,0x0007);
		LCD_WriteReg(0x0012,0x0000);                                                                 
		LCD_WriteReg(0x0013,0x0000);                 
		LCD_Delay(5); 
		LCD_WriteReg(0x0010,0x1590);   
		LCD_WriteReg(0x0011,0x0227);
		LCD_Delay(5); 
		LCD_WriteReg(0x0012,0x009c);                  
		LCD_Delay(5); 
		LCD_WriteReg(0x0013,0x1900);   
		LCD_WriteReg(0x0029,0x0023);
		LCD_WriteReg(0x002b,0x000e);
		LCD_Delay(5); 
		LCD_WriteReg(0x0020,0x0000);                                                            
		LCD_WriteReg(0x0021,0x013f);           
		LCD_Delay(5); 
		//٤��У��
		LCD_WriteReg(0x0030,0x0007); 
		LCD_WriteReg(0x0031,0x0707);   
		LCD_WriteReg(0x0032,0x0006);
		LCD_WriteReg(0x0035,0x0704);
		LCD_WriteReg(0x0036,0x1f04); 
		LCD_WriteReg(0x0037,0x0004);
		LCD_WriteReg(0x0038,0x0000);        
		LCD_WriteReg(0x0039,0x0706);     
		LCD_WriteReg(0x003c,0x0701);
		LCD_WriteReg(0x003d,0x000f);
		LCD_Delay(5); 
		LCD_WriteReg(0x0050,0x0000); //ˮƽGRAM��ʼλ�� 
		LCD_WriteReg(0x0051,0x00ef); //ˮƽGRAM��ֹλ��                    
		LCD_WriteReg(0x0052,0x0000); //��ֱGRAM��ʼλ��                    
		LCD_WriteReg(0x0053,0x013f); //��ֱGRAM��ֹλ��  
		
		LCD_WriteReg(0x0060,0xa700);        
		LCD_WriteReg(0x0061,0x0001); 
		LCD_WriteReg(0x006a,0x0000);
		LCD_WriteReg(0x0080,0x0000);
		LCD_WriteReg(0x0081,0x0000);
		LCD_WriteReg(0x0082,0x0000);
		LCD_WriteReg(0x0083,0x0000);
		LCD_WriteReg(0x0084,0x0000);
		LCD_WriteReg(0x0085,0x0000);
		
		LCD_WriteReg(0x0090,0x0010);     
		LCD_WriteReg(0x0092,0x0000);  
		LCD_WriteReg(0x0093,0x0003);
		LCD_WriteReg(0x0095,0x0110);
		LCD_WriteReg(0x0097,0x0000);        
		LCD_WriteReg(0x0098,0x0000);  
		//������ʾ����    
		LCD_WriteReg(0x0007,0x0133);   
		LCD_WriteReg(0x0020,0x0000);                                                            
		LCD_WriteReg(0x0021,0x013f);
		}
	else if(DeviceCode==0x9320||DeviceCode==0x9300)
		{
		LCD_WriteReg(0x00,0x0000);
		LCD_WriteReg(0x01,0x0100);	//Driver Output Contral.
		LCD_WriteReg(0x02,0x0700);	//LCD Driver Waveform Contral.
		LCD_WriteReg(0x03,0x1030);//Entry Mode Set.
		//LCD_WriteReg(0x03,0x1018);	//Entry Mode Set.
		
		LCD_WriteReg(0x04,0x0000);	//Scalling Contral.
		LCD_WriteReg(0x08,0x0202);	//Display Contral 2.(0x0207)
		LCD_WriteReg(0x09,0x0000);	//Display Contral 3.(0x0000)
		LCD_WriteReg(0x0a,0x0000);	//Frame Cycle Contal.(0x0000)
		LCD_WriteReg(0x0c,(1<<0));	//Extern Display Interface Contral 1.(0x0000)
		LCD_WriteReg(0x0d,0x0000);	//Frame Maker Position.
		LCD_WriteReg(0x0f,0x0000);	//Extern Display Interface Contral 2.	    
		LCD_Delay(5); 
		LCD_WriteReg(0x07,0x0101);	//Display Contral.
		LCD_Delay(5); 								  
		LCD_WriteReg(0x10,(1<<12)|(0<<8)|(1<<7)|(1<<6)|(0<<4));	//Power Control 1.(0x16b0)
		LCD_WriteReg(0x11,0x0007);								//Power Control 2.(0x0001)
		LCD_WriteReg(0x12,(1<<8)|(1<<4)|(0<<0));				//Power Control 3.(0x0138)
		LCD_WriteReg(0x13,0x0b00);								//Power Control 4.
		LCD_WriteReg(0x29,0x0000);								//Power Control 7.
		
		LCD_WriteReg(0x2b,(1<<14)|(1<<4));	    
		LCD_WriteReg(0x50,0);	//Set X Star
		//ˮƽGRAM��ֹλ��Set X End.
		LCD_WriteReg(0x51,239);	//Set Y Star
		LCD_WriteReg(0x52,0);	//Set Y End.t.
		LCD_WriteReg(0x53,319);	//
		
		LCD_WriteReg(0x60,0x2700);	//Driver Output Control.
		LCD_WriteReg(0x61,0x0001);	//Driver Output Control.
		LCD_WriteReg(0x6a,0x0000);	//Vertical Srcoll Control.
		
		LCD_WriteReg(0x80,0x0000);	//Display Position? Partial Display 1.
		LCD_WriteReg(0x81,0x0000);	//RAM Address Start? Partial Display 1.
		LCD_WriteReg(0x82,0x0000);	//RAM Address End-Partial Display 1.
		LCD_WriteReg(0x83,0x0000);	//Displsy Position? Partial Display 2.
		LCD_WriteReg(0x84,0x0000);	//RAM Address Start? Partial Display 2.
		LCD_WriteReg(0x85,0x0000);	//RAM Address End? Partial Display 2.
		
		LCD_WriteReg(0x90,(0<<7)|(16<<0));	//Frame Cycle Contral.(0x0013)
		LCD_WriteReg(0x92,0x0000);	//Panel Interface Contral 2.(0x0000)
		LCD_WriteReg(0x93,0x0001);	//Panel Interface Contral 3.
		LCD_WriteReg(0x95,0x0110);	//Frame Cycle Contral.(0x0110)
		LCD_WriteReg(0x97,(0<<8));	//
		LCD_WriteReg(0x98,0x0000);	//Frame Cycle Contral.	   
		LCD_WriteReg(0x07,0x0173);	//(0x0173)
		}				    
	else if(DeviceCode==0x1505)
		{
		// second release on 3/5  ,luminance is acceptable,water wave appear during camera preview
		LCD_WriteReg(0x0007,0x0000);
		LCD_Delay(5); 
		LCD_WriteReg(0x0012,0x011C);//0x011A   why need to set several times?
		LCD_WriteReg(0x00A4,0x0001);//NVM	 
		LCD_WriteReg(0x0008,0x000F);
		LCD_WriteReg(0x000A,0x0008);
		LCD_WriteReg(0x000D,0x0008);	    
		//٤��У��
		LCD_WriteReg(0x0030,0x0707);
		LCD_WriteReg(0x0031,0x0007); //0x0707
		LCD_WriteReg(0x0032,0x0603); 
		LCD_WriteReg(0x0033,0x0700); 
		LCD_WriteReg(0x0034,0x0202); 
		LCD_WriteReg(0x0035,0x0002); //?0x0606
		LCD_WriteReg(0x0036,0x1F0F);
		LCD_WriteReg(0x0037,0x0707); //0x0f0f  0x0105
		LCD_WriteReg(0x0038,0x0000); 
		LCD_WriteReg(0x0039,0x0000); 
		LCD_WriteReg(0x003A,0x0707); 
		LCD_WriteReg(0x003B,0x0000); //0x0303
		LCD_WriteReg(0x003C,0x0007); //?0x0707
		LCD_WriteReg(0x003D,0x0000); //0x1313//0x1f08
		LCD_Delay(5); 
		LCD_WriteReg(0x0007,0x0001);
		LCD_WriteReg(0x0017,0x0001);//������Դ
		LCD_Delay(5); 
		//��Դ����
		LCD_WriteReg(0x0010,0x17A0); 
		LCD_WriteReg(0x0011,0x0217);//reference voltage VC[2:0]   Vciout = 1.00*Vcivl
		LCD_WriteReg(0x0012,0x011E);//0x011c  //Vreg1out = Vcilvl*1.80   is it the same as Vgama1out ?
		LCD_WriteReg(0x0013,0x0F00);//VDV[4:0]-->VCOM Amplitude VcomL = VcomH - Vcom Ampl
		LCD_WriteReg(0x002A,0x0000);  
		LCD_WriteReg(0x0029,0x000A);//0x0001F  Vcomh = VCM1[4:0]*Vreg1out    gate source voltage??
		LCD_WriteReg(0x0012,0x013E);// 0x013C  power supply on
		//Coordinates Control//
		LCD_WriteReg(0x0050,0x0000);//0x0e00
		LCD_WriteReg(0x0051,0x00EF); 
		LCD_WriteReg(0x0052,0x0000); 
		LCD_WriteReg(0x0053,0x013F); 
		//Pannel Image Control//
		LCD_WriteReg(0x0060,0x2700); 
		LCD_WriteReg(0x0061,0x0001); 
		LCD_WriteReg(0x006A,0x0000); 
		LCD_WriteReg(0x0080,0x0000); 
		//Partial Image Control//
		LCD_WriteReg(0x0081,0x0000); 
		LCD_WriteReg(0x0082,0x0000); 
		LCD_WriteReg(0x0083,0x0000); 
		LCD_WriteReg(0x0084,0x0000); 
		LCD_WriteReg(0x0085,0x0000); 
		//Panel Interface Control//
		LCD_WriteReg(0x0090,0x0013);//0x0010 frenqucy
		LCD_WriteReg(0x0092,0x0300); 
		LCD_WriteReg(0x0093,0x0005); 
		LCD_WriteReg(0x0095,0x0000); 
		LCD_WriteReg(0x0097,0x0000); 
		LCD_WriteReg(0x0098,0x0000); 
		
		LCD_WriteReg(0x0001,0x0100); 
		LCD_WriteReg(0x0002,0x0700); 
		LCD_WriteReg(0x0003,0x1030); 
		LCD_WriteReg(0x0004,0x0000); 
		LCD_WriteReg(0x000C,0x0000); 
		LCD_WriteReg(0x000F,0x0000); 
		LCD_WriteReg(0x0020,0x0000); 
		LCD_WriteReg(0x0021,0x0000); 
		LCD_WriteReg(0x0007,0x0021); 
		LCD_Delay(20);
		LCD_WriteReg(0x0007,0x0061); 
		LCD_Delay(20);
		LCD_WriteReg(0x0007,0x0173); 
		LCD_Delay(20);
		}							 
	else if(DeviceCode==0x8989)
		{
		LCD_WriteReg(0x0000,0x0001);LCD_Delay(5);//�򿪾���
		LCD_WriteReg(0x0003,0xA8A4);LCD_Delay(5);//0xA8A4
		LCD_WriteReg(0x000C,0x0000);LCD_Delay(5);    
		LCD_WriteReg(0x000D,0x080C);LCD_Delay(5);    
		LCD_WriteReg(0x000E,0x2B00);LCD_Delay(5);    
		LCD_WriteReg(0x001E,0x00B0);LCD_Delay(5);    
		LCD_WriteReg(0x0001,0x2B3F);LCD_Delay(5);//�����������320*240  0x6B3F
		LCD_WriteReg(0x0002,0x0600);LCD_Delay(5); 
		LCD_WriteReg(0x0010,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0011,0x6070);LCD_Delay(5);//�������ݸ�ʽ  16λɫ 		���� 0x6058
		LCD_WriteReg(0x0005,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0006,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0016,0xEF1C);LCD_Delay(5); 
		LCD_WriteReg(0x0017,0x0003);LCD_Delay(5); 
		LCD_WriteReg(0x0007,0x0233);LCD_Delay(5);//0x0233       
		LCD_WriteReg(0x000B,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x000F,0x0000);LCD_Delay(5);//ɨ�迪ʼ��ַ
		LCD_WriteReg(0x0041,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0042,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0048,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0049,0x013F);LCD_Delay(5); 
		LCD_WriteReg(0x004A,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x004B,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0044,0xEF00);LCD_Delay(5); 
		LCD_WriteReg(0x0045,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0046,0x013F);LCD_Delay(5); 
		LCD_WriteReg(0x0030,0x0707);LCD_Delay(5); 
		LCD_WriteReg(0x0031,0x0204);LCD_Delay(5); 
		LCD_WriteReg(0x0032,0x0204);LCD_Delay(5); 
		LCD_WriteReg(0x0033,0x0502);LCD_Delay(5); 
		LCD_WriteReg(0x0034,0x0507);LCD_Delay(5); 
		LCD_WriteReg(0x0035,0x0204);LCD_Delay(5); 
		LCD_WriteReg(0x0036,0x0204);LCD_Delay(5); 
		LCD_WriteReg(0x0037,0x0502);LCD_Delay(5); 
		LCD_WriteReg(0x003A,0x0302);LCD_Delay(5); 
		LCD_WriteReg(0x003B,0x0302);LCD_Delay(5); 
		LCD_WriteReg(0x0023,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0024,0x0000);LCD_Delay(5); 
		LCD_WriteReg(0x0025,0x8000);LCD_Delay(5); 
		LCD_WriteReg(0x004f,0);        //����ַ0
		LCD_WriteReg(0x004e,0);        //����ַ0
		}
	else if(DeviceCode==0x4531)
		{
		LCD_WriteReg(0X00,0X0001);   
		LCD_Delay(50);   
		LCD_WriteReg(0X10,0X1628);   
		LCD_WriteReg(0X12,0X000e);//0x0006    
		LCD_WriteReg(0X13,0X0A39);   
		LCD_Delay(10);   
		LCD_WriteReg(0X11,0X0040);   
		LCD_WriteReg(0X15,0X0050);   
		LCD_Delay(40);   
		LCD_WriteReg(0X12,0X001e);//16    
		LCD_Delay(40);   
		LCD_WriteReg(0X10,0X1620);   
		LCD_WriteReg(0X13,0X2A39);   
		LCD_Delay(10);   
		LCD_WriteReg(0X01,0X0100);   
		LCD_WriteReg(0X02,0X0300);   
		LCD_WriteReg(0X03,0X1030);//�ı䷽���   
		LCD_WriteReg(0X08,0X0202);   
		LCD_WriteReg(0X0A,0X0008);   
		LCD_WriteReg(0X30,0X0000);   
		LCD_WriteReg(0X31,0X0402);   
		LCD_WriteReg(0X32,0X0106);   
		LCD_WriteReg(0X33,0X0503);   
		LCD_WriteReg(0X34,0X0104);   
		LCD_WriteReg(0X35,0X0301);   
		LCD_WriteReg(0X36,0X0707);   
		LCD_WriteReg(0X37,0X0305);   
		LCD_WriteReg(0X38,0X0208);   
		LCD_WriteReg(0X39,0X0F0B);   
		LCD_WriteReg(0X41,0X0002);   
		LCD_WriteReg(0X60,0X2700);   
		LCD_WriteReg(0X61,0X0001);   
		LCD_WriteReg(0X90,0X0210);   
		LCD_WriteReg(0X92,0X010A);   
		LCD_WriteReg(0X93,0X0004);   
		LCD_WriteReg(0XA0,0X0100);   
		LCD_WriteReg(0X07,0X0001);   
		LCD_WriteReg(0X07,0X0021);   
		LCD_WriteReg(0X07,0X0023);   
		LCD_WriteReg(0X07,0X0033);   
		LCD_WriteReg(0X07,0X0133);   
		LCD_WriteReg(0XA0,0X0000); 
		}				  
	LCD_Delay(5000);
	Clr_LED;//��������	 
	LCD_Clear(WHITE);
	}  		  
  
//��������
//Color:Ҫ���������ɫ
void LCD_Clear(u16 Color)
	{
	u32 index=0;      
	LCD_SetCursor(0x00,0x0000);//���ù��λ�� 
	LCD_WriteRAM_Prepare();     //��ʼд��GRAM	 	  
	for(index=0;index<76800;index++)
		{
		LCD_WR_DATA(Color);   //��ÿ��GRAMд������  
		}
	}  
	
////��ָ�����������ָ����ɫ
////�����С:
////  (xend-xsta)*(yend-ysta)
//void LCD_Fill(u8 xsta,u16 ysta,u8 xend,u16 yend,u16 color)
//	{                    
//	u32 n;
//	//���ô���										
//	LCD_WriteReg(R80, xsta); //ˮƽ����GRAM��ʼ��ַ
//	LCD_WriteReg(R81, xend); //ˮƽ����GRAM������ַ
//	LCD_WriteReg(R82, ysta); //��ֱ����GRAM��ʼ��ַ
//	LCD_WriteReg(R83, yend); //��ֱ����GRAM������ַ	
//	LCD_SetCursor(xsta,ysta);//���ù��λ��  
//	LCD_WriteRAM_Prepare();  //��ʼд��GRAM	 	   	   
//	n=(u32)(yend-ysta+1)*(xend-xsta+1);    
//	while(n--){LCD_WR_DATA(color);}//��ʾ��������ɫ. 
//	//�ָ�����
//	LCD_WriteReg(R80, 0x0000); //ˮƽ����GRAM��ʼ��ַ
//	LCD_WriteReg(R81, (LCD_W-1)); //ˮƽ����GRAM������ַ
//	LCD_WriteReg(R82, 0x0000); //��ֱ����GRAM��ʼ��ַ
//	LCD_WriteReg(R83, (LCD_H-1)); //��ֱ����GRAM������ַ	    
//	}  

//��ָ�����������ָ����ɫ
//�����С:
//  (xend-xsta)*(yend-ysta)
void LCD_Fill(u8 xsta,u16 ysta,u8 xend,u16 yend,u16 color)
	{     
	u16 colortemp=POINT_COLOR;
	u16 ytemp=ysta;
	POINT_COLOR=color;
	for(;xsta<=xend;xsta++)
		{
		for(;ysta<=yend;ysta++)LCD_DrawPoint(xsta,ysta); 
		ysta=ytemp;
		}  
	POINT_COLOR=colortemp;              
	}  

//����
//x1,y1:�������
//x2,y2:�յ�����  
void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2)
	{
	u16 t; 
	int xerr=0,yerr=0,delta_x,delta_y,distance; 
	int incx,incy,uRow,uCol; 
	
	delta_x=x2-x1; //������������ 
	delta_y=y2-y1; 
	uRow=x1; 
	uCol=y1; 
	if(delta_x>0)incx=1; //���õ������� 
	else if(delta_x==0)incx=0;//��ֱ�� 
	else {incx=-1;delta_x=-delta_x;}   //�յ�����С����ʼ����,������,���������¶�λΪ������
	if(delta_y>0)incy=1; 
	else if(delta_y==0)incy=0;//ˮƽ�� 
	else{incy=-1;delta_y=-delta_y;}   //�յ�����С����ʼ����,������,���������¶�λΪ������
	if( delta_x>delta_y)distance=delta_x; //ѡȡ�������������� 
	else distance=delta_y; 
	for(t=0;t<=distance+1;t++ )//������� 
		{  
		LCD_DrawPoint(uRow,uCol);//�������껭�� 
		xerr+=delta_x ;  //X��������
		yerr+=delta_y ;  //Y��������
		if(xerr>distance) 
			{ 
			xerr-=distance; 
			uRow+=incx; 
			} 
		if(yerr>distance) 
			{ 
			yerr-=distance; 
			uCol+=incy; 
			} 
		}  
	}    

//������
void LCD_DrawRectangle(u8 x1, u16 y1, u8 x2, u16 y2)
	{
	LCD_DrawLine(x1,y1,x2,y1);
	LCD_DrawLine(x1,y1,x1,y2);
	LCD_DrawLine(x1,y2,x2,y2);
	LCD_DrawLine(x2,y1,x2,y2);
	}

//��ָ��λ�û�һ��ָ����С��Բ
//(x,y):���ĵ�
//r    :�뾶
void Draw_Circle(u8 x0,u16 y0,u8 r)
	{
	int a,b;
	int di;
	a=0;b=r;	  
	di=3-(r<<1);             //�ж��¸���λ�õı�־
	while(a<=b)
		{
		LCD_DrawPoint(x0-b,y0-a);             //3           
		LCD_DrawPoint(x0+b,y0-a);             //0           
		LCD_DrawPoint(x0-a,y0+b);             //1       
		LCD_DrawPoint(x0-b,y0-a);             //7           
		LCD_DrawPoint(x0-a,y0-b);             //2             
		LCD_DrawPoint(x0+b,y0+a);             //4               
		LCD_DrawPoint(x0+a,y0-b);             //5
		LCD_DrawPoint(x0+a,y0+b);             //6 
		LCD_DrawPoint(x0-b,y0+a);             
		a++;
		//ʹ��Bresenham�㷨��Բ     
		if(di<0)di +=4*a+6;	  
		else
			{
			di+=10+4*(a-b);   
			b--;
			} 
			LCD_DrawPoint(x0+a,y0+b);
		}
	} 
//��ָ��λ����ʾһ���ַ�
//x:0~234
//y:0~308
//num:Ҫ��ʾ���ַ�:" "--->"~"
//size:�����С 12/16
//mode:���ӷ�ʽ(1)���Ƿǵ��ӷ�ʽ(0)
void LCD_ShowChar(u8 x,u16 y,u8 num,u8 size,u8 mode)
	{       
	#ifdef USE_HORIZONTAL
		#define MAX_CHAR_POSX 312
		#define MAX_CHAR_POSY 232 
	#else     
		#define MAX_CHAR_POSX 232
		#define MAX_CHAR_POSY 312
	#endif 
//	u8 temp;
//	u8 pos,t;      
//	if(x>MAX_CHAR_POSX||y>MAX_CHAR_POSY)return;	    
//	//���ô���										
//	LCD_WriteReg(R80,x);           //ˮƽ����GRAM��ʼ��ַ
//	LCD_WriteReg(R81,x+(size/2-1));//ˮƽ����GRAM������ַ
//	LCD_WriteReg(R82,y);           //��ֱ����GRAM��ʼ��ַ
//	LCD_WriteReg(R83,y+size-1);    //��ֱ����GRAM������ַ	
//	LCD_SetCursor(x,y);            //���ù��λ��  
//	LCD_WriteRAM_Prepare();        //��ʼд��GRAM	   
//	num=num-' ';//�õ�ƫ�ƺ��ֵ
//	if(!mode) //�ǵ��ӷ�ʽ
//		{
//		for(pos=0;pos<size;pos++)
//			{
//			if(size==12)temp=asc2_1206[num][pos];//����1206����
//			else temp=asc2_1608[num][pos];		 //����1608����
//			for(t=0;t<size/2;t++)
//				{                 
//				if(temp&0x01)
//					{
//					LCD_WR_DATA(POINT_COLOR);
//					}else LCD_WR_DATA(BACK_COLOR);	        
//					temp>>=1; 
//				}
//			}	
//		}
//	else//���ӷ�ʽ
//		{
//		for(pos=0;pos<size;pos++)
//			{
//			if(size==12)temp=asc2_1206[num][pos];//����1206����
//			else temp=asc2_1608[num][pos];		 //����1608����
//			for(t=0;t<size/2;t++)
//				{                 
//				if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//��һ����     
//				temp>>=1; 
//				}
//			}
//		}	    
//	//�ָ������С	 
//	LCD_WriteReg(R80, 0x0000); //ˮƽ����GRAM��ʼ��ַ
//	LCD_WriteReg(R81, (LCD_W-1)); //ˮƽ����GRAM������ַ
//	LCD_WriteReg(R82, 0x0000); //��ֱ����GRAM��ʼ��ַ
//	LCD_WriteReg(R83, (LCD_H-1)); //��ֱ����GRAM������ַ
	u8 temp;
	u8 pos,t;
	u16 x0=x;
	u16 colortemp=POINT_COLOR;      
	if(x>MAX_CHAR_POSX||y>MAX_CHAR_POSY)return;	    
	//���ô���		   
	num=num-' ';//�õ�ƫ�ƺ��ֵ
	if(!mode) //�ǵ��ӷ�ʽ
		{
		for(pos=0;pos<size;pos++)
			{
			if(size==12)temp=asc2_1206[num][pos];//����1206����
			else temp=asc2_1608[num][pos];		 //����1608����
			for(t=0;t<size/2;t++)
				{                 
				if(temp&0x01)POINT_COLOR=colortemp;
				else POINT_COLOR=BACK_COLOR;
				LCD_DrawPoint(x,y);	
				temp>>=1; 
				x++;
				}
			x=x0;
			y++;
			}	
		}
	else//���ӷ�ʽ
		{
		for(pos=0;pos<size;pos++)
			{
			if(size==12)temp=asc2_1206[num][pos];//����1206����
			else temp=asc2_1608[num][pos];		 //����1608����
			for(t=0;t<size/2;t++)
				{                 
				if(temp&0x01)LCD_DrawPoint(x+t,y+pos);//��һ����     
				temp>>=1; 
				}
			}
		}
	POINT_COLOR=colortemp;	   
	}  

//m^n����
u32 mypow(u8 m,u8 n)
	{
	u32 result=1;	 
	while(n--)result*=m;    
	return result;
	}		
		 
//��ʾ2������
//x,y :�������	 
//len :���ֵ�λ��
//size:�����С
//color:��ɫ
//num:��ֵ(0~4294967295);	 
void LCD_ShowNum(u8 x,u16 y,u32 num,u8 len,u8 size)
	{         	
	u8 t,temp;
	u8 enshow=0;						   
	for(t=0;t<len;t++)
		{
		temp=(num/mypow(10,len-t-1))%10;
		if(enshow==0&&t<(len-1))
			{
			if(temp==0)
				{
				LCD_ShowChar(x+(size/2)*t,y,' ',size,0);
				continue;
				}else enshow=1; 
			}
		LCD_ShowChar(x+(size/2)*t,y,temp+'0',size,0); 
		}
	} 


//��ʾ2������
//x,y:�������
//size:�����С
//mode:ģʽ	0,���ģʽ;1,����ģʽ
//num:��ֵ(0~99);	 
void LCD_Show2Num(u8 x,u16 y,u16 num,u8 len,u8 size,u8 mode)
	{         	
	u8 t,temp;						   
	for(t=0;t<len;t++)
		{
		temp=(num/mypow(10,len-t-1))%10;
		LCD_ShowChar(x+(size/2)*t,y,temp+'0',size,mode); 
		}
	} 

//��ʾ�ַ���
//x,y:�������  
//*p:�ַ�����ʼ��ַ
//��16����
void LCD_ShowString(u8 x,u16 y,const u8 *p)
	{         
	while(*p!='\0')	 //�ַ����������
		{       
		if(x>MAX_CHAR_POSX){x=0;y+=16;}	   //����
		if(y>MAX_CHAR_POSY){y=x=0;LCD_Clear(WHITE);}  //������Ļ��ʾ��Χ
		LCD_ShowChar(x,y,*p,16,0);
		x+=8;
		p++;
		}  
	}






























