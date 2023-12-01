#include "remote.h"	  
#include "SysTickDelay.h"
//Mini STM32������
//����ң�ؽ��� �������� 
//����ԭ��@ALIENTEK
//2010/6/17	  		  
u32 Remote_Odr=0;  	 //�����ݴ洦
u8  Remote_Cnt=0;    //��������,�˴ΰ��¼��Ĵ���
u8  Remote_Rdy=0;    //������յ�����    



//��ʼ������������ŵ�����
//�����ж�,��ӳ�� 
void Remote_Init(void)
	{							 
	GPIO_InitTypeDef GPIO_InitStructure;	//GPIO
	NVIC_InitTypeDef NVIC_InitStructure;	//�ж�
	EXTI_InitTypeDef EXTI_InitStructure;	//�ⲿ�ж���
	//RCC->APB2ENR|=1<<2;       //PAʱ��ʹ��		 
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOA, ENABLE );	  
	//GPIOA->CRL&=0XFFFFFF0F;
	//GPIOA->CRL|=0X00000080;	//PA1����	 
	//GPIOA->ODR|=1<<1;		//PA.1����   
	GPIO_InitStructure.GPIO_Pin = RDATA_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU ;  //��������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(RDATA_PORT, &GPIO_InitStructure);  
	//GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;		//���Ӵ�������
	//GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP ;  //
	//GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	//GPIO_Init(GPIOC, &GPIO_InitStructure);  
	//GPIO_ResetBits(GPIOC,GPIO_Pin_13);
	//Ex_NVIC_Config(0,1,0x01);//��line1ӳ�䵽PA.1���½��ش���.
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);	
	/* Connect Button EXTI Line to Button GPIO Pin */
	GPIO_EXTILineConfig(GPIO_PortSourceGPIOA, GPIO_PinSource1);  	//ѡ��PA1���ڵ�GPIO�ܽ������ⲿ�ж���·EXIT1		
	/* Configure Button EXTI line */
	EXTI_InitStructure.EXTI_Line = EXTI_Line1;	//�ⲿ��·EXIT1
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;			//�����ⲿ�ж�ģʽ:EXTI��·Ϊ�ж�����  EXTI_Mode_Event ;//���� EXTI��·Ϊ�¼����� 
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  //�ⲿ�жϴ�����ѡ��:����������·�½���Ϊ�ж�����
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;		//ʹ���ⲿ�ж���״̬
	EXTI_Init(&EXTI_InitStructure);		//����EXTI_InitStruct��ָ���Ĳ�����ʼ������EXTI�Ĵ���	
	//MY_NVIC_Init(2,1,EXTI1_IRQChannel,2);
	/* Enable the EXTI1 Interrupt */
	NVIC_InitStructure.NVIC_IRQChannel = EXTI1_IRQn; //ʹ�ܰ������ڵ��ⲿ�ж�ͨ��
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2; //��ռ���ȼ�2��
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1; //�����ȼ�1��
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //ʹ���ⲿ�ж�ͨ��
	NVIC_Init(&NVIC_InitStructure); //����NVIC_InitStruct��ָ���Ĳ�����ʼ������NVIC�Ĵ���
	}   

//���������
//�����Ϊ5ms
//����ֵ:x,��������Ϊx*20us(x=1~250);
u8 Pulse_Width_Check(void)
	{
	u8 t=0;	
	while(RDATA)
		{	 
		t++;delay_us(20);					 
		if(t==250)return t; //��ʱ���
		}
	return t;
	}			   
	
//����������  
/*-------------------------Э��--------------------------
��ʼ����9ms,������һ��4.5ms�ĸ�����,֪ͨ������ʼ����������
�����Ƿ���4��8λ��������,��һ������ң��ʶ����(REMOTE_ID),��һ��Ϊ
����(0),�ڶ���Ϊ����(255),�������������Ǽ�ֵ,��һ��Ϊ����
�ڶ���Ϊ����.�������40ms,ң���ٷ���һ��9ms��,2ms�ߵ�����,
��ʾ�����Ĵ���,����һ����֤��ֻ������һ��,������ֶ��,���
����Ϊ�ǳ������¸ü�.
---------------------------------------------------------*/		 
//�ⲿ�жϷ������	   
void EXTI1_IRQHandler(void)
	{       
	u8 res=0;
	u8 OK=0; 
	u8 RODATA=0; 
	//EXTI_ClearITPendingBit(EXTI_Line1);  //���EXTI1��·����λ       		 
	while(1)
		{        
		if(RDATA)//�и��������
			{
			//GPIO_SetBits(GPIOC,GPIO_Pin_13);    
			res=Pulse_Width_Check();//��ô˴θ�������   
			//GPIO_ResetBits(GPIOC,GPIO_Pin_13);    
			if(res==250)break;//�������ź�
			if(res>=200&&res<250)
			  {
			  OK=1; //���ǰ��λ(4.5ms)	
			  }
			else if(res>=85&&res<200)  //����������һ(2ms)
				{  							    		 
				Remote_Rdy=1;//���ܵ�����
				Remote_Cnt++;//������������
				break;
				}
			else if(res>=50&&res<85)RODATA=1;//1.5ms
			else if(res>=10&&res<50)RODATA=0;//500us
			if(OK)
				{
				//Remote_Odr<<=1;
				//Remote_Odr+=RODATA; 
				Remote_Odr>>=1;
				if (RODATA) Remote_Odr+=0x80000000;
				Remote_Cnt=0; //������������
				}   
			}			 						 
		} 	 	    
	//EXTI->PR=1<<1;      //����жϱ�־λ   
	/* Clear the Key Button EXTI line pending bit */  
	EXTI_ClearITPendingBit(EXTI_Line1);  //���EXTI1��·����λ     
	}  
//����������
//������Ӧ�ļ�ֵ
u8 Remote_Process(void)
	{               
	u8 t1,t2; 
	//�������ݸ�ʽ:Remote_Odr = �����뷴��+������+�û���ַ�뷴��+�û���ַ��
	t1=Remote_Odr&0xff; //�������
	t2=(Remote_Odr>>8)&0xff; 
	Remote_Rdy=0;//������ 		      
	if((t1==(u8)~t2)&&((Remote_Odr&0xff)==REMOTE_ID))//����ң��ʶ����(ID) 
		{ 
		t1=Remote_Odr>>24;
		t2=(Remote_Odr>>16)&0xff;	
		if(t1==(u8)~t2)return t2; //�����ֵ  
		}     
	return 0;
	}































