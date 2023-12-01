volatile unsigned int *P_IOA_Data=(unsigned int*)(0x7000); 	
volatile unsigned int *P_IOA_Dir=(unsigned int*)(0x7002);
volatile unsigned int *P_P_IOA_Attrib=(unsigned int*)(0x7003);

unsigned int old,new,push,rel,temp,row;
void key(void)
{
	for(row=0x10;row<0x100;row=row<<1)
	{
		*P_IOA_Data=*P_IOA_Data&row;
		new=(new<<4)| *P_IOA_Data&0x0f;
	}
	if((temp=new^old)>0)
	{
		push=temp&new;
		rel=temp&old;
		old=new;
	}
}

///////////////////////////////////////

main()
{
	*P_IOA_Dir=0x00f0;
	*P_P_IOA_Attrib=0;
	*P_IOA_Data=0x000f;
	key();
}	
	
		

	 
