#define HaveKey  1
#define NoKey    0
unsigned int  KeyVal;
unsigned int  KeyDownTimes;                                //���水������
unsigned int  KeyFlag;                                     //������ʶ 
//=============================================================================================== 
// ������ main()
// ������������
//============================================================================================
int main()
{	   
    SP_Init_IOA();
//	SP_Init_IOB();                                        //��ʼ��B�ڵ��ֽڵĸ���λ�����ݻ������ĸߵ�ƽΪ�����
    KeyDownTimes = 0;                                     //����λΪ����������������
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