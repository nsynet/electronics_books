//ʵ��39���궨��Ӧ�þ���
#include<reg51.h>   //����51��Ƭ���Ĵ��������ͷ�ļ�
# define F(a,b) (a)+(a)*(b)/256+(b)     //�������ĺ궨�壬a��bΪ�β�
void main(void)
 {
	  unsigned char i,j,k;
	  i=40;
	  j=30;
	  k=20;
	  P3=F(i,j+k);  //i��j+k�ֱ�Ϊʵ�Σ���չ��ʱ��ʵ�ν�����궨���е��β�
	  while(1)
	    ;
 }

