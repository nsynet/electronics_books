/******************************************************************
*      �ļ����ƣ�  
*              RS485.c 
*      �ļ�˵����
*           ʹ��UARTģ�����Max3485оƬʵ��485�ӿ� 
******************************************************************/

#include  "msp430x44x.h"
/*****************************************************/
/*   ���ݶ���                                        */
/*****************************************************/
char rs485_RBuf;   //���ջ�����
char rs485_TBuf;   //���ͻ�����
unsigned char rs485_RFlag;        // ���ջ����������������Ŀ����λ�ַ���
/****************************************************************
*  ��ʼ��
*****************************************************************/
void init_485()
{
    unsigned char tmpv;
    FLL_CTL0 &= 0xbf;
    UCTL0 |=SWRST;
    UCTL0 |=CHAR;                          // 8-bit �ַ�
    FLL_CTL1|=SELS+XT2OFF+SELM_XT2;        //�����ڶ�������
    do 
    {
      IFG1 &= ~OFIFG;                      // ���OSCFault��־
      for(tmpv = 0xff;tmpv > 0;tmpv--);    //
    }while ((FLL_CTL0&XT2OF) == XT2OF );   // �ڶ��������Ƿ���������
    UCTL0|=SWRST;
    UCTL0|=CHAR;                           // 8-bit �ַ�
    UTCTL0=SSEL0+SSEL1;                    // UCLK=SMCLK
    UBR00=0x87;                            // ��6MHz�½��� 9600������ͨ��
    UBR10=0x02;                            // ��6MHz�½��� 9600������ͨ��
    UMCTL0=0x03;                              // �����Ĵ���
    UCTL0&=~SWRST;
    
    ME1|= (UTXE0 + URXE0);                 // ʹ�� USART0 TXD/RXD
    IE1|= URXIE0 ;
    IFG1 = 0x00;
    P2SEL |= 0x30;                         // P2.4,P2.5 = USART0 TXD/RXD
    P2DIR &= 0xcF;
    P2DIR |= 0x10;
    rs485_RBuf = 0;
    rs485_TBuf = 0;
    P4DIR |= 0x04;                         //p4.2 ��λ���ģʽ
    P4SEL &= 0xFB;                         //P4.2 sel=0
    P4OUT &= 0xFB;                         //p4.2=0,R0 Enable
            
}

void rs485_SendData()
{
     P4OUT |= 0x04;                       //Max3485 DI ʹ��
     TXBUF0 = rs485_TBuf;                 //��������
     while((UTCTL0 & 0x01)!=0x01);
     P4OUT &= 0xfb;                       //ʹ�� RO
     
     
}
#pragma vector = UART0RX_VECTOR
__interrupt void data_Receive(void)       // UART�����ж�
{   
   rs485_RBuf = RXBUF0;
   rs485_RFlag = 1;
 }

