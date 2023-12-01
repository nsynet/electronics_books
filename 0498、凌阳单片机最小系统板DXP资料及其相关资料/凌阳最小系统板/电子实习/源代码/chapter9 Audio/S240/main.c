//03-06-06
//V32

#include "sp_lib.h"
#include "sacmv32.h"

#define MaxSpeechNum	3												// ���������Դ��Ŀ
#define MaxVolume		15												// ���������ֵ

int	Ret = 0;							

extern long RES_PK1_SA;

long Addr;
	
int main(){
	int Key = 0;						
	int SpeechIndex = 0;				
	int VolumeIndex = 7;												// �е�����
	int Mode;
	
	Mode = Auto;
	if(Mode == Auto) {						
		Ret = SACM_S240_Initial(Auto);	
		SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);			// ����
		while(1){							
			Key = SP_GetCh();
			switch(Key){	
			case 0x00:
				break;
			case 0x01:
				SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);	// ����
				break;
			case 0x02:
				SACM_S240_Stop();										// ֹͣ����
				break;
			case 0x04:
				SACM_S240_Pause();										// ��ͣ����
				break;
			case 0x08:
				SACM_S240_Resume();										// ��������
				break;
			case 0x10:						
				VolumeIndex++;				
				if(VolumeIndex > MaxVolume)
					VolumeIndex = MaxVolume;
				SACM_S240_Volume(VolumeIndex);							// ��������		
				break;		
			case 0x20:	
				if(VolumeIndex == 0)
					VolumeIndex = 0;
				else
					VolumeIndex--;	
				SACM_S240_Volume(VolumeIndex);							// ������С
				break;
			
			case 0x40:													// ��һ�� 
				SpeechIndex++;
				if(SpeechIndex == MaxSpeechNum) 
					SpeechIndex = 0;
				SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);	
				break;
			
			case 0x80:													// ǰһ�� 
				if(SpeechIndex == 0) 
					SpeechIndex = MaxSpeechNum;
				SpeechIndex--;
				SACM_S240_Play(SpeechIndex,DAC1+DAC2, Ramp_UpDn_On);			
				break;
			
			default:
				break;
			}
			System_ServiceLoop();										// ����ɨ�躯��
			SACM_S240_ServiceLoop();									// SACM S240 ������					
		}
	}
	return 0;
}