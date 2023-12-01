#include "ps2.h" 
#include "UART_INTERFACE.h"		
//Mini STM32������
//PS2 �������� 
//����ԭ��@ALIENTEK
//2010/6/17

//PS2������ʱ��Ƶ����10~20Khz(���33K)
//��/�͵�ƽ�ĳ���ʱ��Ϊ25~50us֮��.	  
			 
//PS2_Status��ǰ״̬��־
//[5:4]:��ǰ������ģʽ;[7]:���յ�һ������
//[6]:У�����;[3:0]:�յ������ݳ���;
u8 PS2_Status=CMDMODE; //Ĭ��Ϊ����ģʽ 
u8 PS2_DATA_BUF[16];   //ps2���ݻ�����

//λ������
u8 BIT_Count=0;
	   
//�ж�15~10������
//ÿ11��bit,Ϊ����1���ֽ�
//ÿ������һ����(11λ)��,�豸���ٻ�ȴ�50ms�ٷ�����һ����
//ֻ������겿��,���̲�����ʱδ����
//CHECK OK 2010/5/2
void EXTI15_10_IRQHandler(void)
	{	  	 
	static u8 tempdata=0;
	static u8 parity=0;  	   
	if(EXTI_GetITStatus(EXTI_Line15) != RESET) //���ָ����EXTI15��·�������������
		{
		/* Clear the Key Button EXTI line pending bit */  
		EXTI_ClearITPendingBit(EXTI_Line15);  //���EXTI15��·����λ    
		if(BIT_Count==0)
			{
			parity=0;
			tempdata=0;
			}
		BIT_Count++;    
		if(BIT_Count>1&&BIT_Count<10)//����������
			{	  
			tempdata>>=1;
			if(PS2_SDA)
				{
				tempdata|=0x80;
				parity++;//��¼1�ĸ���
				}   
			}
		else if(BIT_Count==10)//�õ�У��λ
			{
			if(PS2_SDA)parity|=0x80;//У��λΪ1
			}	   
		if(BIT_Count==11)//���յ�1���ֽڵ�������
			{
			BIT_Count=parity&0x7f;//ȡ��1�ĸ���	  
			if(((BIT_Count%2==0)&&(parity&0x80))||((BIT_Count%2==1)&&(parity&0x80)==0))//��żУ��OK
				{					    
				//PS2_Status|=1<<7;//��ǵõ�����	   
				BIT_Count=PS2_Status&0x0f;		
				PS2_DATA_BUF[BIT_Count]=tempdata;//��������
				if(BIT_Count<15)PS2_Status++;    //���ݳ��ȼ�1
				BIT_Count=PS2_Status&0x30;	     //�õ�ģʽ	  
				switch(BIT_Count)
					{
					case CMDMODE://����ģʽ��,ÿ�յ�һ���ֽڶ�������������
						PS2_Dis_Data_Report();//��ֹ���ݴ���
						PS2_Status|=1<<7; //��ǵõ�����
						break;
					case KEYBOARD:
						break;
					case MOUSE:
						if(MOUSE_ID==0)//��׼���,3���ֽ�
							{
							if((PS2_Status&0x0f)==3)
								{
								PS2_Status|=1<<7;//��ǵõ�����
								PS2_Dis_Data_Report();//��ֹ���ݴ���
								}
							}
						else if(MOUSE_ID==3)//��չ���,4���ֽ�
							{
							if((PS2_Status&0x0f)==4)
								{
								PS2_Status|=1<<7;//��ǵõ�����
								PS2_Dis_Data_Report();//��ֹ���ݴ���
								}
							}	 
						break;
					}		   		 
				}
			else
				{
				PS2_Status|=1<<6;//���У�����
				PS2_Status&=0xf0;//����������ݼ�����
				}
			BIT_Count=0;
			} 	 	  
		}			  
	}

//��ֹ���ݴ���
//��ʱ��������,��ֹ���ݴ���
//CHECK OK 2010/5/2
void PS2_Dis_Data_Report(void)
	{
	PS2_Set_Int(0);   //�ر��ж�
	PS2_SET_SCL_OUT();//����SCLΪ���
	Clr_PS2_SCL_OUT;    //���ƴ���
	}

//ʹ�����ݴ���
//�ͷ�ʱ����
//CHECK OK 2010/5/2
void PS2_En_Data_Report(void)
	{
	PS2_SET_SCL_IN(); //����SCLΪ����
	PS2_SET_SDA_IN(); //SDA IN
	Set_PS2_SCL_OUT;    //����   
	Set_PS2_SDA_OUT; 
	PS2_Set_Int(1);   //�����ж�
	}

//PS2�ж���������
//en:1������;0���ر�;
//CHECK OK 2010/5/2
void PS2_Set_Int(u8 en)
	{
	/* Clear the Key Button EXTI line pending bit */  
	EXTI_ClearITPendingBit(EXTI_Line15);  //���EXTI15��·����λ
	if(en)EXTI->IMR|=1<<15;//������line15�ϵ��ж�
	else EXTI->IMR&=~(1<<15);//����line15�ϵ��ж�   
	}
	
//�ȴ�PS2ʱ����sta״̬�ı�
//sta:1���ȴ���Ϊ1;0���ȴ���Ϊ0;
//����ֵ:0��ʱ���߱����sta;1����ʱ���;
//CHECK OK 2010/5/2
u8 Wait_PS2_Scl(u8 sta)
	{
	u16 t=0;
	sta=!sta;
	while(PS2_SCL==sta)
		{
		delay_us(1);
		t++;
		if(t>16000)return 1;//ʱ����� (�豸����10ms�ڼ�����״̬)
		}
	return 0;//��������
	}

//�ڷ�������/����֮��,�ȴ��豸Ӧ��,�ú���������ȡӦ��
//���صõ���ֵ 
//����0����PS2_Status.6=1��������˴���
//CHECK OK 2010/5/2
u8 PS2_Get_Byte(void)
	{
	u16 t=0;
	u8 temp=0;
	while(1)//���ȴ�55ms
		{
		t++;
		delay_us(10);
		if(PS2_Status&0x80)//�õ���һ������
			{
			temp=PS2_DATA_BUF[PS2_Status&0x0f-1];
			PS2_Status&=0x70;//��������������յ����ݱ��
			break;	
			}
		else if(t>5500||PS2_Status&0x40)break;//��ʱ���/���մ���	   
		}
	PS2_En_Data_Report();//ʹ�����ݴ���
	return temp;    
	}	 
   
//����һ�����PS2.
//����ֵ:0���޴���,����,�������
u8 PS2_Send_Cmd(u8 cmd)
	{
	u8 i;
	u8 high=0;//��¼1�ĸ���		 
	PS2_Set_Int(0);   //�����ж�
	PS2_SET_SCL_OUT();//����SCLΪ���
	PS2_SET_SDA_OUT();//SDA OUT
	Clr_PS2_SCL_OUT;//����ʱ����
	delay_us(120);//��������100us
	Clr_PS2_SDA_OUT;//����������
	delay_us(10);
	PS2_SET_SCL_IN();//�ͷ�ʱ����,����PS2�豸�õ���һ��λ,��ʼλ
	Set_PS2_SCL_OUT;
	if(Wait_PS2_Scl(0)==0)//�ȴ�ʱ������
		{									  
		for(i=0;i<8;i++)
			{
			if(cmd&0x01)
				{
				Set_PS2_SDA_OUT;
				high++;
				}
			else Clr_PS2_SDA_OUT;   
			cmd>>=1;
			//��Щ�ط�û�м�����,��Ϊ��Щ�ط����������ѭ��
			Wait_PS2_Scl(1);//�ȴ�ʱ������ ����8��λ
			Wait_PS2_Scl(0);//�ȴ�ʱ������
			}
		if((high%2)==0)Set_PS2_SDA_OUT//����У��λ 10
		else Clr_PS2_SDA_OUT;
		Wait_PS2_Scl(1); //�ȴ�ʱ������ 10λ
		Wait_PS2_Scl(0); //�ȴ�ʱ������
		Set_PS2_SDA_OUT;   //����ֹͣλ  11	  
		Wait_PS2_Scl(1);//�ȴ�ʱ������ 11λ
		PS2_SET_SDA_IN();//SDA in
		Wait_PS2_Scl(0);//�ȴ�ʱ������
		if(PS2_SDA==0)Wait_PS2_Scl(1);//�ȴ�ʱ������ 12λ 
		else 
			{
			PS2_En_Data_Report();
			return 1;//����ʧ��
			}		
		}
	else 
		{
		PS2_En_Data_Report();
		return 2;//����ʧ��
		}
	PS2_En_Data_Report();
	return 0;    //���ͳɹ�
	}
	
//PS2��ʼ��				   
//CHECK OK 2010/5/2
void PS2_Init(void)
	{
	GPIO_InitTypeDef GPIO_InitStructure;	//GPIO
	NVIC_InitTypeDef NVIC_InitStructure;	//�ж�
	EXTI_InitTypeDef EXTI_InitStructure;	//�ⲿ�ж���
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOA, ENABLE );
		
	GPIO_PinRemapConfig(GPIO_Remap_SWJ_Disable, ENABLE);	//SWJ��ȫʧ��(JTAG+SW-DP)
							  
	//GPIOA->ODR|=5<<13;				
	GPIO_InitStructure.GPIO_Pin = PS2_SCL_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU ;  //��������
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(PS2_SCL_PORT, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = PS2_SDA_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU ;  //��������
	//GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(PS2_SDA_PORT, &GPIO_InitStructure);			  	  	 
	 
	/* Connect Button EXTI Line to Button GPIO Pin */
	GPIO_EXTILineConfig(GPIO_PortSourceGPIOA, GPIO_PinSource15);  	//ѡ��PA15���ڵ�GPIO�ܽ������ⲿ�ж���·EXIT15   		   
	 			
	/* Configure Button EXTI line */
	EXTI_InitStructure.EXTI_Line = EXTI_Line15;	//�ⲿ��·EXIT15
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;	//EXTI_Mode_Event ;//		//�����ⲿ�ж�ģʽ:EXTI��·Ϊ�ж�����  ���� EXTI��·Ϊ�¼����� 
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;  //�ⲿ�жϴ�����ѡ��:����������·�½���Ϊ�ж�����
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;		//ʹ���ⲿ�ж���״̬
	EXTI_Init(&EXTI_InitStructure);		//����EXTI_InitStruct��ָ���Ĳ�����ʼ������EXTI�Ĵ���		  
	/* Enable the EXTI15 Interrupt */
	NVIC_InitStructure.NVIC_IRQChannel = EXTI15_10_IRQn; //ʹ�ܰ������ڵ��ⲿ�ж�ͨ��
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1; //��ռ���ȼ�1��
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 2; //�����ȼ�2��
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE; //ʹ���ⲿ�ж�ͨ��
	NVIC_Init(&NVIC_InitStructure); //����NVIC_InitStruct��ָ���Ĳ�����ʼ������NVIC�Ĵ���	 
	} 














