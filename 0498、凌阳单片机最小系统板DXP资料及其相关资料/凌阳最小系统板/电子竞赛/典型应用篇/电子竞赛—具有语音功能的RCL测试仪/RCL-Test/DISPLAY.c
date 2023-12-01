extern 			g_Speechary[];
extern 			g_array[];
extern			g_speechID;

unsigned int 	g_uiAx;
/*******************电阻计算******************************/
void R_display(float Rx)
{   
	if(Rx<100)
	{   
		g_array[3]=5;
		g_array[2]=5;
		g_array[1]=5; 
		g_array[0]=5;
/*******************************/
//电阻小于100欧姆
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
//几百几十欧姆
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//几百欧姆
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
//几点几K欧姆
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
//几十几K欧姆
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
//几百几十K欧姆
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//几百K欧姆		
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
//1M欧姆
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
//电阻大于1M欧姆
		g_speechID=1;
		g_Speechary[0]=21;	
	}
	

}
//*****************电容计算***************************************//
void C_display(float Cx)
{  
	if(Cx<100)
	{
		g_array[3]=5;
		g_array[2]=5;
		g_array[1]=5; 
		g_array[0]=5;
//////////////////////////////////////////电容小于100PF
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
//几百几十PF
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//几百PF
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
//几千几百PF
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=27;
		if(g_array[2]==0)//几千PF
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
////////////////////////////////////////1万PF
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
//电容大于1万PF
		g_speechID=1;
		g_Speechary[0]=23;	
	}	

}
//**************电感计算**********************************//
void L_display(float Lx)
{  
	if(Lx<100)
	{
		g_array[3]=5;
		g_array[2]=5;
		g_array[1]=5; 
		g_array[0]=5;
/*******************************/
//电感小于100uH
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
//几百几十uH
		g_Speechary[0]=g_array[3];
		g_Speechary[1]=12;
		if(g_array[2]==0)//几百uH
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
//几点几mH
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
//电感大于10mH
		g_speechID=1;
		g_Speechary[0]=25;
	}	

}