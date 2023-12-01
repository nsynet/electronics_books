//03-06-06
//V32

#include "sp_lib.h"
#include "sacmv32.h"

#define MaxSpeechNum	3												// 最大语音资源数目
#define MaxVolume		15												// 声音的最大值

int	Ret = 0;							

extern long RES_PK1_SA;

long Addr;
	
int main(){
	int Key = 0;						
	int SpeechIndex = 0;				
	int VolumeIndex = 7;												// 中等音量
	int Mode;
	
	Mode = Auto;
	if(Mode == Auto) {						
		Ret = SACM_S240_Initial(Auto);	
		SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);			// 放音
		while(1){							
			Key = SP_GetCh();
			switch(Key){	
			case 0x00:
				break;
			case 0x01:
				SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);	// 放音
				break;
			case 0x02:
				SACM_S240_Stop();										// 停止放音
				break;
			case 0x04:
				SACM_S240_Pause();										// 暂停放音
				break;
			case 0x08:
				SACM_S240_Resume();										// 继续放音
				break;
			case 0x10:						
				VolumeIndex++;				
				if(VolumeIndex > MaxVolume)
					VolumeIndex = MaxVolume;
				SACM_S240_Volume(VolumeIndex);							// 音量增加		
				break;		
			case 0x20:	
				if(VolumeIndex == 0)
					VolumeIndex = 0;
				else
					VolumeIndex--;	
				SACM_S240_Volume(VolumeIndex);							// 音量减小
				break;
			
			case 0x40:													// 下一段 
				SpeechIndex++;
				if(SpeechIndex == MaxSpeechNum) 
					SpeechIndex = 0;
				SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);	
				break;
			
			case 0x80:													// 前一段 
				if(SpeechIndex == 0) 
					SpeechIndex = MaxSpeechNum;
				SpeechIndex--;
				SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);			
				break;
			
			default:
				break;
			}
			System_ServiceLoop();										// 键盘扫描函数
			SACM_S240_ServiceLoop();									// SACM S240 服务函数					
		}
	}
	return 0;
}