/********************************************************
*	�ļ����ƣ�
*               IIC.c
*       �ļ�˵����
*		ʹ�ÿ���ģ��IIC
*********************************************************/

#define MSP_IIC 0

#ifndef MSP430F449_H
#include <msp430x44x.h>
#endif

/*********************************************************
*	���ݶ���
*********************************************************/
unsigned char read_Buf,	 //��������
	      write_Buf, //д������
	      ctrl_Buf,  //���ڴ�ſ���ָ��ȵ��м仺����
	      addr_Buf,  //�ߵ�ַ����
	      ack_Flag;  //Ӧ���ʶ
/************************************************
*	�ӳ�
************************************************/
void iic_Delay(void)
{
   _NOP();
   _NOP();
   _NOP();
}
/*********************************************************
*	����IIC
*********************************************************/
void start_IIC(void)
{
     P4OUT &= 0x3f;	//����P4OUT
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
*	ֹͣIIC
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
*	���� 0
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
*	���� 1
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
*	����һ���ֽ�����
*******************************************************/
void send_Char(void)
{
     unsigned char cnt,tmp=0x80;
     for(cnt=0;cnt<8;cnt++)
     {
     	if((ctrl_Buf & tmp )> 0)
     	{
     	     send_One();     	// ����1
     	}else
     	{
     	     send_Zero();	// ����0
     	}
     	tmp /= 2;		// tmp����һλ
     }	
}

/*******************************************************
*	��һ��byte����
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
     	{               // �յ� 1
     	    read_Buf |= tmp;
     	}
     	P4DIR |= 0x40;  //SCL = 0
     	iic_Delay();
     	tmp = tmp/2;
     	
     }
}

/*************************************************
*	Ӧ���ź�
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
*	дһ�����ݵ�EEPROM
*************************************************/
void write_EEPROM(void)
{
     unsigned char step_Flag=0x00;
     while(step_Flag < 0x03)
     {
         if(step_Flag == 0x00)
         {
            start_IIC();	   // ���� I2c
            ctrl_Buf = 0xA0;	   // ���ÿ���λ
            send_Char();	   // ���Ϳ���λ
            iic_ACK();		   // ȷ��
            if (ack_Flag == 0) step_Flag += 1;
	 }else if (step_Flag==1)
	 {
	     ctrl_Buf = addr_Buf;  // ���õ�ַ
	     send_Char();          // ���͵�ַ
	     iic_ACK();            // �� ȷ��
	     if (ack_Flag == 0)
	     {  // ����Ƿ��ַ���ͳɹ�
	         step_Flag += 1;
	     }else{
	         step_Flag = 0;
	     }
	  }else{
	     ctrl_Buf = write_Buf; // ����д����
	     send_Char();	   // д
	     iic_ACK();            // ����Ӧ��Ϣ
	     if (ack_Flag == 0)
	     {                     // ����Ƿ�д�ɹ�
	         step_Flag += 1;
	     }else{
	         step_Flag = 0;
	     }
	  }
      }
	  	
      stop_IIC();                // ֹͣ IIC

}
/*************************************************
*	��EEPROM������
*************************************************/
void read_EEPROM()
{
     unsigned char step_Flag=0;
     while(step_Flag < 0x03)
     {
         if(step_Flag == 0x00)
         {
            start_IIC();	    //���� I2c
            ctrl_Buf = 0xa0;	    //���ÿ���λ
            send_Char();	    //���Ϳ���λ
            iic_ACK();		    //��ȡӦ��
            if (ack_Flag == 0) step_Flag += 1;
	 }else if (step_Flag==1){   // �������λ���ͳɹ�
	     ctrl_Buf = addr_Buf;   // ���ö���ַ
	     send_Char();           // ���͵�ַ
	     iic_ACK();             // ����Ӧ
	     if (ack_Flag == 0)
	     {   // �Ƿ��ַ�Ѿ�����
	         step_Flag += 1;
	     }else{
	         step_Flag = 0;
	     }
	  }else{
	     start_IIC();          // ���� IIC
	     ctrl_Buf = 0xa1;      // ���ö�ģʽ
	     send_Char();	   // ���Ϳ���λ
	     iic_ACK();            // ��ȡ��Ӧ
	     if (ack_Flag == 0)
	     {                     // �Ƿ��ͳɹ�
	         step_Flag += 1;
	         read_Char();      // ���ַ�
	         iic_NACK();       // ����Ӧ
	     }else{
	         step_Flag = 0;
	     }
	  }
      }  	
      stop_IIC();                  // ֹͣ IIC
}
