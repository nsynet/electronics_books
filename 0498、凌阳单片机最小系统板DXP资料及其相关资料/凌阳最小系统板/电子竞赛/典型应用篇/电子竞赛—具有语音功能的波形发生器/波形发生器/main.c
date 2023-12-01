//======================================================
//
//        The information contained herein is the exclusive property of
//      Sunplus Technology Co. And shall not be distributed, reproduced,
//      or disclosed in whole in part without prior written permission.
//
//            (C) COPYRIGHT 2001   SUNPLUS TECHNOLOGY CO.
//                           ALL RIGHTS RESERVED
//
//    The entire notice above must be reproduced on all authorized copies.
//
//======================================================

//======================================================
//
//  Filename:    
//  Designer:    xinyan liu    (email: fae/sunnorth)    (ext: 631)
//  Date:        2002,2,26
//  Description:    SPCE061A design the tool for signal'formation 
//               
//  Reference:
//  Revision:
//  ---------------------------------------------------------------------------
//  2002-12-03    MODIFIED BY    DESCRIPTION
//  ---------------------------------------------------------------------------
//
//======================================================

#include "hardware.h"

#include "s480.h"
#include "math.h"
#define PI  3.1415926
#define		SPEECH_1	    0
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_Up_On		1
#define		Ramp_Dn_On		2
#define		Ramp_UpDn_On	3
#define		Auto			1
#define		Full			1
#define		Empty			2
//===========================================//
//描述：播放S480语音
//注意：播放语音时关闭其它中断
//===========================================//
void playS480( unsigned char num)
{
	unsigned int i;
	for(i = 0;i<1;i++){
	       Turnoff_INT_64Hz();	  
	       SACM_S480_Initial(Auto);     	   
		   SACM_S480_Play(num,DAC1+DAC2,Ramp_UpDn_On);              
	 	   while(SACM_S480_Status()&0x01)             //判断第一首是否播完
	           SACM_S480_ServiceLoop();	
    }
	SP_INT_64Hz();   
}
float w,y,t,tt,h,j;
void showled(tim,pin)	
{
	int kk,t,time,carlong,tm0,tm1,tm2,tm3,second,distance,dst0,dst1,dst2,dst3,dst4,dst5;
tm0=tim%10;
    t=tim/10;
    tm1=t%10;
	t=tim/100;
	tm2=t%10;
	t=tim/1000;
	tm3=t%10;
	dst0=pin%10;
	t=pin/10;
	dst1=t%10;
	t=pin/100;
	dst2=t%10;
	t=pin/1000;
	dst3=t%10;
	t=pin/10000;
	dst4=t%10;
	t=pin/100000;
	dst5=t%10;
	t=0;

do
	{
		singleled(0,tm0);
		 
	for(kk=1;kk<=0x10;kk++)
       delay(); 
       singleled(1,tm1);
     for(kk=1;kk<=0x10;kk++)
       delay(); 
	    singleled(2,dst0);
	   for(kk=1;kk<=0x10;kk++)
      delay();
     singleled(3,dst1);
     for(kk=1;kk<=0x10;kk++)
       delay();
      
    
     singleled(4,dst2);
		 
	for(kk=1;kk<=0x10;kk++)
       delay(); 
        
	    singleled(5,dst3);
	   for(kk=1;kk<=0x10;kk++)
      delay();
     
       t++;
}
       while(t<=800);
       SACM_S480_Initial(Auto);  //S480自动方式播放初始化]
       playS480(tm1);
       playS480(tm0);
       playS480(12);
       playS480(dst3);
       playS480(dst2);
       playS480(dst1);
       playS480(dst0);
       K_IRQ();
}
extern float sinf(float);
unsigned int pp=0;
unsigned int Mk_Z=100,Mk_F=100,Mk_Z1=100,Mk_F1=100,Mk_Z2=100,Mk_F2=100,Mk_Z3=100,Mk_F3=100,Mk_Z4=100,Mk_F4=100,Mk_Z5=100,Mk_F5=100,V_GA=100,Bianxing=0,Bianxing1=0;
unsigned int sanju=0xf3;
unsigned int Mk_Z6=0x0FF0;
int main()
{

int keyfirst=0,keylast,xx0,xx1,xx2,xx3,xx4,xx5,xx6,xx7,xx8,xx9,xxA,xxB,xxC,xxD,xxE,xxF,i;
int aa=1,bb=1,cc=1,dd=1,ff=1,kind,frequency=300;
unsigned int max=0x7fff,m=0xf3;
int yy;
   	if(pp>0) baab();
   K_IRQ();
   
while(1)
{     
	 keyfirst=key_asm();
	 
	 keylast=key_asm1();
	 keylast=key_asm1();
	 keylast=key_asm1();
	 i=0x000f;
   
   keyfirst=i&keyfirst;
   i=0x00f0;
   
   keylast=i&keylast;
   
   keyfirst=keyfirst|keylast;
   i=0x00ff;
   keyfirst^=i;
   
   switch(keyfirst)
	{
		case 0x0000:
		  break;
//////////////////////////////////////////////////////////////////
		case 0x00ee:
		  xx0=0;
		  i=0;
		  kind=1;
		  frequency=frequency+10;
		  showled(kind,frequency);
		  L_asin();
		  
		  break;
//////////////////////////////////////////////////////////////////		  
		case 0x00de:
		  xx1=1;
		  i=1;
		  kind=2;
		  frequency=frequency+20;
		  showled(kind,frequency);
		  Sanjiaobo();
		  
		  break;
//////////////////////////////////////////////////////////////////
		case 0x00be:
		  xx2=2;
		  i=2;
		  kind=3;
		  frequency=frequency+200;
		  showled(kind,frequency);
		  Juchibo();
		  
		 break;
//////////////////////////////////////////////////////////////////
		case 0x007e:
		  xx3=3;
		  i=3;
		  kind=4;
		  frequency=frequency+213;
		  showled(kind,frequency);
		  Fangbo();
		  
		  break;
//////////////////////////////////////////////////////////////////
		case 0x00ed:
		  xx4=4;
		  i=4;
	   kind=5;
		  frequency=frequency/10;
		  showled(kind,frequency);
		   i=6;
		  j=2;
	    h=0.5;
	     tt=0;
        loop6:
        t= tt * PI/j;    
  y = aa*h*sinf(t)+bb*h*sinf(2*t)+cc*h*sinf(3*t)+dd*h*sinf(4*t)+ff*h*sinf(5*t);    
 yy= (int) 32736 * y; 
         yy = yy^0x8000; 
         DAC_FW(yy);           
         tt=tt+j/100;           
         if(((int)tt)== j*2) tt=0; 
         goto loop6;	 
	loop3:
			if(m<max)  m=m+sanju;
	       else  m=0xf3;
  
         DAC_FW(m); 
         
		  break;
//////////////////////////////////////////////////////////////////
		case 0x00dd:
		  xx5=5;
		  i=5;
		  kind=5;
		  
		  showled(kind,0);
	 F_Apwm();
  loop4:
	do
		{m=m+sanju;
		DAC_FW(m); }
		while(m<max);
	do
		{m=m-sanju;
		DAC_FW(m); }
		while(m!=sanju);
	goto loop4;	
		  break;
////////////////////////////////////////////////////////////////////
		case 0x00bd:
		  xx6=6;
		  kind=6;
		  
		  showled(kind,0);
		  Mk_Z6=0x0c70;
		  i=6;
		  j=2;
	    h=0.5;
	     tt=0;
        loop5:
        t= tt * PI/j;    
   y = h*sinf(t);    
 yy= (int) 32736 * y; 
         yy = yy^0x8000; 
         DAC_FW(yy);           
         tt=tt+j/100;           
         if(((int)tt)== j*2) tt=0; 
         goto loop5;
		 break;
//////////////////////////////////////////////////////////////////
		case 0x007d:
		  xx7=7;
		  i=7;
	 xx6=6;
	 kind=7;
		  
		  showled(kind,0);
		  if(Mk_Z<1500) Mk_Z=Mk_Z+100;
	      else Mk_Z=0; 
		 Mk_Z6=0x0cb0 ;
		  break;
//////////////////////////////////////////////////////////////////
	    case 0x00eb:
	      xx8=8;
	    i=8; 
	    kind=8;
		  
		  showled(kind,0);
		  Mk_Z6=0x0cf0;
		  if(Mk_F5<1500) Mk_F5=Mk_F5+100;
	      else Mk_F5=0; 
	  /*  if(h<2) h=h+0.1;
	      else h=0.1; */
	    break;
///////////////////////////////////////////////////////////////////	    
	    case 0x00db:
	      xx9=9;
	      i=9;
	      kind=9;
		  
		  showled(kind,0);
		  Mk_Z6=0x0df0;
		  if(Mk_F4<1500) Mk_F=Mk_F4+100;
	      else Mk_F4=0; 
	     if(max<0xffff) max=max+0x1000;
	      else max=0; 
	       if(aa==0) aa=1;  
	       else aa=0 ;
	      break;
////////////////////////////////////////////////////////////////////
	    case 0x00bb:
	      xxA=10;
	      i=10;
	      kind=10;
		  
		  showled(kind,0);
		  Mk_Z6=0x0d70;
		  if(Mk_F3<1500) Mk_F3=Mk_F3+100;
	      else Mk_F3=0; 
	   if(Bianxing1<100) Bianxing1=Bianxing1+5;
	      else Bianxing1=0; 
	       if(bb==0) bb=0;
	       else bb=0;
	   if(sanju<max) sanju=sanju+0xf3;
	      else sanju=0;    
	      break;
//////////////////////////////////////////////////////////////////
	    case 0x007b:
	      xxB=11;
	      i=11;
	      kind=11;
		  
		  showled(kind,0);
		  Mk_Z6=0x0db0;
		  if(Mk_F2<1500) Mk_F2=Mk_F2+100;
	      else Mk_F2=0; 
	     if(Bianxing<100) Bianxing=Bianxing+5;
	      else Bianxing=0; 
	       if(cc==0) cc=1;
	       else cc=0;
	      break;
/////////////////////////////////////////////////////////////////
	    case 0x00e7:
	      xxC=12;
	      i=12;
	      kind=12;
		  
		  showled(kind,0);
		  Mk_Z6=0x0f70;
	      if(Mk_F1<1500) Mk_F1=Mk_F1+100;
	      else Mk_F1=0; 
	      if(V_GA<100) V_GA=V_GA+5;
	      else V_GA=0;
	       if(dd==0) dd=1;
	       else dd=0;
	      break;
//////////////////////////////////////////////////////////////////
	    case 0x00d7:
	      xxD=13;
	      i=13;
	      kind=13;
		  
		  showled(kind,0);
		  Mk_Z6=0x0fb0;
	    if(Mk_F<1500) Mk_F=Mk_F+100;
	      else Mk_F=0; 
	      if(ff==0) ff=1;
	      else ff=0;
	      break;
//////////////////////////////////////////////////////////////////
	    case 0x00b7:
	      xxE=14;
	      i=14;
	      kind=14;
		  
		  showled(kind,0);
		  frequency=7500;
		  
	      Gaopin();
	     break;
//////////////////////////////////////////////////////////////////
	    case 0x0077:
	      xxF=15;
	      i=15;
	      kind=15;
		  
		  showled(kind,0);
	       frequency=10;
	      Dipin();
	     break;
	}
   }
}