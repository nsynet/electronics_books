#ifndef	__1602_H__
#define	__1602_H__
//	write your header here
//	write your header here

//============================================================
//	文件名称：	LCD1602_User.h
//	功能描述：	LCD1602驱动程序接口函数声明配套头文件
//	维护记录：	2005-11-2	v1.0		Edit by 小丑 
//	Mz出品  时序经典
//============================================================
void LCD1602_Initial(void);							//LCD1602初始化程序
void Write_Command(unsigned int Com);				//LCD1602写指令程序
void Write_Data(unsigned int Data);					//LCD1602写数据程序
unsigned int Read_Data(void);						//LCD1602读显示数据程序
unsigned int Read_BZAC(void);						//LCD1602读BZ状态以及AC地址程序

#endif
