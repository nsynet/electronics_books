#include<reg51.h>  //����51��Ƭ���Ĵ��������ͷ�ļ�
#define MAX 100   //��MAX�궨��Ϊ�ַ���100
void main(void) 
{
	#if MAX>80   //����ַ���100����80
	  P3=0xf0;   //P3�ڵ���λLED����
	#else
	  P3=0x0f;   //����P3�ڸ���λLED����
	#endif		 //�������α���
		
}



