//========================================================
//	�ļ����ƣ�	SACM_DVR1600_User_C.c
//	����������	DVR1600�û�������C���԰棩�����ڱ�����ȡ������Դ����
//				������
//					void USER_DVR1600_GetResource_Init(unsigned int SoundIndex);
//					void USER_DVR1600_GetResource(unsigned int *p_Buf, unsigned int Words);
//					void USER_DVR1600_SaveResource_Init(unsigned int UserParam);
//					void USER_DVR1600_SaveResource(unsigned int *p_Buf, unsigned int Words);
//					void USER_DVR1600_SaveResource_End(void);
//				��Щ�������������Զ����ã��ɸ�����Ҫ�����޸���Щ����������
//	ά����¼��	2006-10-16	v1.0, by Qwerty
//========================================================
#include "SPCE061A.h"
#include "Flash.h"
//======================================================
//	���������Ƿ�����
//======================================================
#define	RECORD_SA	0xC000					// ¼����Դ��ʼ��ַ
#define	RECORD_EA	0xEFFF					// ¼����Դ������ַ

//======================================================
//	�ⲿ�����ͱ�������
//======================================================
extern void SACM_DVR1600_Stop(void);

//========================================================================
//	ȫ�ֱ�������
//========================================================================
unsigned int ResAddr;

//========================================================================
//	�﷨��ʽ��	void USER_DVR1600_GetResource_Init(unsigned int SoundIndex);
//	ʵ�ֹ��ܣ�	(��DVR1600�������Զ�����)��ȡ������Դ���ݣ���ʼ������
//	������		SoundIndex:		������Դ���
//	����ֵ��		��
//========================================================================
void USER_DVR1600_GetResource_Init(unsigned int SoundIndex)
{
	ResAddr = RECORD_SA;					// ��ʼ��������Դ����ʼ��ַ
}

//========================================================================
//	�﷨��ʽ��	void USER_DVR1600_GetResource(unsigned int *p_Buf, unsigned int Words);
//	ʵ�ֹ��ܣ�	(��DVR1600�������Զ�����)��ȡ������Դ���ݣ�����䵽���������
//	������		p_Buf:		����������е���ʼ��ַ(�ò����ɺ������Զ�����)
//				Words:		��������ݵ���������λΪWord(�ò����ɺ������Զ�����)
//	����ֵ��		��
//========================================================================
void USER_DVR1600_GetResource(unsigned int *p_Buf, unsigned int Words)
{
	while(Words>0)
	{
		*p_Buf = *(unsigned int*)ResAddr;
		p_Buf++;
		ResAddr++;
		Words--;
	}
}

//========================================================================
//	�﷨��ʽ��	void USER_DVR1600_SaveResource_Init(unsigned int UserParam);
//	ʵ�ֹ��ܣ�	(��DVR1600�������Զ�����)����¼�Ƶ�������Դ���룬��ʼ������
//	������		UserParam:	��SACM_DVR1600_Play�������ݵ��û��Զ������
//	����ֵ��		��
//========================================================================
void USER_DVR1600_SaveResource_Init(unsigned int UserParam)
{
	unsigned int Addr;
	for(Addr=RECORD_SA; Addr<=RECORD_EA; Addr+=0x0100)
	{
		Flash_Erase(Addr);					// ����¼�������Flash
		*P_Watchdog_Clear = 0x01;
	}
	ResAddr = RECORD_SA + 2;				// ����ǰ����Word������¼������ʱ������Դ���ȣ�
}

//========================================================================
//	�﷨��ʽ��	void USER_DVR1600_SaveResource(unsigned int *p_Buf, unsigned int Words)
//	ʵ�ֹ��ܣ�	(��DVR1600�������Զ�����)��ȡ�ѱ������ݣ�������
//	������		p_Buf:		����ȡ���ѱ������ݵ���ʼ��ַ(�ò����ɺ������Զ�����)
//				Words:		�ѱ������ݵ���������λΪWord(�ò����ɺ������Զ�����)
//	����ֵ��		��
//========================================================================
void USER_DVR1600_SaveResource(unsigned int *p_Buf, unsigned int Words)
{
	while(Words--)
	{
		Flash_WriteWord(ResAddr++, *p_Buf++);
		if(ResAddr>RECORD_EA)				// �ﵽ������ַ��ֹͣ¼��
		{
			SACM_DVR1600_Stop();
			break;
		}
	}
}

//========================================================================
//	�﷨��ʽ��	void USER_DVR1600_SaveResource_End(void)
//	ʵ�ֹ��ܣ�	(��DVR1600�������Զ�����)¼�������󣬽�¼����Դ�ĳ���(��λΪByte)���浽����Դ��ǰ����word
//	������		��
//	����ֵ��		��
//========================================================================
void USER_DVR1600_SaveResource_End(void)
{
	unsigned int ResSize;
	ResSize = (ResAddr - RECORD_SA)<<1;		// ����¼����Դ�ĳ��ȣ�ת��ΪByte��λ
	Flash_WriteWord(RECORD_SA, ResSize);	// ��Դ���ȵĵ�16λд��RECORD_SA��
	Flash_WriteWord(RECORD_SA+1, 0x0000);	// ��Դ���ȵĸ�16λ���0
}
