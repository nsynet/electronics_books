#include<reg52.h>
code unsigned char seg7code[10]={ 0xC0,0xf9,0xa4,0xb0,0x99,0x92,
0x82,0xf8,0x80,0x90}; //显示段码

sbit TMDAT =P3^2; //DS18B20 的数据输入/输出脚DQ,根据情况设定

unsigned int sdata;//测量到的温度的整数部分
unsigned char xiaoshu1;//小数第一位
unsigned char xiaoshu2;//小数第二位
unsigned char xiaoshu;//两位小数


bit fg=1; //温度正负标志
/**********************************************************************/
//////////*显示延时程序*///////////////

void Delay(unsigned int tc)
{while( tc != 0 )
{unsigned int i;
for(i=0; i<80; i++);
tc--;}
}
/**********************************************************************/
////////////延时部分///////////////

void dmsec (unsigned int count) 
{
unsigned char i;
while(count--)
{for(i=0;i<115;i++);}
}
/**********************************************************************/
/////////////发送复位///////////////

void tmreset (void) 
{
unsigned char i;
TMDAT=0; for(i=0;i<103;i++);
TMDAT = 1; for(i=0;i<4;i++);
}

/**********************************************************************/
bit tmrbit (void) //读一位//
{                      
unsigned int i;
bit dat;
TMDAT = 0;
i++;
TMDAT = 1;
i++; i++; //微量延时 //
dat = TMDAT;
for(i=0;i<8;i++);
return (dat);
}
unsigned char tmrbyte (void) //读一个字节
{
unsigned char i,j,dat;
dat = 0;
for (i=1;i<=8;i++)
{ j = tmrbit(); dat = (j << 7) | (dat >> 1); }
return (dat);
}
/**********************************************************************/
void tmwbyte (unsigned char dat) //写一个字节
{
unsigned char j,i;
bit testb;
for (j=1;j<=8;j++)
{ testb = dat & 0x01;
dat = dat >> 1;
if (testb)
{ TMDAT = 0; //写0
i++; i++;
TMDAT = 1;
for(i=0;i<8;i++); }
else
{ TMDAT = 0; //写0
for(i=0;i<8;i++);
TMDAT = 1;
i++; i++;}
}
}
/**********************************************************************/
void tmstart (void) //发送ds1820 开始转换
{
tmreset(); //复位
dmsec(1); //延时
tmwbyte(0xcc); //跳过序列号命令
tmwbyte(0x44); //发转换命令 44H,
}   
/**********************************************************************/                
void tmrtemp (void) //读取温度
{
unsigned char a,b;
tmreset (); //复位
dmsec (1); //延时
tmwbyte (0xcc); //跳过序列号命令
tmwbyte (0xbe); //发送读取命令
a = tmrbyte (); //读取低位温度
b = tmrbyte (); //读取高位温度
if(b>0x7f) //最高位为1 时温度是负
{a=~a; b=~b+1; //补码转换，取反加一
fg=0; //读取温度为负时fg=0
}
sdata = a/16+b*16; //整数部分
xiaoshu1 = (a&0x0f)*10/16; //小数第一位
xiaoshu2 = (a&0x0f)*100/16%10;//小数
xiaoshu=xiaoshu1*10+xiaoshu2; //小数
}
/**********************************************************************/
void DS18B20PRO(void)
{ 
tmstart();

tmrtemp(); //读取温度,执行完毕温度将存于
}

/**********************************************************************/
void Led()
{
if(fg==1) //温度为正时显示的数据
{ 
P2=P2&0xef;
P0=seg7code[sdata/10]; //输
Delay(2); P2=P2|0xf0; P2=P2&0xdf;
P0=seg7code[sdata%10]&0x7f;//输出个
Delay(2); P2=P2|0xf0; P2=P2&0xbf;
P0=seg7code[xiaoshu1]; //输出小数点
Delay(2); P2=P2|0xf0; P2=P2&0x7f;
P0=seg7code[xiaoshu2]; //输出小
Delay(2); P2=P2|0xf0;
}

if(fg==0) //温度为负时显示的数据
{ P2=P2&0xef;
P0=seg7code[11]; //负号
Delay(8); P2=P2|0xf0; P2=P2&0xdf;
P0=seg7code[sdata/10]&0x7f; //输出十位
Delay(8); P2=P2|0xf0; P2=P2&0xbf;
P0=seg7code[sdata%10]; //输出个位
Delay(8); P2=P2|0xf0;              P2=P2&0x7f;
P0=seg7code[xiaoshu1]; //输出小
Delay(4); P2=P2|0xf0;
} 
}
main()
{fg=1;
while(1)
{
DS18B20PRO();
Led();

}
}
