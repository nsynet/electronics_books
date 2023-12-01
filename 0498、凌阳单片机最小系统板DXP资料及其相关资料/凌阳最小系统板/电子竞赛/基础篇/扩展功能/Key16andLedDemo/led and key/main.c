#include "hardware.h"
unsigned int uiValue,ko;	
unsigned int uiDelay=0x0008;
void KeyFind()                                //键扫描并取得健值
{
int keyfirst=0,keylast;

	keyfirst=key_asm();                       //取得第一次扫描的值
	keylast=key_asm1();                       //取得第二次扫描的值
	uiValue=0x000f;
    keyfirst=uiValue&keyfirst;
    uiValue=0x00f0;
    keylast=uiValue&keylast;
    keyfirst=keyfirst|keylast;
    uiValue=0x00ff;
    keyfirst^=uiValue;                        //数据处理得到想要的扫描值
    ClearWatchDog();
     switch(keyfirst)                         //把对应的值赋给uiValue
	{
		case 0x0000:
		  break;
		case 0x00ee:
		  uiValue=0;
		  break;
		case 0x00de:
		  uiValue=1;
		  break;
		case 0x00be:
		  uiValue=2;
		 break;
		case 0x007e:
		  uiValue=3;
		  break;
		case 0x00ed:
		  uiValue=4;
		  break;
		case 0x00dd:
		  uiValue=5;
		  break;
		case 0x00bd:
		  uiValue=6;
		 break;
		case 0x007d:
		  uiValue=7;
		  break;
	    case 0x00eb:
	    uiValue=8; 
	    break;
	    case 0x00db:
	      uiValue=9;
	      break;
	    case 0x00bb:
	      uiValue=10;
	      break;
	    case 0x007b:
	      uiValue=11;
	      break;
	    case 0x00e7:
	      uiValue=12;
	      break;
	    case 0x00d7:
	      uiValue=13;
	      break;
	    case 0x00b7:
	      uiValue=14;
	     break;
	    case 0x0077:
	      uiValue=15;
	     break;
	     return ;
}
	if(uiValue==255)  ko=ko;
    else   ko=uiValue;
}

int main()
{
	int tm0,tm1,i,t;
    Initirq5();                                     //开中断
    
loop:
    tm0=ko%10;
    t=ko/10;
    if(t==0) tm1=0;
    else   tm1=1;   
	F_SingleLed(1,tm0);                             //显示个位数据
	ClearWatchDog();
	F_SingleLed(0,tm1);                             //显示十位数据
	ClearWatchDog();
goto loop;
     
}
