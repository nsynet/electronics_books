/*****************************************************************
*  文件名称：
*            exflash.c
*  文件说明：
*          对扩展FlashAT45DB041进行读写操作
*
******************************************************************
*                  MSP430F449
*             -----------------
*            |                 |  
*            |                 |
*            |             |   ________
*            |             |  |        |
*            |        P6.3|-->|   M    |
*            |        P4.3| . |   2    |
*            |        P4.4| . |   5    |
*            |        P4.5| ->|   P    |
*            |                |   8    |
*            |                |   0    |
*            |                |        |
*                             |________|

****************************************************************/

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

unsigned char write_Buf,//发送数据的缓存
              read_Buf; // 接收数据的缓存
#define CS 0x08         
#define WREN 0X06
#define READ 0X03
#define PP   0x02
#define SE   0XD8
#define BE   0xc7
#define RDSR 0X05
#define Dummy_Byte    0xA5
#define WIP_Flag             0x01     /* Write In Progress (WIP) flag */
#define Write_In_Progress    0x01
#define ENABLE 0
#define DISABLE 1
/*****************************************************************
*    初始化AT45DB041B
******************************************************************/              

void init_EXFlash()
{
  FLL_CTL1 |= SELS + FLL_DIV_1;
  P6DIR|=0X08; // /S
  P6OUT&=0XF7;
  //P4DIR&=0XEF; //Q:OUT   设为输入
  //P4DIR|=0X28; //C:CLOCK;D:IN  设为输出
  //P4SEL|=0X38;
  
}
/***************************************************************
*  读写期间的时延
****************************************************************/
void flash_Delay()
{
    _NOP();
    _NOP();
    _NOP();
}/***************************************************************
*  flash enable
****************************************************************/
 void FLASH_CS(int NewState)
{
  if(NewState == 0)
  {P6DIR |= CS;
         P6OUT &= ~CS;
  }//cs=0
  else
         P6OUT |= CS; //cs=1,去除片选
}
     
/**********************************************************
*  从AT45DB041读一个Byte
***********************************************************/
unsigned char Read_Byte()
{
  flash_Delay();
  while (!(IFG2 & URXIFG1));   //等待接收完毕
  read_Buf = RXBUF1;
  return read_Buf;
}
/****************************************************************
* 发送一个Byte到AT45DB041
*****************************************************************/
unsigned char Send_Byte(unsigned char byte)
{   //Read_Byte();
  while (!(IFG2 & UTXIFG1));   //等待是否有未完成的发送任务
   flash_Delay();
     TXBUF1 = byte;
     read_Buf = Read_Byte();
    return read_Buf;
 
}

/**********************************************************
* read status
***********************************************************/
unsigned char FLASH_ReadStatus()
{
  unsigned char FLASH_Status = 0;

  FLASH_CS(ENABLE);
  /* send "Read Status Register" instruction */
  Send_Byte(RDSR);
		
  /* send a dummy byte to generate the clock needed by the EEPROM 
  and put the value of the status register in EE_Status variable */
  FLASH_Status = Send_Byte(Dummy_Byte);

  FLASH_CS(DISABLE);
  /* return the status register value */		
  return FLASH_Status;   
}
/**********************************************************
*  waiting
***********************************************************/
static void FLASH_WaitForLastTask() 
{
  unsigned char FLASH_Status = 0;
  
  /* loop as long as the memory is busy with a write cycle */ 		
  do
  { 			 
    FLASH_Status = FLASH_ReadStatus();    																				
  } while((FLASH_Status & WIP_Flag) == Write_In_Progress);   	
} 
/****************************************************************
* 块擦除
****************************************************************/
void sector_erase(unsigned char addr1,unsigned char addr2,unsigned char addr3)
{
  FLASH_CS(ENABLE);
  Send_Byte(WREN);                           //发送写使能命令
  FLASH_CS(DISABLE);
  FLASH_WaitForLastTask();                   //等待flash空闲
  FLASH_CS(ENABLE);
  Send_Byte(SE);                             //发送扇区擦除指令
  Send_Byte(addr1);                          //发送需要擦除的地址
  Send_Byte(addr2);
  Send_Byte(addr3);
  FLASH_CS(DISABLE);
  FLASH_WaitForLastTask();
}
/****************************************************************
* 全擦除
****************************************************************/
void FLASH_BulkErase(void)
{
  FLASH_CS(ENABLE);
  Send_Byte(WREN);
  FLASH_CS(DISABLE);
  FLASH_WaitForLastTask();
  FLASH_CS(ENABLE);
  /* Send Bulk Erase command */ 
  Send_Byte(BE);
  FLASH_CS(DISABLE);
  FLASH_WaitForLastTask();
}


