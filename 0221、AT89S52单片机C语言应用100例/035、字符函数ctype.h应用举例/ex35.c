//ʵ��35���ַ�����ctype.hӦ�þ���
#include<reg51.h>   //����51��Ƭ���Ĵ��������ͷ�ļ�
#include<ctype.h>
void main(void)
 {
   while(1)
   {		
	  P3=isalpha('_')?0xf0:0x0f;//�������㣬��'_'��Ӣ����ĸ��P3=0xf0	  
	}
}
