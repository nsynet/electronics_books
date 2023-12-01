
//*****************************************************//
//R/C/L测试:每次等测试稳定后语音播报1次，之后不再播报，
//可以通过数码管显示观察测量结果。
//*****************************************************//

#include "s480.h"
#define  	P_IOA_Data			(volatile int*)0x7000
#define	 	P_TimerB_Data      	(volatile int*)0x700c
#define		P_TimerB_Ctrl       (volatile int*)0x700D
#define	 	R_Test				1
#define		C_Test				2
#define		L_Test				3



float g_fRx=0.0;
float g_fCx=0.0;
float g_fLx=0.0;

unsigned char 	g_ucIntFlag=0;     
unsigned int 	g_uiStatus;
unsigned int  	g_uiKey=0;     	
unsigned int	g_uifx=0;	
unsigned int  	g_uisum=0;         
unsigned int	j=0,i=0;
unsigned int  	g_uidisplay;
unsigned int	Lxsum=0;
unsigned char 	LxFlag=0;
unsigned int	g_speechID=0;
unsigned int	g_speachIndex=0;
unsigned int	g_Speechary[6]={0};
unsigned int 	g_array[4]={0};


unsigned int 	voicflag=0;
//=========== 播放提示语音 ========================//
//input:voice index
//=================================================//
void PlayTestValue()      //播放语音
{  
   SACM_S480_Initial(1);
   while(g_speachIndex<g_speechID)
	{
	   SACM_S480_Play(g_Speechary[g_speachIndex],3,3);
	   while(SACM_S480_Status()&0x0001)
	    SACM_S480_ServiceLoop();
	    g_speachIndex++;
	}
	SACM_S480_Stop();
	voicflag=1;
}

//*************************************************//
main()
{   
	g_uidisplay=0;
	System_Initial();                                                                                                                                                                                                                                 
	while(1)
	{  
	   g_uiKey=SP_GetCh();	 
	   //g_uiKey=1;  
		  switch(g_uiKey)
		  	{ 
			   case 0x0001:			   			
						g_uiStatus = R_Test;
						RunTime2Hz();//开中断
					   	TmbCount();					   
					   	Rline_on();														  
					   	break;
			   case 0x0002:				   				   			
			   			g_uiStatus = C_Test;
			   			RunTime2Hz();//开中断
						TmbCount();
					    Cline_on();
					   					    
						break;
			   case 0x0004:			   			
			   			g_uiStatus = L_Test;
						SP_INT_32Hz();
						TmbCount();   
						Lline_on();
												
			   			break;
			   default:
						break;		     
			
		
			}

		 
//************************状态判断处理*********************//
	
	  	switch(g_uiStatus)
		{	
			case R_Test:
//**********************R********************************//
			if(voicflag) 			
			   RunTime2Hz();						
			 while(g_ucIntFlag)
			{		
				g_uifx=*(P_TimerB_Data);										
				g_ucIntFlag = 0;				
				*(P_TimerB_Data)=0;									    				    
				if(g_uifx&&g_uifx<7500)									
			 		g_fRx=(3*2.7575*(1e+6))/g_uifx-100;  //计算
				else
				{	
					R_Above1K();
					g_fRx =(3*69.3225*(1e+6))/g_uifx-(1e+4);
				}								   
					R_display(g_fRx);
				
			}
				break;
				
			case C_Test:
//************************C*******************//
	    	 while(g_ucIntFlag)
			{	
				if(voicflag) 			
			   	RunTime2Hz();	
				g_uifx=*(P_TimerB_Data);										
				g_ucIntFlag = 0;
				*(P_TimerB_Data)=0;									
				    				    
				if(g_uifx)									
			 	{
					g_fCx=(3*4.81*(1e+6))/g_uifx;  //计算				   
			/*		if(g_fCx<1000)
					{	
						C_Below1K();						
						g_fCx =(3*0.94*(1e+6))/g_uifx;
					 
					}  */ 					   
					//PlayVoice(g_fRx);
					C_display(g_fCx);
				}
			}				
				break;
						
			case L_Test:
//************************L*******************//
			 while(LxFlag)
			{		
				if(voicflag) 			
			   	RunTime2Hz();
				g_uifx=*(P_TimerB_Data);										
				LxFlag = 0;							
			//	*(P_IOA_Data)|=0x0008;
			//	Lline_on();
				*(P_TimerB_Data)=0;												    				    
				if(g_uifx)									
			 	{
					g_fLx=(4*38*(1e+6))/(g_uifx*g_uifx); //计算   
					   					   
					//PlayVoice(g_fRx);
					L_display(g_fLx);
					
				}
			}
				
				break;
			default:
				break;	
		}		   	
		 	System_ServiceLoop();//键盘扫描	
	
			F_Show(g_uidisplay,g_array[g_uidisplay]); 
			if(++g_uidisplay>3)
			g_uidisplay=0;
			j++;		
			if((j>0xfff0)&&(voicflag<1))
		{	
		//	OffTime2Hz();
			PlayTestValue();
			g_speachIndex=0;
			j=0;		
		}
	}
} 