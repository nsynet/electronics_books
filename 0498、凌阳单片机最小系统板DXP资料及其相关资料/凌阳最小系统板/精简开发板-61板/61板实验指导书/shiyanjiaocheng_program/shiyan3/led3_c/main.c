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
//  �������ƣ� led3_C.scs
//  ��������:  ��Cʵ�ְ����������������
//  �ļ���Դ����61��ʵ��̡̳�"ʵ���� ����������������ܡ�
//  Ӳ�����ӣ� IOA��8λ����SEG�ӿڿ���LED�ĵ�ͨ
//             IOA��8λ���ӵ�LED����ģ���1*8KEY�ӿڹܽ��ϣ���ȡ��Ӧ����ֵ
//             1*8key��ROW1��DGND������IOB6����DIG7ͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.c
//
//  ����:  2004/8/16
//===============================================================
#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008

#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

extern unsigned GetKey(void);


//============================================================= 
// ��������:    int main()  
// ���ڣ�		20040816 		
// ��������:    �����������������
// �﷨��ʽ:    int main() 
// ��ڲ���:    ��
// ���ڲ���:    ��
// ע������:    ��Ϊ�û�ģ��
//=============================================================
int main()
{
	unsigned Key = 0x0000;
	
	
    *P_IOA_Dir = 0x00ff;         //����A�ڵ�8λΪͬ����������8λΪͬ����������
	*P_IOA_Attrib = 0x00ff;
	*P_IOA_Data = 0xff00;
    *P_IOB_Dir=0x0040;           //����B6��Ϊ�ߵ�ƽ�������֤LED�������ӵ�
	*P_IOB_Attrib=0x0040;
	*P_IOB_Data=0x0040;
	
	while(1) 
	{
	    Key = GetKey();          //ȡ��ֵ
	    Key = Key >> 8;          //ȡLED��ʾ��ֵ
        *P_IOA_Data = Key;
	}
}

//============================================================= 
// main.c ����
//=============================================================		