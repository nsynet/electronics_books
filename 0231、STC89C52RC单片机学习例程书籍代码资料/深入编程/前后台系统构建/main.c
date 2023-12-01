/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"
#include "Typedef.h"
#include "Process.h"

/****************************************
*��������:UARTInit
*��    ��:��
*��    ��:��
*��    ��:���ڳ�ʼ��
******************************************/
static void UARTInit(void)        
{
     SCON =0x40;             
	T2CON =0x34;            
	RCAP2L=0xD9;           
	RCAP2H=0xFF;           
}
/****************************************
*��������:UARTSendByte
*��    ��:byte Ҫ���͵��ֽ�
*��    ��:��
*��    ��:�������ݷ���
******************************************/
static void UARTSendByte(UINT8 byte)
{
	SBUF=byte;             
	while(TI==0);           
	TI=0;                   
}
/****************************************
*��������:PROC_SetData
*��    ��:Wp  ����1
          Lp  ����2
*��    ��:��
*��    ��:����-��������
******************************************/
PROC_API void PROC_SetData(WPARAM Wp,LPARAM Lp)
{
      static UINT8 cnt=1;
	  static UINT8 buf[8],i;

	  Wp=Wp;  //����ʹ�øñ���,���Ը�ֵ,������ֱ��뾯��
	  Lp=Lp;  //����ʹ�øñ���,���Ը�ֵ,������ֱ��뾯��

	  for(i=0; i<8; i++)
	  {
	      buf[i]=cnt+'0';
           	  
	  }

	  if(++cnt>9)
      {
	       cnt=1;
	  }

      SetCurProcIsAlive(FALSE);     //��ǰ������Ч

	  SetProcIsAlive(PROC_SEND_DATA,//�������ݽ������
	                 TRUE,          //����
			 (WPARAM)buf,           //����bufָ��
			 (LPARAM)8);            //���ݳ���Ϊ8

}

/****************************************
*��������:PROC_SendData
*��    ��:Wp  ����1
          Lp  ����2
*��    ��:��
*��    ��:����-��������
******************************************/
PROC_API void PROC_SendData(WPARAM Wp,LPARAM Lp)
{
     UINT8  i;

	 UINT8 *pbuf=(UINT8 *)Wp;     //��ȡҪ���͵�����

	 UINT8  j=(UINT8)Lp;          //��ȡ�������ݳ���

	 for(i=0; i<j; i++)
	 {
	     UARTSendByte(*(pbuf+i)); //��������
	 }

	 for(i=0;i<255;i++)
	     for(j=0;j<255;j++);      //��ʱһ���

	 for(i=0;i<255;i++)
	     for(j=0;j<255;j++);      //��ʱһ���

     SetCurProcIsAlive(FALSE);    //��ǰ������Ч

	 SetProcIsAlive(PROC_SET_DATA,//�������ݽ������
	                TRUE,         //����
			(WPARAM)0,            //����1
			(LPARAM)0);           //����2

}

/****************************************
*��������:main
*��    ��:��
*��    ��:��
*��    ��:��������
******************************************/
void main(void)
{
     UARTInit();                //���ڳ�ʼ��

     while(1)
	 {
	 
	    ProcPerform();          //���̵���
	 
	 }
}

