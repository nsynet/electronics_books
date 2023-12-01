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
//  �������ƣ� led9_c.scs
//  ��������:  �û��ʵ�ַ��������ѭ�ص���������ܼ���
//             LEDѲ����˸��ͬʱ����ܴ���������ʾ0~8��ȫ����ʾ��ɺ�LEDֹͣ��˸�������ȫ��
//  �ļ���Դ����61��ʵ��̡̳�"ʵ��� ���������ѭ�ص���������ܼ�����
//  Ӳ�����ӣ� IOA��8λ����SEG�ӿڿ���LED�ĵ�ͨ
//             IOB��8λ����DIGͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬�����������
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.asm
//
//  ����:  2004/8/19
//===============================================
//*****************************************************************************/
// �ļ����ƣ� main.c
// ʵ�ֹ��ܣ� ��Cʵ�ַ��������ѭ�ص���������ܼ���
//            LEDѲ����˸��ͬʱ����ܴ���������ʾ0~8��ȫ����ʾ��ɺ�LEDֹͣ��˸�������ȫ��
// ���ڣ� 2004/8/19
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
int Led_Disp(int Led, int Loop);
int Delay(); 
	                                                        //��ʾ��������
int DispTbl[10] = { 0x003F,0x0006,0x005B,0x004F,0x0066,		//0��1��2��3��4
			        0x006D,0x007D,0x0007,0x007F,0x00FF};	//5��6��7��8��ȫ��
	
unsigned LedControl = 0x0001;     	
//============================================================= 
// ��������:    int main()  
// ���ڣ�		20040819		
// ��������:    ���������ѭ�ص���������ܼ���
// �﷨��ʽ:    int main() 
// ��ڲ���:    ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=============================================================
int main()
{
	int Loop_Numb = 0x0000;        //ѭ������
	int Led_Numb = 0x0000;         //��ʾ���ָ���	
		
    *P_IOA_Dir = 0x00ff;         //����A�ڵ�8λΪͬ������������LED������ܵ���ʾ״̬
	*P_IOA_Attrib = 0x00ff;
	*P_IOA_Data = 0x0000;
    *P_IOB_Dir=0x00ff;                          //����B0~B7��Ϊͬ��͵�ƽ�����LED������ܵ�Ƭѡ
	*P_IOB_Attrib=0x00ff;
	*P_IOB_Data=0x0000;
		
	for (Loop_Numb = 0; Loop_Numb<6; Loop_Numb++)
	{
	      *P_IOB_Data = LedControl << Loop_Numb; //��Ӧ�������ʾ0
	      *P_IOA_Data = DispTbl[0];    
	      Delay();
	      
	      for (Led_Numb = 0; Led_Numb<8; Led_Numb++)
	      {
	          Led_Disp(Led_Numb, Loop_Numb);     //������������ܲ���ʾ����1~8	      
	      }
	}
	
	*P_IOA_Data = 0x0000;
	*P_IOB_Data = 0x003f;                        //�����ȫ��
	*P_IOA_Data = DispTbl[9];   

    while (1)
    {	
         Delay();
	}
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
int Led_Disp(int Led, int Loop) 
{
	*P_IOB_Data = 0x0040;               //LED����
	*P_IOA_Data = LedControl << Led;    
	Delay();
	
	*P_IOB_Data = LedControl << Loop;   //��Ӧ������ʾ���������
	*P_IOA_Data = DispTbl[Led + 1];    
	Delay();
}

//============================================================= 
// main.c ����
//=============================================================	