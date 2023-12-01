#include <reg52.h>
#include <intrins.h>
#define uchar unsigned char 
#define uint unsigned int 
#define OP_WRITE 0xa0          // ������ַ�Լ�д����� 
#define OP_READ  0xa1           // ������ַ�Լ���ȡ���� 
uchar code display[72]={ 
        0xFE,0xFD,0xFB,0xF7,0xEF,0xDF,0xBF,0x7F, 
        0xBF,0xDF,0xEF,0xF7,0xFB,0xFD,0xFE,0xFF, 
        0xFE,0xFC,0xF8,0xF0,0xE0,0xC0,0x80,0x00, 
        0x80,0xC0,0xE0,0xF0,0xF8,0xFC,0xFE,0xFF, 
        0xFC,0xF9,0xF3,0xE7,0xCF,0x9F,0x3F, 
        0x9F,0xCF,0xE7,0xF3,0xF9,0xFC,0xFF, 
        0xE7,0xDB,0xBD,0x7E,0xBD,0xDB,0xE7,0xFF, 
        0xE7,0xC3,0x81,0x00,0x81,0xC3,0xE7,0xFF, 
        0xAA,0x55,0x18,0xFF,0xF0,0x0F, 
        0x00,0xFF,0x00,0xFF }; 
sbit SDA = P2^3; 
sbit SCL = P2^2; 
void start(); 
void stop(); 
uchar shin(); 
bit shout(uchar write_data); 
void write_byte( uchar addr, uchar write_data); 
void fill_byte(uchar fill_size,uchar fill_data); 
void delayms(uint ms); 
uchar read_current(); 
uchar read_random(uchar random_addr); 
#define delayNOP(); {_nop_();_nop_();_nop_();_nop_();}; 
/**********************************************************/ 
main(void) 
{ 
   uchar i; 
   SDA = 1; 
   SCL = 1; 
   fill_byte(72,0xff);          // ��ǰ72�ֽ����0xff 
   for(i = 0 ; i < 72; i++)    //д����ʾ���뵽AT24C02 
    { 
      write_byte(i,display[i]); 
    } 
   for(i =0 ;i <72 ; i++)      //��AT24C02�Ƴ������͵�P0����ʾ 
   { 
      P0 = read_random(i); 
      delayms(350); 
   }  
} 
/**********************************************************/ 
void start() 
 //��ʼλ 
{ 
   SDA = 1; 
   SCL = 1; 
   delayNOP(); 
   SDA = 0; 
   delayNOP(); 
   SCL = 0; 
} 
/**********************************************************/ 
void stop() 
 // ֹͣλ 
{ 
   SDA = 0; 
   delayNOP(); 
   SCL = 1; 
   delayNOP(); 
   SDA = 1; 
} 
/**********************************************************/ 
uchar shin() 
// ��AT24C02�Ƴ����ݵ�MCU 
{ 
   uchar i,read_data; 
   for(i = 0; i < 8; i++) 
   { 
    SCL = 1; 
    read_data <<= 1; 
    read_data |= SDA; 
    SCL = 0; 
   } 
    return(read_data); 
} 
/**********************************************************/ 
bit shout(uchar write_data)  
// ��MCU�Ƴ����ݵ�AT24C02 
{ 
   uchar i; 
   bit ack_bit; 
   for(i = 0; i < 8; i++)   // ѭ������8��λ 
   { 
     SDA = (bit)(write_data & 0x80); 
    _nop_(); 
    SCL = 1; 
    delayNOP(); 
    SCL = 0; 
    write_data <<= 1; 
   } 
   SDA = 1;                     // ��ȡӦ�� 
   delayNOP(); 
   SCL = 1; 
   delayNOP(); 
   ack_bit = SDA; 
   SCL = 0; 
   return ack_bit;            // ����AT24C02Ӧ��λ 
} 
/**********************************************************/ 
void write_byte(uchar addr, uchar write_data) 
// ��ָ����ַaddr��д������write_data 
{ 
   start(); 
   shout(OP_WRITE); 
   shout(addr); 
   shout(write_data); 
   stop(); 
   delayms(10);          // д������ 
} 
/**********************************************************/ 
void fill_byte(uchar fill_size,uchar fill_data) 
// �������fill_data��EEPROM��fill_size�ֽ� 
{ 
   uchar i; 
   for(i = 0; i < fill_size; i++) 
   { 
     write_byte(i, fill_data); 
   } 
} 
/**********************************************************/ 
uchar read_current() 
// �ڵ�ǰ��ַ��ȡ 
{ 
   uchar read_data; 
   start(); 
   shout(OP_READ); 
   read_data = shin(); 
   stop(); 
   return read_data; 
} 
/**********************************************************/ 
uchar read_random(uchar random_addr) 
// ��ָ����ַ��ȡ 
{ 
   start(); 
   shout(OP_WRITE); 
   shout(random_addr); 
   return(read_current()); 
} 
/**********************************************************/ 
void delayms(uint ms)  
// ��ʱ�ӳ��� 
{ 
   uchar k; 
   while(ms--) 
   { 
      for(k = 0; k < 120; k++); 
   } 
}
