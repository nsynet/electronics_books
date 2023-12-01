/********************************************************
*	文件名称：
*               IIC.c
*       文件说明：
*		使用口线模拟IIC
*********************************************************/

#define MSP_IIC 0

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

/*********************************************************
*	数据定义
*********************************************************/
unsigned char read_Buf,	 //读缓冲区
	      write_Buf, //写缓冲区
	      ctrl_Buf,  //用于存放控制指令等的中间缓冲区
	      addr_Buf,  //高地址缓冲
	      ack_Flag;  //应答标识
/************************************************
*	延迟
************************************************/
void iic_Delay(void)
{
   _NOP();
   _NOP();
   _NOP();
}
/*********************************************************
*	启动IIC
*********************************************************/
void start_IIC(void)
{
     P4OUT &= 0x3f;	//设置P4OUT
     P4DIR &= 0x7f;	//SDA = 1
     iic_Delay();
     P4DIR &= 0xbf;	//SCL = 1
     iic_Delay();
     P4DIR |= 0x80;	//SDA = 0
     iic_Delay();
     P4DIR |= 0x40;	//SCL = 0
     iic_Delay();

}
/*******************************************************
*	停止IIC
*******************************************************/
void stop_IIC(void)
{
     P4DIR |= 0x80;	//SDA = 0
     iic_Delay();
     P4DIR &= 0xbf;	//SCL = 1
     iic_Delay();
     P4DIR &= 0x7f;	//SDA = 1
     iic_Delay();
     P4DIR |= 0x80;	//SDA = 0
     iic_Delay();
     P4DIR |= 0x40;	//SCL = 0
}

/*******************************************************
*	发送 0
*******************************************************/
void send_Zero(void)
{
     P4DIR |= 0x80;	//SDA = 0
     iic_Delay();
     P4DIR &= 0xbf;	//SCL = 1
     iic_Delay();
     P4DIR |= 0x40;	//SCL = 0
     iic_Delay();

}
/*******************************************************
*	发送 1
*******************************************************/
void send_One(void)
{
     P4DIR &= 0x7f;	//SDA = 1
     iic_Delay();
     P4DIR &= 0xbf;	//SCL = 1
     iic_Delay();
     P4DIR |= 0x40;	//SCL = 0
     iic_Delay();
     P4DIR |= 0x80;	//SDA = 0
     iic_Delay();	
}
/*******************************************************
*	发送一个字节数据
*******************************************************/
void send_Char(void)
{
     unsigned char cnt,tmp=0x80;
     for(cnt=0;cnt<8;cnt++)
     {
     	if((ctrl_Buf & tmp )> 0)
     	{
     	     send_One();     	// 发送1
     	}else
     	{
     	     send_Zero();	// 发送0
     	}
     	tmp /= 2;		// tmp右移一位
     }	
}

/*******************************************************
*	读一个byte数据
*******************************************************/
void read_Char(void)
{
     unsigned char cnt,tmp=0x80;
     read_Buf = 0x00;
     for(cnt=0;cnt<8;cnt++)
     {
     	P4DIR &= 0x7f;	//SDA = 1
     	iic_Delay();
     	P4DIR &= 0xbf;	//SCL = 1
     	iic_Delay();
     	if((P4IN & 0x80) > 0x00)
     	{               // 收到 1
     	    read_Buf |= tmp;
     	}
     	P4DIR |= 0x40;  //SCL = 0
     	iic_Delay();
     	tmp = tmp/2;
     	
     }
}

/*************************************************
*	应答信号
*************************************************/
void iic_ACK(void)
{
     ack_Flag = 0x00;
     P4DIR   &= 0x7f;	//SDA = 1
     iic_Delay();
     P4DIR   &= 0xbf;	//SCL = 1
     iic_Delay();
     if ((P4IN & 0x80) == 0x80 )
     {
     	ack_Flag = 0x01;
     }
     P4DIR   |=  0x40;	//SCL = 0
     iic_Delay();

}
/***********************************************
*  iic_NACK
************************************************/
void iic_NACK(void)
{
     P4DIR   &= 0x7f;	//SDA = 1
     iic_Delay();
     P4DIR   &= 0xbf;	//SCL = 0
     iic_Delay();

     P4DIR   |= 0x40;	//SCL = 0
     iic_Delay();
     P4DIR   |= 0x80;	//SDA = 0
     iic_Delay();
}

/************************************************
*	写一个数据到EEPROM
*************************************************/
void write_EEPROM(void)
{
     unsigned char step_Flag=0x00;
     while(step_Flag < 0x03)
     {
         if(step_Flag == 0x00)
         {
            start_IIC();	   // 启动 I2c
            ctrl_Buf = 0xA0;	   // 设置控制位
            send_Char();	   // 发送控制位
            iic_ACK();		   // 确认
            if (ack_Flag == 0) step_Flag += 1;
	 }else if (step_Flag==1)
	 {
	     ctrl_Buf = addr_Buf;  // 设置地址
	     send_Char();          // 发送地址
	     iic_ACK();            // 读 确认
	     if (ack_Flag == 0)
	     {  // 检测是否地址发送成功
	         step_Flag += 1;
	     }else{
	         step_Flag = 0;
	     }
	  }else{
	     ctrl_Buf = write_Buf; // 设置写内容
	     send_Char();	   // 写
	     iic_ACK();            // 读响应信息
	     if (ack_Flag == 0)
	     {                     // 检测是否写成功
	         step_Flag += 1;
	     }else{
	         step_Flag = 0;
	     }
	  }
      }
	  	
      stop_IIC();                // 停止 IIC

}
/*************************************************
*	从EEPROM读数据
*************************************************/
void read_EEPROM()
{
     unsigned char step_Flag=0;
     while(step_Flag < 0x03)
     {
         if(step_Flag == 0x00)
         {
            start_IIC();	    //启动 I2c
            ctrl_Buf = 0xa0;	    //设置控制位
            send_Char();	    //发送控制位
            iic_ACK();		    //读取应答
            if (ack_Flag == 0) step_Flag += 1;
	 }else if (step_Flag==1){   // 如果控制位发送成功
	     ctrl_Buf = addr_Buf;   // 设置读地址
	     send_Char();           // 发送地址
	     iic_ACK();             // 读响应
	     if (ack_Flag == 0)
	     {   // 是否地址已经发送
	         step_Flag += 1;
	     }else{
	         step_Flag = 0;
	     }
	  }else{
	     start_IIC();          // 启动 IIC
	     ctrl_Buf = 0xa1;      // 设置读模式
	     send_Char();	   // 发送控制位
	     iic_ACK();            // 获取响应
	     if (ack_Flag == 0)
	     {                     // 是否发送成功
	         step_Flag += 1;
	         read_Char();      // 读字符
	         iic_NACK();       // 发响应
	     }else{
	         step_Flag = 0;
	     }
	  }
      }  	
      stop_IIC();                  // 停止 IIC
}
