//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//=======================================================

//============================================================
//  �������ƣ� led10_c.scs
//  ��������:  ��Cʵ��A/D���������ڷ���������ϵ���
//  �ļ���Դ����61��ʵ��̡̳�"ʵ��ʮ A/D���������ڷ���������ϵ�����
//  Ӳ�����ӣ� 61��SPY0029�ӿ�ѡ��3.3V��IOB��8λ����SEG�ӿڿ���LED�ĵ�ͨ
//             IOB6����DIG7ͨ��ULN2003A����8��LED�Ĺ�������ƽ״̬
//  IDE������  SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//  main.asm
//
//  ����:  2004/8/17
//===============================================

//*****************************************************************************/
// �ļ����ƣ� main.c
// ʵ�ֹ��ܣ� ��Cʵ��A/D���������ڷ���������ϵ���
//            ͨ���ı�LINE_IN�˿ڵ�ģ���ѹ���ı�IOB����������ݣ�
//            �����Զ���ʽִ��ADCת��������ͨ������
//            �����ܵĵ����˽�ת��������ֵ��
// ���ڣ� 2004/8/17
//*****************************************************************************/
#define P_IOA_Attrib		(volatile unsigned int *)0x7003
#define P_IOB_Data			(volatile unsigned int *)0x7005
#define P_IOB_Buffer		(volatile unsigned int *)0x7006
#define P_IOB_Dir			(volatile unsigned int *)0x7007
#define P_IOB_Attrib		(volatile unsigned int *)0x7008

#define	P_ADC_Ctrl		    (volatile unsigned int *)0x7015 
#define	P_ADC_MUX_Ctrl		(volatile unsigned int *)0x702b 
#define	P_ADC_MUX_DATA		(volatile unsigned int *)0x702C
#define	P_DAC_Ctrl		    (volatile unsigned int *)0x702A 


#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012


void Delay();
//============================================================= 
// ��������:    int main()  
// ���ڣ�		20040817 	
// ��������:    AD���������ڷ������������ʾ
// Ӳ�����ӣ�   B�ڸ߰�λ����8����������ܵ�����B6����8����������ܵĹ�����
//              A�ڵ���λ��ΪAD�����룬61��SPY0029�ӿ�ѡ��3.3V����֤AD��������Ч��Χ֮�ڡ�
// �﷨��ʽ:    int main() 
// ע������:    ��Ϊ�û�ģ��
//=============================================================
int main()
{
    unsigned ADValue = 0x0000;
	
    *P_IOB_Dir=0xff40;           //����B�ڸ�8λΪͬ������������B6��Ϊ�ߵ�ƽ�������֤LED�������ӵ�
	*P_IOB_Attrib=0xff40;
	*P_IOB_Data=0x0040;
	
	*P_ADC_MUX_Ctrl = 0x0001;    //ģ���ѹ�ź�ͨ��LINE_IN1����
	*P_ADC_Ctrl |= 0x0001;       //����ADת��
    while (1)
    {	
        
        while (!(*P_ADC_MUX_Ctrl & 0x8000)); //�ȴ�ADת�����
        ADValue = *P_ADC_MUX_DATA;           //��ȡת��ֵ
        ADValue <<= 2;                       //ͨ��led��ʾADת�����
        ADValue |= 0x0040;                   //��֤LED��������
        *P_IOB_Data = ADValue;      
        Delay();                             //��ʱ��ʾ
	}
}	

//============================================================= 
// ��������:   Delay()
// ��������:   ʵ����ʱ	
//=============================================================
void Delay()
{									//��ʱ�ӳ���
	unsigned int i;
	for(i = 0; i < 0x50; i++){
		*P_Watchdog_Clear=0x0001;	//��WatchDog
	}	
}

//============================================================= 
//main.c����
//=============================================================
