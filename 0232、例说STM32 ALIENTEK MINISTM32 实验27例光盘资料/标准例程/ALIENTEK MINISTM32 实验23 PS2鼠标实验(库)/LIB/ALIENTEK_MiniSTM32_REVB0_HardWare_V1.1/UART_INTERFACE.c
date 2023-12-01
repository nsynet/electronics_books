#include "UART_INTERFACE.h"

void USART_Configuration(unsigned long UART_baud) //波特率，如115200
	{
	USART_InitTypeDef USART_InitStructure;
	/* USARTx configured as follow:
	      - BaudRate = 115200 baud  
	      - Word Length = 8 Bits
	      - One Stop Bit
	      - No parity
	      - Hardware flow control disabled (RTS and CTS signals)
	      - Receive and transmit enabled
	*/
	USART_InitStructure.USART_BaudRate = UART_baud;//115200;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	
	STM_EVAL_COMInit(USED_COM_NUMBER, &USART_InitStructure);
	
	//USART_DMACmd(USED_COM_NUMBER, USART_DMAReq_Rx, ENABLE);  //使能UART DAM传输
	}




/*******************************************************************************
* Function Name  : int fputc(int ch, FILE *f)
* Description    : Retargets the C library printf function to the USART.printf重定向
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
int fputc(int ch, FILE *f)
	{

 	STM_EVAL_SendChar(USED_COM_NUMBER,(uint8_t) ch);
	
	return ch;
	}

/*******************************************************************************
* Function Name  : int fgetc(FILE *f)
* Description    : Retargets the C library printf function to the USART.fgetc重定向
* Input          : None
* Output         : None
* Return         : 读取到的字符
*******************************************************************************/
int fgetc(FILE *f)
	{
	/* Loop until received a char */
	while(!(USART_GetFlagStatus(USED_COM_NUMBER, USART_FLAG_RXNE) == SET))
		{
		}
	
	/* Read a character from the USART and RETURN */
	return (USART_ReceiveData(USED_COM_NUMBER));
	}

