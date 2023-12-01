/*============================================================
ʹ��1602Һ����ʾDS1302+c51ʱ�� 
[ע:AT89C51ʹ��12M����]
=============================================================*/

#include <AT89x51.h>
#include <string.h>
#include < intrins.h >
#define delayNOP() ; {_nop_() ;_nop_() ;_nop_() ;_nop_() ;} ;
#define LCM_RW P3_1 //��������
#define LCM_RS P3_0
#define LCM_E P3_2
#define LCM_Data P0
#define Busy 0x80          //���ڼ��LCM״̬���е�Busy��ʶ
#define uchar unsigned char

sbit T_CLK=P2^4;
sbit T_IO =P2^5;
sbit T_RST=P2^6;
sbit ACC0=ACC^0;
sbit ACC7=ACC^7;
sbit LED=P2^0;			 //�������� (��ʵ����޴˹��� ���Դ������Ч)
sbit system=P1^1;		 //ģʽ
sbit TimerUp=P1^2;		 //ʱ���
sbit TimerDown=P1^0;     //ʱ���
sbit Speaker=P2^1;       //������


void   Set(uchar,uchar);      //����ѡ�������Ӧ��Ŀ
void   RTInputByte(uchar);    //���� 1Byte */
uchar  RTOutputByte(void);    //��� 1Byte */
void   W1302(uchar, uchar);   //��DS1302д��һ���ֽ�
uchar  R1302(uchar);          //��DS1302����һ���ֽ�
void   Set1302(uchar * );     //����ʱ�� 
void   KeySound();			  //������
void   ClockSound();		  //���������


uchar id,msec,model,LedTime,d;
bit a,b;                	  //��˸��־λ

                        
uchar inittime[7]={0x00,0x10,0x19,0x29,0x03,0x04,0x06};	//��ʼ��������Ϊ��06��3��29������3 19��10��0��
void  Out_LCM(void);     //��ʾ��Ļ
void  model0(void);						   //��ʾ���
void  model1(void);
void  model2(void);
void  model3(void);
void  model4(void);
void  model5(void);
void  model6(void);

 
void  id_case1_key();	//��Ŀ����
void  Modset();          //ģʽ������

void  WriteDataLCM(uchar WDLCM);
void  WriteCommandLCM(uchar WCLCM,BuysC);
uchar ReadStatusLCM(void);
void  LCMInit(void);
void  OutputInformation(uchar X, uchar Y, uchar DData);
void  DisplayListChar(uchar X, uchar Y, uchar code *DData);

void  Delay5Ms(void);
void  Delay400Ms(void);
void  systemsetup(void);                 //����ϵͳ����

uchar code systemp[]={"System.setup"};  //�ַ������(ϵͳ�趨)
uchar code TIMER[]={"Time"};            //�ַ������(ʱ��)
uchar code DATE[]={"Date"};	            //�ַ������(����)
uchar code alarmclock[]={"Clock"};      //�ַ�����������壩
uchar code lamp[]={"Lamp"};			    //�ַ������������ƣ�
uchar code reset[]={"Reset"};		    //�ַ��������ʱ����㣩
uchar code exit[]={"Exit"};             //�ַ���������˳���
uchar code set[]={"Set"};				//�ַ�����������ã�
uchar code sec[]={"sec"};               //�ַ���������룩
uchar code ClockSet[]={"ClockSet"};		//�ַ���������������ã�
uchar code ClockOn[]={"ON"};		    //�ַ��������ON��
uchar code ClockOff[]={"OFF"};		    //�ַ��������OFF��

void  timesetup(void);                   //ʱ������
void  datesetup(void);                   //��������
void  alarmclockset(void);               //��������
void  lampsetup(void);                   //���������									   
void  timereset(void);                   //ʱ������


/*******************************************************************/
void delay1(int ms)
{
 unsigned char y ;
  while(ms--)
 {
  for(y = 0 ; y<250 ; y++)
  {
   _nop_() ;
   _nop_() ;
   _nop_() ;
   _nop_() ;
  }
 }
}

void main(void)
{
  Speaker=1;    //�رշ�����
  LED=0;        //��LED ,�͵�ƽ��Ч�����9012����
  Delay400Ms(); //�����ȴ�����LCM���빤��״̬
  Delay400Ms();
  LCMInit();    //LCM��ʼ��
  TMOD=0x01;	//16λ��ʱ
  TH0=0x3c;		//50ms
  TL0=0xb0;
  EA=1;
  TR0=1;
  ET0=1;  
   
  while(1)
  {
     if(TimerDown==0)         //���Ƽ����º�ѱ���ƴ�
      {Delay5Ms();
      if(TimerDown==0)
	   {KeySound();			  //������
		LED=0;				  //�򿪱����
	    LedTime=R1302(0xc1)/16*10+R1302(0xc1)%16;} //ȡ�������ʱ�䲢ת��Ϊʮ������         
       }
	 b=1;		         	  //ģʽ���Ƿ�����־��Ϊ1ʱ��������Ϊ0ʱ������
	 Modset();		          //����ģʽ����������жϰ����Ƿ��¡�
	 if(b==0)
	  {
	   KeySound();			  //������
	   LED=0;                 //�򿪱����
	   systemsetup();         //����ϵͳ����ģʽ
	   LedTime=R1302(0xc1)/16*10+R1302(0xc1)%16; //ȡ�������ʱ�䲢ת��Ϊʮ������
	   }
	 if((LED==0)&&LedTime==0)  //��ʱ���Ƿ�
	    LED=1;            	   //�رձ����	
	 if(R1302(0xc3)==1)        //�����Ƿ�򿪣�0xc3Ϊ������Ĵ�����ַ��
	   {if((R1302(0x85)==R1302(0xc5))&&(R1302(0x83)==R1302(0xc7))) //�ж�����ʱ���Ƿ񵽣�
		  ClockSound();		   //����������������ް�����������һ���ӡ�
	   	}	   
	 model0();                //�����ʾ��Ļ
	}					    
}

void KeySound()			        //������
{
 Speaker=0;					    //��������
 Delay5Ms();
 Speaker=1;					    //�ط�����
 }
void ClockSound()		        //���������
{
 if(a==0)
  {
   Speaker=0;					//��������
   Delay5Ms();
   Delay5Ms();
   Delay5Ms();
   Speaker=1;				    //�ط�����
  }
}

void Modset()                   //ģʽ������
{ if(system==0)               
   {
    Delay5Ms();
    if(system==0)
	 {while(system==0);
	   KeySound();			  //������
	   a=0;msec=0;b=0;		  //a��msecΪ��˸��־�������ж���ʱ���㣬����˸��
	 }						  //bΪģʽ��ȷ�϶������������ж�b�Ƿ�Ϊ��ʱ��ȷ��ģʽ���Ƿ�����
   }
}

void systemsetup(void)		    //ϵͳ����
{ 
  model=1;
  while(model!=0)
  {	
  Out_LCM(); 
  if (TimerUp==0)      	      //������Ŀ����
      {Delay5Ms();
       if(TimerUp==0)
	   {a=0;msec=0;KeySound();//������
	    if(model--==1)	      //6��ϵͳ������Ŀ
		 model=6;
		}   
       while(TimerUp==0);    
      }
   if (TimerDown==0)         //������Ŀ����
      {
       Delay5Ms();
       if(TimerDown==0) 
	     {a=0;msec=0;KeySound();//������
		 if(model++==6)
		     model=1; 
		 }         
       while(TimerDown==0);    
      }
     b=1;			//ģʽ���Ƿ�����־��Ϊ1ʱ��������Ϊ0ʱ������
	 Modset();		//����ģʽ����������жϰ����Ƿ��¡�
	 if(b==0)
	   {KeySound();			   //������
	    switch(model)          //���������Ŀ����
		  {
		   case 1:
		        timesetup(); break;   //ʱ������
		   case 2:
		        datesetup();break;    //��������
		   case 3:
		        alarmclockset();break;//��������
		   case 4:
		        lampsetup();break;	  //���������
	       case 5:
		        timereset();break;    //ʱ������
		   case 6:
		        model=0;break;        //�˳�ϵͳ����
		  }
	  }
   }
 }

							  
void timesetup()                //ʱ�����
{
 id=6;
 while(model==1)				//modelΪ1ʱ����ʱ�����
  {
    b=1;
    Modset();
	if(b==0)
	 {KeySound();			     //������
	  if(id++==9)			    //6..9Ϊʱ�������				   .
	   id=6;
	  }
   id_case1_key();				//���ð�������
   Out_LCM();                   //��ʾ���
 } 
}
void datesetup()                //�����ڽ��е���
{
 id=1;
 while(model==2)				//modelΪ2ʱ�������ڵ���
  {b=1;
   Modset();					//ģʽ���Ƿ���
   if(b==0)
    {KeySound();			    //������
	 if(id++==5)			    //1..5Ϊ���������� exit
	  id=1;
	 }
 id_case1_key();		        //���ڵ���
 Out_LCM();                     //��ʾ���
 } 
}
void alarmclockset(void)	    //�������
{id=12;
 while(model==3)			    //������������
  {b=1;
   Modset();				    //ģʽ���Ƿ���
   if(b==0)					  
    {KeySound();			    //������
	 if(R1302(0xc3)%16==0)
 	   {id=0;model++;}          //0xc2Ϊ���忪�ؼĴ�������Ϊ��ʱ����ģʽ��ʱ���˳��������ã�����ʱ��������ʱ������
        
	 else if(id++==15)		    //12..15Ϊ���忪�غ�ʱ������ exit
	      id=12;
    }
  id_case1_key();		        //����
  Out_LCM();                    //��ʾ���
  }
} 
   
void lampsetup(void)            //�����ʱ������
{id=10;							//����ƴ洢�ռ�DS1302(0xc0)
  while(model==4)				//modelΪ3ʱ���뱳��Ƶ���
  {b=1;
   Modset();					//ģʽ���Ƿ���
   if(b==0)
    {KeySound();			    //������
	 if(id++==11)			    //10Ϊ����� exit
	  id=10;
	 }
 id_case1_key();		        
 Out_LCM();                     //��ʾ���                    
 }

}
void  timereset()               //ʱ������
{
  Set1302(inittime);		    //��ʱ��
  W1302(0x90,0xa5);             //�򿪳�������  һ�������ܴ���һ��2K����
  model++; 
}
//����Ӧ����Ŀ���мӡ���������
void id_case1_key()				//��������
{
  if (TimerUp==0)        //����
      {
       Delay5Ms();
       if(TimerUp==0)
	    {a=0;msec=0;KeySound();			//������
		 if((id==9)||(id==5)||(id==11)||(id==15))	//��IDΪ9��5ʱ���¼ӡ��������˳�����
	   	  { model++;		            //�˳�ʱ�䡢��������
		    id=0;
		  }
		 else
	       Set(id,1);
		}  
      while(TimerUp==0);    
     }
  if (TimerDown==0)  //����
     {
       Delay5Ms();
       if(TimerDown==0) 
	    {a=0;msec=0;KeySound();			 //������
		 if((id==9)||(id==5)||(id==11)||(id==15))  //��IDΪ9��5ʱ���¼ӡ��������˳�����
	   	  { model++;		             //�˳�ʱ�䡢��������
		    id=0;
		  }
	   else
		   Set(id,0);		  //����DS1302д�뺯��
	   }          
      while(TimerDown==0);    
     }
}
                 
void timer_1(void) interrupt 1 	//�ж���ڣ���˸
{
  TH0=0x3c;            //50ms��ʱ
  TL0=0xb0;
  if(msec++==10)	   //500ms
   {msec=0;a=~a;       //��˸��־��ת 
	if(a==0)		   //1��󱳹�ʱ���һ�롣
	 LedTime--;
   }  
}

//����ѡ�������Ӧ��Ŀ��д��DS1302
void Set(uchar sel,uchar sel_1) 
{
  uchar address,item;
  uchar max,min;
  if(sel==1)  {address=0x8c; max=99;min=0;}    //��
  if(sel==2)  {address=0x88; max=12;min=1;}    //��
  if(sel==3)  {address=0x86; max=31;min=1;}    //��
  if(sel==4)  {address=0x8a; max=7; min=1;}    //����
  if(sel==6)  {address=0x84; max=23;min=0;}    //Сʱ
  if(sel==7)  {address=0x82; max=59;min=0;}    //����
  if(sel==8)  {address=0x80; max=59;min=0;}    //��
  if(sel==10) {address=0xc0; max=59;min=0;}    //����ʱ�䣬�1����
  if(sel==12) {address=0xc2; max=1;min=0;}     //���忪�ؼĴ���
  if(sel==13) {address=0xc4; max=23;min=0;}    //����ʱ�Ĵ���
  if(sel==14) {address=0xc6; max=59;min=0;}    //����ּĴ���


  item=R1302(address+1)/16*10+R1302(address+1)%16;
  if (sel_1==0) item++;  else item--;
  if(item>max) item=min;   
  if(item<min) item=max;
           
  W1302(0x8e,0x00);                   //����д����
  W1302(address,item/10*16+item%10);  //д��DS1302 //ת��BCD��
  W1302(0x8e,0x80);                   //д��������ֹд����  
}

//��Ļ��ʾ
void Out_LCM(void) 
{ switch(model)
   {
    case 0: model0(); break;
	case 1: model1(); break;
	case 2: model2(); break;		   //�ڲ�ͬ����������ʾ��ͬ���ַ�
	case 3: model3(); break;
	case 4: model4(); break;
	case 5: model5(); break;
	case 6: model6(); break;
   }       
}

/***********************modelΪ��ʱ��һ����ʾʱ�䣬��Ϊ��ʱ��ʾsystem setup******/
void model0()
  {																
   DisplayListChar(0,0,TIMER);   //��ʾ�̶��ַ�����Time)						
   OutputInformation(13,0,0x20); //����ʾ
   OutputInformation(4,0,0x20);  //����ʾ
   OutputInformation(4,1,0x20);  //����ʾ
   OutputInformation(15,1,0x20); //����ʾ
   OutputInformation(7,1,0x2f);  //��ʾ�̶��ַ� "/"
   OutputInformation(10,1,0x2f); //��ʾ�̶��ַ� "/"
   OutputInformation(13,1,0x2f); //��ʾ�̶��ַ� "/"
   DisplayListChar(0,1,DATE);    //��ʾ�̶��ַ���Date(���ڣ�         
   if(a==1)				         //ð����˸
    {OutputInformation(7,0,0x3a); OutputInformation(10,0,0x3a);}
   else
    {OutputInformation(7,0,0x20); OutputInformation(10,0,0x20);}

 /*******************modelΪ��ʱ�ڶ�����ʾ���ڣ���Ϊ����ʾ������Ŀ*******/
 
	OutputInformation(5,1,R1302(0x8d)/16+0x30);  //��ʾ��
    OutputInformation(6,1,R1302(0x8d)%16+0x30);
 
    OutputInformation(8,1,R1302(0x89)/16+0x30);  //��ʾ�� 
    OutputInformation(9,1,R1302(0x89)%16+0x30);    
      
    OutputInformation(11,1,R1302(0x87)/16+0x30); //��ʾ��
    OutputInformation(12,1,R1302(0x87)%16+0x30);    

    OutputInformation(14,1,R1302(0x8b)%16+0x30); //��ʾ����

    OutputInformation(5,0,R1302(0x85)/16+0x30);  //��ʾСʱ
    OutputInformation(6,0,R1302(0x85)%16+0x30); 
	   
    OutputInformation(8,0,R1302(0x83)/16+0x30);  //��ʾ����
    OutputInformation(9,0,R1302(0x83)%16+0x30); 
	   
    OutputInformation(11,0,R1302(0x81)/16+0x30); //��ʾ��
    OutputInformation(12,0,R1302(0x81)%16+0x30); 
}
  
/*************************model��Ϊ��ʱ��ʾϵͳ����***********************************/


	 
	          					  //modelΪ1ʱtime��˸������ģʽ�������ʱ�����
void model1()
	 /*************************************�ж�ID��ֵ����ʾ��Ŀ***********************/
{	 OutputInformation(0,0,0x20);          //����ʾ
     OutputInformation(1,0,0x20);
     DisplayListChar(2,0,systemp);         //��һ����ʾsystem setup
      if(id==0)							   //Ϊ0ʱ��ʾTIME  date lalcak
	 	 {OutputInformation(9,1,0x20);     //����ʾ
	      OutputInformation(4,1,0x20);     //����ʾ
		  OutputInformation(15,1,0x20);    //����ʾ
		  DisplayListChar(5,1,DATE);	   //��ʾdate 
		  DisplayListChar(10,1,alarmclock);//��ʾlalcak
		  							
		  if(a==1)
	         {OutputInformation(0,1,0x20);     //����ʾ
	          OutputInformation(1,1,0x20);     //����ʾ
		      OutputInformation(2,1,0x20);     //����ʾ
			  OutputInformation(3,1,0x20);     //����ʾ
		     }
	      else											 
	        DisplayListChar(0,1,TIMER);	  //��ʾtime     
		 }
	  else
	   {   	 										     //id��Ϊ�����ʱ�������Ŀ
		   OutputInformation(3,1,0x3a);                  //��ʾ�̶��ַ� ":"
           OutputInformation(6,1,0x3a);                  //��ʾ�̶��ַ� ":"
           OutputInformation(9,1,0x20);                  //����ʾ
		   OutputInformation(10,1,0x20);                 //����ʾ
		   OutputInformation(0,1,0x20);                  //����ʾ
   /****************************ʱ��ʾ��˸����********************/
		   if((id==6)&&(a==1))						 //idΪ5ʱʱ��˸
	        {
		     OutputInformation(1,1,0x20); //����ʾ
			 OutputInformation(2,1,0x20); //����ʾ
			}
           else
			{OutputInformation(1,1,R1302(0x85)/16+0x30); //��ʾʱ
             OutputInformation(2,1,R1302(0x85)%16+0x30); 
			}
  /******************************����ʾ��˸����********************/
		  if((id==7)&&(a==1))						 //idΪ6ʱ����˸
	        {
		     OutputInformation(4,1,0x20); //����ʾ
			 OutputInformation(5,1,0x20); //����ʾ
			}
		  else
			 {OutputInformation(4,1,R1302(0x83)/16+0x30); //��ʾ��
              OutputInformation(5,1,R1302(0x83)%16+0x30); 
			 }
  /******************************����ʾ��˸����********************/
		  if((id==8)&&(a==1))						 //idΪ7ʱ����˸
	        {
		     OutputInformation(7,1,0x20); //����ʾ
			 OutputInformation(8,1,0x20); //����ʾ
			 }
			else
			 {OutputInformation(7,1,R1302(0x81)/16+0x30); //��ʾ��
              OutputInformation(8,1,R1302(0x81)%16+0x30); 
			 }
  /*******************************Exit��ʾ��˸����********************/

		  if((id==9)&&(a==1))		    //idΪ8ʱexit��˸
			 {OutputInformation(11,1,0x20);     //����ʾ
	          OutputInformation(12,1,0x20);     //����ʾ
		      OutputInformation(13,1,0x20);     //����ʾ
			  OutputInformation(14,1,0x20);     //����ʾ
		     }
		  else
		      DisplayListChar(11,1,exit);	//��ʾexit
		}
}
/***************************************modeloΪ2ʱdate��˸***********************************************/
void model2()
{
	  if(id==0)
	   {OutputInformation(9,1,0x20);        //����ʾ
	    OutputInformation(4,1,0x20);        //����ʾ
		OutputInformation(15,1,0x20);       //����ʾ
		DisplayListChar(0,1,TIMER);	        //��ʾtime    
	    DisplayListChar(10,1,alarmclock);   //��ʾclock
	    if(a==1)
		 {OutputInformation(5,1,0x20);     //����ʾ
	      OutputInformation(6,1,0x20);     //����ʾ
		  OutputInformation(7,1,0x20);     //����ʾ
		  OutputInformation(8,1,0x20);     //����ʾ
		 }
		 
	   else
	     DisplayListChar(5,1,DATE);	        //��ʾdate
	   }
/*****************************************************************************************************/
						   	//id��Ϊ��ʱ���������ڵ���
/*****************************************************************************************************/
	  else								
	   { OutputInformation(0,1,0x20);                  //����ʾ
		 OutputInformation(11,1,0x20);                 //����ʾ
	     OutputInformation(3,1,0x2f);                  //��ʾ�̶��ַ� "/"
         OutputInformation(6,1,0x2f);                  //��ʾ�̶��ַ� "/"
         OutputInformation(9,1,0x2f);                  //��ʾ�̶��ַ� "/"  
   /****************************����ʾ��˸����********************/
		 if((id==1)&&(a==1))						   //idΪ1ʱ����˸
	      {
		   OutputInformation(1,1,0x20);                //����ʾ
		   OutputInformation(2,1,0x20);                //����ʾ
		  }
		 else
		  {OutputInformation(1,1,R1302(0x8d)/16+0x30); //��ʾ��
           OutputInformation(2,1,R1302(0x8d)%16+0x30); 
		  }
   /***************************����˸����************************/
		 if((id==2)&&(a==1))						   //idΪ2ʱ����˸
	      {
		   OutputInformation(4,1,0x20);                //����ʾ
		   OutputInformation(5,1,0x20);                //����ʾ
		  }
		 else
		  {OutputInformation(4,1,R1302(0x89)/16+0x30); //��ʾ��
           OutputInformation(5,1,R1302(0x89)%16+0x30); 
		  }
  /***************************����˸����************************/
		 if((id==3)&&(a==1))						   //idΪ2����˸
	      {
		   OutputInformation(7,1,0x20);                //����ʾ
		   OutputInformation(8,1,0x20);                //����ʾ
		  }
		 else
		  {OutputInformation(7,1,R1302(0x87)/16+0x30); //��ʾ��
           OutputInformation(8,1,R1302(0x87)%16+0x30); 
		  }
  /***************************������˸����*********************************/
		 if((id==4)&&(a==1))						   //idΪ2ʱ������˸
	      {
		   OutputInformation(10,1,0x20);                //����ʾ
		  }
		 else
		  {OutputInformation(10,1,R1302(0x8b)%16+0x30); //��ʾ����
		  }
  /**************************exit��˸����*********************************/
		 if((id==5)&&(a==1))						    //idΪ5ʱexit��˸
	       { OutputInformation(12,1,0x20);     //����ʾ
	         OutputInformation(13,1,0x20);     //����ʾ
		     OutputInformation(14,1,0x20);     //����ʾ
			 OutputInformation(15,1,0x20);     //����ʾ
		     }
		 else
		   DisplayListChar(12,1,exit);	                //��ʾexit
	   }
}
/*********************************************************************************/

								/*modelΪ3ʱ����������Ŀ

/**********************************************************************************/
void model3()
{
      if(id==0) 
	   {OutputInformation(9,1,0x20);        //����ʾ
	    OutputInformation(4,1,0x20);        //����ʾ
		OutputInformation(15,1,0x20);       //����ʾ
        DisplayListChar(0,1,TIMER);	        //��ʾtime 
	    DisplayListChar(5,1,DATE);	        //��ʾdate    
	    if(a==1)
		 { OutputInformation(10,1,0x20);     //����ʾ
	       OutputInformation(11,1,0x20);     //����ʾ
		   OutputInformation(12,1,0x20);     //����ʾ
		   OutputInformation(13,1,0x20);     //����ʾ
		   OutputInformation(14,1,0x20);
		 }
	    else
	     DisplayListChar(10,1,alarmclock);  //��ʾcloak
	   }

/**************************id��Ϊ���������������ʾ********************/
	 else
	 {if(id==12)						   //���忪����ʾ
	   {DisplayListChar(0,1,ClockSet);	   //��ʾClockSet
	   	OutputInformation(8,1,0x20);
		OutputInformation(13,1,0x20);
		OutputInformation(14,1,0x20);
/*****************************���忪����ʾ********************************/ 
	    if(a==1)							   //AΪ��˸��־
	      {OutputInformation(10,1,0x20);     //����ʾ
	       OutputInformation(11,1,0x20);     //����ʾ
		   OutputInformation(12,1,0x20);     //����ʾ
		   OutputInformation(13,1,0x20);     //����ʾ
		  }	
	    else
	     {
	      if(R1302(0xc3)%16==0)            //����Ĵ�����ֵ�Ƿ�Ϊ�㣨�أ�
			{DisplayListChar(10,1,ClockOff);}//��ʾOFF
		  else
		    {OutputInformation(9,1,0x20);    //����ʾ
			 OutputInformation(12,1,0x20);   //����ʾ
	         OutputInformation(13,1,0x20);   //����ʾ
		     OutputInformation(14,1,0x20);   //����ʾ
			 OutputInformation(15,1,0x20);   //����ʾ
		   	 DisplayListChar(10,1,ClockOn);  //��ʾON 
			}
		 }
	   }
	 else 
	   {DisplayListChar(0,1,alarmclock);   //��ʾclock
	    OutputInformation(8,1,0x3a);       //��ʾ�̶��ַ� ":"
		OutputInformation(5,1,0x20);       //����ʾ
		OutputInformation(11,1,0x20);      //����ʾ
/**************************����ʱ��˸��ʾ**********************/		 
	    if((id==13)&&(a==1))			   //����ʱ��˸
		  {
		   OutputInformation(6,1,0x20);
		   OutputInformation(7,1,0x20);
		  }
		else
		  {OutputInformation(6,1,R1302(0xc5)/16+0x30); //��ʾ����ʱ
		   OutputInformation(7,1,R1302(0xc5)%16+0x30); //��ʾ����ʱ
		  }

/**************************�������˸��ʾ*******************/
		if((id==14)&&(a==1))               //�������˸
		 {OutputInformation(9,1,0x20);     //����ʾ
		  OutputInformation(10,1,0x20);    //����ʾ
		  
		 }
		else
		  {OutputInformation(9,1,R1302(0xc7)/16+0x30);  //��ʾ�����
		   OutputInformation(10,1,R1302(0xc7)%16+0x30); //��ʾ�����
		  }

/************************exit��˸��ʾ***********************/
		if((id==15)&&(a==1))			   //exie��˸
		  {OutputInformation(12,1,0x20);   //����ʾ
	       OutputInformation(13,1,0x20);   //����ʾ
		   OutputInformation(14,1,0x20);   //����ʾ
		   OutputInformation(15,1,0x20);   //����ʾ
		  }
		else
		  DisplayListChar(12,1,exit);	   //��ʾexit								   
	   }
	 }
}
							
/*********************************���������*****************************************/
void model4()
{
	  if(id==0)								//idΪ��δ���뱳�������
	   {OutputInformation(10,1,0x20);       //����ʾ
	    OutputInformation(11,1,0x20);       //����ʾ
	    OutputInformation(4,1,0x20);        //����ʾ
		DisplayListChar(5,1,reset);         //��ʾreset		
		DisplayListChar(12,1,exit);         //��ʾexit
		if(a==1)
		  {OutputInformation(0,1,0x20);     //����ʾ
	       OutputInformation(1,1,0x20);     //����ʾ
		   OutputInformation(2,1,0x20);     //����ʾ
		   OutputInformation(3,1,0x20);     //����ʾ
		   }
		else
          DisplayListChar(0,1,lamp);        //��ʾlamp
	    }
	 else 						            //id��Ϊ�㣨10�����뱳���ʱ������
	   {DisplayListChar(0,1,lamp);          //��ʾlamp
		DisplayListChar(4,1,set);           //��ʾset
		DisplayListChar(9,1,sec);           //��ʾsec
		DisplayListChar(12,1,exit);         //��ʾexit
		if((id==10)&&(a==1))
		   {
			OutputInformation(7,1,0x20);      //����ʾ		 
            OutputInformation(8,1,0x20);}
		else
		  {
		   OutputInformation(7,1,R1302(0xc1)/16+0x30); //�����������ʱʱ��
		   OutputInformation(8,1,R1302(0xc1)%16+0x30);
		  }
		if((id==11)&&(a==1))
		  {OutputInformation(12,1,0x20);     //����ʾ
	       OutputInformation(13,1,0x20);     //����ʾ
		   OutputInformation(14,1,0x20);     //����ʾ
		   OutputInformation(15,1,0x20);     //����ʾ
		  }
	 }

}
/*********************************ʱ���������*****************************************/
void model5()
{       
        OutputInformation(4,1,0x20);        //����ʾ
	    OutputInformation(10,1,0x20);       //����ʾ
		OutputInformation(11,1,0x20);       //����ʾ
	    DisplayListChar(0,1,lamp);          //��ʾlamp
	    DisplayListChar(12,1,exit);         //��ʾexit
		if(a==1)
		 { OutputInformation(5,1,0x20);     //����ʾ
	       OutputInformation(6,1,0x20);     //����ʾ
		   OutputInformation(7,1,0x20);     //����ʾ
		   OutputInformation(8,1,0x20);     //����ʾ
		   OutputInformation(9,1,0x20);
		 }
		else
          DisplayListChar(5,1,reset);       //��ʾreset	  
}
/**********************************�˳�***********************************************/
void model6()
{
  OutputInformation(10,1,0x20);       //����ʾ
  OutputInformation(11,1,0x20);       //����ʾ
  DisplayListChar(0,1,lamp);          //��ʾlamp
  DisplayListChar(5,1,reset);         //��ʾreset
  if(a==1)
	 {OutputInformation(12,1,0x20);   //����ʾ
	  OutputInformation(13,1,0x20);   //����ʾ
	  OutputInformation(14,1,0x20);   //����ʾ
	  OutputInformation(15,1,0x20);   //����ʾ
	 }
  else
     DisplayListChar(12,1,exit);      //��ʾexit
}

	
  
//********* LCM1602�������� ***************
//д����
void WriteDataLCM(uchar WDLCM)
{
ReadStatusLCM(); //���æ

LCM_RS = 1;
LCM_RW = 0;
LCM_E = 0; 
LCM_Data = WDLCM;
delayNOP() ;
    LCM_E = 1 ;
    delayNOP() ;
 LCM_E = 0 ; 
}
//дָ��
void WriteCommandLCM(uchar WCLCM,BuysC)     //BuysCΪ0ʱ����æ���
 {
  if (BuysC) ReadStatusLCM(); //������Ҫ���æ
 
  LCM_RS = 0;
  LCM_RW = 0; 
  LCM_E = 0;
 _nop_() ;
    _nop_() ; 
 LCM_Data = WCLCM;
delayNOP() ;
  LCM_E = 1; 
delayNOP() ;
 LCM_E = 0;
 }
//��״̬
uchar ReadStatusLCM(void)
 {
 LCM_RS = 0 ;
    LCM_RW = 1 ;
    LCM_E = 1 ;
    delayNOP() ;
  LCM_E = 1;
  while (LCM_Data & Busy); //���æ�ź�
 LCM_E =0;
  return(LCM_Data);
 }
//LCM��ʼ��
void LCMInit(void) 
 {

 

delay1(15) ;

WriteCommandLCM(0x01,1);
  WriteCommandLCM(0x38,1);
    delay1(5) ;
  WriteCommandLCM(0x38,1);
  delay1(5) ;
  WriteCommandLCM(0x38,1);
  delay1(5) ;
  WriteCommandLCM(0x0c,1); //��ʾģʽ����,��ʼҪ��ÿ�μ��æ�ź�
  delay1(5) ;
  WriteCommandLCM(0x06,1); // ��ʾ����ƶ�����
  
 }
//��ָ��λ����ʾһ���ַ�
void OutputInformation(uchar X, uchar Y, uchar DData)
 {
  Y &= 0x1;
  X &= 0xF; //����X���ܴ���15��Y���ܴ���1
  if (Y) X |= 0x40; //��Ҫ��ʾ�ڶ���ʱ��ַ��+0x40;
  X |= 0x80; //���ָ����
  WriteCommandLCM(X, 0); //���ﲻ���æ�źţ����͵�ַ��
  WriteDataLCM(DData);
 }
//��ָ��λ����ʾһ���ַ�  ***ԭ���������ո�0x20�Ͳ���ʾ***
void DisplayListChar(uchar X, uchar Y, uchar code *DData)
{
  uchar ListLength,j;
  ListLength = strlen(DData);
  Y &= 0x1;
  X &= 0xF; //����X���ܴ���15��Y���ܴ���1
      if (X <= 0xF) //X����ӦС��0xF
        { 
         for(j=0;j<ListLength;j++)
            {
             OutputInformation(X, Y, DData[j]); //��ʾ�����ַ�
             X++;
            }
        }
}
//5ms��ʱ
void Delay5Ms(void)
 {
  unsigned int TempCyc = 5552;
  while(TempCyc--);
 }
//400ms��ʱ
void Delay400Ms(void)
 {
  uchar TempCycA = 5;
  unsigned int TempCycB;
  while(TempCycA--)
  {
   TempCycB=7269;
   while(TempCycB--);
  }
 }

//********DS1302��д����***************//
/******************************************************************** 
�� �� ����RTInputByte()
��    �ܣ�ʵʱʱ��д��һ�ֽ�
˵    ������DS1302д��1Byte���� (�ڲ�����)
��ڲ�����d д������� 
�� �� ֵ����  
***********************************************************************/
void RTInputByte(uchar d) 
{ 
    uchar i;
    ACC = d;
    for(i=8; i>0; i--)
    {
        T_IO = ACC0;           /*�൱�ڻ���е� RRC */
        T_CLK = 1;
        T_CLK = 0;
        ACC = ACC >> 1; 
    } 
}
/******************************************************************** 
�� �� ����RTOutputByte()
��    �ܣ�ʵʱʱ�Ӷ�ȡһ�ֽ�
˵    ������DS1302��ȡ1Byte���� (�ڲ�����)
��ڲ�������  
�� �� ֵ��ACC
��    �ƣ�zhaojunjie           ��    �ڣ�2002-03-19
��    �ģ�                     ��    �ڣ� 
***********************************************************************/
uchar RTOutputByte(void) 
{ 
    uchar i;
    for(i=8; i>0; i--)
    {
        ACC = ACC >>1;         /*�൱�ڻ���е� RRC */
        ACC7 = T_IO;
        T_CLK = 1;
        T_CLK = 0;
    } 
    return(ACC); 
}
/******************************************************************** 
�� �� ����W1302()
��    �ܣ���DS1302д������
˵    ������д��ַ����д����/���� (�ڲ�����)
��    �ã�RTInputByte() , RTOutputByte()
��ڲ�����ucAddr: DS1302��ַ, ucData: Ҫд������
�� �� ֵ����
***********************************************************************/
void W1302(uchar ucAddr, uchar ucDa)
{
    T_RST = 0;
    T_CLK = 0;
    T_RST = 1;
    RTInputByte(ucAddr);       /* ��ַ������ */
    RTInputByte(ucDa);       /* д1Byte����*/
    T_CLK = 1;
    T_RST = 0;
}
/******************************************************************** 
�� �� ����R1302()
��    �ܣ���ȡDS1302ĳ��ַ������
˵    ������д��ַ���������/���� (�ڲ�����)
��    �ã�RTInputByte() , RTOutputByte()
��ڲ�����ucAddr: DS1302��ַ
�� �� ֵ��ucData :��ȡ������
***********************************************************************/
uchar R1302(uchar ucAddr)
{
    uchar ucData;
    T_RST = 0;
    T_CLK = 0;
    T_RST = 1;
    RTInputByte(ucAddr);             /* ��ַ������ */
    ucData = RTOutputByte();         /* ��1Byte���� */
    T_CLK = 1;
    T_RST = 0;
    return(ucData);
}

/******************************************************************** 
�� �� ����Set1302()
��    �ܣ����ó�ʼʱ��
˵    ������д��ַ���������/����(�Ĵ������ֽڷ�ʽ)
��    �ã�W1302()
��ڲ�����pClock: ����ʱ�����ݵ�ַ ��ʽΪ: �� �� ʱ �� �� ���� ��
                               7Byte (BCD��)1B 1B 1B 1B 1B  1B  1B
�� �� ֵ����
***********************************************************************/
void Set1302(uchar *pClock) 
{
    uchar i;
    uchar ucAddr = 0x80; 
    W1302(0x8e,0x00);           /* ��������,WP=0,д����*/
    for(i =7; i>0; i--)
    { 
        W1302(ucAddr,*pClock);  /* �� �� ʱ �� �� ���� �� */ 
        pClock++;
        ucAddr +=2;
    }
    W1302(0x8e,0x80);           /* ��������,WP=1,д����*/
}
