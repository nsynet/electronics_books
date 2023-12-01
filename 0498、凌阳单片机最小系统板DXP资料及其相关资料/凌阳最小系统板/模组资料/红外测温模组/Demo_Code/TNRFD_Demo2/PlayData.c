//==============================================================================
//文件名称:PlayData.c
//功能描述:播放温度值
//维护记录:2006.4.20 by hongyan.Feng
//==============================================================================
#include "s480.h"

#define P_Watchdog_Clear (volatile unsigned int *)0x7012

//===============================================================================
//语法格式:void PlaySnd_Auto(unsigned int uiSndIndex)
//实现功能:自动播放语音函数
//参    数:uiSndIndex,播放索引号
//返 回 值:无
//日    期:2005.11.30
//==============================================================================
void PlaySnd_Auto(unsigned int uiSndIndex)
{
	SACM_S480_Initial(1);						//初始化为自动播放方式
	SACM_S480_Play(uiSndIndex,3,3);	            //播放
	while((SACM_S480_Status() & 0x0001) != 0)
	{											//判断播放状态，如还在播放则继续循环
		SACM_S480_ServiceLoop();				//播放系统服务程序
		*P_Watchdog_Clear = 0x0001;			
	}	
	SACM_S480_Stop();							//停止播放
}
//===============================================================================
//语法格式:void F_TempplayAndShow(float temp)
//实现功能:温度播放函数
//参    数:temp,温度值
//返 回 值:无
//日    期:2006.4.20
//==============================================================================
void F_TempplayAndShow(float temp)
{
	int iShow[6];								 //播报数存储数组
	temp=temp*100;                               //温度值乘100，以方便计算小数点后两位
	iShow[5]=temp/10000;                         //计算温度值的百位数
	iShow[4]=(temp/1000);                        //计算温度值的十位数
	iShow[4]=iShow[4]%10;                        
	iShow[3]=(temp/100);                         //计算温度值的个位数
        iShow[3]=iShow[3]%10;
	iShow[2]=(temp/10);                          //计算温度值的小数点后第一位数
	iShow[2]=iShow[2]%10;
	iShow[1]=(temp);                             //计算温度值的小数点后第二位数                         
	iShow[1]=iShow[1]%10;
	if(iShow[5]!=0)                                              //如果百位数字不为0
	{                          
		PlaySnd_Auto(iShow[5]);                                  //播放百位数字
		PlaySnd_Auto(10);                                        //播放"百"
	}
	if((iShow[5]!=0)&&(iShow[4]==0)&&(iShow[3]!=0))              //如果百位数字不为0且十位为0,但是个位不为0
	{
		PlaySnd_Auto(iShow[4]);                                  //播放十位数字 	
	}
	if(iShow[4]!=0)                                              //如果十位不为0
	{
		PlaySnd_Auto(iShow[4]);                                  //播放十位数字
		PlaySnd_Auto(11);                                        //播放"十"
	}
	if((iShow[4] == 0)&&(iShow[5]==0)&&(iShow[3]==0))            //如果百位,十位,个位都为0
	{
		PlaySnd_Auto(iShow[3]);                                  //播放个位数字
	}
	if(iShow[3]!=0)                                              //如果个位为不为0
	{
		PlaySnd_Auto(iShow[3]);                                  //播放个位数字
	}
	PlaySnd_Auto(12);                                            //播放"点"
	PlaySnd_Auto(iShow[2]);                                      //播放小数点后第一位数字
	PlaySnd_Auto(iShow[1]);                                      //播放小数点后第二位数字
	PlaySnd_Auto(13);                                            //播放"摄氏度"
	*P_Watchdog_Clear = 0x0001;
}