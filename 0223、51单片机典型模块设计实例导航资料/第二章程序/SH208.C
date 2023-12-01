# include <reg52.h>
# include <absacc.h>
# define CW8155 0XEF00
# define B8155  0XEF02
# define C8155  0XEF03
# define uchar unsigned char
uchar datap;

void pchar(uchar i)
{
XBYTE[B8155]=i;
XBYTE[C8155]=0X00;
XBYTE[C8155]=0X01;
} 

main(void)
{
EA=1; PT0=1;					// 开外中断，并设置定时器；
ET0=1;
IT0=1;IT1=1;
EX0=1;EX1=1;ET2=1;
T2CON=0x08;
TMOD=0x21;

datap='*';						// 输出打印字符
pchar(datap);
}
 


