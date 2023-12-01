#include <pgmspace.h>
#include "kb.h"
#include "serial.h"
#include "gpr.h"
#include "scancodes.h"
#define BUFF_SIZE 64
unsigned char edge, bitcount;				// 0 =符号. 1 = 正号.
unsigned char kb_buffer[BUFF_SIZE];
unsigned char *inpt, *outpt;
unsigned char buffcnt;
void init_kb(void)
{
inpt = kb_buffer;						// 初始化缓冲区
outpt = kb_buffer;
buffcnt = 0;
MCUCR = 2; 						// INT0 中断，下降沿触发
edge = 0;							// 0 = 下降沿； 1 = 上升沿
bitcount = 11;
}
interrupt [INT0_vect] void INT0_interrupt(void)
{
static unsigned char data;					// 保持接受扫描码的状态
if (!edge)							// 下降沿触发中断服务程序
{
if(bitcount < 11 && bitcount > 2)		// 3到10位是数据,
{								// 忽略起始和停止位
data = (data >> 1);
if(PIND & 8)
data = data | 0x80;				// 存储一个'1'
}
MCUCR = 3;						// 用上升沿引发中断
edge = 1;
}
else 
{									// 上升沿触发中断服务程序
MCUCR = 2;						// 用下降沿引发中断
edge = 0;
if(--bitcount == 0)					//  接受到所有的数据位
{
decode(data);
bitcount = 11;
}
}
}

void decode(unsigned char sc)
{
static unsigned char is_up=0, shift = 0, mode = 0;
unsigned char i;
if (!is_up)							// 最后一位数据接受
{
switch (sc)
{
case 0xF0 :					// 确定完成键
is_up = 1;
break;
case 0x12 :					// 左SHIFT按键
shift = 1;
break;
case 0x59 :					// 右SHIFT按键
shift = 1;
break;
case 0x05 :					// F1键
if(mode == 0)
mode = 1;					// 进入按键扫描码模式
if(mode == 2)
mode = 3;					// 离开按键扫描码模式
break;
default:
if(mode == 0 || mode == 3)			// ASCII 模式
{
if(!shift)					//如果没有SHIFT键按下,
{ 						// 查表
for(i = 0; unshifted[i][0]!=sc && unshifted[i][0]; i++);
if (unshifted[i][0] == sc) 
{
put_kbbuff(unshifted[i][1]);
}
} 
else 
{						// 如果SHIFT键按下
for(i = 0; shifted[i][0]!=sc && shifted[i][0]; i++);
if (shifted[i][0] == sc) 
{
put_kbbuff(shifted[i][1]);
}
}
}
else
{ 							// 扫描键盘码模式
print_hexbyte(sc);			// 显示模式
put_kbbuff(' ');
put_kbbuff(' ');
}
break;
}
}
else 
{
is_up = 0;					// 2个 0xF0在一列中是不允许的
switch (sc)
{
case 0x12 :				// 左 SHIFT
shift = 0;
break;
case 0x59 :				// 右SHIFT
shift = 0;
break;
case 0x05 :				// F1
if(mode == 1)
mode = 2;
if(mode == 3)
mode = 0;
break;
case 0x06 :				// F2
clr();
break;
}
}
}

void put_kbbuff(unsigned char c)
{
if (buffcnt<BUFF_SIZE)				// 若缓冲区为空
{
*inpt = c;					// 在缓冲区中输入一个字符
inpt++; 						// 指针加1
buffcnt++;
if (inpt >= kb_buffer + BUFF_SIZE)	// 指针判断
inpt = kb_buffer;
}
}
int getchar(void)
{
int byte;
while(buffcnt == 0);					// 等待数据
byte = *outpt;						// 取数据
outpt++;							// 指针加1
if (outpt >= kb_buffer + BUFF_SIZE)		// 指针比较
outpt = kb_buffer;
buffcnt--;							// 缓冲区减去1
return byte;
} 

