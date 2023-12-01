
#ifndef	__SACM_USER_A2000_h__
#define	__SACM_USER_A2000_h__
//	write your header here
#define		DAC1			1
#define		DAC2			2
#define		Ramp_UpDn_Off	0
#define		Ramp_UpDn_On	3
#define		Manual			0
#define		Auto			1
#define		Full			1
#define		Empty			2
#define		Mode			0

extern     RES_T046_16K_SA;
extern     RES_T047_16K_SA;
extern     RES_T048_16K_SA;
extern     RES_T049_16K_SA;
extern     RES_T050_16K_SA;
extern     RES_T051_16K_SA;
extern     RES_T052_16K_SA;
extern     RES_T053_16K_SA;
extern     RES_T054_16K_SA;
extern     RES_T055_16K_SA;
extern     RES_T056_16K_SA;
extern     RES_T034_16K_SA;

extern     RES_T046_16K_EA;
extern     RES_T047_16K_EA;
extern     RES_T048_16K_EA;
extern     RES_T049_16K_EA;
extern     RES_T050_16K_EA;
extern     RES_T051_16K_EA;
extern     RES_T052_16K_EA;
extern     RES_T053_16K_EA;
extern     RES_T054_16K_EA;
extern     RES_T055_16K_EA;
extern     RES_T056_16K_EA;
extern     RES_T034_16K_EA;
	
int	   iRet ;
int  iPlay_times = 0;                       //温度播放语音组个数
int  iaSpeech_index[4] ;                     //语音播放序号组
unsigned int   guifgSpeechPlay;           //语音播放状态1,有语音播放，0，无语音播放
int iNumber = 0;                          //保存语音播放的序号的地址位置


#endif


