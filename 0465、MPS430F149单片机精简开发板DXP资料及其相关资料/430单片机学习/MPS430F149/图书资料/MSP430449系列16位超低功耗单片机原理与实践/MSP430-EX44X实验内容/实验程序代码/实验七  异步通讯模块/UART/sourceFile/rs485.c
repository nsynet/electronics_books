/******************************************************************
*      文件名称：  
*              RS485.c 
*      文件说明：
*           使用UART模块外加Max3485芯片实现485接口 
******************************************************************/

#include  "msp430x44x.h"
/*****************************************************/
/*   数据定义                                        */
/*****************************************************/
char rs485_RBuf;   //接收缓冲区
char rs485_TBuf;   //发送缓冲区
unsigned char rs485_RFlag;        // 接收缓冲区缓存的数据数目（单位字符）
/****************************************************************
*  初始化
*****************************************************************/
void init_485()
{
    unsigned char tmpv;
    FLL_CTL0 &= 0xbf;
    UCTL0 |=SWRST;
    UCTL0 |=CHAR;                          // 8-bit 字符
    FLL_CTL1|=SELS+XT2OFF+SELM_XT2;        //开启第二个振荡器
    do 
    {
      IFG1 &= ~OFIFG;                      // 清除OSCFault标志
      for(tmpv = 0xff;tmpv > 0;tmpv--);    //
    }while ((FLL_CTL0&XT2OF) == XT2OF );   // 第二个振荡器是否正常工作
    UCTL0|=SWRST;
    UCTL0|=CHAR;                           // 8-bit 字符
    UTCTL0=SSEL0+SSEL1;                    // UCLK=SMCLK
    UBR00=0x87;                            // 在6MHz下进行 9600波特率通信
    UBR10=0x02;                            // 在6MHz下进行 9600波特率通信
    UMCTL0=0x03;                              // 调整寄存器
    UCTL0&=~SWRST;
    
    ME1|= (UTXE0 + URXE0);                 // 使能 USART0 TXD/RXD
    IE1|= URXIE0 ;
    IFG1 = 0x00;
    P2SEL |= 0x30;                         // P2.4,P2.5 = USART0 TXD/RXD
    P2DIR &= 0xcF;
    P2DIR |= 0x10;
    rs485_RBuf = 0;
    rs485_TBuf = 0;
    P4DIR |= 0x04;                         //p4.2 置位输出模式
    P4SEL &= 0xFB;                         //P4.2 sel=0
    P4OUT &= 0xFB;                         //p4.2=0,R0 Enable
            
}

void rs485_SendData()
{
     P4OUT |= 0x04;                       //Max3485 DI 使能
     TXBUF0 = rs485_TBuf;                 //发送数据
     while((UTCTL0 & 0x01)!=0x01);
     P4OUT &= 0xfb;                       //使能 RO
     
     
}
#pragma vector = UART0RX_VECTOR
__interrupt void data_Receive(void)       // UART接收中断
{   
   rs485_RBuf = RXBUF0;
   rs485_RFlag = 1;
 }

