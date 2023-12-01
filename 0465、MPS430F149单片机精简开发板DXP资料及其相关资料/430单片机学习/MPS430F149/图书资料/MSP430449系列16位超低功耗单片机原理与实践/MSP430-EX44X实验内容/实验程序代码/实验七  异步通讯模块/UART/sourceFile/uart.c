/******************************************************
* �ļ����ƣ�uart.c
* �ļ�˵����
*          RS232ͨѸʹ�õ�UART0 ģ�� 
*****************************************************/
#ifndef MSP430XF449_H
#include <msp430x44x.h>
#endif

#define UART_BUF_SIZE 6
/*****************************************************/
/*   ���ݶ���                                        */
/*****************************************************/
char uart_RBuf[UART_BUF_SIZE];   //���ջ�����
char uart_TBuf[UART_BUF_SIZE];   //���ͻ�����
unsigned char uart_RDataPos,     //����ָʾ��һ����Ž������ݵĻ�����λ��
              uart_RFlag,        // ���ջ����������������Ŀ����λ�ַ���
              uart_TNum,         // ���ͻ����������������Ŀ����λ�ַ���
              uart_TPos;         // ��ʶ uart ��һ��Ҫ���͵����ݵ�λ��
/*******************************************************
*     ģ���ʼ��
*******************************************************/
void init_UART(void)
{
    unsigned char tmpv;
    FLL_CTL0 &= 0xbf;
    UCTL0 |=SWRST;
    UCTL0 |=CHAR;                           // 8-bit �ַ�
  /*  UTCTL0= 0x10;                         // UCLK=ACLK
    UBR00 = 0x0d;                           // ��32768�½��� 2400������ͨ��
    UBR10 = 0x00;                           // ��32768�½��� 2400������ͨ��
    UMCTL0= 0x57;                           // �����Ĵ���
  */ 
       
    FLL_CTL1|=SELS+XT2OFF+SELM_XT2;        //�����ڶ�������
    do 
    {
      IFG1 &= ~OFIFG;                      // ���OSCFault��־
      for(tmpv = 0xff;tmpv > 0;tmpv--);    //
    }while ((FLL_CTL0&XT2OF) == XT2OF );   // �ڶ��������Ƿ���������
    UCTL0|=SWRST;
    UCTL0|=CHAR;                           // 8-bit �ַ�
    UTCTL0=SSEL0+SSEL1;                    // UCLK=SMCLK
    //UBR00=0xa0;                            // ��4MHz�½��� 9600������ͨ��
    //UBR10=0x01;                            // ��4MHz�½��� 9600������ͨ��
    //UMCTL0=0x5e;                           // �����Ĵ���
    UBR00=0x87;                            // ��6MHz�½��� 9600������ͨ��
    UBR10=0x02;                            // ��6MHz�½��� 9600������ͨ��
    UMCTL0=0x03;                           // �����Ĵ���
    UCTL0&=~SWRST;
    
    ME1|= (UTXE0 + URXE0);                 // ʹ�� USART0 TXD/RXD
    IE1|= URXIE0 ;
    IFG1 = 0x00;
    P2SEL |= 0x30;                         // P2.4,P2.5 = USART0 TXD/RXD
    P2DIR |= 0x10;
    uart_RDataPos = 0;
    uart_TNum =0 ;
    for(tmpv=0;tmpv<UART_BUF_SIZE;tmpv++)
    {
       uart_RBuf[tmpv] = 0;
    }
}
/****************************************************
*     ���ݷ���
****************************************************/
void uart_Start(void)
{
    IE1 |= UTXIE0 ;
    while((UTCTL0 & 0x01 )!=0x01);        //�ȴ�ֱ��û�����ݷ���
    TXBUF0 = uart_TBuf[0];                //��������
    uart_TPos = 1;
}

/****************************************************
*     ���ݽ����ж�
****************************************************/
#pragma vector = UART0RX_VECTOR 
__interrupt void data_Receive(void)       // UART�����ж�
{     
    uart_RBuf[uart_RDataPos]=RXBUF0-48;  //��asc��ת�䵽��Ƭ����������
                                         //��asc��ת�䵽��Ƭ����������
    uart_RDataPos = (uart_RDataPos + 1); //�ƶ����ջ�����ָ��
    if (uart_RDataPos >= UART_BUF_SIZE)
    {
        uart_RDataPos = 0;
    }
    uart_RFlag += 1;                    //�������ݼ�������1
}
#pragma vector = UART0TX_VECTOR
__interrupt void __uart_Send(void)
{
    uart_TNum -= 1;
    if (uart_TNum >0)
    {
        TXBUF0 = uart_TBuf[uart_TPos];
        uart_TPos +=1; 
    }else {
       IE1 &= 0x7f;                   //disable UTXIE0
    }
}
