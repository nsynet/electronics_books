//===============================================================
//
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//
//    The entire notice above must be reproduced on all authorized copies.
//
//==============================================================
//============================================================
//  �������ƣ� checkled.scs
//  ��������:  LEDģ���Լ����
//  �ļ���Դ����61��ʵ��̡̳�"LEDģ���Լ����"
//  Ӳ�����ӣ� IOA��8λ����SEG�ӿڿ���LED�ĵ�ͨ,IOA��8λ����1*8�ӿڻ�ȡ���̵�״ֵ̬
//             IOB��8λ����DIGͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬�����������
//             1*8KEY��ROW1ֱ������gnd,2*4KEY��D_DP�Ӹߵ�ƽ
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.c
//
//  ����:  2004/8/23
//===============================================
//*****************************************************************************/
// �ļ����ƣ� main.c
// ʵ�ֹ��ܣ� ��Cʵ��LEDģ���Լ칦�� 
//            ���������ѭ�ص���������ܼ�����LEDѲ����˸��ͬʱ����ܴ���������ʾ0~8��
//                                  ȫ����ʾ��ɺ�LEDֹͣ��˸�������ȫ����֮��ȫ��
//            ֮����Ϊ��8��������˳����ѡ���������Ӧ������ܽ�������8�μ������󣬶�����ȫ��
//            ���Ϲ������˵��LEDģ�鹦����ȫ����
// ���ڣ� 2004/8/23
//*****************************************************************************/
#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008
#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define KEY_ALL 0xff00		

int Led_Disp(unsigned int Led, unsigned int Loop);
unsigned int GetKey(void);
	                                                        //��ʾ��������
int DispTbl[10] = { 0x003F,0x0006,0x005B,0x004F,0x0066,		//0��1��2��3��4
			        0x006D,0x007D,0x0007,0x007F,0x00FF};	//5��6��7��8��ȫ��
	
unsigned int LedControl = 0x0001;     	
//============================================================= 
// ��������:    int main()  
// ���ڣ�		20040823
// ��������:    LED����ģ���Լ����
// �﷨��ʽ:    int main() 
// ��ڲ���:    ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=============================================================
int main()
{
	int Loop_Numb = 0x0000;        //ѭ������
	int Led_Numb = 0x0000;         //��ʾ���ָ���	
	unsigned int Key = 0x0000;
	int  time = 0;
	int i=0;
		
    *P_IOA_Dir = 0x00ff;           //����A�ڵ�8λΪͬ������������LED������ܵ���ʾ״̬
	*P_IOA_Attrib = 0x00ff;        //����A�ڸ�8λΪͬ������룬��ȡ������״ֵ̬
	*P_IOA_Data = 0xff00;
    *P_IOB_Dir = 0x00ff;           //����B0~B7��Ϊͬ��͵�ƽ�����LED������ܵ�Ƭѡ
	*P_IOB_Attrib = 0x00ff;
	*P_IOB_Data = 0x0000;
		
	for (Loop_Numb = 0; Loop_Numb < 6; Loop_Numb++)
	{
	      *P_IOB_Data = LedControl << Loop_Numb; //��Ӧ�������ʾ0
	      *P_IOA_Data = DispTbl[0];    
	      Delay();
	      
	      for (Led_Numb = 0; Led_Numb<8; Led_Numb++)
	      {
	          Led_Disp(Led_Numb, Loop_Numb);     //������������ܲ���ʾ����1~8	      
	      }
	}
	
	*P_IOB_Data = 0x00bf;                        //�����ȫ��
	*P_IOA_Data = DispTbl[9]; 
	  
    Delay();
    
    *P_IOB_Data = 0x00bf;                        //�����ȫ��
	*P_IOA_Data = 0x0000;   
    Delay();  
    
    *P_IOB_Data = 0x0040;                
    for(time = 0; time < 8; time++)              //�����������������
	{
	    Key = GetKey();                          //ȡ��ֵ
	    Key = Key >> 4;                          //ȡ�����������ʾֵ
	    Key = Key >> 4;                     
        *P_IOA_Data = Key;                       //��������ܵ�������ʱ
        i++;
        Delay();
        Delay();
	}  

	*P_IOA_Data &= 0xff00;                       //���������ȫ��
	Delay();
	*P_IOA_Data |= 0x00ff;                       //���������ȫ��
	while(1)
	    Delay();
}

//============================================================= 
// ��������:    void Delay()  
// ���ڣ�		20040819		
// ��������:    ��ʱ���忴�Ź�
//=============================================================
int Delay() 
{
    int DelayValue = 0;
    
    for (DelayValue = 0; DelayValue < 0x2000; DelayValue++)
        *P_Watchdog_Clear = 1;
}
//============================================================= 
// ��������:    void Led_Disp()  
// ���ڣ�		20040819		
// ��������:    ���������ѭ�ص���������ܼ���
// ��ڲ���:    Led �����ķ�������ܺ��룬Loop ��ʾ��Ӧ���ֵ�����ܺ���
//=============================================================
int Led_Disp(unsigned int Led, unsigned int Loop) 
{
	*P_IOB_Data = 0x0040;               //LED����
	*P_IOA_Data = LedControl << Led;    
	Delay();
	
	*P_IOB_Data = LedControl << Loop;   //��Ӧ������ʾ���������
	*P_IOA_Data = DispTbl[Led + 1];    
	Delay();
}

//============================================================= 
//	��������:   GetKey()
//	���ڣ�		20040816
//	��������:	�ȴ�ֱ���м����²�̧�𣬷��ؼ�ֵ��û��ȥ������
//	���룺		��
//	�����		����16λ��ֵ
//=============================================================
unsigned int GetKey(void)          //ʹ��IOA8~IOA15��Ϊ���������
{
	unsigned KeyValue=0;

	//��ʼ��IOA����Ӧ�˿�Ϊ��������
	*P_IOA_Dir &= ~KEY_ALL;
	*P_IOA_Attrib &= ~KEY_ALL;
	*P_IOA_Buffer |= KEY_ALL;
	
	//�ȴ��м����£����ж˿ڱ�Ϊ0
	//while(!(((*P_IOA_Data) & KEY_ALL) ^ KEY_ALL))
	//{	
	//	*P_Watchdog_Clear=1;		//�忴�Ź�
	//}
	
	while(KeyValue==0)
	{
		KeyValue=(*P_IOA_Data & KEY_ALL)^KEY_ALL;
		*P_Watchdog_Clear=1;
	}
	
	KeyValue = ((*P_IOA_Data) & KEY_ALL) ^ KEY_ALL;
	//�ȴ�����̧��
	while(((*P_IOA_Data)&KEY_ALL)^KEY_ALL)
	{
		*P_Watchdog_Clear=1;
	}
	return KeyValue;
}
//============================================================= 
// main.c ����
//=============================================================	