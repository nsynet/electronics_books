#ifndef	__1602_H__
#define	__1602_H__
//	write your header here
//	write your header here

//============================================================
//	�ļ����ƣ�	LCD1602_User.h
//	����������	LCD1602��������ӿں�����������ͷ�ļ�
//	ά����¼��	2005-11-2	v1.0		Edit by С�� 
//	Mz��Ʒ  ʱ�򾭵�
//============================================================
void LCD1602_Initial(void);							//LCD1602��ʼ������
void Write_Command(unsigned int Com);				//LCD1602дָ�����
void Write_Data(unsigned int Data);					//LCD1602д���ݳ���
unsigned int Read_Data(void);						//LCD1602����ʾ���ݳ���
unsigned int Read_BZAC(void);						//LCD1602��BZ״̬�Լ�AC��ַ����

#endif
