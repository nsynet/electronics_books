/*********************************************************
*     �ļ����ƣ�
*             keyboard12.c
*      ������������
*            ����ʽ���̼��
*   ���룺
*            �û��İ����¼�
*   �����
*            ����û�����ļ�ֵ
*
*
*********************************************************/

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

#define KEY_BOARD 1

unsigned char key_Pressed,      // �Ƿ��м�ֵ����
              key_val,          // ��ż�ֵ
              key_Flag;         // �Ƿ�һ�����µİ����Ѿ��ɿ���
                                // ���ǰ����ļ�ֵ���Զ�ȡ

unsigned char key_Map[16] ={    //���ü����߼���ֵ���������ֵ��ӳ��
                           0x0C,0x0D,0x0E,0x0F,
                           0x08,0x09,0x0A,0x0B,
                           0x04,0x05,0x06,0x07,
                           0x00,0x01,0x02,0x03

                           };
/********************************************************
*  ��ʼ�������豸
********************************************************/
void init_Keyboard(void){

      P3DIR &= 0xf0;  // P3.0~P3.3 ����Ϊ����ģʽ
      P3DIR |= 0xf0;  // set p3.4~p3.7 ����Ϊ���ģʽ
     // P3OUT |= 0xF0;  // p3.4~p3.7 ���ֵ����
      P3OUT=0X00;
      key_Flag    = 0;// ��ʼ��key_Flag
      key_Pressed = 0;// ��ʼ��key_Pressed
      key_val = 0xFF;

}
/*********************************************
* Check_Key(),��鰴����ȷ�ϼ�ֵ
*********************************************/
void check_Key(void){
  P3OUT &= 0x0F;         // ����P3OUT���ֵ
     P3OUT = 0xFF;
     P3DIR &= 0xF0;  // P3.0~P3.3 ����Ϊ����ģʽ
     P3DIR |= 0xF0;  // set p3.4~p3.7 ����Ϊ���ģʽ
     P3OUT &= 0x0F;         // ����P3OUT���ֵ
    unsigned char row ,col,tmp1,tmp2;
    // tmp1��������P3OUT��ֵ��ʹP1.1~P1.3����һ��Ϊ0
    tmp1 = 0x80;
    for(row=0;row<4;row++){
        P3OUT |= 0xF0;                          // p3.4~P3.7=1
        P3OUT &= ~tmp1;                          // P3.4~p3.7����һ��Ϊ0
        tmp1 >>= 1;                          // tmp1 ����һλ
        if ((P3IN & 0x0F) < 0x0F){              // �Ƿ�P3IN��P3.0~P3.3����һλΪ0
           tmp2 = 0x01;                         // tmp2���ڼ�����һλΪ0
           for(col =0;col<0x04;col++){          // �м��
              if((P3IN & tmp2)==0x00){          // �Ƿ��Ǹ���
                key_val =key_Map[ row*4 +col] ; // ��ȡ��ֵ
                return;                         // �˳�ѭ��
              }
              tmp2 <<= 1;                        // tmp2����
           }
        }
        if(key_val==0xFF)
        {
           key_Pressed = 0;
        }
    }

}
/***********************************************************
* �ӳ٣�������������
************************************************************/
void delay(){
     unsigned char tmp;
      for(tmp=0xff;tmp>0;tmp--);
}
/************************************************************
*  key_Event()���������Ƿ��м����£�����л�ȡ��ֵ
*************************************************************/
void key_Event(void){
     IE2   &= ~0x80;  
     unsigned char tmp;
     P3OUT &= 0x0F;         // ����P3OUT���ֵ
     P3OUT = 0xFF;
     P3DIR &= 0xF0;  // P3.0~P3.3 ����Ϊ����ģʽ
     P3DIR |= 0xF0;  // set p3.4~p3.7 ����Ϊ���ģʽ
     P3OUT &= 0x0F;         // ����P3OUT���ֵ
     
     tmp = P3IN;            // ��ȡ p3IN
     if ((key_Pressed ==0x00)&&((tmp & 0x0F) < 0x0F))
     {                      //�Ƿ��м�����
         key_Pressed = 1;   // ����а������£�����key_Pressed��ʶ
         delay();           //��������
         delay();
         delay();
         check_Key();       // ����check_Key(),��ȡ��ֵ
     }else if ((key_Pressed ==1)&&((tmp & 0x0F) == 0x0F))
     {                      //�Ƿ񰴼��Ѿ��ͷ�
         key_Pressed = 0;   // ���key_Pressed��ʶ
         key_Flag    = 1;   // ����key_Flag��ʶ
     }
IE2   |= 0x80;                          // ʹ�� basic timer �ж�
}
