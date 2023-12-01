/*
 ----------------------------------------------------
 *��    �ߣ�������
 ----------------------------------------------------
 */
#include "stc.h"
#include "rtx51tny.h"

#define TASKINIT       0          //����ID
#define LEDCTRLTASK1  1
#define LEDCTRLTASK2  2
#define LEDCTRLTASK3  3
#define LEDCTRLTASK4  4

#define LED_PORT      P2

/******************************************
*��������:Taskinit
*��    ��:��
*��    ��:��
*��    ��:��ʼ������
*******************************************/
void Taskinit(void) _task_ TASKINIT
{

     os_create_task(TASKINIT);    //����Taskinit����
     os_create_task(LEDCTRLTASK1);//����LEDCtrlTask1����
     os_create_task(LEDCTRLTASK2);//����LEDCtrlTask2����
     os_create_task(LEDCTRLTASK3);//����LEDCtrlTask3����
     os_create_task(LEDCTRLTASK4);//����LEDCtrlTask4����
     os_send_signal(LEDCTRLTASK1);//��LEDCtrlTask1�������ź�
     os_delete_task(TASKINIT);    //ɾ��Taskinit����
     
}
/******************************************
*��������:LEDCtrlTask1
*��    ��:��
*��    ��:��
*��    ��:��ˮ������1
*******************************************/
void LEDCtrlTask1(void) _task_ LEDCTRLTASK1
{
     unsigned char i=0;

     while(1)
     {
        os_wait(K_SIG,LEDCTRLTASK1,0);//�ȴ�LEDCtrlTask1�����ź�
  
        for(i=0;i<=7;i++)
        {
            LED_PORT|=1<<i;
            os_wait (K_TMO,10,0);//��ʱ100ms
        }

        os_send_signal(LEDCTRLTASK2);//��LEDCtrlTask2�������ź�

     }

}
/******************************************
*��������:LEDCtrlTask2
*��    ��:��
*��    ��:��
*��    ��:��ˮ������2
*******************************************/
void LEDCtrlTask2(void) _task_ LEDCTRLTASK2
{
     unsigned char i=0;

     while(1)
     {
        
        os_wait(K_SIG,LEDCTRLTASK2,0);//�ȴ�LEDCtrlTask2�����ź�

        for(i=0;i<=7;i++)
        {
            LED_PORT&=~(1<<i);
            os_wait (K_TMO,10,0); //��ʱ100ms
        }
   
        os_send_signal(LEDCTRLTASK3);//��LEDCtrlTask3�������ź�
     }
}
/******************************************
*��������:LEDCtrlTask3
*��    ��:��
*��    ��:��
*��    ��:��ˮ������3
*******************************************/
void LEDCtrlTask3(void) _task_ LEDCTRLTASK3
{
     unsigned char i=0;

     while(1)
     {
         os_wait(K_SIG,LEDCTRLTASK3,0);//�ȴ�LEDCtrlTask3�����ź�

        for(i=0;i<=7;i++)
        {
            LED_PORT|=1<<(7-i);
            os_wait (K_TMO,10,0); //��ʱ100ms
        }

        os_send_signal(LEDCTRLTASK4);//��LEDCtrlTask4�������ź�

     }


}
/******************************************
*��������:LEDCtrlTask4
*��    ��:��
*��    ��:��
*��    ��:��ˮ������4
*******************************************/
void LEDCtrlTask4(void) _task_ LEDCTRLTASK4
{
     unsigned char i=0;

     while(1)
     {
        
         os_wait(K_SIG,LEDCTRLTASK4,0);//�ȴ�LEDCtrlTask4�����ź�
        for(i=0;i<=7;i++)
        {
            LED_PORT&=~(1<<(7-i));
            os_wait (K_TMO,10,0); //��ʱ100ms
        }

        os_send_signal(LEDCTRLTASK1);//��LEDCtrlTask1�������ź�

     }

}

