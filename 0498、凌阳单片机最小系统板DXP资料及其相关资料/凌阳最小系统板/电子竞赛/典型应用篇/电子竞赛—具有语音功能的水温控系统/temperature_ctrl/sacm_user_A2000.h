
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
int  iPlay_times = 0;                       //�¶Ȳ������������
int  iaSpeech_index[4] ;                     //�������������
unsigned int   guifgSpeechPlay;           //��������״̬1,���������ţ�0������������
int iNumber = 0;                          //�����������ŵ���ŵĵ�ַλ��


#endif


