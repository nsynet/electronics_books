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
                           0,1,2,3,
                           4,5,6,7,
                           8,9,0x0A,0x0B,
                           0x0C,0x0D,0x0E,0x0F
                           };
/********************************************************
*  ��ʼ�������豸
********************************************************/
/*void init_Keyboard(void){
     
      P1DIR &= 0x01;  // P1.4~P1.7 ����Ϊ����ģʽ
      P1DIR |= 0x0E;  // set p1.1~p1.3 ����Ϊ���ģʽ
      P1OUT |= 0x0E;  // p1.1~p1.3 ���ֵ����
      key_Flag    = 0;// ��ʼ��key_Flag 
      key_Pressed = 0;// ��ʼ��key_Pressed 
      
}*/
void init_Keyboard(void){
     
      P3DIR |= 0x0f;  // P3.0~P3.3 ����Ϊ���ģʽ
      P3DIR &= 0x0f;  // set p3.4~p3.7����Ϊ����ģʽ
      P3OUT = 0x00;  // p3.4~p3.7 ���ֵ����
      key_Flag    = 0;// ��ʼ��key_Flag 
      key_Pressed = 0;// ��ʼ��key_Pressed 
      key_val=0xff;
      
}
/*********************************************
* Check_Key(),��鰴����ȷ�ϼ�ֵ
*********************************************/
void check_Key(void){
    
    unsigned char row ,col,tmp1,tmp2;
    // tmp1��������P1OUT��ֵ��ʹP1.1~P1.3����һ��Ϊ0
    tmp1 = 0x10;
    for(row=0;row<4;row++){
        P3OUT |= 0xf0;                          // p3.4~P3.7=1
        P3OUT &= ~tmp1;                          // P3.4~p3.7����һ��Ϊ0
        tmp1 <<=1;                          // tmp1����һλ      
        if ((P3IN & 0x0f) < 0x0f){              // �Ƿ�P1IN��P3.0~P3.3����һλΪ0         
           tmp2 = 0x01;                         // tmp2���ڼ�����һλΪ0  
           for(col =0;col<0x04;col++){          // �м�� 
              if((P3IN & tmp2)==0x00){          // �Ƿ��Ǹ���
                key_val =key_Map[ row*4 +col] ; // ��ȡ��ֵ
                return;                         // �˳�ѭ��
              }
              tmp2<<= 1;                        // tmp2���� 
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
/*void key_Event(void){
     
     unsigned char tmp;
     P1OUT &= 0x01;         // ����P1OUT���ֵ
     tmp = P1IN;            // ��ȡ p1IN
     if ((key_Pressed ==0x00)&&((tmp & 0xf0) < 0xf0)) 
     {                      //�Ƿ��м�����
         key_Pressed = 1;   // ����а������£�����key_Pressed��ʶ
         delay();           //��������
         check_Key();       // ����check_Key(),��ȡ��ֵ
     }else if ((key_Pressed ==1)&&((tmp & 0xf0) == 0xf0))
     {                      //�Ƿ񰴼��Ѿ��ͷ�
         key_Pressed = 0;   // ���key_Pressed��ʶ
         key_Flag    = 1;   // ����key_Flag��ʶ
     }
     
}*/

void key_Event(void){

     unsigned char tmp;
     //P3OUT = 0xFF;
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

}
