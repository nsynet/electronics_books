extern 			g_Speechary[];
extern 			g_array[];
extern			g_speechID;

unsigned int 	g_uiAx;
/*******************�������******************************/
void R_display(float Rx)
{   
	if(Rx<100)
	{   
		g_array[3]=5;
		g_array[2]=5;
		g_array[1]=5; 
		g_array[0]=5;
/*******************************/
//����С��100ŷķ
		g_speechID=1;
		g_Speechary[0]=20;
	}
	if((Rx>=100)&&(Rx<=999))	
	{	
		g_uiAx=(unsigned int)Rx;
		g_array[3]=g_uiAx/100;
		g_array[2]=g_uiAx%100/10;
		g_array[1]=(g_uiAx%100)%10; 
		g_array[0]=0;
/********************************/
//���ټ�ʮŷķ
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//����ŷķ
		{	g_speechID=3;
			g_Speechary[2]=16;
		}
		g_Speechary[2]=g_array[2];
		g_Speechary[3]=11;
		g_Speechary[4]=16;		
		g_speechID=5;
				
	}
	if((Rx>=1000)&&(Rx<=9999))
	
	{	
		g_uiAx=(unsigned int)Rx;
		g_array[3]=g_uiAx/1000;
		g_array[2]=(g_uiAx%1000)/100;
		g_array[1]=((g_uiAx%1000)%100)/10; 
		g_array[0]=1;
/********************************/
//���㼸Kŷķ
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=10;
		g_Speechary[2]=g_array[2];
		g_Speechary[3]=13;
		g_Speechary[4]=16;
		g_speechID=5;
		
	}
	if((Rx>=10000)&&(Rx<=99999))
	{   Rx/=100;
		g_uiAx=(unsigned int)Rx;
		g_array[3]=g_uiAx/100;
		g_array[2]=(g_uiAx%100)/10;
		g_array[1]=(g_uiAx%100)%10; 
		g_array[0]=2;
/********************************/
//��ʮ��Kŷķ
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=11;
		g_Speechary[2]=g_array[2];
		g_Speechary[3]=13;
		g_Speechary[4]=16;
		g_speechID=5;

	}
	if((Rx>=100000)&&(Rx<=999999))
	{   Rx/=1000;
		g_uiAx=(unsigned int)Rx;
		g_array[3]=g_uiAx/100;
		g_array[2]=(g_uiAx%100)/10;
		g_array[1]=(g_uiAx%100)%10; 
		g_array[0]=3;
/********************************/
//���ټ�ʮKŷķ
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//����Kŷķ		
		{	g_Speechary[2]=13;
			g_Speechary[3]=16;
			g_speechID=4;
		}
		else
		{
			g_Speechary[2]=g_array[2];
			g_Speechary[3]=11;
			g_Speechary[4]=13;
			g_Speechary[5]=16;
			g_speechID=6;
		}	
		
	}
	if(Rx==1000000)
	{
		g_array[3]=1;
		g_array[2]=0;
		g_array[1]=0; 
		g_array[0]=4;
/********************************/
//1Mŷķ
		g_Speechary[0]=1;
		g_Speechary[1]=15;
		g_Speechary[2]=16;		
		g_speechID=3;
	}
	if(Rx>1000000)
	{
		g_array[3]=0;
		g_array[2]=0;
		g_array[1]=0; 
		g_array[0]=0;
/*******************************/
//�������1Mŷķ
		g_speechID=1;
		g_Speechary[0]=21;	
	}
	

}
//*****************���ݼ���***************************************//
void C_display(float Cx)
{  
	if(Cx<100)
	{
		g_array[3]=5;
		g_array[2]=5;
		g_array[1]=5; 
		g_array[0]=5;
//////////////////////////////////////////����С��100PF
		g_speechID=1;
		g_Speechary[0]=22;
	}
	if((Cx>=100)&&(Cx<=999))	
	{	
		g_uiAx=(unsigned int)Cx;
		g_array[3]=g_uiAx/100;
		g_array[2]=g_uiAx%100/10;
		g_array[1]=(g_uiAx%100)%10; 
		g_array[0]=0;
/********************************/
//���ټ�ʮPF
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//����PF
		{	g_speechID=3;
			g_Speechary[2]=17;
		}
		g_Speechary[2]=g_array[2];
		g_Speechary[3]=11;
		g_Speechary[4]=17;		
		g_speechID=5;
	}
	if((Cx>=1000)&&(Cx<=9999))
	
	{	
		g_uiAx=(unsigned int)Cx;
		g_array[3]=g_uiAx/1000;
		g_array[2]=(g_uiAx%1000)/100;
		g_array[1]=((g_uiAx%1000)%100)/10; 
		g_array[0]=1;
/********************************/
//��ǧ����PF
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=27;
		if(g_array[2]==0)//��ǧPF
		{	g_speechID=3;
			g_Speechary[2]=17;
		}
		else
		{
			g_Speechary[2]=g_array[2];
			g_Speechary[3]=12;
			g_Speechary[4]=17;
			g_speechID=5;
		}
	}
		
	if(Cx==10000)
	{
		g_array[3]=1;
		g_array[2]=0;
		g_array[1]=0; 
		g_array[0]=2;
////////////////////////////////////////1��PF
		g_Speechary[0]=1;
		g_Speechary[1]=14;
		g_Speechary[2]=16;
		g_speechID=3;
	}
	if(Cx>10000)
	
	{
		g_array[3]=0;
		g_array[2]=0;
		g_array[1]=0; 
		g_array[0]=0;
/*******************************/
//���ݴ���1��PF
		g_speechID=1;
		g_Speechary[0]=23;	
	}	

}
//**************��м���**********************************//
void L_display(float Lx)
{  
	if(Lx<100)
	{
		g_array[3]=5;
		g_array[2]=5;
		g_array[1]=5; 
		g_array[0]=5;
/*******************************/
//���С��100uH
		g_speechID=1;
		g_Speechary[0]=24;
	}
	if((Lx>=100)&&(Lx<=999))	
	{	
		g_uiAx=(unsigned int)Lx;
		g_array[3]=g_uiAx/100;
		g_array[2]=g_uiAx%100/10;
		g_array[1]=(g_uiAx%100)%10; 
		g_array[0]=0;
/********************************/
//���ټ�ʮuH
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//����uH
		{	g_speechID=3;
			g_Speechary[2]=18;
		}
		else
		{
			g_Speechary[2]=g_array[2];
			g_Speechary[3]=11;
			g_Speechary[4]=18;		
			g_speechID=5;
		}
	}
	if((Lx>=1000)&&(Lx<=9999))
	
	{	
		g_uiAx=(unsigned int)Lx;
		g_array[3]=g_uiAx/1000;
		g_array[2]=(g_uiAx%1000)/100;
		g_array[1]=((g_uiAx%1000)%100)/10; 
		g_array[0]=1;
/********************************/
//���㼸mH
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=10;
		g_Speechary[2]=g_array[2];
		g_Speechary[3]=19;		
		g_speechID=4;
	}
		
	if(Lx==10000)
	{
		g_array[3]=1;
		g_array[2]=0;
		g_array[1]=0; 
		g_array[0]=2;
/*******************************/
//10mH
		g_Speechary[0]=11;
		g_Speechary[1]=19;
		g_speechID=2;
	}
	if(Lx>10000)
	
	{
		g_array[3]=0;
		g_array[2]=0;
		g_array[1]=0; 
		g_array[0]=0;
/*******************************/
//��д���10mH
		g_speechID=1;
		g_Speechary[0]=25;
	}	

}