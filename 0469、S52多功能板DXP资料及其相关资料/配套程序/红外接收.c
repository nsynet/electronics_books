 /******************************************************************************
程序功能： 
			我们在这里要实现的目标是，红外遥控按下，
			4位LED数码管显示音乐的序号，并由喇叭演奏出相应序号的音乐，
			这里我们提供了12首的音乐，也就是序号从1到12，
			当我们按遥控器上面别的按键的时候，
			这时候系统要提示没有歌了，并显示错误的标志。
			相当于是一个midi播放器！
*****************************************************************************/

#include <reg52.h>
#include <stdio.h>



sbit IR=P3^2;            //P3.2为红外一体化接收
         //喇叭


unsigned char data l;   //第几个码?
unsigned char  dm;
unsigned char  aa[2]; //定义2个数组，用来存储代码,8位的数据码和8位的数据反码
unsigned long  bb;    //定义bb用来存放用户识别码,这里采用的是26位的用户识别


bit data IR_OK=0;             //解码成功标志





void delay0_9ms(void)
{
   unsigned char j,k;
   for(j=18;j>0;j--)
   for(k=20;k>0;k--) ;
}

//1ms
void delay1ms(void)
{
  unsigned char i,j;
  for(i=2;i>0;i--)
  for(j=230;j>0;j--) ;
}

//4.5ms
void delay4_5ms(void)
{
   unsigned char i,j;
   for(i=10;i>0;i--)
   for(j=225;j>0;j--) ;
}


void t0(void) interrupt 0 using 2   //外部中断0的函数
{
    unsigned char i,j,k;
    EA=0;                        //暂时关闭CPU的所有中断请求

    for(k=0;k<10;k++)            
  {                              //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    
    delay0_9ms();               //延时0.9毫秒
    if (IR==1) {k=10;break;}    
    else if(k==9)                //重复10次?
           {                     //bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
            while(IR==0);       //等待高电平避开9毫秒低电平引导脉冲
            delay4_5ms();           //延时4.5毫秒避开4.5毫秒的结果码

			
/********************************************
//26位的用户码,前13位数据码，后13位数据反码
*********************************************/
              for(j=1;j<=26;j++)//每组数据为26位
                {                 
                 while(IR==0);  //
                 delay0_9ms();
                  if(IR==1)
                   {
					   delay1ms();
	                   dm=dm|0x2000000;             
	                   if(j<26) dm=dm>>1;            
                   }                
                 else  if(j<26) dm=dm>>1;            
                }                    
             bb=dm;
             dm=0;



/***************************************************
//16位的用户码,前8位数据码，后8位数据反码
****************************************************/

			  for(i=0;i<2;i++)     
               {                
                 for(j=1;j<=8;j++)//每组数据为26位
                {                
                 while(IR==0);  //
                 delay0_9ms();
                  if(IR==1)
                   {
				     delay1ms();
                     dm=dm|0x80;
                     if(j<8) dm=dm>>1;           //数据"1"，右移一个"1",一共7次
                   }                
                  else  if(j<8) dm=dm>>1;          //数据"0"，一共7次
                }                    
             aa[i]=dm;
             dm=0;
               }              

         }
              
          }                   
EA=1;
}






 void main()
{


     EA=1;            //总中断
     TMOD=0x01;       //timer0工作在方式1
	 IT0=1;           //外部中断0触发方式控制位，下降沿触发
	 ET0=1;          //允许定时器T0中断
	 EX0=1;           //外部中断0（INT0）中断允许位
	 IP=0x01;         //定义外部中断0优先于定时器中断的优先级
 

     while(1)
  	{
    
      
{ if(aa[0]==0x01)
         {
		  P2=0xfe;
		 }      
         else if(aa[0]==0x07)
         { 
		 P2=0xfd;
		 }    
         else if(aa[0]==0x0a)
         {P2=0xff;
		 }       
         else if(aa[0]==0x12)
         {P2=0x00;
		 }       
        
		 }
		 }
}  		
