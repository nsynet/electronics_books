/******************************************************
* 文件名称：uart.c
* 文件说明：
*          RS232通迅使用的UART0 模块 
*****************************************************/
#ifndef MSP430XF449_H
#include <msp430x44x.h>
#endif

#define UART_BUF_SIZE 6
/*****************************************************/
/*   数据定义                                        */
/*****************************************************/
char uart_RBuf[UART_BUF_SIZE];   //接收缓冲区
char uart_TBuf[UART_BUF_SIZE];   //发送缓冲区
unsigned char uart_RDataPos,     //用于指示下一个存放接收数据的缓冲区位置
              uart_RFlag,        // 接收缓冲区缓存的数据数目（单位字符）
              uart_TNum,         // 发送缓冲区缓存的数据数目（单位字符）
              uart_TPos;         // 标识 uart 下一个要发送的数据的位置
/*******************************************************
*     模块初始化
*******************************************************/
void init_UART(void)
{
    unsigned char tmpv;
    FLL_CTL0 &= 0xbf;
    UCTL0 |=SWRST;
    UCTL0 |=CHAR;                           // 8-bit 字符
  /*  UTCTL0= 0x10;                         // UCLK=ACLK
    UBR00 = 0x0d;                           // 在32768下进行 2400波特率通信
    UBR10 = 0x00;                           // 在32768下进行 2400波特率通信
    UMCTL0= 0x57;                           // 调整寄存器
  */ 
       
    FLL_CTL1|=SELS+XT2OFF+SELM_XT2;        //开启第二个振荡器
    do 
    {
      IFG1 &= ~OFIFG;                      // 清除OSCFault标志
      for(tmpv = 0xff;tmpv > 0;tmpv--);    //
    }while ((FLL_CTL0&XT2OF) == XT2OF );   // 第二个振荡器是否正常工作
    UCTL0|=SWRST;
    UCTL0|=CHAR;                           // 8-bit 字符
    UTCTL0=SSEL0+SSEL1;                    // UCLK=SMCLK
    //UBR00=0xa0;                            // 在4MHz下进行 9600波特率通信
    //UBR10=0x01;                            // 在4MHz下进行 9600波特率通信
    //UMCTL0=0x5e;                           // 调整寄存器
    UBR00=0x87;                            // 在6MHz下进行 9600波特率通信
    UBR10=0x02;                            // 在6MHz下进行 9600波特率通信
    UMCTL0=0x03;                           // 调整寄存器
    UCTL0&=~SWRST;
    
    ME1|= (UTXE0 + URXE0);                 // 使能 USART0 TXD/RXD
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
*     数据发送
****************************************************/
void uart_Start(void)
{
    IE1 |= UTXIE0 ;
    while((UTCTL0 & 0x01 )!=0x01);        //等待直到没有数据发送
    TXBUF0 = uart_TBuf[0];                //发送数据
    uart_TPos = 1;
}

/****************************************************
*     数据接收中断
****************************************************/
#pragma vector = UART0RX_VECTOR 
__interrupt void data_Receive(void)       // UART接收中断
{     
    uart_RBuf[uart_RDataPos]=RXBUF0-48;  //从asc码转变到单片机键码索引
                                         //从asc码转变到单片机键码索引
    uart_RDataPos = (uart_RDataPos + 1); //移动接收缓冲区指针
    if (uart_RDataPos >= UART_BUF_SIZE)
    {
        uart_RDataPos = 0;
    }
    uart_RFlag += 1;                    //接收数据计数器加1
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
