#include <reg51.h>

      #define c(x) (x*120000/120000) 

      sbit Ir_Pin=P3^2;
	  sbit beep=P2^1;
	  //sbit RELAY=P2^0;
      unsigned char code Led_Tab[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,
      0xf8,0x80,0x90,0x88,0x83,0xC6,0xA1,0x86,0x8E};                        //共阳极数码显示码0-F.
      unsigned char code Led_Sel[]={0x7f,0xbf,0xdf,0xef};

      unsigned char Led_Buf[4]; //显示缓冲区
      char Led_Index;                   //位选         

      unsigned char Ir_Buf[4]; //用于保存解码结果
		 void delay_50ms(unsigned int t)
{
 unsigned int j;   
 for(;t>0;t--) 
  for(j=6245;j>0;j--) 
{;}
}

      //==============================================================
      //数码管扫描
      timer0() interrupt 1 using 1
      {
      TL0=65536-1000;
      TH0=(65536-1000)/256; //定时器0设定约1000us中断一次，用于数码管扫描
      P0=0xff;
      P3=Led_Sel[Led_Index];                            //位选
      P0=Led_Tab[Led_Buf[Led_Index]];                    //段选

      if(++Led_Index>3) Led_Index=0;                    //四个扫描完了,到第一个数码管
      }
      //==============================================================
      unsigned int Ir_Get_Low()
      {
      TL1=0;
      TH1=0;
      TR1=1;
      while(!Ir_Pin && (TH1&0x80)==0);                
      TR1=0;           
      return TH1*256+TL1;
      }
      //=============================================================
      unsigned int Ir_Get_High()
      {
      TL1=0;
      TH1=0;
      TR1=1;
      while(Ir_Pin && (TH1&0x80)==0);
      TR1=0;
      return TH1*256+TL1;
      }
      //==============================================================
      main()
      {
      unsigned int temp;
      char i,j;
      Led_Index=1;

      TMOD=0x11;
      TL0=65536-1000;
      TH0=(65536-1000)/256; //定时器0设定约1000us中断一次，用于数码管扫描
      EA=1;
      ET0=1;
      TR0=1;

      Led_Buf[0]=0;
      Led_Buf[1]=0;
      Led_Buf[2]=0;
      Led_Buf[3]=0; //显示区设成0
      do{
      restart:
      while(Ir_Pin);
      temp=Ir_Get_Low();
      if(temp<c(8500) || temp>c(9500)) continue;//引导脉冲低电平9000
      temp=Ir_Get_High();
      if(temp<c(4000) || temp>c(5000)) continue;//引导脉冲高电平4500
      for(i=0;i<4;i++) //4个字节
      for(j=0;j<8;j++) //每个字节8位
      {
      temp=Ir_Get_Low();
      if(temp<c(200) || temp>c(800)) goto restart;
      temp=Ir_Get_High();
      if(temp<c(200) || temp>c(2000)) goto restart;
      Ir_Buf[i]>>=1;
      if(temp>c(1120)) Ir_Buf[i]|=0x80;
      }
      Led_Buf[0]=Ir_Buf[2]&0xf;
      Led_Buf[1]=(Ir_Buf[2]/16)&0xf;
      Led_Buf[2]=Ir_Buf[3]&0xf;
      Led_Buf[3]=(Ir_Buf[3]/16)&0xf; //显示结果
	  P1=Ir_Buf[2];
	 beep=0;
	 delay_50ms(2);
	 beep=1;
	 //RELAY=0;
	 //delay_50ms(50);
	 //RELAY=1;
      }
	  while(1);
   
      }
	 