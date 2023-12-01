
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
#define RSP_AGAIN		4
#define RSP_NOVOICE		5
#define RSP_STAR		8
#define RSP_MASTER		9
#define RSP_HERE		10
#define RSP_GUNSHOT		0
#define RSP_PATROL		11
#define RSP_READY		12
#define RSP_COPY		13
#define RSP_NOISY		14

//..................全程变量....................
int gActivated = 0;	//该变量用于检测是否有触发命令，当有识别出语句
                    //为触发名称则该位置1 
					 
int gTriggerRespond[] = {RSP_MASTER, RSP_HERE, RSP_MASTER};
int gComm2Respond[] = {RSP_PATROL, RSP_READY, RSP_COPY};
extern void ClearWatchDog();
int PlayFlag = 0;
unsigned uiSpeed=0;

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
		//res = BSR_Train(WordID,1);
		if(res == 0) break;
		switch(res)
		{
		case -1: 									//没有检测出声音
			PlayRespond(RSP_NOVOICE);
			return -1;
		case -2: 									//需要重新训练一遍
			PlayRespond(RSP_AGAIN);
			break;
		case -3: 									//环境太吵
			PlayRespond(RSP_NOISY);
			return -1;		
		case -4: 									//数据库满
		 	return -1;
		case -5: 									//检测出声音不同
			if(WordID == NAME_ID)	PlayRespond(RSP_NOVOICE);
			else					PlayRespond(RSP_NOVOICE);
			return -1;
		case -6: 									//序号错误
			return -1;
		}
	}
	return 0;
}

int main()
{
	int res, timeCnt=0, random_no=0,iMoveFlag=0xffff,aFlag=0;
	unsigned int * ClearWatchdog = 0x7012;
	unsigned int uiIOB,i;
	unsigned int *p;
	p=0x7005;
    F_Speed();
	* ClearWatchdog = 0x0001; 
	SP_Init_IOB(0xff00,0xff00,0x00ff); 		    //设置A口为输出口
    


    BSR_DeleteSDGroup(0);							// 初始化存储器RAM

	PlayRespond(RSP_INTR);				    		//播放开始训练的提示音
	//..........训练名称..............................
	while(TrainWord(NAME_ID,1) != 0) ;
	//..........训练第一条命令.......................
	while(TrainWord(COMMAND_ONE_ID,2) != 0) ;
	//..........训练第二条命令.......................
	while(TrainWord(COMMAND_TWO_ID,3) != 0) ;
	//..........训练第三条命令.......................
	while(TrainWord(COMMAND_THREE_ID,3) != 0) ;
	//..........训练第四条命令.......................
	while(TrainWord(COMMAND_FORE_ID,3) != 0) ;
	
	//..........开始识别命令.........................
	BSR_InitRecognizer(BSR_MIC);		    		//辨识器初始化
	//BSR_EnableCPUIndicator();

	PlayRespond(RSP_STAR);			    			// 播放开始辨识的提示音
	
	while(1)
	{
	

	    SP_Init_IOB(0xff00,0xff00,0x00ff); 
		SP_Export(Port_IOB_Data,iMoveFlag);	
	    * ClearWatchdog = 0x0001; 

       
        uiIOB=*p;
        uiIOB=uiIOB&0x00f0;
        if(uiIOB==0x00e0||uiIOB==0x00b0||uiIOB==0x00d0||uiIOB==0x00f0)
		{
		switch(uiIOB)
		 {
		    case 0x00e0:
		  SP_Export(Port_IOB_Data,0xdaff);  //左拐  
  
          * ClearWatchdog = 0x0001; 
          iMoveFlag=0xdaff;
          break;
          //******************************************//
		  case 0x00b0:
		    SP_Export(Port_IOB_Data,0xfdff);  //慢速倒退   
		  	for(i=0; i<4; i++)
	     {
			F_Delay();
	      * ClearWatchdog = 0x0001;
         }	
		iMoveFlag=0xfdff;		         
		 SP_Init_IOB(0xff00,0xff00,0x00ff);
          SP_Export(Port_IOB_Data,0xeaff);  //右拐
          
          for(i=0; i<5; i++)
	     {
		    F_Delay();
	      * ClearWatchdog = 0x0001;
         }	
		 iMoveFlag=0xeaff;
          break;
          
          //******************************************//
		  case 0x00d0:
	      SP_Export(Port_IOB_Data,0xeaff);  //右拐
          * ClearWatchdog = 0x0001;
          iMoveFlag=0xeaff;
		  break;
		  
		  //******************************************//
		  case 0x00f0:
		   SP_Export(Port_IOB_Data,0xfeff);  
		  * ClearWatchdog = 0x0001;	      
          break; 
		}
        }
		else
     
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
				    SP_Init_IOB(0xff00,0xff00,0x00ff);
				    SP_Export(Port_IOB_Data,0xffff);
		for(i=0; i<3; i++)
	     {
			F_Delay();
	      * ClearWatchdog = 0x0001;
         }	
				    PlayFlag = 1;
					PlayRespond2(RSP_GUNSHOT);
					PlayFlag = 0;
					* ClearWatchdog = 0x0001;
				//	PlayRespond(gTriggerRespond[random_no]);
					
				    iMoveFlag=0xffff;					
					break;
				case COMMAND_ONE_ID:
				    SP_Init_IOB(0xff00,0xff00,0x00ff);
				 SP_Export(Port_IOB_Data,0xfeff);  //慢速前进 
		for(i=0; i<3; i++)
	     {
			F_Delay();
	      * ClearWatchdog = 0x0001;
         }	  
					PlayFlag = 1;
					PlayRespond2(RSP_GUNSHOT);
					
					PlayFlag = 0;
					* ClearWatchdog = 0x0001;
					iMoveFlag=0xfeFF;
					gActivated = 0;
					break;
				case COMMAND_TWO_ID:
					SP_Init_IOB(0xff00,0xff00,0x00ff);
				   SP_Export(Port_IOB_Data,0xdaff);  //左拐 
		for(i=0; i<3; i++)
	     {
			F_Delay();
	      * ClearWatchdog = 0x0001;
         }	
				    PlayFlag = 1;
					PlayRespond2(RSP_GUNSHOT);
					PlayFlag = 0;
				//	PlayRespond(gComm2Respond[random_no]);
					* ClearWatchdog = 0x0001;
					
					
					iMoveFlag=0xdaFF;
					gActivated = 0;
					break;
				case COMMAND_THREE_ID:
				    SP_Init_IOB(0xff00,0xff00,0x00ff);
				  SP_Export(Port_IOB_Data,0xeaff);  //右拐
		for(i=0; i<3; i++)
	     {
			F_Delay();
	      * ClearWatchdog = 0x0001;
         }	
				    PlayFlag = 1;
					PlayRespond2(RSP_GUNSHOT);
					PlayFlag = 0;
					* ClearWatchdog = 0x0001;
				    
				    iMoveFlag=0xeaFF;
				    gActivated = 0;
				    break;
				case COMMAND_FORE_ID:
				    SP_Init_IOB(0xff00,0xff00,0x00ff);
				   SP_Export(Port_IOB_Data,0xfdff);  //慢速倒退  
				   aFlag=aFlag+1;
		for(i=0; i<3; i++)
	     {
			F_Delay();
	      * ClearWatchdog = 0x0001;
         }	
				    PlayFlag = 1;
					PlayRespond2(RSP_GUNSHOT);
					PlayFlag = 0;
					* ClearWatchdog = 0x0001;
					
				    iMoveFlag=0xfdFF;
				    gActivated = 0;
				    break; 
			   }				
			}
			else
			{
				if(res == NAME_ID)
				{
					* ClearWatchdog = 0x0001; 
					PlayRespond(gTriggerRespond[random_no]);
					gActivated = 1;
					timeCnt = 0;
				}
			}	
		}
		else if (gActivated)
		{
			if (++timeCnt > 450)			//超出定时
			{
				* ClearWatchdog = 0x0001; 
				PlayRespond(RSP_NOVOICE); 	//在设定时间内没有检测出声音					
				gActivated = 0;
				timeCnt = 0;
			}
		}
	}
}

int ShowAndVoic()
{ 
	int i,t,time,carlong,tm0,tm1,tm2,tm3,second,distance,dst0,dst1,dst2,dst3,dst4,dst5;
   	time=car_time();
	carlong=car_long();
	carlong=carlong*15;
    tm0=time%10;
    t=time/10;
    tm1=t%10;
	t=time/100;
	tm2=t%10;
	t=time/1000;
	tm3=t%10;
	dst0=carlong%10;
	t=carlong/10;
	dst1=t%10;
	t=carlong/100;
	dst2=t%10;
	t=carlong/1000;
	dst3=t%10;
	t=carlong/10000;
	dst4=t%10;
	t=carlong/100000;
	dst5=t%10;

loop:
t=0;
	do
	{ t=t+1; 
	singleled(0,tm0);
		 
	for(i=1;i<=0x50;i++)
       delay(); 
       
	    singleled(1,tm1);
	   for(i=1;i<=50;i++)
      delay();
     singleled(2,tm2);
     for(i=1;i<=50;i++)
       delay();
      
    
    
}
while(t<2000);

       
       t=0;
	do
	{ t=t+1; 
	singleled(0,dst0);
		 
	for(i=1;i<=0x50;i++)
       delay(); 
       
	    singleled(1,dst1);
	   for(i=1;i<=50;i++)
      delay();
     singleled(2,dst2);
     for(i=1;i<=50;i++)
       delay();
      
    
     singleled(3,dst3);
		 
	for(i=1;i<=0x50;i++)
       delay(); 
}
while(t<2000);
            
  //////////////////////////////////////////////////////////
  
    PlayRespond(12); 

       delay();
     PlayRespond(tm2);
     
       delay();
	PlayRespond(tm1);
	
       delay();
	PlayRespond(tm0);
	
       delay();
	 PlayRespond(11);
	  delay();
	  delay();
	   delay();
	    delay();
	     delay();
	      delay();
	       delay();
       delay();
	PlayRespond(dst3);
	
       delay();
	PlayRespond(dst2); 

       delay();
	PlayRespond(dst1);
	
       delay();
	PlayRespond(dst0);
	
       delay();
	PlayRespond(13); 
	
       delay();
	////////////////////////////////////////////////////
}