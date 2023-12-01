#include "spi.h"

//Mini STM32������
//SPI ���� V1.2
//����ԭ��@ALIENTEK
//2010/5/23	

//������SPIģ��ĳ�ʼ�����룬���ó�����ģʽ������SD Card/W25X16/24L01/JF24C							  
//SPI�ڳ�ʼ��
//�������Ƕ�SPI1�ĳ�ʼ��
void SPIx_Init(void)
	{
	SPI_InitTypeDef  SPI_InitStructure;
    GPIO_InitTypeDef GPIO_InitStructure;

	RCC->APB2RSTR|=1<<12;      //SPI1��λ 
	RCC->APB2RSTR&=~(1<<12);   //SPI1������λ
	
//	RCC->APB2ENR|=1<<2;       //PORTAʱ��ʹ�� 	 
//	RCC->APB2ENR|=1<<12;      //SPI1ʱ��ʹ�� 
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOA|RCC_APB2Periph_SPI1, ENABLE );	
	
	//����ֻ���SPI�ڳ�ʼ��
//	GPIOA->CRL&=0X000FFFFF; 
//	GPIOA->CRL|=0XBBB00000;//PA5.6.7���� 	    
//	GPIOA->ODR|=0X7<<5;    //PA5.6.7����
		/* Configure SPI1 pins: SCK, MISO and MOSI */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_7;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  //�����������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	
//	SPI1->CR1|=0<<10;//ȫ˫��ģʽ	
//	SPI1->CR1|=1<<9; //���nss����
//	SPI1->CR1|=1<<8;  
//	
//	SPI1->CR1|=1<<2; //SPI����
//	SPI1->CR1|=0<<11;//8bit���ݸ�ʽ	
//	//��24L01Ҫ���� CPHA=0;CPOL=0;
//	SPI1->CR1|=1<<1; //CPOL=0ʱ����ģʽ��SCKΪ1 
//	SPI1->CR1|=1<<0; //��һ��ʱ�ӵ��½���,CPHA=1 CPOL=1
//	
//	SPI1->CR1|=7<<3; //Fsck=Fcpu/256
//	SPI1->CR1|=0<<7; //MSBfirst   

	/* SPI1 configuration */
	SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;  //����SPI�������˫�������ģʽ:SPI����Ϊ˫��˫��ȫ˫��
	SPI_InitStructure.SPI_Mode = SPI_Mode_Master;		//����SPI����ģʽ:����Ϊ��SPI
	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;		//����SPI�����ݴ�С:SPI���ͽ���8λ֡�ṹ
	SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;		//ѡ���˴���ʱ�ӵ���̬:ʱ�����ո�
	SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;	//���ݲ����ڵڶ���ʱ����
	SPI_InitStructure.SPI_NSS = SPI_NSS_Hard;//SPI_NSS_Soft;		//NSS�ź���Ӳ����NSS�ܽţ����������ʹ��SSIλ������:�ڲ�NSS�ź���SSIλ����
	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_256;		//���岨����Ԥ��Ƶ��ֵ:������Ԥ��ƵֵΪ256
	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;	//ָ�����ݴ����MSBλ����LSBλ��ʼ:���ݴ����MSBλ��ʼ
	SPI_InitStructure.SPI_CRCPolynomial = 7;	//CRCֵ����Ķ���ʽ
	SPI_Init(SPI1, &SPI_InitStructure);  //����SPI_InitStruct��ָ���Ĳ�����ʼ������SPIx�Ĵ���
	
	//SPI1->CR1|=1<<6; //SPI�豸ʹ��
	/* Enable SPI1  */
	SPI_Cmd(SPI1, ENABLE); //ʹ��SPI����

	SPIx_ReadWriteByte(0xff);//��������		 
	} 
  
//SPI �ٶ����ú���
//SpeedSet:
//SPI_SPEED_2   2��Ƶ   (SPI 36M@sys 72M)
//SPI_SPEED_4   4��Ƶ   (SPI 18M@sys 72M)
//SPI_SPEED_8   8��Ƶ   (SPI 9M@sys 72M)
//SPI_SPEED_16  16��Ƶ  (SPI 4.5M@sys 72M)
//SPI_SPEED_256 256��Ƶ (SPI 281.25K@sys 72M)
void SPIx_SetSpeed(u8 SpeedSet)
	{
	SPI1->CR1&=0XFFC7;//Fsck=Fcpu/256
	switch(SpeedSet)
		{
		case SPI_SPEED_2://����Ƶ
			SPI1->CR1|=0<<3;//Fsck=Fpclk/2=36Mhz
			break;
		case SPI_SPEED_4://�ķ�Ƶ
			SPI1->CR1|=1<<3;//Fsck=Fpclk/4=18Mhz
			break;
		case SPI_SPEED_8://�˷�Ƶ
			SPI1->CR1|=2<<3;//Fsck=Fpclk/8=9Mhz
			break;
		case SPI_SPEED_16://ʮ����Ƶ
			SPI1->CR1|=3<<3;//Fsck=Fpclk/16=4.5Mhz
			break;
		case SPI_SPEED_256://256��Ƶ
			SPI1->CR1|=7<<3;//Fsck=Fpclk/16=281.25Khz
			break;
		}		 
	SPI1->CR1|=1<<6; //SPI�豸ʹ��	  
	} 

//��������USB�ٶ�ֻ��142K/S
//SPIx ��дһ���ֽ�
//TxData:Ҫд����ֽ�
//����ֵ:��ȡ�����ֽ�
u8 SPIx_ReadWriteByte(u8 TxData)
	{		
	u8 retry=0;				 
	//while((SPI1->SR&(1<<1))==0)//�ȴ���������	
	/* Loop while DR register in not emplty */
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET) //���ָ����SPI��־λ�������:���ͻ���ձ�־λ
		{
		retry++;
		if(retry>200)return 0;
		}			  
	//SPI1->DR=TxData;	 	  //����һ��byte 
	/* Send byte through the SPI1 peripheral */
	SPI_I2S_SendData(SPI1, TxData); //ͨ������SPIx����һ������
	retry=0;
	//while((SPI1->SR&(1<<0))==0) //�ȴ�������һ��byte  
	/* Wait to receive a byte */
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET) //���ָ����SPI��־λ�������:���ܻ���ǿձ�־λ
		{
		retry++;
		if(retry>200)return 0;
		}	  						    
	//return SPI1->DR;          //�����յ�������
	/* Return the byte read from the SPI bus */
	return SPI_I2S_ReceiveData(SPI1); //����ͨ��SPIx������յ�����				    
	}



//��������USB�ٶ�Ϊ170K/S
////SPIx ��дһ���ֽ�
////TxData:Ҫд����ֽ�
////����ֵ:��ȡ�����ֽ�
//u8 SPIx_ReadWriteByte(u8 TxData)
//{		
//	u8 retry=0;				 
//	while((SPI1->SR&1<<1)==0)//�ȴ���������	
//	{
//		retry++;
//		if(retry>200)return 0;
//	}			  
//	SPI1->DR=TxData;	 	  //����һ��byte 
//	retry=0;
//	while((SPI1->SR&1<<0)==0) //�ȴ�������һ��byte  
//	{
//		retry++;
//		if(retry>200)return 0;
//	}	  						    
//	return SPI1->DR;          //�����յ�������				    
//}































