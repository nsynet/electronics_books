#include "fontupd.h"
#include "stm32f10x.h"
#include "fat.h"
#include "flash.h"
#include "usart.h"
#include "SysTickDelay.h"
#include "lcd.h"
#include "spi.h"

//Mini STM32������
//���ĺ���֧�ֳ��� V1.1
//�����������,�Լ��ֿ��׵�ַ��ȡ2������.
//����ԭ��@ALIENTEK
//2010/5/23	

//�������ֶ�һ����Ҫ�Ҹ�!!!
//�ֽ�0~3,  ��¼UNI2GBKADDR;�ֽ�4~7  ,��¼UNI2GBKADDR�Ĵ�С
//�ֽ�8~11, ��¼FONT16ADDR ;�ֽ�12~15,��¼FONT16ADDR�Ĵ�С
//�ֽ�16~19,��¼FONT12ADDR ;�ֽ�20~23,��¼FONT12ADDR�Ĵ�С		    
//�ֽ�24,��������ֿ��Ƿ���ڵı�־λ,0XAA,��ʾ�����ֿ�;����ֵ,��ʾ�ֿⲻ����!

extern unsigned char *folder[];	 //ϵͳ�ļ���
extern unsigned char *sysfile[]; //ϵͳͼ��

//�ֽ�0~3,  ��¼UNI2GBKADDR;�ֽ�4~7  ,��¼UNI2GBKADDR�Ĵ�С
//�ֽ�8~11, ��¼FONT16ADDR ;�ֽ�12~15,��¼FONT16ADDR�Ĵ�С
//�ֽ�16~19,��¼FONT12ADDR ;�ֽ�20~23,��¼FONT12ADDR�Ĵ�С
//������,��100K����ʼ
//100K,���UNICODE2GBK��ת����	

u32 FONT16ADDR ;//16�����ŵĵ�ַ
u32 FONT12ADDR ;//12�����ŵĵ�ַ
u32 UNI2GBKADDR;//UNICODE TO GBK ���ŵ�ַ	  	 

//���������ļ�
//����ֵ:0,���³ɹ�;
//		 ����,�������.
//����ԭ��@ALIENTEK
//V1.1
#ifdef EN_UPDATE_FONT
u8 temp[512];  //��ʱ�ռ�
u8 Update_Font(void)
{
	u32 fcluster=0;	   
	u32 i;
	//u8 temp[512];  //��ʱ�ռ�	 �����ﶨ��,���ڴ����
	u32 tempsys[2];  //��ʱ��¼�ļ���ʼλ�ú��ļ���С
	float prog;
	u8 t;		 
	FileInfoStruct FileTemp;//��ʱ�ļ���   				    	 
	//�õ���Ŀ¼�Ĵغ�
	if(FAT32_Enable)fcluster=FirstDirClust;
	else fcluster=0;			   
	FileTemp=F_Search(fcluster,(unsigned char *)folder[0],T_FILE);//����system�ļ���	  
	if(FileTemp.F_StartCluster==0)return 1;						  //ϵͳ�ļ��ж�ʧ			  
	{	 										 
		//�Ȳ�������
		FileTemp=F_Search(FileTemp.F_StartCluster,(unsigned char *)folder[1],T_FILE);//��system�ļ����²���FONT�ļ���
		if(FileTemp.F_StartCluster==0)return 2;//�����ļ��ж�ʧ	

		fcluster=FileTemp.F_StartCluster;      //�����ļ��дغ�	    
		FileTemp=F_Search(fcluster,(unsigned char *)sysfile[2],T_SYS);//��system�ļ����²���SYS�ļ�
		if(FileTemp.F_StartCluster==0)return 3;//FONT12�����ļ���ʧ	 
		LCD_ShowString(20,90,"Write UNI2GBK to FLASH...");		
		LCD_ShowString(108,110,"%");		
		F_Open(&FileTemp);//�򿪸��ļ�
		i=0;	  
		while(F_Read(&FileTemp,temp))//�ɹ�����512���ֽ�
		{		 
			if(i<FileTemp.F_Size)//�������ļ���С
			{
				SPI_Flash_Write(temp,i+100000,512);//��100K�ֽڴ���ʼд��512������   
				i+=512;//����512���ֽ�
			}
			prog=(float)i/FileTemp.F_Size;
			prog*=100;
			if(t!=prog)
			{
				t=prog;
				if(t>100)t=100;
				LCD_ShowNum(84,110,t,3,16);//��ʾ��ֵ
			}					    
		}
		UNI2GBKADDR=100000;//UNI2GBKADDR��100K����ʼд��.
		tempsys[0]=UNI2GBKADDR;
		tempsys[1]=FileTemp.F_Size;	 	  //UNI2GBKADDR ��С
		SPI_Flash_Write((u8*)tempsys,0,8);//��¼�ڵ�ַ0~7��

		delay_ms(1000);			    
		//printf("UNI2GBKд��FLASH���!\n");
		//printf("д�����ݳ���:%d\n",FileTemp.F_Size);
		//printf("UNI2GBKSADDR:%d\n\n",UNI2GBKADDR);
		
		FONT16ADDR=FileTemp.F_Size+UNI2GBKADDR;//F16���׵�ַ 
		FileTemp=F_Search(fcluster,(unsigned char *)sysfile[0],T_FON);//��system�ļ����²���FONT16�����ļ�
		if(FileTemp.F_StartCluster==0)return 4;//FONT16�����ļ���ʧ	 
	
		LCD_ShowString(20,90,"Write FONT16 to FLASH... ");		
 		//printf("��ʼFONT16д��FLASH...\n");		
		F_Open(&FileTemp);//�򿪸��ļ�
		i=0;	  
		while(F_Read(&FileTemp,temp))//�ɹ�����512���ֽ�
		{
			if(i<FileTemp.F_Size)//�������ļ���С
			{
				SPI_Flash_Write(temp,i+FONT16ADDR,512);//��0��ʼд��512������   
				i+=512;//����512���ֽ�
			}
			prog=(float)i/FileTemp.F_Size;
			prog*=100;
			if(t!=prog)
			{
				t=prog;
				if(t>100)t=100;
				LCD_ShowNum(84,110,t,3,16);//��ʾ��ֵ
			}
		}												   
		tempsys[0]=FONT16ADDR;
		tempsys[1]=FileTemp.F_Size;	 	  //FONT16ADDR ��С
		SPI_Flash_Write((u8*)tempsys,8,8);//��¼�ڵ�ַ8~15��
		
		delay_ms(1000);	    
		//printf("FONT16д��FLASH���!\n");
		//printf("д�����ݳ���:%d\n",FileTemp.F_Size);


		FONT12ADDR=FileTemp.F_Size+FONT16ADDR;//F16���׵�ַ
		//printf("FONT16SADDR:%d\n\n",FONT16ADDR);
		//LCD_ShowString(20,60,"Write FONT12 to FLASH... ");		
		//FONT12��ʱ������
		/*			  
		FileTemp=F_Search(fcluster,(unsigned char *)sysfile[1],T_FON);//��system�ļ����²���FONT12�����ļ�
		if(FileTemp.F_StartCluster==0)return 5;//FONT12�����ļ���ʧ	 
		printf("��ʼFONT12д��FLASH...\n");		
		F_Open(&FileTemp);//�򿪸��ļ�
		i=0;	  
		while(F_Read(&FileTemp,temp))//�ɹ�����512���ֽ�
		{
			if(i<FileTemp.F_Size)//�������ļ���С
			{
				SPI_Flash_Write(temp,i+FONT12ADDR,512);//��0��ʼд��512������   
				i+=512;//����512���ֽ�
			}
			prog=(float)i/FileTemp.F_Size;
			prog*=100;
			if(t!=prog)
			{
				t=prog;
				if(t>100)t=100;
				LCD_ShowNum(84,80,t,3,16);//��ʾ��ֵ
			}
		}	    
		tempsys[0]=FONT12ADDR;
		tempsys[1]=FileTemp.F_Size;	 	  //FONT16ADDR ��С
		SPI_Flash_Write((u8*)tempsys,16,8);//��¼�ڵ�ַ16~23��

		printf("FONT12д��FLASH���!\n");
		printf("д�����ݳ���:%d\n",FileTemp.F_Size);   
		printf("FONT12SADDR:%d\n\n",FONT12ADDR); */
	}
	t=0XAA;
   	SPI_Flash_Write(&t,24,1);//д���ֿ���ڱ�־	0XAA
	LCD_ShowString(20,90,"  Font Update Successed  ");		    
	delay_ms(1000);		
	delay_ms(1000);		
	return 0;//�ɹ�
}
#endif

//����������õ������ַ
//��ϵͳʹ�ú���֧��֮ǰ,������øú���
//����FONT16ADDR,FONT12ADDR,UNI2GBKADDR;  
u8 Font_Init(void)
{
	u32 tempsys[2];//��ʱ��¼�ļ���ʼλ�ú��ļ���С
	u8 fontok=0;
	//SPIx_SetSpeed(SPI_SPEED_16);//���õ�����ģʽ
	SPI_Flash_Read(&fontok,24,1);//�����ֿ��־λ,���Ƿ�����ֿ�
	if(fontok!=0XAA)return 1;
	SPI_Flash_Read((u8*)tempsys,0,8);//����8���ֽ�   
	UNI2GBKADDR=tempsys[0];					  
	//printf("tempsysgbk[0]:%d\n",tempsys[0]);
	//printf("tempsysgbk[1]:%d\n",tempsys[1]);

	SPI_Flash_Read((u8*)tempsys,8,8);//����8���ֽ�   
	//printf("tempsysf16[0]:%d\n",tempsys[0]);
	//printf("tempsysf16[1]:%d\n",tempsys[1]);
	FONT16ADDR=tempsys[0];
	
	SPI_Flash_Read((u8*)tempsys,16,8);//����8���ֽ�   
	//printf("tempsysf12[0]:%d\n",tempsys[0]);
	//printf("tempsysf12[1]:%d\n",tempsys[1]);
	FONT12ADDR=tempsys[0];
	return 0;	 
}





























