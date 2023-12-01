#include <AT89X52.H> 

#include<stdio.h>

unsigned char code table[] = {0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};//�����������ʾ0~F
void delay()                   //��ʱ�ӳ���
{
 unsigned char n, m;
 for (n = 100; n > 0; n--)
  for (m = 300; m > 0; m--);    
}
void display(unsigned char S)      //��ʾ�ӳ���
{
 P0 = table[S];	//�������P0��������
 delay();                    
 P3 = 0x7f; //�����ѡͨ���أ�P3.7ѡͨ Ҳ��������ܵĵڰ�λ (������˳��)��
}
unsigned char Keycan(void) //����ɨ����� P1.0--P1.3Ϊ���� P1.4--P1.7Ϊ����
{
  unsigned char rcode, ccode;
  P1 = 0xF0;      // ��ȫ0��ɨ���룬��������
  if((P1&0xF0) != 0xF0) // ���м�����
  {
    delay();// ��ʱȥ���� 
    if((P1&0xF0) != 0xF0)
    {  rcode = 0xFE;         // ����ɨ���ֵ
    while((rcode&0x10) != 0)
    {
       P1 = rcode;         // �����ɨ����
    if((P1&0xF0) != 0xF0) // �����м�����
    {
       ccode = (P1&0xF0)|0x0F;
       do{;}while((P1&0xF0) != 0xF0); //�ȴ����ͷ�
       return ((~rcode) + (~ccode)); // ���ؼ�����
    }
    else
    rcode = (rcode<<1)|0x01; // ��ɨ��������һλ
    }
 }
  }  
  return 0; // �޼����£�����ֵΪ0
}
void KeyDispaly(unsigned char key)
{
   switch(key)
   {
   case 0x11: display(0); break;
   case 0x21: display(1); break;
   case 0x41: display(2); break;
   case 0x81: display(3); break;
   case 0x12: display(4); break;
   case 0x22: display(5); break;
   case 0x42: display(6); break;
   case 0x82: display(7); break;
   case 0x14: display(8); break;
   case 0x24: display(9); break;
   case 0x44: display(10); break;
   case 0x84: display(11); break;
   case 0x18: display(12); break;
   case 0x28: display(13); break;
   case 0x48: display(14); break;
   case 0x88: display(15); break;
   default: break;
   }
}
int main(void)
{ 
   unsigned char Key;
   while(1)
   {
     Key = Keycan();   
     KeyDispaly(Key);
   } 
return 0;
}
