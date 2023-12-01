//03-06-05
//SACM_A2000���Զ���ʽ����̿��ƣ���������
//����Ҫ����������sacmv25.lib���Լ��͸ÿ��Ӧ��hardware.asm��
#define		DAC1			1
#define		Full			1
#include	"A2000.h"
#define P_Watchdog_Clear		(volatile unsigned int *)0x7012   
main()
{ 
  extern long   RES_D1_24K_SA,RES_D1_24K_EA;    //����������Դ����ĩ��ַ���
  long  int Addr;								//�����ַ����
  int	Ret = 0;								//�����ȡ�������ݱ�������ʼ��
  
	Addr=RES_D1_24K_SA;					  		//�����������е���ַ
	 
	SACM_A2000_Initial(0);						//���Զ���ʽ���ŵĳ�ʼ��
	 
    SACM_A2000_InitDecoder(DAC1);				//��ʼ��A2000�����������Է��Զ���ʽ���� 	
	
     while(1)
	{
		*P_Watchdog_Clear=0x0001;
		if(SACM_A2000_TestQueue()!=Full)
		{
			Ret =SP_GetResource(Addr);   
	        SACM_A2000_FillQueue(Ret);
	        Addr++;
    	}
 
         if(Addr< RES_D1_24K_EA )				//����ö�����δ���꣬��δ����ĩ��ַʱ
         SACM_A2000_Decoder();					//��ȡ��Դ�����н��룬��ͨ���жϷ����ӳ�������DACͨ������
         else
         SACM_A2000_Stop();						//����ֹͣ����
    }  
}

