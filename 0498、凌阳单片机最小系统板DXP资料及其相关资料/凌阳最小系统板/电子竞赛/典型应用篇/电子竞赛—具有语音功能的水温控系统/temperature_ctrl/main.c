//======================================================
//  The information contained herein is the exclusive property of
//  Sunnnorth Technology Co. And shall not be distributed, reproduced,
//  or disclosed in whole in part without prior written permission.
//           (C) COPYRIGHT 2003  SUNNORTH TECHNOLOGY CO.
//                     ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorized copies.
//========================================================

//============================================================
//  �������ƣ� temperature_ctrl.scs
//  ��������:  ˮ�¿���ϵͳ�������¶ȴ�������PT1000)�������¶ȡ���ˮ�¿������趨���¶��
//  Ӳ�����ӣ�IOA8-15----LEDa--dp.
//            IOB0-IOB2----LEDcs1-cs3
//            IOA0--IOA2---KEY1---KEY3
//            IOA3----ADC 
//            IOA4----Relay
//            IOB7 IOB10---UART
//  �ļ���Դ����ʵ��ָ���顷"ʵ��һ ��ϤIDE�����µĻ�����ı�д"��9ҳ
//  IDE������   SUNPLUS u'nSPTM  IDE 1.8.0
//
//  �漰�Ŀ⣺
//  ����ļ�:
//    	main.c  
//      isr.asm
//      key.asm
//      hardware.asm
//      led.asm
//      system.asm
//      sacm_user_a2000.h
//  ����:          2003-7-4
//===============================================

//*****************************************************************************/
// �ļ����ƣ� main.c// 
// ʵ�ֹ��ܣ� �¶����á��¶���ʾ���¶ȿ��ơ�
// ���ڣ� 2003/7/4
//*****************************************************************************/
#include "key.h"
#include "a2000.h"
#include "hardware.h"
#include "sacm_user_A2000.h"

#define     Time5s            8;
#define     Time1s            2;    
#define     SET_ADC_TIME      Time5s

typedef struct PID {

        int    SetPoint;           //  �趨Ŀ�� Desired Value
        float  Proportion;         //  �������� Proportional Const
        float  Integral;           //  ���ֳ��� Integral Const
        float  Derivative;         //  ΢�ֳ��� Derivative Const
        int    LastError;          //  Error[1]
        int    PrevError;          //  Error[2]
        int    SumError;           //  ����ۼ�ֵ

} PID;
PID  stPID;
int fOut=0;


enum system_status { system_temperature_set,system_temperature_control};
enum system_status status;

float PIDCalc( PID *pp, int NextPoint );   //PID���㺯��             
void display_speech_ADC_temperature(void); //ADת��ֵ�Ĵ�����
void active();
void PIDinit(void);
int adc_data_cmp();
void key_value_process(int key);
void temperature_speech_index(unsigned int * p_speech);
void temperature_speech_play(void);


unsigned int   giADC_DataSave[10] ;        //ADCת��������
unsigned int   guiLED_Value[3] ={0,0,0};  //������ʾ��LED����
unsigned int  iAddrSpeech;
 int  G_ADC_flag = 0;
//============================================================================================
//����: ������
//�﷨��int main(void)
//��������������������ɨ�衢�¶ȿ���
//��������
//���أ���
//============================================================================================

int main(void){ 
    int iKeyValue;
    
    status = system_temperature_set;
    guifgSpeechPlay = 0;
	System_Initial();	    
	PIDinit();		
	while(1){
	    iKeyValue = SP_GetCh();	              //ȡ��ֵ
	    key_value_process(iKeyValue);	      //��ֵ����
	    if(guifgSpeechPlay)
		    temperature_speech_play( );        //��������
	    if(status == system_temperature_control)  		
	        display_speech_ADC_temperature();  //�����¶���ʾ���¶Ȳ�����PID����
	    Clear_WatchDog();                      //�忴�Ź�
	    System_ServiceLoop();                  //����ɨ��
	    if(fOut<=0) turn_off_timerB();         //����ʱ�䵽���رն�ʱ��B
	    ADC_Init(); 
   }
}
//============================================================================================
//����: void PIDinit(void)
//�﷨��void PIDinit(void)
//������PID��ʼ��
//��������
//���أ���
//============================================================================================

void PIDinit(void)
{
	stPID.LastError = 0;
	stPID.PrevError = 0;	   
	stPID.SumError =  0;
}   
//============================================================================================
//����:float PIDCalc( PID *pp, int NextPoint )
//�﷨��float PIDCalc( PID *pp, int NextPoint )
//������PID����
//������1��PID��ֵ2�������¶�ֵ
//���أ�PID���ֵ
//============================================================================================

float PIDCalc( PID *pp, int NextPoint )
{
    int   dError,
          Error;       
        Error = pp->SetPoint*10 -  NextPoint;          // ƫ��
        pp->SumError += Error;                      // ����
        dError = pp->LastError - pp->PrevError;     // ��ǰ΢��
        pp->PrevError = pp->LastError;
        pp->LastError = Error;        
        return (pp->Proportion * Error              // ������
            +   pp->Integral * pp->SumError         // ������
            +   pp->Derivative * dError             // ΢����
        );
}

//============================================================================================
//����:void display_speech_ADC_temperature(void)
//�﷨��void display_speech_ADC_temperature(void)
//�����������¶���ʾֵ������������Դ��PID����
//��������
//���أ���
//============================================================================================

void display_speech_ADC_temperature(void){
    float fT,K;    
    int adc_data;
    static int siTlast = 0;
	if(G_ADC_flag){                       //�ж��Ƿ����¶Ȳ��� 1���� 0����
	    G_ADC_flag = 0;
	    adc_data = adc_data_cmp();                     
	    adc_data /= SET_ADC_TIME;        //�����¶�ƽ��ֵ
		if(adc_data >0x0255)  K = 0.079;  //ȷ���¶�ϵ��
	    else K = 0.076;
	    fT = adc_data * K;               //������¶�ֵ	                       	    
        guiLED_Value[0] = (int)fT/10;		   //���¶�ֵת����ʮ��������LED��ʾ	
		guiLED_Value[1] = (int)fT%10;		
        guiLED_Value[2] = (int)(fT*10)%10;
        if((int)fT != siTlast){     //�ж��¶ȵ�����ֵ�Ƿ�仯
        	temperature_speech_index(guiLED_Value);  	  //�¶�����ֵ������������
	     	SACM_A2000_Initial(0);					      //���Զ���ʽ���ŵĳ�ʼ��
         	SACM_A2000_InitDecoder(DAC2);          	      //��ʼ��A2000�����������Է��Զ���ʽ����
         	SP_INT_IRQ6();                                
         	iAddrSpeech = speech_start_address(iaSpeech_index[0]);//��������ʼ��ַ
         	guifgSpeechPlay = 1;                         //��������Ϊ����״̬
         	siTlast = (int)fT;
        }
        stPID.Proportion = 1;              //  ����PID����ֵ
        stPID.Integral   = 0.5;              //  ����PID����ֵ
        stPID.Derivative = 0.0;              //  ����PID΢��ֵ
        fOut = 100*PIDCalc ( &stPID,(int)(fT*10) );        //  PID����
        active();	
   }   
} 
//============================================================================================
//����: void active()
//�﷨��void active()
//������PID���ֵ�Ĵ���
//��������
//���أ���
//============================================================================================

void active(){	
	if(fOut<=0){
	    turn_off_relay();           //�¶ȸ����趨ֵ���رյ�¯
	    turn_off_timerB();          //ֹͣ��ʱ  
	}
	else{
	    if(fOut>30*stPID.Proportion)//�¶ȵ����趨ֵ2���϶�
	    	turn_on_relay();        //����¯����
	    else  { turn_on_relay();SP_INT_TIMEB();  }    //��ʼ����ʱ������ʼ��ʱ����	       
	    
	}
}
//========================================================================
//������ int adc_data_cmp()
//�﷨�� int adc_data_cmp()
//������ ADC�������ݵľ�ֵ��������������
//������ ��
//���أ� ��
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
    	   max = giADC_DataSave[i];          //ȡ�����ֵ
    }
    min = giADC_DataSave[i];
    for(i=0;i<10;i++){
    	if(giADC_DataSave[i]<min)
    		min =  giADC_DataSave[i];        //ȡ����Сֵ
    }
    for(i=0;i<10;i++)
       Sum += giADC_DataSave[i];             //�ۼ�ֵ
    Sum = Sum - max-min;                     //�ų������Сֵ
    return(Sum);
}
//========================================================================
//������ void key_value_process(int key)
//�﷨�� void key_value_process(int key)
//������ ����ֵ�Ĵ���
//������ ��ֵ
//���أ� ��
//============================================================================================
void key_value_process(int key)
{
	int iAddr;
	switch(key){
    			case 0: break;
    			case 1:
    			       if(status == system_temperature_set){     //�¶�����״̬��
    			        	guiLED_Value[0]++;                   //�¶�ֵ����
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
	               	   		SACM_A2000_Initial(0);			//���Զ���ʽ���ŵĳ�ʼ��
                        	SACM_A2000_InitDecoder(DAC2);   //��ʼ��A2000�����������Է��Զ���ʽ����						    	               	   	
	               	    	guifgSpeechPlay = 1;
	               	    	stPID.SetPoint = guiLED_Value[0]*10 + guiLED_Value[1];
	               	    	iAddrSpeech = speech_start_address(iaSpeech_index[0]);		               	        	                	    	
	               	    }
	               	    else {
	               	        turn_off_IRQ5();                   //��ֹADC
	               	        status =  system_temperature_set;  //ϵͳ״̬�ָ�Ϊ����״̬
	               	    }		               	    	               	    
	               		break;
	           default: break;						
		}
}	
//========================================================================
//������ void temperature_speech_index(unsigned int * p_speech)
//�﷨�� void temperature_speech_index(unsigned int * p_speech)
//������ ���������������
//������ ���û�������¶�ֵ
//���أ� ��
//============================================================================================
void temperature_speech_index(unsigned int * p_speech)
{
     if(*p_speech != 0){			      //�ж������¶ȵ�ʮλ�Ƿ�Ϊ��
         iaSpeech_index[0] = *p_speech;   //��Ϊ�������������������
         iaSpeech_index[1] = 10;          //���ò�������   ʮ
          p_speech++;
          
          if(*p_speech != 0){              //�жϲ��Ÿ�λ�����Ƿ�Ϊ��
             iaSpeech_index[2] = *p_speech;//��Ϊ�㣬����������� 
             iaSpeech_index[3] = 11;       //�������϶�
              iPlay_times = 4;             //���ò�����������
          }    
          else {
              iPlay_times = 3;            //�����λ����Ϊ�㣬�����ò��Ŵ���Ϊ3 
              iaSpeech_index[2] = 11;     //�������϶�
          }    
          
     }
     
     else{
         p_speech++;					  //��������¶ȵ�ʮλΪ�㣬
         iaSpeech_index[0] = *p_speech;   //���ø�λ���ֵĲ������
         iaSpeech_index[1] = 11;          //�������϶�
         iPlay_times = 2;                 //���ò��Ŵ���
     }  
 } 
//========================================================================
//������ int  speech_start_address(int n)
//�﷨�� int  speech_start_address(int n)
//������ȡ�������ŵĿ�ʼ��ַ
//������1���������
//���أ� ������ַ
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
//������speech_end_address(int m)
//�﷨��speech_end_address(int m)
//������ȡ�������ŵĽ�����ַ
//������1���������
//���أ�������ַ
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
//������void temperature_speech_play(void)
//�﷨��void temperature_speech_play(void)
//�������¶�ֵ���ź���
//��������
//���أ���
//============================================================================================

void temperature_speech_play(void)
{
   int k = 0;
   SP_INT_IRQ6();                               //����LED��ʾ
   if(SACM_A2000_TestQueue()!=Full)              //�ж����������Ƿ�Ϊ��
   {
		iRet = SP_GetResource(iAddrSpeech);      //���ݵ�ַȡ��Դ����
	    SACM_A2000_FillQueue(iRet);              //������
	    iAddrSpeech++;                           //��ַ����
   }                                             //�ж��Ƿ�Ϊ��Դ���ݵĽ�����ַ
   if(iAddrSpeech < speech_end_address(iaSpeech_index[iNumber]))
         SACM_A2000_Decoder();	                       //��Դ���ݽ���  
   else{
      iPlay_times--;                                   //���²��Ŵ���
      if (iPlay_times == 0){                           //������Ž���
          SACM_A2000_Stop();                           //ֹͣ��������
       	  guifgSpeechPlay = 0;                         //����״̬����Ϊֹͣ״̬
       	  iNumber = 0;                                 //����
       	  SP_INT_IRQ6();                                //����LED��ʾ
          SP_INT_IRQ5();                                //����ADC
          ADC_Init();                                   //ADC���³�ʼ��
      }
      else{                                            //���Ŵ�����Ϊ��   
          iNumber++;                                    
          iAddrSpeech =  speech_start_address(iaSpeech_index[iNumber]);//ȡ��һ�β����������׵�ַ
          SACM_A2000_InitDecoder(DAC2);          	                   //��ʼ��A2000�����������Է��Զ���ʽ����

      }
   }
}     	        
