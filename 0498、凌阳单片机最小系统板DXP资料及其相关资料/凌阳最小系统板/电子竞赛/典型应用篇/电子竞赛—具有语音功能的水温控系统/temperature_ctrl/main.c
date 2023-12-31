//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  工程名称： temperature_ctrl.scs
//  功能描述:  水温控制系统，利用温度传感器（PT1000)）测量温度。是水温控制在设定的温度�
//  硬件连接：IOA8-15----LEDa--dp.
//            IOB0-IOB2----LEDcs1-cs3
//            IOA0--IOA2---KEY1---KEY3
//            IOA3----ADC 
//            IOA4----Relay
//            IOB7 IOB10---UART
//  文件来源：《实验指导书》"实验一 熟悉IDE环境下的汇编程序的编写"第9页
//  IDE环境：   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  涉及的库：
//  组成文件:
//    	main.c  
//      isr.asm
//      key.asm
//      hardware.asm
//      led.asm
//      system.asm
//      sacm_user_a2000.h
//  日期:          2003-7-4
//===============================================

//*****************************************************************************/
// 文件名称： main.c// 
// 实现功能： 温度设置、温度显示、温度控制。
// 日期： 2003/7/4
//*****************************************************************************/
#include "key.h"
#include "a2000.h"
#include "hardware.h"
#include "sacm_user_A2000.h"

#define     Time5s            8;
#define     Time1s            2;    
#define     SET_ADC_TIME      Time5s

typedef struct PID {

        int    SetPoint;           //  设定目标 Desired Value
        float  Proportion;         //  比例常数 Proportional Const
        float  Integral;           //  积分常数 Integral Const
        float  Derivative;         //  微分常数 Derivative Const
        int    LastError;          //  Error[1]
        int    PrevError;          //  Error[2]
        int    SumError;           //  误差累计值

} PID;
PID  stPID;
int fOut=0;


enum system_status { system_temperature_set,system_temperature_control};
enum system_status status;

float PIDCalc( PID *pp, int NextPoint );   //PID计算函数             
void display_speech_ADC_temperature(void); //AD转换值的处理函数
void active();
void PIDinit(void);
int adc_data_cmp();
void key_value_process(int key);
void temperature_speech_index(unsigned int * p_speech);
void temperature_speech_play(void);


unsigned int   giADC_DataSave[10] ;        //ADC转换的数据
unsigned int   guiLED_Value[3] ={0,0,0};  //保存显示的LED数字
unsigned int  iAddrSpeech;
 int  G_ADC_flag = 0;
//============================================================================================
//函数: 主程序
//语法：int main(void)
//描述：语音播报、键盘扫描、温度控制
//参数：无
//返回：无
//============================================================================================

int main(void){ 
    int iKeyValue;
    
    status = system_temperature_set;
    guifgSpeechPlay = 0;
	System_Initial();	    
	PIDinit();		
	while(1){
	    iKeyValue = SP_GetCh();	              //取键值
	    key_value_process(iKeyValue);	      //键值处理
	    if(guifgSpeechPlay)
		    temperature_speech_play( );        //语音播放
	    if(status == system_temperature_control)  		
	        display_speech_ADC_temperature();  //测量温度显示、温度播报、PID计算
	    Clear_WatchDog();                      //清看门狗
	    System_ServiceLoop();                  //键盘扫描
	    if(fOut<=0) turn_off_timerB();         //加热时间到，关闭定时器B
	    ADC_Init(); 
   }
}
//============================================================================================
//函数: void PIDinit(void)
//语法：void PIDinit(void)
//描述：PID初始化
//参数：无
//返回：无
//============================================================================================

void PIDinit(void)
{
	stPID.LastError = 0;
	stPID.PrevError = 0;	   
	stPID.SumError =  0;
}   
//============================================================================================
//函数:float PIDCalc( PID *pp, int NextPoint )
//语法：float PIDCalc( PID *pp, int NextPoint )
//描述：PID计算
//参数：1、PID数值2、采样温度值
//返回：PID输出值
//============================================================================================

float PIDCalc( PID *pp, int NextPoint )
{
    int   dError,
          Error;       
        Error = pp->SetPoint*10 -  NextPoint;          // 偏差
        pp->SumError += Error;                      // 积分
        dError = pp->LastError - pp->PrevError;     // 当前微分
        pp->PrevError = pp->LastError;
        pp->LastError = Error;        
        return (pp->Proportion * Error              // 比例项
            +   pp->Integral * pp->SumError         // 积分项
            +   pp->Derivative * dError             // 微分项
        );
}

//============================================================================================
//函数:void display_speech_ADC_temperature(void)
//语法：void display_speech_ADC_temperature(void)
//描述：整理温度显示值、语音播放资源、PID控制
//参数：无
//返回：无
//============================================================================================

void display_speech_ADC_temperature(void){
    float fT,K;    
    int adc_data;
    static int siTlast = 0;
	if(G_ADC_flag){                       //判断是否有温度采样 1，有 0，无
	    G_ADC_flag = 0;
	    adc_data = adc_data_cmp();                     
	    adc_data /= SET_ADC_TIME;        //计算温度平均值
		if(adc_data >0x0255)  K = 0.079;  //确定温度系数
	    else K = 0.076;
	    fT = adc_data * K;               //换算成温度值	                       	    
        guiLED_Value[0] = (int)fT/10;		   //将温度值转换成十进制用于LED显示	
		guiLED_Value[1] = (int)fT%10;		
        guiLED_Value[2] = (int)(fT*10)%10;
        if((int)fT != siTlast){     //判断温度的整数值是否变化
        	temperature_speech_index(guiLED_Value);  	  //温度整数值语音播放排序
	     	SACM_A2000_Initial(0);					      //非自动方式播放的初始化
         	SACM_A2000_InitDecoder(DAC2);          	      //开始对A2000的语音数据以非自动方式解码
         	SP_INT_IRQ6();                                
         	iAddrSpeech = speech_start_address(iaSpeech_index[0]);//语音播放始地址
         	guifgSpeechPlay = 1;                         //设置语音为播放状态
         	siTlast = (int)fT;
        }
        stPID.Proportion = 1;              //  设置PID比例值
        stPID.Integral   = 0.5;              //  设置PID积分值
        stPID.Derivative = 0.0;              //  设置PID微分值
        fOut = 100*PIDCalc ( &stPID,(int)(fT*10) );        //  PID计算
        active();	
   }   
} 
//============================================================================================
//函数: void active()
//语法：void active()
//描述：PID输出值的处理
//参数：无
//返回：无
//============================================================================================

void active(){	
	if(fOut<=0){
	    turn_off_relay();           //温度高于设定值，关闭电炉
	    turn_off_timerB();          //停止计时  
	}
	else{
	    if(fOut>30*stPID.Proportion)//温度低于设定值2摄氏度
	    	turn_on_relay();        //开电炉加热
	    else  { turn_on_relay();SP_INT_TIMEB();  }    //初始化定时器，开始定时加热	       
	    
	}
}
//========================================================================
//函数： int adc_data_cmp()
//语法： int adc_data_cmp()
//描述： ADC采样数据的均值处理，抗干扰作用
//参数： 无
//返回： 无
//============================================================================================
	           
int adc_data_cmp()
{
    int max;
    int min;
    int Sum;
    int i;
    max = giADC_DataSave[0];
    for(i=0;i<10;i++){
    	if(giADC_DataSave[i]>max)     
    	   max = giADC_DataSave[i];          //取出最大值
    }
    min = giADC_DataSave[i];
    for(i=0;i<10;i++){
    	if(giADC_DataSave[i]<min)
    		min =  giADC_DataSave[i];        //取出最小值
    }
    for(i=0;i<10;i++)
       Sum += giADC_DataSave[i];             //累计值
    Sum = Sum - max-min;                     //排除最大最小值
    return(Sum);
}
//========================================================================
//函数： void key_value_process(int key)
//语法： void key_value_process(int key)
//描述： 按键值的处理
//参数： 键值
//返回： 无
//============================================================================================
void key_value_process(int key)
{
	int iAddr;
	switch(key){
    			case 0: break;
    			case 1:
    			       if(status == system_temperature_set){     //温度设置状态下
    			        	guiLED_Value[0]++;                   //温度值增加
    		        		if(guiLED_Value[0]==10)
	                	    guiLED_Value[0] = 0;                
	                    }	    
	                	break;
	        	case 2: 
	        	       if(status == system_temperature_set){
	        	        	guiLED_Value[1]++;
    		        		if(guiLED_Value[1]==10)
	                	    	guiLED_Value[1] = 0;
	                   }	    	
	                	break;
	        	case 4:
	        	        if(status == system_temperature_set){    
	        	        	temperature_speech_index(guiLED_Value);
	               	    	status = system_temperature_control;
	               	   		SACM_A2000_Initial(0);			//非自动方式播放的初始化
                        	SACM_A2000_InitDecoder(DAC2);   //开始对A2000的语音数据以非自动方式解码						    	               	   	
	               	    	guifgSpeechPlay = 1;
	               	    	stPID.SetPoint = guiLED_Value[0]*10 + guiLED_Value[1];
	               	    	iAddrSpeech = speech_start_address(iaSpeech_index[0]);		               	        	                	    	
	               	    }
	               	    else {
	               	        turn_off_IRQ5();                   //禁止ADC
	               	        status =  system_temperature_set;  //系统状态恢复为设置状态
	               	    }		               	    	               	    
	               		break;
	           default: break;						
		}
}	
//========================================================================
//函数： void temperature_speech_index(unsigned int * p_speech)
//语法： void temperature_speech_index(unsigned int * p_speech)
//描述： 排列语音播放序号
//参数： 设置或采样的温度值
//返回： 无
//============================================================================================
void temperature_speech_index(unsigned int * p_speech)
{
     if(*p_speech != 0){			      //判断设置温度的十位是否为零
         iaSpeech_index[0] = *p_speech;   //不为零则设置语音播放序号
         iaSpeech_index[1] = 10;          //设置播放语音   十
          p_speech++;
          
          if(*p_speech != 0){              //判断播放个位数字是否为零
             iaSpeech_index[2] = *p_speech;//不为零，设置语音序号 
             iaSpeech_index[3] = 11;       //设置摄氏度
              iPlay_times = 4;             //设置播放语音次数
          }    
          else {
              iPlay_times = 3;            //如果个位数字为零，则设置播放次数为3 
              iaSpeech_index[2] = 11;     //设置摄氏度
          }    
          
     }
     
     else{
         p_speech++;					  //如果设置温度的十位为零，
         iaSpeech_index[0] = *p_speech;   //设置个位数字的播放序号
         iaSpeech_index[1] = 11;          //设置摄氏度
         iPlay_times = 2;                 //设置播放次数
     }  
 } 
//========================================================================
//函数： int  speech_start_address(int n)
//语法： int  speech_start_address(int n)
//描述：取语音播放的开始地址
//参数：1、语音序号
//返回： 语音地址
//============================================================================================
 int  speech_start_address(int n)
{
     int iAddress;
     switch(n){
     	case 0:  iAddress =  RES_T046_16K_SA; break;
     	case 1:  iAddress =  RES_T047_16K_SA; break;
     	case 2:  iAddress =  RES_T048_16K_SA; break;
     	case 3:  iAddress =  RES_T049_16K_SA; break;
     	case 4:  iAddress =  RES_T050_16K_SA; break;
     	case 5:  iAddress =  RES_T051_16K_SA; break;
     	case 6:  iAddress =  RES_T052_16K_SA; break;
     	case 7:  iAddress =  RES_T053_16K_SA; break;
     	case 8:  iAddress =  RES_T054_16K_SA; break;
     	case 9:  iAddress =  RES_T055_16K_SA; break;
     	case 10:  iAddress =  RES_T056_16K_SA; break;
     	case 11:  iAddress =  RES_T034_16K_SA; break;
     	default: break;
    }
    return(iAddress);
} 
//========================================================================
//函数：speech_end_address(int m)
//语法：speech_end_address(int m)
//描述：取语音播放的结束地址
//参数：1、语音序号
//返回：语音地址
//============================================================================================

int  speech_end_address(int m)
{
     int iEndAddress;
     switch(m){
     	case 0:  iEndAddress =  RES_T046_16K_EA; break;
     	case 1:  iEndAddress =  RES_T047_16K_EA; break;
     	case 2:  iEndAddress =  RES_T048_16K_EA; break;
     	case 3:  iEndAddress =  RES_T049_16K_EA; break;
     	case 4:  iEndAddress =  RES_T050_16K_EA; break;
     	case 5:  iEndAddress =  RES_T051_16K_EA; break;
     	case 6:  iEndAddress =  RES_T052_16K_EA; break;
     	case 7:  iEndAddress =  RES_T053_16K_EA; break;
     	case 8:  iEndAddress =  RES_T054_16K_EA; break;
     	case 9:  iEndAddress =  RES_T055_16K_EA; break;
     	case 10: iEndAddress =  RES_T056_16K_EA; break;
     	case 11: iEndAddress =  RES_T034_16K_EA; break;
     	default: break;
    }
    return(iEndAddress);
} 

//========================================================================
//函数：void temperature_speech_play(void)
//语法：void temperature_speech_play(void)
//描述：温度值播放函数
//参数：无
//返回：无
//============================================================================================

void temperature_speech_play(void)
{
   int k = 0;
   SP_INT_IRQ6();                               //允许LED显示
   if(SACM_A2000_TestQueue()!=Full)              //判断语音队列是否为空
   {
		iRet = SP_GetResource(iAddrSpeech);      //根据地址取资源数据
	    SACM_A2000_FillQueue(iRet);              //填充队列
	    iAddrSpeech++;                           //地址更新
   }                                             //判断是否为资源数据的结束地址
   if(iAddrSpeech < speech_end_address(iaSpeech_index[iNumber]))
         SACM_A2000_Decoder();	                       //资源数据解码  
   else{
      iPlay_times--;                                   //更新播放次数
      if (iPlay_times == 0){                           //如果播放结束
          SACM_A2000_Stop();                           //停止语音播放
       	  guifgSpeechPlay = 0;                         //语音状态设置为停止状态
       	  iNumber = 0;                                 //清零
       	  SP_INT_IRQ6();                                //允许LED显示
          SP_INT_IRQ5();                                //允许ADC
          ADC_Init();                                   //ADC重新初始化
      }
      else{                                            //播放次数不为零   
          iNumber++;                                    
          iAddrSpeech =  speech_start_address(iaSpeech_index[iNumber]);//取下一次播放语音的首地址
          SACM_A2000_InitDecoder(DAC2);          	                   //开始对A2000的语音数据以非自动方式解码

      }
   }
}     	        
