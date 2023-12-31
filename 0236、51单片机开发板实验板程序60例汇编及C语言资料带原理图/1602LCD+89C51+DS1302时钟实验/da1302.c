/*============================================================
使用1602液晶显示DS1302+c51时钟 
[注:AT89C51使用12M晶振]
=============================================================*/

#include <AT89x51.h>
#include <string.h>
#include < intrins.h >
#define delayNOP() ; {_nop_() ;_nop_() ;_nop_() ;_nop_() ;} ;
#define LCM_RW P3_1 //定义引脚
#define LCM_RS P3_0
#define LCM_E P3_2
#define LCM_Data P0
#define Busy 0x80          //用于检测LCM状态字中的Busy标识
#define uchar unsigned char

sbit T_CLK=P2^4;
sbit T_IO =P2^5;
sbit T_RST=P2^6;
sbit ACC0=ACC^0;
sbit ACC7=ACC^7;
sbit LED=P2^0;			 //背光灯输出 (因本实验板无此功能 所以此项功能无效)
sbit system=P1^1;		 //模式
sbit TimerUp=P1^2;		 //时间加
sbit TimerDown=P1^0;     //时间减
sbit Speaker=P2^1;       //蜂鸣器


void   Set(uchar,uchar);      //根据选择调整相应项目
void   RTInputByte(uchar);    //输入 1Byte */
uchar  RTOutputByte(void);    //输出 1Byte */
void   W1302(uchar, uchar);   //向DS1302写入一个字节
uchar  R1302(uchar);          //从DS1302读出一个字节
void   Set1302(uchar * );     //设置时间 
void   KeySound();			  //按键音
void   ClockSound();		  //闹铃蜂鸣声


uchar id,msec,model,LedTime,d;
bit a,b;                	  //闪烁标志位

                        
uchar inittime[7]={0x00,0x10,0x19,0x29,0x03,0x04,0x06};	//初始化后设置为：06年3月29日星期3 19点10分0秒
void  Out_LCM(void);     //显示屏幕
void  model0(void);						   //显示输出
void  model1(void);
void  model2(void);
void  model3(void);
void  model4(void);
void  model5(void);
void  model6(void);

 
void  id_case1_key();	//项目调整
void  Modset();          //模式键处理

void  WriteDataLCM(uchar WDLCM);
void  WriteCommandLCM(uchar WCLCM,BuysC);
uchar ReadStatusLCM(void);
void  LCMInit(void);
void  OutputInformation(uchar X, uchar Y, uchar DData);
void  DisplayListChar(uchar X, uchar Y, uchar code *DData);

void  Delay5Ms(void);
void  Delay400Ms(void);
void  systemsetup(void);                 //进入系统设置

uchar code systemp[]={"System.setup"};  //字符串输出(系统设定)
uchar code TIMER[]={"Time"};            //字符串输出(时间)
uchar code DATE[]={"Date"};	            //字符串输出(日期)
uchar code alarmclock[]={"Clock"};      //字符串输出（闹铃）
uchar code lamp[]={"Lamp"};			    //字符串输出（背光灯）
uchar code reset[]={"Reset"};		    //字符串输出（时间归零）
uchar code exit[]={"Exit"};             //字符串输出（退出）
uchar code set[]={"Set"};				//字符串输出（设置）
uchar code sec[]={"sec"};               //字符串输出（秒）
uchar code ClockSet[]={"ClockSet"};		//字符串输出（闹铃设置）
uchar code ClockOn[]={"ON"};		    //字符串输出（ON）
uchar code ClockOff[]={"OFF"};		    //字符串输出（OFF）

void  timesetup(void);                   //时间设置
void  datesetup(void);                   //日期设置
void  alarmclockset(void);               //闹铃设置
void  lampsetup(void);                   //背光灯设置									   
void  timereset(void);                   //时间清零


/*******************************************************************/
void delay1(int ms)
{
 unsigned char y ;
  while(ms--)
 {
  for(y = 0 ; y<250 ; y++)
  {
   _nop_() ;
   _nop_() ;
   _nop_() ;
   _nop_() ;
  }
 }
}

void main(void)
{
  Speaker=1;    //关闭蜂鸣器
  LED=0;        //打开LED ,低电平有效，外接9012驱动
  Delay400Ms(); //启动等待，等LCM讲入工作状态
  Delay400Ms();
  LCMInit();    //LCM初始化
  TMOD=0x01;	//16位定时
  TH0=0x3c;		//50ms
  TL0=0xb0;
  EA=1;
  TR0=1;
  ET0=1;  
   
  while(1)
  {
     if(TimerDown==0)         //左移键按下后把背光灯打开
      {Delay5Ms();
      if(TimerDown==0)
	   {KeySound();			  //蜂鸣声
		LED=0;				  //打开背光灯
	    LedTime=R1302(0xc1)/16*10+R1302(0xc1)%16;} //取出背光灯时间并转换为十进制数         
       }
	 b=1;		         	  //模式键是否动作标志。为1时不动作，为0时动作。
	 Modset();		          //调用模式键处理程序判断按键是否按下。
	 if(b==0)
	  {
	   KeySound();			  //蜂鸣声
	   LED=0;                 //打开背光灯
	   systemsetup();         //进入系统设置模式
	   LedTime=R1302(0xc1)/16*10+R1302(0xc1)%16; //取出背光灯时间并转换为十进制数
	   }
	 if((LED==0)&&LedTime==0)  //延时间是否到
	    LED=1;            	   //关闭背光灯	
	 if(R1302(0xc3)==1)        //闹铃是否打开，0xc3为读闹铃寄存器地址。
	   {if((R1302(0x85)==R1302(0xc5))&&(R1302(0x83)==R1302(0xc7))) //判断闹铃时间是否到，
		  ClockSound();		   //发出闹铃蜂鸣声，无按键动作蜂鸣一分钟。
	   	}	   
	 model0();                //输出显示屏幕
	}					    
}

void KeySound()			        //按键音
{
 Speaker=0;					    //开蜂鸣声
 Delay5Ms();
 Speaker=1;					    //关蜂鸣声
 }
void ClockSound()		        //闹铃蜂鸣声
{
 if(a==0)
  {
   Speaker=0;					//开蜂鸣声
   Delay5Ms();
   Delay5Ms();
   Delay5Ms();
   Speaker=1;				    //关蜂鸣声
  }
}

void Modset()                   //模式键处理
{ if(system==0)               
   {
    Delay5Ms();
    if(system==0)
	 {while(system==0);
	   KeySound();			  //蜂鸣声
	   a=0;msec=0;b=0;		  //a、msec为闪烁标志，按键有动作时清零，不闪烁。
	 }						  //b为模式键确认动作。其它程判断b是否为零时来确定模式键是否动作。
   }
}

void systemsetup(void)		    //系统设置
{ 
  model=1;
  while(model!=0)
  {	
  Out_LCM(); 
  if (TimerUp==0)      	      //设置项目左移
      {Delay5Ms();
       if(TimerUp==0)
	   {a=0;msec=0;KeySound();//蜂鸣声
	    if(model--==1)	      //6种系统设置项目
		 model=6;
		}   
       while(TimerUp==0);    
      }
   if (TimerDown==0)         //设置项目右移
      {
       Delay5Ms();
       if(TimerDown==0) 
	     {a=0;msec=0;KeySound();//蜂鸣声
		 if(model++==6)
		     model=1; 
		 }         
       while(TimerDown==0);    
      }
     b=1;			//模式键是否动作标志。为1时不动作，为0时动作。
	 Modset();		//调用模式键处理程序判断按键是否按下。
	 if(b==0)
	   {KeySound();			   //蜂鸣声
	    switch(model)          //进入进个项目设置
		  {
		   case 1:
		        timesetup(); break;   //时间设置
		   case 2:
		        datesetup();break;    //日期设置
		   case 3:
		        alarmclockset();break;//闹铃设置
		   case 4:
		        lampsetup();break;	  //背光灯设置
	       case 5:
		        timereset();break;    //时间清零
		   case 6:
		        model=0;break;        //退出系统设置
		  }
	  }
   }
 }

							  
void timesetup()                //时间调整
{
 id=6;
 while(model==1)				//model为1时进入时间调整
  {
    b=1;
    Modset();
	if(b==0)
	 {KeySound();			     //蜂鸣声
	  if(id++==9)			    //6..9为时分秒调。				   .
	   id=6;
	  }
   id_case1_key();				//调用按键处理
   Out_LCM();                   //显示输出
 } 
}
void datesetup()                //对日期进行调整
{
 id=1;
 while(model==2)				//model为2时进入日期调整
  {b=1;
   Modset();					//模式键是否动作
   if(b==0)
    {KeySound();			    //蜂鸣声
	 if(id++==5)			    //1..5为年月日星期 exit
	  id=1;
	 }
 id_case1_key();		        //日期调整
 Out_LCM();                     //显示输出
 } 
}
void alarmclockset(void)	    //闹铃调整
{id=12;
 while(model==3)			    //进入闹铃设置
  {b=1;
   Modset();				    //模式键是否动作
   if(b==0)					  
    {KeySound();			    //蜂鸣声
	 if(R1302(0xc3)%16==0)
 	   {id=0;model++;}          //0xc2为闹铃开关寄存器。当为关时按下模式键时将退出闹铃设置，当开时进入闹铃时间设置
        
	 else if(id++==15)		    //12..15为闹铃开关和时间设置 exit
	      id=12;
    }
  id_case1_key();		        //调整
  Out_LCM();                    //显示输出
  }
} 
   
void lampsetup(void)            //背光灯时间设置
{id=10;							//背光灯存储空间DS1302(0xc0)
  while(model==4)				//model为3时进入背光灯调整
  {b=1;
   Modset();					//模式键是否动作
   if(b==0)
    {KeySound();			    //蜂鸣声
	 if(id++==11)			    //10为背光灯 exit
	  id=10;
	 }
 id_case1_key();		        
 Out_LCM();                     //显示输出                    
 }

}
void  timereset()               //时间清零
{
  Set1302(inittime);		    //清时间
  W1302(0x90,0xa5);             //打开充电二级管  一个二级管串联一个2K电阻
  model++; 
}
//对相应的项目进行加、减调整。
void id_case1_key()				//按键处理
{
  if (TimerUp==0)        //增加
      {
       Delay5Ms();
       if(TimerUp==0)
	    {a=0;msec=0;KeySound();			//蜂鸣声
		 if((id==9)||(id==5)||(id==11)||(id==15))	//当ID为9、5时按下加、减键将退出调整
	   	  { model++;		            //退出时间、日期设置
		    id=0;
		  }
		 else
	       Set(id,1);
		}  
      while(TimerUp==0);    
     }
  if (TimerDown==0)  //减少
     {
       Delay5Ms();
       if(TimerDown==0) 
	    {a=0;msec=0;KeySound();			 //蜂鸣声
		 if((id==9)||(id==5)||(id==11)||(id==15))  //当ID为9、5时按下加、减键将退出调整
	   	  { model++;		             //退出时间、日期设置
		    id=0;
		  }
	   else
		   Set(id,0);		  //调用DS1302写入函数
	   }          
      while(TimerDown==0);    
     }
}
                 
void timer_1(void) interrupt 1 	//中断入口，闪烁
{
  TH0=0x3c;            //50ms定时
  TL0=0xb0;
  if(msec++==10)	   //500ms
   {msec=0;a=~a;       //闪烁标志反转 
	if(a==0)		   //1秒后背光时间减一秒。
	 LedTime--;
   }  
}

//根据选择调整相应项目并写入DS1302
void Set(uchar sel,uchar sel_1) 
{
  uchar address,item;
  uchar max,min;
  if(sel==1)  {address=0x8c; max=99;min=0;}    //年
  if(sel==2)  {address=0x88; max=12;min=1;}    //月
  if(sel==3)  {address=0x86; max=31;min=1;}    //日
  if(sel==4)  {address=0x8a; max=7; min=1;}    //星期
  if(sel==6)  {address=0x84; max=23;min=0;}    //小时
  if(sel==7)  {address=0x82; max=59;min=0;}    //分钟
  if(sel==8)  {address=0x80; max=59;min=0;}    //秒
  if(sel==10) {address=0xc0; max=59;min=0;}    //背光时间，最长1分钟
  if(sel==12) {address=0xc2; max=1;min=0;}     //闹铃开关寄存器
  if(sel==13) {address=0xc4; max=23;min=0;}    //闹铃时寄存器
  if(sel==14) {address=0xc6; max=59;min=0;}    //闹铃分寄存器


  item=R1302(address+1)/16*10+R1302(address+1)%16;
  if (sel_1==0) item++;  else item--;
  if(item>max) item=min;   
  if(item<min) item=max;
           
  W1302(0x8e,0x00);                   //允许写操作
  W1302(address,item/10*16+item%10);  //写入DS1302 //转成BCD码
  W1302(0x8e,0x80);                   //写保护，禁止写操作  
}

//屏幕显示
void Out_LCM(void) 
{ switch(model)
   {
    case 0: model0(); break;
	case 1: model1(); break;
	case 2: model2(); break;		   //在不同的条件下显示不同的字符
	case 3: model3(); break;
	case 4: model4(); break;
	case 5: model5(); break;
	case 6: model6(); break;
   }       
}

/***********************model为零时第一行显示时间，不为零时显示system setup******/
void model0()
  {																
   DisplayListChar(0,0,TIMER);   //显示固定字符串（Time)						
   OutputInformation(13,0,0x20); //不显示
   OutputInformation(4,0,0x20);  //不显示
   OutputInformation(4,1,0x20);  //不显示
   OutputInformation(15,1,0x20); //不显示
   OutputInformation(7,1,0x2f);  //显示固定字符 "/"
   OutputInformation(10,1,0x2f); //显示固定字符 "/"
   OutputInformation(13,1,0x2f); //显示固定字符 "/"
   DisplayListChar(0,1,DATE);    //显示固定字符串Date(日期）         
   if(a==1)				         //冒号闪烁
    {OutputInformation(7,0,0x3a); OutputInformation(10,0,0x3a);}
   else
    {OutputInformation(7,0,0x20); OutputInformation(10,0,0x20);}

 /*******************model为零时第二行显示日期，不为零显示设置项目*******/
 
	OutputInformation(5,1,R1302(0x8d)/16+0x30);  //显示年
    OutputInformation(6,1,R1302(0x8d)%16+0x30);
 
    OutputInformation(8,1,R1302(0x89)/16+0x30);  //显示月 
    OutputInformation(9,1,R1302(0x89)%16+0x30);    
      
    OutputInformation(11,1,R1302(0x87)/16+0x30); //显示日
    OutputInformation(12,1,R1302(0x87)%16+0x30);    

    OutputInformation(14,1,R1302(0x8b)%16+0x30); //显示星期

    OutputInformation(5,0,R1302(0x85)/16+0x30);  //显示小时
    OutputInformation(6,0,R1302(0x85)%16+0x30); 
	   
    OutputInformation(8,0,R1302(0x83)/16+0x30);  //显示分钟
    OutputInformation(9,0,R1302(0x83)%16+0x30); 
	   
    OutputInformation(11,0,R1302(0x81)/16+0x30); //显示秒
    OutputInformation(12,0,R1302(0x81)%16+0x30); 
}
  
/*************************model不为零时显示系统设置***********************************/


	 
	          					  //model为1时time闪烁，按下模式键后进入时间调整
void model1()
	 /*************************************判断ID的值来显示项目***********************/
{	 OutputInformation(0,0,0x20);          //不显示
     OutputInformation(1,0,0x20);
     DisplayListChar(2,0,systemp);         //第一行显示system setup
      if(id==0)							   //为0时显示TIME  date lalcak
	 	 {OutputInformation(9,1,0x20);     //不显示
	      OutputInformation(4,1,0x20);     //不显示
		  OutputInformation(15,1,0x20);    //不显示
		  DisplayListChar(5,1,DATE);	   //显示date 
		  DisplayListChar(10,1,alarmclock);//显示lalcak
		  							
		  if(a==1)
	         {OutputInformation(0,1,0x20);     //不显示
	          OutputInformation(1,1,0x20);     //不显示
		      OutputInformation(2,1,0x20);     //不显示
			  OutputInformation(3,1,0x20);     //不显示
		     }
	      else											 
	        DisplayListChar(0,1,TIMER);	  //显示time     
		 }
	  else
	   {   	 										     //id不为零进入时间调整项目
		   OutputInformation(3,1,0x3a);                  //显示固定字符 ":"
           OutputInformation(6,1,0x3a);                  //显示固定字符 ":"
           OutputInformation(9,1,0x20);                  //不显示
		   OutputInformation(10,1,0x20);                 //不显示
		   OutputInformation(0,1,0x20);                  //不显示
   /****************************时显示闪烁控制********************/
		   if((id==6)&&(a==1))						 //id为5时时闪烁
	        {
		     OutputInformation(1,1,0x20); //不显示
			 OutputInformation(2,1,0x20); //不显示
			}
           else
			{OutputInformation(1,1,R1302(0x85)/16+0x30); //显示时
             OutputInformation(2,1,R1302(0x85)%16+0x30); 
			}
  /******************************分显示闪烁控制********************/
		  if((id==7)&&(a==1))						 //id为6时分闪烁
	        {
		     OutputInformation(4,1,0x20); //不显示
			 OutputInformation(5,1,0x20); //不显示
			}
		  else
			 {OutputInformation(4,1,R1302(0x83)/16+0x30); //显示分
              OutputInformation(5,1,R1302(0x83)%16+0x30); 
			 }
  /******************************秒显示闪烁控制********************/
		  if((id==8)&&(a==1))						 //id为7时秒闪烁
	        {
		     OutputInformation(7,1,0x20); //不显示
			 OutputInformation(8,1,0x20); //不显示
			 }
			else
			 {OutputInformation(7,1,R1302(0x81)/16+0x30); //显示秒
              OutputInformation(8,1,R1302(0x81)%16+0x30); 
			 }
  /*******************************Exit显示闪烁控制********************/

		  if((id==9)&&(a==1))		    //id为8时exit闪烁
			 {OutputInformation(11,1,0x20);     //不显示
	          OutputInformation(12,1,0x20);     //不显示
		      OutputInformation(13,1,0x20);     //不显示
			  OutputInformation(14,1,0x20);     //不显示
		     }
		  else
		      DisplayListChar(11,1,exit);	//显示exit
		}
}
/***************************************modelo为2时date闪烁***********************************************/
void model2()
{
	  if(id==0)
	   {OutputInformation(9,1,0x20);        //不显示
	    OutputInformation(4,1,0x20);        //不显示
		OutputInformation(15,1,0x20);       //不显示
		DisplayListChar(0,1,TIMER);	        //显示time    
	    DisplayListChar(10,1,alarmclock);   //显示clock
	    if(a==1)
		 {OutputInformation(5,1,0x20);     //不显示
	      OutputInformation(6,1,0x20);     //不显示
		  OutputInformation(7,1,0x20);     //不显示
		  OutputInformation(8,1,0x20);     //不显示
		 }
		 
	   else
	     DisplayListChar(5,1,DATE);	        //显示date
	   }
/*****************************************************************************************************/
						   	//id不为零时、进入日期调整
/*****************************************************************************************************/
	  else								
	   { OutputInformation(0,1,0x20);                  //不显示
		 OutputInformation(11,1,0x20);                 //不显示
	     OutputInformation(3,1,0x2f);                  //显示固定字符 "/"
         OutputInformation(6,1,0x2f);                  //显示固定字符 "/"
         OutputInformation(9,1,0x2f);                  //显示固定字符 "/"  
   /****************************年显示闪烁控制********************/
		 if((id==1)&&(a==1))						   //id为1时年闪烁
	      {
		   OutputInformation(1,1,0x20);                //不显示
		   OutputInformation(2,1,0x20);                //不显示
		  }
		 else
		  {OutputInformation(1,1,R1302(0x8d)/16+0x30); //显示年
           OutputInformation(2,1,R1302(0x8d)%16+0x30); 
		  }
   /***************************月闪烁控制************************/
		 if((id==2)&&(a==1))						   //id为2时月闪烁
	      {
		   OutputInformation(4,1,0x20);                //不显示
		   OutputInformation(5,1,0x20);                //不显示
		  }
		 else
		  {OutputInformation(4,1,R1302(0x89)/16+0x30); //显示月
           OutputInformation(5,1,R1302(0x89)%16+0x30); 
		  }
  /***************************日闪烁控制************************/
		 if((id==3)&&(a==1))						   //id为2日闪烁
	      {
		   OutputInformation(7,1,0x20);                //不显示
		   OutputInformation(8,1,0x20);                //不显示
		  }
		 else
		  {OutputInformation(7,1,R1302(0x87)/16+0x30); //显示日
           OutputInformation(8,1,R1302(0x87)%16+0x30); 
		  }
  /***************************星期闪烁控制*********************************/
		 if((id==4)&&(a==1))						   //id为2时星期闪烁
	      {
		   OutputInformation(10,1,0x20);                //不显示
		  }
		 else
		  {OutputInformation(10,1,R1302(0x8b)%16+0x30); //显示星期
		  }
  /**************************exit闪烁控制*********************************/
		 if((id==5)&&(a==1))						    //id为5时exit闪烁
	       { OutputInformation(12,1,0x20);     //不显示
	         OutputInformation(13,1,0x20);     //不显示
		     OutputInformation(14,1,0x20);     //不显示
			 OutputInformation(15,1,0x20);     //不显示
		     }
		 else
		   DisplayListChar(12,1,exit);	                //显示exit
	   }
}
/*********************************************************************************/

								/*model为3时进入闹铃项目

/**********************************************************************************/
void model3()
{
      if(id==0) 
	   {OutputInformation(9,1,0x20);        //不显示
	    OutputInformation(4,1,0x20);        //不显示
		OutputInformation(15,1,0x20);       //不显示
        DisplayListChar(0,1,TIMER);	        //显示time 
	    DisplayListChar(5,1,DATE);	        //显示date    
	    if(a==1)
		 { OutputInformation(10,1,0x20);     //不显示
	       OutputInformation(11,1,0x20);     //不显示
		   OutputInformation(12,1,0x20);     //不显示
		   OutputInformation(13,1,0x20);     //不显示
		   OutputInformation(14,1,0x20);
		 }
	    else
	     DisplayListChar(10,1,alarmclock);  //显示cloak
	   }

/**************************id不为零进入闹铃设置显示********************/
	 else
	 {if(id==12)						   //闹铃开关显示
	   {DisplayListChar(0,1,ClockSet);	   //显示ClockSet
	   	OutputInformation(8,1,0x20);
		OutputInformation(13,1,0x20);
		OutputInformation(14,1,0x20);
/*****************************闹铃开关显示********************************/ 
	    if(a==1)							   //A为闪烁标志
	      {OutputInformation(10,1,0x20);     //不显示
	       OutputInformation(11,1,0x20);     //不显示
		   OutputInformation(12,1,0x20);     //不显示
		   OutputInformation(13,1,0x20);     //不显示
		  }	
	    else
	     {
	      if(R1302(0xc3)%16==0)            //闹铃寄存器的值是否为零（关）
			{DisplayListChar(10,1,ClockOff);}//显示OFF
		  else
		    {OutputInformation(9,1,0x20);    //不显示
			 OutputInformation(12,1,0x20);   //不显示
	         OutputInformation(13,1,0x20);   //不显示
		     OutputInformation(14,1,0x20);   //不显示
			 OutputInformation(15,1,0x20);   //不显示
		   	 DisplayListChar(10,1,ClockOn);  //显示ON 
			}
		 }
	   }
	 else 
	   {DisplayListChar(0,1,alarmclock);   //显示clock
	    OutputInformation(8,1,0x3a);       //显示固定字符 ":"
		OutputInformation(5,1,0x20);       //不显示
		OutputInformation(11,1,0x20);      //不显示
/**************************闹铃时闪烁显示**********************/		 
	    if((id==13)&&(a==1))			   //闹铃时闪烁
		  {
		   OutputInformation(6,1,0x20);
		   OutputInformation(7,1,0x20);
		  }
		else
		  {OutputInformation(6,1,R1302(0xc5)/16+0x30); //显示闹铃时
		   OutputInformation(7,1,R1302(0xc5)%16+0x30); //显示闹铃时
		  }

/**************************闹铃分闪烁显示*******************/
		if((id==14)&&(a==1))               //闹铃分闪烁
		 {OutputInformation(9,1,0x20);     //不显示
		  OutputInformation(10,1,0x20);    //不显示
		  
		 }
		else
		  {OutputInformation(9,1,R1302(0xc7)/16+0x30);  //显示闹铃分
		   OutputInformation(10,1,R1302(0xc7)%16+0x30); //显示闹铃分
		  }

/************************exit闪烁显示***********************/
		if((id==15)&&(a==1))			   //exie闪烁
		  {OutputInformation(12,1,0x20);   //不显示
	       OutputInformation(13,1,0x20);   //不显示
		   OutputInformation(14,1,0x20);   //不显示
		   OutputInformation(15,1,0x20);   //不显示
		  }
		else
		  DisplayListChar(12,1,exit);	   //显示exit								   
	   }
	 }
}
							
/*********************************背光灯设置*****************************************/
void model4()
{
	  if(id==0)								//id为零未进入背光灯设置
	   {OutputInformation(10,1,0x20);       //不显示
	    OutputInformation(11,1,0x20);       //不显示
	    OutputInformation(4,1,0x20);        //不显示
		DisplayListChar(5,1,reset);         //显示reset		
		DisplayListChar(12,1,exit);         //显示exit
		if(a==1)
		  {OutputInformation(0,1,0x20);     //不显示
	       OutputInformation(1,1,0x20);     //不显示
		   OutputInformation(2,1,0x20);     //不显示
		   OutputInformation(3,1,0x20);     //不显示
		   }
		else
          DisplayListChar(0,1,lamp);        //显示lamp
	    }
	 else 						            //id不为零（10）进入背光灯时间设置
	   {DisplayListChar(0,1,lamp);          //显示lamp
		DisplayListChar(4,1,set);           //显示set
		DisplayListChar(9,1,sec);           //显示sec
		DisplayListChar(12,1,exit);         //显示exit
		if((id==10)&&(a==1))
		   {
			OutputInformation(7,1,0x20);      //不显示		 
            OutputInformation(8,1,0x20);}
		else
		  {
		   OutputInformation(7,1,R1302(0xc1)/16+0x30); //读出背光灯延时时间
		   OutputInformation(8,1,R1302(0xc1)%16+0x30);
		  }
		if((id==11)&&(a==1))
		  {OutputInformation(12,1,0x20);     //不显示
	       OutputInformation(13,1,0x20);     //不显示
		   OutputInformation(14,1,0x20);     //不显示
		   OutputInformation(15,1,0x20);     //不显示
		  }
	 }

}
/*********************************时间归零设置*****************************************/
void model5()
{       
        OutputInformation(4,1,0x20);        //不显示
	    OutputInformation(10,1,0x20);       //不显示
		OutputInformation(11,1,0x20);       //不显示
	    DisplayListChar(0,1,lamp);          //显示lamp
	    DisplayListChar(12,1,exit);         //显示exit
		if(a==1)
		 { OutputInformation(5,1,0x20);     //不显示
	       OutputInformation(6,1,0x20);     //不显示
		   OutputInformation(7,1,0x20);     //不显示
		   OutputInformation(8,1,0x20);     //不显示
		   OutputInformation(9,1,0x20);
		 }
		else
          DisplayListChar(5,1,reset);       //显示reset	  
}
/**********************************退出***********************************************/
void model6()
{
  OutputInformation(10,1,0x20);       //不显示
  OutputInformation(11,1,0x20);       //不显示
  DisplayListChar(0,1,lamp);          //显示lamp
  DisplayListChar(5,1,reset);         //显示reset
  if(a==1)
	 {OutputInformation(12,1,0x20);   //不显示
	  OutputInformation(13,1,0x20);   //不显示
	  OutputInformation(14,1,0x20);   //不显示
	  OutputInformation(15,1,0x20);   //不显示
	 }
  else
     DisplayListChar(12,1,exit);      //显示exit
}

	
  
//********* LCM1602驱动程序 ***************
//写数据
void WriteDataLCM(uchar WDLCM)
{
ReadStatusLCM(); //检测忙

LCM_RS = 1;
LCM_RW = 0;
LCM_E = 0; 
LCM_Data = WDLCM;
delayNOP() ;
    LCM_E = 1 ;
    delayNOP() ;
 LCM_E = 0 ; 
}
//写指令
void WriteCommandLCM(uchar WCLCM,BuysC)     //BuysC为0时忽略忙检测
 {
  if (BuysC) ReadStatusLCM(); //根据需要检测忙
 
  LCM_RS = 0;
  LCM_RW = 0; 
  LCM_E = 0;
 _nop_() ;
    _nop_() ; 
 LCM_Data = WCLCM;
delayNOP() ;
  LCM_E = 1; 
delayNOP() ;
 LCM_E = 0;
 }
//读状态
uchar ReadStatusLCM(void)
 {
 LCM_RS = 0 ;
    LCM_RW = 1 ;
    LCM_E = 1 ;
    delayNOP() ;
  LCM_E = 1;
  while (LCM_Data & Busy); //检测忙信号
 LCM_E =0;
  return(LCM_Data);
 }
//LCM初始化
void LCMInit(void) 
 {

 

delay1(15) ;

WriteCommandLCM(0x01,1);
  WriteCommandLCM(0x38,1);
    delay1(5) ;
  WriteCommandLCM(0x38,1);
  delay1(5) ;
  WriteCommandLCM(0x38,1);
  delay1(5) ;
  WriteCommandLCM(0x0c,1); //显示模式设置,开始要求每次检测忙信号
  delay1(5) ;
  WriteCommandLCM(0x06,1); // 显示光标移动设置
  
 }
//按指定位置显示一个字符
void OutputInformation(uchar X, uchar Y, uchar DData)
 {
  Y &= 0x1;
  X &= 0xF; //限制X不能大于15，Y不能大于1
  if (Y) X |= 0x40; //当要显示第二行时地址码+0x40;
  X |= 0x80; //算出指令码
  WriteCommandLCM(X, 0); //这里不检测忙信号，发送地址码
  WriteDataLCM(DData);
 }
//按指定位置显示一串字符  ***原来的遇到空格0x20就不显示***
void DisplayListChar(uchar X, uchar Y, uchar code *DData)
{
  uchar ListLength,j;
  ListLength = strlen(DData);
  Y &= 0x1;
  X &= 0xF; //限制X不能大于15，Y不能大于1
      if (X <= 0xF) //X坐标应小于0xF
        { 
         for(j=0;j<ListLength;j++)
            {
             OutputInformation(X, Y, DData[j]); //显示单个字符
             X++;
            }
        }
}
//5ms延时
void Delay5Ms(void)
 {
  unsigned int TempCyc = 5552;
  while(TempCyc--);
 }
//400ms延时
void Delay400Ms(void)
 {
  uchar TempCycA = 5;
  unsigned int TempCycB;
  while(TempCycA--)
  {
   TempCycB=7269;
   while(TempCycB--);
  }
 }

//********DS1302读写程序***************//
/******************************************************************** 
函 数 名：RTInputByte()
功    能：实时时钟写入一字节
说    明：往DS1302写入1Byte数据 (内部函数)
入口参数：d 写入的数据 
返 回 值：无  
***********************************************************************/
void RTInputByte(uchar d) 
{ 
    uchar i;
    ACC = d;
    for(i=8; i>0; i--)
    {
        T_IO = ACC0;           /*相当于汇编中的 RRC */
        T_CLK = 1;
        T_CLK = 0;
        ACC = ACC >> 1; 
    } 
}
/******************************************************************** 
函 数 名：RTOutputByte()
功    能：实时时钟读取一字节
说    明：从DS1302读取1Byte数据 (内部函数)
入口参数：无  
返 回 值：ACC
设    计：zhaojunjie           日    期：2002-03-19
修    改：                     日    期： 
***********************************************************************/
uchar RTOutputByte(void) 
{ 
    uchar i;
    for(i=8; i>0; i--)
    {
        ACC = ACC >>1;         /*相当于汇编中的 RRC */
        ACC7 = T_IO;
        T_CLK = 1;
        T_CLK = 0;
    } 
    return(ACC); 
}
/******************************************************************** 
函 数 名：W1302()
功    能：往DS1302写入数据
说    明：先写地址，后写命令/数据 (内部函数)
调    用：RTInputByte() , RTOutputByte()
入口参数：ucAddr: DS1302地址, ucData: 要写的数据
返 回 值：无
***********************************************************************/
void W1302(uchar ucAddr, uchar ucDa)
{
    T_RST = 0;
    T_CLK = 0;
    T_RST = 1;
    RTInputByte(ucAddr);       /* 地址，命令 */
    RTInputByte(ucDa);       /* 写1Byte数据*/
    T_CLK = 1;
    T_RST = 0;
}
/******************************************************************** 
函 数 名：R1302()
功    能：读取DS1302某地址的数据
说    明：先写地址，后读命令/数据 (内部函数)
调    用：RTInputByte() , RTOutputByte()
入口参数：ucAddr: DS1302地址
返 回 值：ucData :读取的数据
***********************************************************************/
uchar R1302(uchar ucAddr)
{
    uchar ucData;
    T_RST = 0;
    T_CLK = 0;
    T_RST = 1;
    RTInputByte(ucAddr);             /* 地址，命令 */
    ucData = RTOutputByte();         /* 读1Byte数据 */
    T_CLK = 1;
    T_RST = 0;
    return(ucData);
}

/******************************************************************** 
函 数 名：Set1302()
功    能：设置初始时间
说    明：先写地址，后读命令/数据(寄存器多字节方式)
调    用：W1302()
入口参数：pClock: 设置时钟数据地址 格式为: 秒 分 时 日 月 星期 年
                               7Byte (BCD码)1B 1B 1B 1B 1B  1B  1B
返 回 值：无
***********************************************************************/
void Set1302(uchar *pClock) 
{
    uchar i;
    uchar ucAddr = 0x80; 
    W1302(0x8e,0x00);           /* 控制命令,WP=0,写操作*/
    for(i =7; i>0; i--)
    { 
        W1302(ucAddr,*pClock);  /* 秒 分 时 日 月 星期 年 */ 
        pClock++;
        ucAddr +=2;
    }
    W1302(0x8e,0x80);           /* 控制命令,WP=1,写保护*/
}
