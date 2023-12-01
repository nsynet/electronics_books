//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  ¹¤³ÌÃû³Æ£º temperature_ctrl.scs
//  ¹¦ÄÜÃèÊö:  Ë®ÎÂ¿ØÖÆÏµÍ³£¬ÀûÓÃÎÂ¶È´«¸ĞÆ÷£¨PT1000)£©²âÁ¿ÎÂ¶È¡£ÊÇË®ÎÂ¿ØÖÆÔÚÉè¶¨µÄÎÂ¶ÈÉ
//  Ó²¼şÁ¬½Ó£ºIOA8-15----LEDa--dp.
//            IOB0-IOB2----LEDcs1-cs3
//            IOA0--IOA2---KEY1---KEY3
//            IOA3----ADC 
//            IOA4----Relay
//            IOB7 IOB10---UART
//  ÎÄ¼şÀ´Ô´£º¡¶ÊµÑéÖ¸µ¼Êé¡·"ÊµÑéÒ» ÊìÏ¤IDE»·¾³ÏÂµÄ»ã±à³ÌĞòµÄ±àĞ´"µÚ9Ò³
//  IDE»·¾³£º   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  Éæ¼°µÄ¿â£º
//  ×é³ÉÎÄ¼ş:
//    	main.c  
//      isr.asm
//      key.asm
//      hardware.asm
//      led.asm
//      system.asm
//      sacm_user_a2000.h
//  ÈÕÆÚ:          2003-7-4
//===============================================

//*****************************************************************************/
// ÎÄ¼şÃû³Æ£º main.c// 
// ÊµÏÖ¹¦ÄÜ£º ÎÂ¶ÈÉèÖÃ¡¢ÎÂ¶ÈÏÔÊ¾¡¢ÎÂ¶È¿ØÖÆ¡£
// ÈÕÆÚ£º 2003/7/4
//*****************************************************************************/
#include "key.h"
#include "a2000.h"
#include "hardware.h"
#include "sacm_user_A2000.h"

#define     Time5s            8;
#define     Time1s            2;    
#define     SET_ADC_TIME      Time5s

typedef struct PID {

        int    SetPoint;           //  Éè¶¨Ä¿±ê Desired Value
        float  Proportion;         //  ±ÈÀı³£Êı Proportional Const
        float  Integral;           //  »ı·Ö³£Êı Integral Const
        float  Derivative;         //  Î¢·Ö³£Êı Derivative Const
        int    LastError;          //  Error[1]
        int    PrevError;          //  Error[2]
        int    SumError;           //  Îó²îÀÛ¼ÆÖµ

} PID;
PID  stPID;
int fOut=0;


enum system_status { system_temperature_set,system_temperature_control};
enum system_status status;

float PIDCalc( PID *pp, int NextPoint );   //PID¼ÆËãº¯Êı             
void display_speech_ADC_temperature(void); //AD×ª»»ÖµµÄ´¦Àíº¯Êı
void active();
void PIDinit(void);
int adc_data_cmp();
void key_value_process(int key);
void temperature_speech_index(unsigned int * p_speech);
void temperature_speech_play(void);


unsigned int   giADC_DataSave[10] ;        //ADC×ª»»µÄÊı¾İ
unsigned int   guiLED_Value[3] ={0,0,0};  //±£´æÏÔÊ¾µÄLEDÊı×Ö
unsigned int  iAddrSpeech;
 int  G_ADC_flag = 0;
//============================================================================================
//º¯Êı: Ö÷³ÌĞò
//Óï·¨£ºint main(void)
//ÃèÊö£ºÓïÒô²¥±¨¡¢¼üÅÌÉ¨Ãè¡¢ÎÂ¶È¿ØÖÆ
//²ÎÊı£ºÎŞ
//·µ»Ø£ºÎŞ
//============================================================================================

int main(void){ 
    int iKeyValue;
    
    status = system_temperature_set;
    guifgSpeechPlay = 0;
	System_Initial();	    
	PIDinit();		
	while(1){
	    iKeyValue = SP_GetCh();	              //È¡¼üÖµ
	    key_value_process(iKeyValue);	      //¼üÖµ´¦Àí
	    if(guifgSpeechPlay)
		    temperature_speech_play( );        //ÓïÒô²¥·Å
	    if(status == system_temperature_control)  		
	        display_speech_ADC_temperature();  //²âÁ¿ÎÂ¶ÈÏÔÊ¾¡¢ÎÂ¶È²¥±¨¡¢PID¼ÆËã
	    Clear_WatchDog();                      //Çå¿´ÃÅ¹·
	    System_ServiceLoop();                  //¼üÅÌÉ¨Ãè
	    if(fOut<=0) turn_off_timerB();         //¼ÓÈÈÊ±¼äµ½£¬¹Ø±Õ¶¨Ê±Æ÷B
	    ADC_Init(); 
   }
}
//============================================================================================
//º¯Êı: void PIDinit(void)
//Óï·¨£ºvoid PIDinit(void)
//ÃèÊö£ºPID³õÊ¼»¯
//²ÎÊı£ºÎŞ
//·µ»Ø£ºÎŞ
//============================================================================================

void PIDinit(void)
{
	stPID.LastError = 0;
	stPID.PrevError = 0;	   
	stPID.SumError =  0;
}   
//============================================================================================
//º¯Êı:float PIDCalc( PID *pp, int NextPoint )
//Óï·¨£ºfloat PIDCalc( PID *pp, int NextPoint )
//ÃèÊö£ºPID¼ÆËã
//²ÎÊı£º1¡¢PIDÊıÖµ2¡¢²ÉÑùÎÂ¶ÈÖµ
//·µ»Ø£ºPIDÊä³öÖµ
//============================================================================================

float PIDCalc( PID *pp, int NextPoint )
{
    int   dError,
          Error;       
        Error = pp->SetPoint*10 -  NextPoint;          // Æ«²î
        pp->SumError += Error;                      // »ı·Ö
        dError = pp->LastError - pp->PrevError;     // µ±Ç°Î¢·Ö
        pp->PrevError = pp->LastError;
        pp->LastError = Error;        
        return (pp->Proportion * Error              // ±ÈÀıÏî
            +   pp->Integral * pp->SumError         // »ı·ÖÏî
            +   pp->Derivative * dError             // Î¢·ÖÏî
        );
}

//============================================================================================
//º¯Êı:void display_speech_ADC_temperature(void)
//Óï·¨£ºvoid display_speech_ADC_temperature(void)
//ÃèÊö£ºÕûÀíÎÂ¶ÈÏÔÊ¾Öµ¡¢ÓïÒô²¥·Å×ÊÔ´¡¢PID¿ØÖÆ
//²ÎÊı£ºÎŞ
//·µ»Ø£ºÎŞ
//============================================================================================

void display_speech_ADC_temperature(void){
    float fT,K;    
    int adc_data;
    static int siTlast = 0;
	if(G_ADC_flag){                       //ÅĞ¶ÏÊÇ·ñÓĞÎÂ¶È²ÉÑù 1£¬ÓĞ 0£¬ÎŞ
	    G_ADC_flag = 0;
	    adc_data = adc_data_cmp();                     
	    adc_data /= SET_ADC_TIME;        //¼ÆËãÎÂ¶ÈÆ½¾ùÖµ
		if(adc_data >0x0255)  K = 0.079;  //È·¶¨ÎÂ¶ÈÏµÊı
	    else K = 0.076;
	    fT = adc_data * K;               //»»Ëã³ÉÎÂ¶ÈÖµ	                       	    
        guiLED_Value[0] = (int)fT/10;		   //½«ÎÂ¶ÈÖµ×ª»»³ÉÊ®½øÖÆÓÃÓÚLEDÏÔÊ¾	
		guiLED_Value[1] = (int)fT%10;		
        guiLED_Value[2] = (int)(fT*10)%10;
        if((int)fT != siTlast){     //ÅĞ¶ÏÎÂ¶ÈµÄÕûÊıÖµÊÇ·ñ±ä»¯
        	temperature_speech_index(guiLED_Value);  	  //ÎÂ¶ÈÕûÊıÖµÓïÒô²¥·ÅÅÅĞò
	     	SACM_A2000_Initial(0);					      //·Ç×Ô¶¯·½Ê½²¥·ÅµÄ³õÊ¼»¯
         	SACM_A2000_InitDecoder(DAC2);          	      //¿ªÊ¼¶ÔA2000µÄÓïÒôÊı¾İÒÔ·Ç×Ô¶¯·½Ê½½âÂë
         	SP_INT_IRQ6();                                
         	iAddrSpeech = speech_start_address(iaSpeech_index[0]);//ÓïÒô²¥·ÅÊ¼µØÖ·
         	guifgSpeechPlay = 1;                         //ÉèÖÃÓïÒôÎª²¥·Å×´Ì¬
         	siTlast = (int)fT;
        }
        stPID.Proportion = 1;              //  ÉèÖÃPID±ÈÀıÖµ
        stPID.Integral   = 0.5;              //  ÉèÖÃPID»ı·ÖÖµ
        stPID.Derivative = 0.0;              //  ÉèÖÃPIDÎ¢·ÖÖµ
        fOut = 100*PIDCalc ( &stPID,(int)(fT*10) );        //  PID¼ÆËã
        active();	
   }   
} 
//============================================================================================
//º¯Êı: void active()
//Óï·¨£ºvoid active()
//ÃèÊö£ºPIDÊä³öÖµµÄ´¦Àí
//²ÎÊı£ºÎŞ
//·µ»Ø£ºÎŞ
//============================================================================================

void active(){	
	if(fOut<=0){
	    turn_off_relay();           //ÎÂ¶È¸ßÓÚÉè¶¨Öµ£¬¹Ø±ÕµçÂ¯
	    turn_off_timerB();          //Í£Ö¹¼ÆÊ±  
	}
	else{
	    if(fOut>30*stPID.Proportion)//ÎÂ¶ÈµÍÓÚÉè¶¨Öµ2ÉãÊÏ¶È
	    	turn_on_relay();        //¿ªµçÂ¯¼ÓÈÈ
	    else  { turn_on_relay();SP_INT_TIMEB();  }    //³õÊ¼»¯¶¨Ê±Æ÷£¬¿ªÊ¼¶¨Ê±¼ÓÈÈ	       
	    
	}
}
//========================================================================
//º¯Êı£º int adc_data_cmp()
//Óï·¨£º int adc_data_cmp()
//ÃèÊö£º ADC²ÉÑùÊı¾İµÄ¾ùÖµ´¦Àí£¬¿¹¸ÉÈÅ×÷ÓÃ
//²ÎÊı£º ÎŞ
//·µ»Ø£º ÎŞ
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
    	   max = giADC_DataSave[i];          //È¡³ö×î´óÖµ
    }
    min = giADC_DataSave[i];
    for(i=0;i<10;i++){
    	if(giADC_DataSave[i]<min)
    		min =  giADC_DataSave[i];        //È¡³ö×îĞ¡Öµ
    }
    for(i=0;i<10;i++)
       Sum += giADC_DataSave[i];             //ÀÛ¼ÆÖµ
    Sum = Sum - max-min;                     //ÅÅ³ı×î´ó×îĞ¡Öµ
    return(Sum);
}
//========================================================================
//º¯Êı£º void key_value_process(int key)
//Óï·¨£º void key_value_process(int key)
//ÃèÊö£º °´¼üÖµµÄ´¦Àí
//²ÎÊı£º ¼üÖµ
//·µ»Ø£º ÎŞ
//============================================================================================
void key_value_process(int key)
{
	int iAddr;
	switch(key){
    			case 0: break;
    			case 1:
    			       if(status == system_temperature_set){     //ÎÂ¶ÈÉèÖÃ×´Ì¬ÏÂ
    			        	guiLED_Value[0]++;                   //ÎÂ¶ÈÖµÔö¼Ó
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
	               	   		SACM_A2000_Initial(0);			//·Ç×Ô¶¯·½Ê½²¥·ÅµÄ³õÊ¼»¯
                        	SACM_A2000_InitDecoder(DAC2);   //¿ªÊ¼¶ÔA2000µÄÓïÒôÊı¾İÒÔ·Ç×Ô¶¯·½Ê½½âÂë						    	               	   	
	               	    	guifgSpeechPlay = 1;
	               	    	stPID.SetPoint = guiLED_Value[0]*10 + guiLED_Value[1];
	               	    	iAddrSpeech = speech_start_address(iaSpeech_index[0]);		               	        	                	    	
	               	    }
	               	    else {
	               	        turn_off_IRQ5();                   //½ûÖ¹ADC
	               	        status =  system_temperature_set;  //ÏµÍ³×´Ì¬»Ö¸´ÎªÉèÖÃ×´Ì¬
	               	    }		               	    	               	    
	               		break;
	           default: break;						
		}
}	
//========================================================================
//º¯Êı£º void temperature_speech_index(unsigned int * p_speech)
//Óï·¨£º void temperature_speech_index(unsigned int * p_speech)
//ÃèÊö£º ÅÅÁĞÓïÒô²¥·ÅĞòºÅ
//²ÎÊı£º ÉèÖÃ»ò²ÉÑùµÄÎÂ¶ÈÖµ
//·µ»Ø£º ÎŞ
//============================================================================================
void temperature_speech_index(unsigned int * p_speech)
{
     if(*p_speech != 0){			      //ÅĞ¶ÏÉèÖÃÎÂ¶ÈµÄÊ®Î»ÊÇ·ñÎªÁã
         iaSpeech_index[0] = *p_speech;   //²»ÎªÁãÔòÉèÖÃÓïÒô²¥·ÅĞòºÅ
         iaSpeech_index[1] = 10;          //ÉèÖÃ²¥·ÅÓïÒô   Ê®
          p_speech++;
          
          if(*p_speech != 0){              //ÅĞ¶Ï²¥·Å¸öÎ»Êı×ÖÊÇ·ñÎªÁã
             iaSpeech_index[2] = *p_speech;//²»ÎªÁã£¬ÉèÖÃÓïÒôĞòºÅ 
             iaSpeech_index[3] = 11;       //ÉèÖÃÉãÊÏ¶È
              iPlay_times = 4;             //ÉèÖÃ²¥·ÅÓïÒô´ÎÊı
          }    
          else {
              iPlay_times = 3;            //Èç¹û¸öÎ»Êı×ÖÎªÁã£¬ÔòÉèÖÃ²¥·Å´ÎÊıÎª3 
              iaSpeech_index[2] = 11;     //ÉèÖÃÉãÊÏ¶È
          }    
          
     }
     
     else{
         p_speech++;					  //Èç¹ûÉèÖÃÎÂ¶ÈµÄÊ®Î»ÎªÁã£¬
         iaSpeech_index[0] = *p_speech;   //ÉèÖÃ¸öÎ»Êı×ÖµÄ²¥·ÅĞòºÅ
         iaSpeech_index[1] = 11;          //ÉèÖÃÉãÊÏ¶È
         iPlay_times = 2;                 //ÉèÖÃ²¥·Å´ÎÊı
     }  
 } 
//========================================================================
//º¯Êı£º int  speech_start_address(int n)
//Óï·¨£º int  speech_start_address(int n)
//ÃèÊö£ºÈ¡ÓïÒô²¥·ÅµÄ¿ªÊ¼µØÖ·
//²ÎÊı£º1¡¢ÓïÒôĞòºÅ
//·µ»Ø£º ÓïÒôµØÖ·
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
//º¯Êı£ºspeech_end_address(int m)
//Óï·¨£ºspeech_end_address(int m)
//ÃèÊö£ºÈ¡ÓïÒô²¥·ÅµÄ½áÊøµØÖ·
//²ÎÊı£º1¡¢ÓïÒôĞòºÅ
//·µ»Ø£ºÓïÒôµØÖ·
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
//º¯Êı£ºvoid temperature_speech_play(void)
//Óï·¨£ºvoid temperature_speech_play(void)
//ÃèÊö£ºÎÂ¶ÈÖµ²¥·Åº¯Êı
//²ÎÊı£ºÎŞ
//·µ»Ø£ºÎŞ
//============================================================================================

void temperature_speech_play(void)
{
   int k = 0;
   SP_INT_IRQ6();                               //ÔÊĞíLEDÏÔÊ¾
   if(SACM_A2000_TestQueue()!=Full)              //ÅĞ¶ÏÓïÒô¶ÓÁĞÊÇ·ñÎª¿Õ
   {
		iRet = SP_GetResource(iAddrSpeech);      //¸ù¾İµØÖ·È¡×ÊÔ´Êı¾İ
	    SACM_A2000_FillQueue(iRet);              //Ìî³ä¶ÓÁĞ
	    iAddrSpeech++;                           //µØÖ·¸üĞÂ
   }                                             //ÅĞ¶ÏÊÇ·ñÎª×ÊÔ´Êı¾İµÄ½áÊøµØÖ·
   if(iAddrSpeech < speech_end_address(iaSpeech_index[iNumber]))
         SACM_A2000_Decoder();	                       //×ÊÔ´Êı¾İ½âÂë  
   else{
      iPlay_times--;                                   //¸üĞÂ²¥·Å´ÎÊı
      if (iPlay_times == 0){                           //Èç¹û²¥·Å½áÊø
          SACM_A2000_Stop();                           //Í£Ö¹ÓïÒô²¥·Å
       	  guifgSpeechPlay = 0;                         //ÓïÒô×´Ì¬ÉèÖÃÎªÍ£Ö¹×´Ì¬
       	  iNumber = 0;                                 //ÇåÁã
       	  SP_INT_IRQ6();                                //ÔÊĞíLEDÏÔÊ¾
          SP_INT_IRQ5();                                //ÔÊĞíADC
          ADC_Init();                                   //ADCÖØĞÂ³õÊ¼»¯
      }
      else{                                            //²¥·Å´ÎÊı²»ÎªÁã   
          iNumber++;                                    
          iAddrSpeech =  speech_start_address(iaSpeech_index[iNumber]);//È¡ÏÂÒ»´Î²¥·ÅÓïÒôµÄÊ×µØÖ·
          SACM_A2000_InitDecoder(DAC2);          	                   //¿ªÊ¼¶ÔA2000µÄÓïÒôÊı¾İÒÔ·Ç×Ô¶¯·½Ê½½âÂë

      }
   }
}     	        
