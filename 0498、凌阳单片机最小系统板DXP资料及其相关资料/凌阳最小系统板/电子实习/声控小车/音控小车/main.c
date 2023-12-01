#define	P_IOA_Data 				(volatile unsigned int *)0x7000   
#define P_IOA_Buffer 			(volatile unsigned int *)0x7001
#define P_IOA_Dir 				(volatile unsigned int *)0x7002
#define P_IOA_Attrib 			(volatile unsigned int *)0x7003
#define P_IOA_Latch 			(volatile unsigned int *)0x7004
#define P_IOB_Data				(volatile unsigned int *)0x7005  
#define P_IOB_Buffer			(volatile unsigned int *)0x7006   
#define P_IOB_Dir				(volatile unsigned int *)0x7007   
#define P_IOB_Attrib			(volatile unsigned int *)0x7008   

#define P_Watchdog_Clear		(volatile unsigned int *)0x7012   
#define P_SystemClock			(volatile unsigned int *)0x7013  
#include "bsrsd.h"
#include "hardware.h"

#define NAME_ID 		0x100
#define COMMAND_ONE_ID 	0x101
#define COMMAND_TWO_ID 	0x102
#define COMMAND_THREE_ID 	0x103
#define COMMAND_FORE_ID 	0x104
#define COMMAND_FIVE_ID 	0x105
#define COMMAND_SIX_ID 	0x106
#define COMMAND_SEVEN_ID 	0x107
#define RSP_INTR		0
#define RSP_NAME		1
#define RSP_FIRE		2
#define RSP_GUARD		3
#define RSP_AGAIN		4
#define RSP_NOVOICE		5
#define RSP_NAMEDIFF	6
#define RSP_CMDDIFF		7
#define RSP_STAR		8
#define RSP_MASTER		9
#define RSP_HERE		10
#define RSP_GUNSHOT		0
#define RSP_PATROL		11
#define RSP_READY		12
#define RSP_COPY		13
#define RSP_NOISY		14
extern  unsigned int BSR_SDModel[100];
unsigned int commandID;
unsigned int g_Ret;
//..................全程变量....................
int gActivated = 0;	//该变量用于检测是否有触发命令，当有识别出语句
                    //为触发名称则该位置1 
					 
int gTriggerRespond[] = {RSP_MASTER, RSP_HERE, RSP_MASTER};
int gComm2Respond[] = {RSP_PATROL, RSP_READY, RSP_COPY};
extern void ClearWatchDog();
int PlayFlag = 0;
unsigned  int uiSpeed=0;
//unsigned int *ClearWatchdog = 0x7012;
void PlayRespond2(int Result)
{
	BSR_StopRecognizer();
	SACM_A2000_Initial(1);
	SACM_A2000_Play(Result, 3, 3);
	while((SACM_A2000_Status()&0x0001) != 0)
	{
		SACM_A2000_ServiceLoop();
		ClearWatchDog();
	}
	SACM_A2000_Stop();
	BSR_InitRecognizer(BSR_MIC);
	BSR_EnableCPUIndicator();	
}

void PlayRespond(int Result)
{
	BSR_StopRecognizer();
	SACM_S480_Initial(1);
	SACM_S480_Play(Result, 3, 3);
	while((SACM_S480_Status()&0x0001) != 0)
	{
		SACM_S480_ServiceLoop();
		ClearWatchDog();
	}
	SACM_S480_Stop();
	BSR_InitRecognizer(BSR_MIC);
	BSR_EnableCPUIndicator();	
}

int TrainWord(int WordID, int RespondID)
{
	int res;
	PlayRespond(RespondID);
	while(1)
	{
		res = BSR_Train(WordID,BSR_TRAIN_TWICE);
		
		if(res == 0) break;
		switch(res)
		{
		case -1: 									//没有检测出声音
			PlayRespond(5);
			return -1;
		case -2: 									//需要重新训练一遍
			PlayRespond(4);
			break;
		case -3: 									//环境太吵
			PlayRespond(5);
			return -1;		
		case -4: 									//数据库满
		 	return -1;
		case -5: 									//检测出声音不同
			if(WordID == NAME_ID)	PlayRespond(5);//两次输入名称不同
			else					PlayRespond(5);//两次输入命令不同
			return -1;
		case -6: 									//序号错误
			return -1;
		}
	}
	return 0;
}
void F_GoAheadCtr(int n)                     			//前进
{  
	int i,j ;	 
	for(j=0;j<n;j++)
	{
	ClearWatchDog();
	i=i&0x00c0;
	i=i|0x2800;
	*P_IOB_Data=i;
	F_Delay(90);
	i=i&0x00c0;
	i=i|0x0000;
	*P_IOB_Data=i;
	F_Delay(60);
	} 
}
void F_BackUpCtr(int n)                        		//倒退
{
  
	int i,j ;	
	 ClearWatchDog(); 
	for(j=0;j<n;j++)
	{
	i=i&0x00c0;
	i=i|0x1400;
	*P_IOB_Data=i;
	F_Delay(90);
	i=i&0x00c0;
	i=i|0x0000;
	*P_IOB_Data=i;
	F_Delay(60);
	} 
}

void F_TurnLeftCtr(int n)                       		//左转
{
	int i,j ;
	ClearWatchDog();	 
	for(j=0;j<n;j++)
	{
	i=i&0x00c0;
	i=i|0x2400;
	*P_IOB_Data=i;
	F_Delay(90);
	i=i&0x00c0;
	i=i|0x0000;
	*P_IOB_Data=i;
	F_Delay(60);
	} 

}
void F_TurnRightCtr(int n)                            //右转
{
	int i,j ;
	ClearWatchDog();	 
	for(j=0;j<n;j++)
	{
	i=i&0x00c0;
	i=i|0x1800;
	*P_IOB_Data=i;
	F_Delay(90);
	i=i&0x00c0;
	i=i|0x0000;
	*P_IOB_Data=i;
	F_Delay(60);
	} 
}

void F_StopCtr()                            //停止
{
	int i,j ;	 
    ClearWatchDog();
	i=i&0x00c0;
	i=i|0x0000;

}

void F_ShunCtr()                             //壁障 
{
      int i;
  
	    	i=*P_IOB_Data;
   		    i=i&0x00c0;
  
				switch(i)
				{
				case 0x00c0:
				    
				    F_GoAheadCtr(50);
				   
					break;
				case 0x0000:
					
				  
				    F_BackUpCtr(500);
				    F_TurnRightCtr(200); 
				 
					break;
				case 0x0040:
				 
				
					F_TurnLeftCtr(200); 
					F_BackUpCtr(100);
					F_TurnLeftCtr(200); 
					F_BackUpCtr(100);
					F_TurnLeftCtr(200); 
					F_BackUpCtr(100);
					F_TurnLeftCtr(200); 
					F_BackUpCtr(100);
				    
				    break;
				case 0x0080:
				
				F_TurnRightCtr(200);
				F_BackUpCtr(100); 
				F_TurnRightCtr(200);
				F_BackUpCtr(100);  
				F_TurnRightCtr(200);
				F_BackUpCtr(100); 
				F_TurnRightCtr(200);
				F_BackUpCtr(100); 
				
				    break; 
			   }			
}
int main()
{
	int res,jk,k, timeCnt=0, random_no=0,iMoveFlag=0xffff,BS_Flag=0,iMoveFlagBS=0,iCarState=0,iCarSpeed=14;
	
	int uiIOB,i,ulAddr,Ret,free,*p;
//	unsigned int *p;
 	p=0xef00;
	BS_Flag=*p;
 	ClearWatchDog(); 
	SP_Init_IOB(0xff00,0x0000,0xff00); 
	SP_Init_IOA(0x0000,0x0000,0x0000);


    BSR_DeleteSDGroup(0);							// 初始化存储器RAM
if(BS_Flag==0xffff)
{
	PlayRespond(0);				    		//播放开始训练的提示音
	//..........训练名称..............................
	while(TrainWord(NAME_ID,0) != 0) ;
	//..........训练第一条命令.......................
	while(TrainWord(COMMAND_ONE_ID,1) != 0) ;
	//..........训练第二条命令.......................
	while(TrainWord(COMMAND_TWO_ID,2) != 0) ;
	//..........训练第三条命令.......................
	while(TrainWord(COMMAND_THREE_ID,3) != 0) ;
	//..........训练第四条命令.......................
	while(TrainWord(COMMAND_FORE_ID,4) != 0) ;
	BS_Flag=0xaaaa;
	F_FlashWrite1Word(0xef00,0xaaaa);
    F_FlashErase(0xe000);
    F_FlashErase(0xe100);
    F_FlashErase(0xe200);
    
	ulAddr=0xe000;//********
	for(commandID=0x100;commandID<0x105;commandID++)
	{
		g_Ret=BSR_ExportSDWord(commandID);
		while(g_Ret!=0)
		g_Ret=BSR_ExportSDWord(commandID);//		
		for(i=0;i<100;i++)
		{
		    F_FlashWrite1Word(ulAddr,BSR_SDModel[i]);
	
			ulAddr+=1;												
		}
		}	//***********************
}
if(BS_Flag==0xaaaa)	
{
BSR_DeleteSDGroup(0);
	p=0xe000;																					
	for(jk=0;jk<5;jk++)
	{
		for(k=0;k<100;k++)
		{
			Ret=*p;							
			BSR_SDModel[k]=Ret;				
			p+=1;													
		}					
		g_Ret=BSR_ImportSDWord();
		while(g_Ret!=0)
		g_Ret=BSR_ImportSDWord();							
	}
}
	//..........开始识别命令.........................
	BSR_InitRecognizer(BSR_MIC);		    		//辨识器初始化
	//BSR_EnableCPUIndicator();

	PlayRespond(0);			    			// 播放开始辨识的提示音
	PlayRespond(0);
	//Interrupt();
	iMoveFlag=0;
	while(1)
	{
	  
	
//	    ClearWatchdog = 0x0001; 
	   
        random_no ++;
		if(random_no >= 3) random_no = 0;
		res = BSR_GetResult();
		
		if(res > 0)							//识别出命令
		{
			  
			if(gActivated)
			{
				timeCnt = 0;
				switch(res)
				{
				case NAME_ID:
   					PlayFlag = 0;
				
					ClearWatchDog();
			
					F_StopCtr();
					iMoveFlag=1;
					iMoveFlagBS=0;
			
					break;
				case COMMAND_ONE_ID:
				    PlayRespond(1);
				    ClearWatchDog();
				    F_GoAheadCtr(600);
				    iMoveFlag=0;
				    iMoveFlagBS=0;
				   
					gActivated = 0;
					F_StopCtr();
					iCarState=0x2800;
					break;
				case COMMAND_TWO_ID:
					PlayRespond(2);
				ClearWatchDog();
				    F_BackUpCtr(650);
				
					PlayFlag = 0;
				    iMoveFlag=0;
				    iCarState=0x1400;
				iMoveFlagBS=0;
					ClearWatchDog();
					gActivated = 0;
					F_StopCtr();
					break;
				case COMMAND_THREE_ID:
				 PlayRespond(3);
				
				F_TurnLeftCtr(450); 
					F_GoAheadCtr(100);
						F_TurnLeftCtr(350); 
					F_GoAheadCtr(100);
					F_TurnLeftCtr(350); 
					F_GoAheadCtr(100);
					F_TurnLeftCtr(350); 
					F_GoAheadCtr(100);
					iMoveFlag=0;
					iMoveFlagBS=0;
				
				    iCarState=0;
					
					ClearWatchDog();
				    gActivated = 0;
				F_StopCtr();
				    break;
				case COMMAND_FORE_ID:
				PlayRespond(4);
				
				F_TurnRightCtr(450);
				F_GoAheadCtr(100); 
				F_TurnRightCtr(350);
				F_GoAheadCtr(100);  
				F_TurnRightCtr(350);
				F_GoAheadCtr(100); 
				F_TurnRightCtr(350);
				F_GoAheadCtr(100); 
				iMoveFlag=0; 
				iMoveFlagBS=0;
				iCarState=0;
		
				    
					
				ClearWatchDog();
				    gActivated = 0;
				F_StopCtr();
				
				    break; 
			   }				
			}
			else
			{
			//	gActivated = 1;
				if(res == NAME_ID)
				{
					ClearWatchDog(); 
					PlayRespond(0);
					iMoveFlag=1;
					iMoveFlagBS=0;
					gActivated = 1;
					timeCnt = 0;
				}
		
			}	
		}
		else if (gActivated)
		{
		
			if (++timeCnt > 450)			//超出定时
			{
				ClearWatchDog(); 
								
				gActivated = 0;
				timeCnt = 0;
			}
		}
		
		if(iMoveFlagBS==13&&iMoveFlag==0) 
	   	{
	   	i=*P_IOB_Data;//**
   		i=i&0x00c0;//**
   		ClearWatchDog();
   		if(i==0x0080||i==0x0040||i==0x0000) free=0;//F_ShunCtr();//free=0; // //F_ShunCtr();//**
	   	else
	   	{
	   		i=i&0x00c0;
			i=i|iCarState;
			//*P_IOB_Data=i;
			ClearWatchDog();
			}
			
		}
		if(iMoveFlagBS==iCarSpeed&&iMoveFlag==0)
		{
			i=i&0x00c0;
			i=i|0x0000;
			*P_IOB_Data=i;
			iMoveFlagBS=0;
	    	ClearWatchDog();

		}
			iMoveFlagBS++;
			i=*P_IOA_Data;//**
   		    i=i&0x0007;//**
   		    if(i==0x0003)  iCarSpeed++;
   		    i=i&0x0004;
   		    if(i==0x0004)  F_FlashErase(0xef00); 
	}
	
}

