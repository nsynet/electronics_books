//ʵ��38���ַ�������string.hӦ�þ���
#include<reg51.h>   //����51��Ƭ���Ĵ��������ͷ�ļ�
#include<string.h>   //��������isalpha����������ͷ�ļ�
void main(void)
 {
  unsigned char str1[ ]="Now, The temperature is :";
  unsigned char str2[ ]="Now, The temperature is 36 Centgrade:";
  unsigned char i;
  i=strcmp(str1,str2); //�Ƚ������ַ����������������i
  if(i==0) //str1=str2
    P3=0x00;
  else
    if(i<0)   //str1<str2
       P3=0xf0;
	 else    //str1>str2
	    P3=0x0f;
  while(1)
    ;   //��ֹ�����ܷɡ�
 }
