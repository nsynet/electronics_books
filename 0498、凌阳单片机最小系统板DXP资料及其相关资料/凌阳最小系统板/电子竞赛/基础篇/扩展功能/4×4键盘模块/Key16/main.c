#define HaveKey  1
#define NoKey    0
unsigned int  KeyVal;
unsigned int  KeyDownTimes;                                //保存按键次数
unsigned int  KeyFlag;                                     //按键标识 
//=============================================================================================== 
// 函数： main()
// 描述：主函数
//============================================================================================
int main()
{	   
    SP_Init_IOA();
//	SP_Init_IOB();                                        //初始化B口低字节的高四位带数据缓存器的高电平为输出口
    KeyDownTimes = 0;                                     //低四位为带下拉电阻的输入端
	KeyFlag = NoKey; 
  	while(1)
	  {	
	    F_Key_Scan();
	  	while(KeyFlag == HaveKey)
		{			
		  KeyVal=F_Get_Key();
		  KeyFlag = NoKey;
	    
	  
	     }
	   
    	}
}