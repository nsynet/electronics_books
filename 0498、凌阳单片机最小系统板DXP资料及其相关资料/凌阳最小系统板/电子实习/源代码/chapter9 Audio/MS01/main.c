#include "sp_lib.h"
#include "sacmv32.h"

#define MaxSongNum              12          							//������Դ��Ŀ
#define MaxVolume               15         								//�������

int Mode;
#define Auto 					1

int Key = 0;                                
int SongIndex = 0;                          
int VolumeIndex = 8;                        

int main()
{
    Mode = Auto;
	while(Mode == Auto)
	{   
		System_Initial();     
		SACM_MS01_Initial(DAC_16K,Auto);								// ������ͨ��
        SACM_MS01_Play(SongIndex,DAC1+DAC2,Ramp_Up_On+Ramp_Dn_On);  	// ����
                
        while(1) {                                  	
            Key = SP_GetCh();
            switch(Key) {
            case 0x00:
                    break;
            case 0x01:
            		SACM_MS01_Play(SongIndex,DAC1+DAC2,Ramp_Up_On+Ramp_Dn_On); 	// ����
		            break;
            case 0x02:
                    SACM_MS01_Stop();                    				// ֹͣ
                    break;
            case 0x04:
					SACM_MS01_Pause();                   				// ��ͣ
                    break;
            case 0x08:
            		SACM_MS01_Resume();                  				// ����
                    break;
            case 0x10:
                    VolumeIndex++;
                    if(VolumeIndex > MaxVolume)
                            VolumeIndex = MaxVolume;
                    SACM_MS01_Volume(VolumeIndex);       				// ��������
                    break;
            case 0x20:
                    if(VolumeIndex == 0)
                            VolumeIndex = 0;
                    else
                            VolumeIndex--;
                    SACM_MS01_Volume(VolumeIndex);  					// ������С
                    break;
            case 0x40:      											// ��һ�� 
                    if( ++SongIndex == MaxSongNum)
                          SongIndex = 0;
                    SACM_MS01_Play(SongIndex,DAC1+DAC2,Ramp_Up_On+Ramp_Dn_On);
                    break;
                        
            case 0x80:													//��һ��
            		if( --SongIndex < 0)
                   	      SongIndex = MaxSongNum-1;
                    SACM_MS01_Play(SongIndex,DAC1+DAC2,Ramp_Up_On+Ramp_Dn_On);
                    break;
            default:
                    break;
            }
            System_ServiceLoop();             							// ����ɨ��
            SACM_MS01_ServiceLoop();          							// MS01������
        }
	}	        
	return 0;
}