/******************************************************************
  
  project: UN2003 control motor 

  data:	  2009/4/1
    
  Author: WHC

  Company:	HCKJ

  purpose: control motor  

  Comments:	 UN2003  Drive  motor 

*****************************************************************/
#include <reg52.h>
 #define uchar  unsigned char
 #define uint  unsigned int
 //definition  motor  Phase  with   A  B  C   D  (定义步进电机的4个相)
 sbit UN2003_A=P0^0;
 sbit UN2003_B=P0^1;
 sbit UN2003_C=P0^2;
 sbit UN2003_D=P0^3;
 

 #define   forward_speed   15    //control forward  speed (正转速度)
 #define   inversion_speed   15	 //control inversion speed (反转速度)
 #define   forward_Length    200 //select  forward  Length   (选择需要转动的圈数)
#define   inversion_Length	 100 //select  inversion Length	 (选择需要转动的圈数)
uchar forward,inversion;         //   select   Rotation   Way
/******************************************************************
  
  project:control motor Speed

  data:	  2009/4/1
    
  Author: WHC

  Company:	HCKJ

  purpose: control motor Speed function

  Comments:	 UN2003  Drive  motor 

*****************************************************************/
void delay_ms(uchar n)	  
{ 
	unsigned int i,j,k;

	for(i=0;i<n;i++)
	{				
		for(k=0;k<3;k++)
		{  
			for(j=0;j<40;j++);	
		}
	}
}

/******************************************************************
  
  project:control motor inversion function

  data:	  2009/4/1
    
  Author: WHC

  Company:	HCKJ

  purpose: control motor inversion function

  Comments: UN2003  Drive  motor 
  
*****************************************************************/
void UN2003_Inversion()	
{
 	UN2003_A=0;
    UN2003_B=1;
    UN2003_C=0;
    UN2003_D=1;
	delay_ms(inversion_speed);
   	UN2003_A=0;
    UN2003_B=1;
    UN2003_C=1;
    UN2003_D=0;
    delay_ms(inversion_speed);
    UN2003_A=1;
    UN2003_B=0;
    UN2003_C=1;
    UN2003_D=0;
	delay_ms(inversion_speed);
   	UN2003_A=1;
    UN2003_B=0;
    UN2003_C=0;
    UN2003_D=1;
	delay_ms(inversion_speed);
 
 }
 /******************************************************************
  
  project:control motor forward function

  data:	  2009/4/1
    
  Author: WHC

  Company:	HCKJ

  purpose: control motor forward function

  Comments:	 
             UN2003  Drive  motor 
*****************************************************************/
 void UN2003_Forward()  
{
 
 	UN2003_C=0;
    UN2003_D=1;
    UN2003_A=0;
    UN2003_B=1;
	delay_ms( forward_speed);
   	UN2003_C=0;
    UN2003_D=1;
    UN2003_A=1;
    UN2003_B=0;
    delay_ms( forward_speed);
    UN2003_C=1;
    UN2003_D=0;
    UN2003_A=1;
    UN2003_B=0;
	delay_ms( forward_speed);
   	UN2003_C=1;
    UN2003_D=0;
    UN2003_A=0;
    UN2003_B=1;
	delay_ms( forward_speed);
  
  }
   int  i,j;
void main()
{
   P2=0XFF;
  
    while(1)      //do  forever
   {
     switch(P2)    //select mode
      {
        case 0xF7:  forward=1;inversion=0; break;
        case 0xfd:  forward=0;inversion=1; break;
       }
 	
	 if(inversion)
	   {  
	     for(i=0;i<inversion_Length;i++)
		   {
	    
			UN2003_Inversion();

		   }
		  
		 break;  //jump out (跳出循环语句)
		}
	 if(forward)
	   {
	   	 for(j=0;j<forward_Length;j++)
		  {
	   	     UN2003_Forward(); 
		   }	   
	    break; //jump out  (跳出循环语句)
	   }
    }
}
  
 
 

 /****************************************************************************************
 	   UN2003驱动的步进电机必须是可以供电的电机
	    
		 电机的要求是  
		 步进电机有供电端！
		 直流电机一段接正另一端接UN2003的输出端

		 break;  跳出电机选择的if 循环！是电机执行一定的步数 立即停止转动！

  ******************************************************************************************/