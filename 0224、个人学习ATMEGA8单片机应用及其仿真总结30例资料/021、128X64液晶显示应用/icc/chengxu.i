#line 1 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"


#line 19 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"
#line 1 "C:/icc/include/iom16v.h"




#line 7 "C:/icc/include/iom16v.h"


#line 10 "C:/icc/include/iom16v.h"


#line 13 "C:/icc/include/iom16v.h"


#line 16 "C:/icc/include/iom16v.h"
























































































































































































































































































































































































































































































































#line 20 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"
#line 1 "C:/icc/include/macros.h"






























#line 35 "C:/icc/include/macros.h"














void _StackCheck(void);
void _StackOverflowed(char);




#line 21 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"
#line 1 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc/delay.h"

#line 5 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc/delay.h"

 void delay_1us(void);
 void delay_nus(unsigned int n);
 void delay_1ms(void) ;
 void delay_nms(unsigned int n) ;



void delay_1us(void)
  {
   asm("nop");
  }

void delay_nus(unsigned int n)
  {
   unsigned int i=0;
   for (i=0;i<n;i++)
   delay_1us();
  }

void delay_1ms(void)
  {
   unsigned int i;
   for (i=0;i<1140;i++);
  }

void delay_nms(unsigned int n)
  {
   unsigned int i=0;
   for (i=0;i<n;i++)
   {
      delay_1ms();
   }
  }
#line 22 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"
unsigned char CurOffset,CurRow,CurPage,CurCol;









volatile unsigned char *LCD_DIR_PORT = &(*(volatile unsigned char *)0x3A);
volatile unsigned char *LCD_IP_PORT  = &(*(volatile unsigned char *)0x39);
volatile unsigned char *LCD_OP_PORT  = &(*(volatile unsigned char *)0x3B);

volatile unsigned char *LCD_EN_PORT  = &(*(volatile unsigned char *)0x38);
volatile unsigned char *LCD_CS2_PORT = &(*(volatile unsigned char *)0x38);
volatile unsigned char *LCD_CS1_PORT = &(*(volatile unsigned char *)0x38);
volatile unsigned char *LCD_RW_PORT  = &(*(volatile unsigned char *)0x38);
volatile unsigned char *LCD_DI_PORT  = &(*(volatile unsigned char *)0x38);

char LCD_EN_BIT  =(1 << (4));
char LCD_CS2_BIT =(1 << (3));
char LCD_CS1_BIT =(1 << (2));
char LCD_RW_BIT  =(1 << (1));
char LCD_DI_BIT  =(1 << (0));





















void LCD_BUSY(unsigned char lr)
{
    unsigned char status;
    asm("cli");
    if(lr== 0)
    {
 *LCD_CS2_PORT &= ~LCD_CS2_BIT;
 *LCD_CS1_PORT |= LCD_CS1_BIT;
    }
    else
    {
 *LCD_CS2_PORT |= LCD_CS2_BIT;
 *LCD_CS1_PORT &= ~LCD_CS1_BIT;
    }
 *LCD_DI_PORT &= ~LCD_DI_BIT;
    *LCD_DIR_PORT = 0x00;
    *LCD_OP_PORT = 0xff;
 *LCD_RW_PORT |= LCD_RW_BIT;
 *LCD_EN_PORT |= LCD_EN_BIT;
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    while((*LCD_IP_PORT) & 0x80)
    {
 *LCD_EN_PORT &= ~LCD_EN_BIT;
        asm("nop");
        asm("nop");
        asm("nop");
        asm("nop");
 *LCD_EN_PORT |= LCD_EN_BIT;
        asm("nop");
        asm("nop");
        asm("nop");
        asm("nop");
    }
 *LCD_EN_PORT &= ~LCD_EN_BIT;
 *LCD_RW_PORT &= ~LCD_RW_BIT;
    *LCD_OP_PORT = 0xff;
    asm("sei");
}

void write_LCD(unsigned char lr,unsigned char cd,unsigned char data)
{
    asm("cli");
    LCD_BUSY(lr);
    if(cd== 0)
    {
 *LCD_DI_PORT &= ~LCD_DI_BIT;
    }
    else
    {
 *LCD_DI_PORT |= LCD_DI_BIT;
    }
 *LCD_RW_PORT &= ~LCD_RW_BIT;
 *LCD_EN_PORT |= LCD_EN_BIT;
    *LCD_DIR_PORT = 0xff;
    *LCD_OP_PORT = data;
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
 *LCD_EN_PORT &= ~LCD_EN_BIT;
    *LCD_OP_PORT = 0xff;
    asm("sei");
}
unsigned char read_LCD(unsigned char lr)
{
    unsigned char data;
    asm("cli");
    LCD_BUSY(lr);
 *LCD_DI_PORT |= LCD_DI_BIT;
    *LCD_DIR_PORT = 0x00;
    *LCD_OP_PORT = 0xff;
 *LCD_RW_PORT |= LCD_RW_BIT;
 *LCD_EN_PORT |= LCD_EN_BIT;
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    data=*LCD_IP_PORT;
 *LCD_EN_PORT &= ~LCD_EN_BIT;
 *LCD_RW_PORT &= ~LCD_RW_BIT;
    LCD_BUSY(lr);
 *LCD_DI_PORT |= LCD_DI_BIT;
    *LCD_DIR_PORT = 0x00;
    *LCD_OP_PORT = 0xff;
 *LCD_RW_PORT |= LCD_RW_BIT;
 *LCD_EN_PORT |= LCD_EN_BIT;
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    data=*LCD_IP_PORT;
 *LCD_EN_PORT &= ~LCD_EN_BIT;
 *LCD_RW_PORT &= ~LCD_RW_BIT;

    asm("sei");
    return data;
}

void set_start_line_L(unsigned char line)
{
    write_LCD(0,0,0xc0|line);
}

void set_start_line_R(unsigned char line)
{
    write_LCD(1,0,0xc0|line);
}

void set_page_L(unsigned char page)
{
    write_LCD(0,0,0xb8|page);
}
void set_page_R(unsigned char page)
{
    write_LCD(1,0,0xb8|page);
}

void set_col_addr_L(unsigned char col)
{
    write_LCD(0,0,0x40|col);
}

void set_col_addr_R(unsigned char col)
{
    write_LCD(1,0,0x40|col);
}

void init_lcd(void)
{
    set_start_line_L(0);
    set_start_line_R(0);
    write_LCD(0,0,0x3f);
    write_LCD(1,0,0x3f);
}

void clr_lcd(void)
{
    unsigned char pages,i;
    for(pages=0;pages<8;pages++)
    {
        set_page_L(pages);
        set_page_R(pages);
        for(i=0;i<64;i++)
        {
            set_col_addr_L(i);
            set_col_addr_R(i);
            write_LCD(0,1,0x0);
            write_LCD(1,1,0x0);
        }
    }
}





typedef struct typFNT_ASC16
{
    char Index[1];
    char Msk[16];
};

{
"1",0x00,0x00,0x08,0x08,0xFC,0x00,0x00,0x00,0x00,0x00,0x04,0x04,0x07,0x04,0x04,0x00,
"2",0x00,0x00,0x08,0x04,0x84,0x44,0x38,0x00,0x00,0x00,0x06,0x05,0x04,0x04,0x04,0x00,
"3",0x00,0x00,0x08,0x04,0x44,0x44,0xB8,0x00,0x00,0x00,0x02,0x04,0x04,0x04,0x03,0x00,
"4",0x00,0x00,0x80,0x60,0x18,0xFC,0x00,0x00,0x00,0x00,0x01,0x01,0x05,0x07,0x05,0x00,
"5",0x00,0x00,0x7C,0x44,0x44,0x44,0x84,0x00,0x00,0x00,0x02,0x04,0x04,0x04,0x03,0x00,
"6",0x00,0x00,0xF0,0x48,0x44,0x44,0x80,0x00,0x00,0x00,0x03,0x04,0x04,0x04,0x03,0x00,
"7",0x00,0x00,0x0C,0x04,0x84,0x64,0x1C,0x00,0x00,0x00,0x00,0x06,0x01,0x00,0x00,0x00,
"8",0x00,0x00,0xB8,0x44,0x44,0x44,0xB8,0x00,0x00,0x00,0x03,0x04,0x04,0x04,0x03,0x00,
"9",0x00,0x00,0x38,0x44,0x44,0x44,0xF8,0x00,0x00,0x00,0x00,0x04,0x04,0x02,0x01,0x00,
"0",0x00,0x00,0xF8,0x04,0x04,0x04,0xF8,0x00,0x00,0x00,0x03,0x04,0x04,0x04,0x03,0x00,
".",0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,
",",0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x04,0x00,0x00,0x00,
":",0x00,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,
";",0x00,0x00,0x00,0x00,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x04,0x00,0x00,0x00,
"-",0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
"_",0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,
"A",0x00,0x00,0x80,0x64,0x1C,0x60,0x80,0x00,0x00,0x04,0x07,0x05,0x01,0x05,0x07,0x04,
"B",0x00,0x04,0xFC,0x44,0x44,0x44,0x44,0xB8,0x00,0x04,0x07,0x04,0x04,0x04,0x04,0x03,
"C",0x00,0xF0,0x08,0x04,0x04,0x04,0x04,0x08,0x00,0x01,0x02,0x04,0x04,0x04,0x04,0x02,
"D",0x00,0x04,0xFC,0x04,0x04,0x04,0x08,0xF0,0x00,0x04,0x07,0x04,0x04,0x04,0x02,0x01,
"E",0x00,0x04,0xFC,0x44,0x44,0xE4,0x04,0x0C,0x00,0x04,0x07,0x04,0x04,0x04,0x04,0x06,
"F",0x00,0x04,0xFC,0x44,0x44,0xE4,0x04,0x0C,0x00,0x04,0x07,0x04,0x04,0x00,0x00,0x00,
" ",0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
"=",0x00,0x00,0xA0,0xA0,0xA0,0xA0,0xA0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
"(",0x00,0x00,0x00,0xE0,0x18,0x04,0x00,0x00,0x00,0x00,0x00,0x03,0x0C,0x10,0x00,0x00,
")",0x00,0x00,0x00,0x04,0x18,0xE0,0x00,0x00,0x00,0x00,0x00,0x10,0x0C,0x03,0x00,0x00,
"V",0x00,0x04,0x3C,0xC4,0x00,0xC4,0x3C,0x04,0x00,0x00,0x00,0x01,0x06,0x01,0x00,0x00,
"m",0x00,0x20,0xE0,0x20,0xC0,0x20,0xC0,0x00,0x00,0x04,0x07,0x00,0x07,0x00,0x07,0x04,
"H",0x00,0x04,0xFC,0x44,0x40,0x44,0xFC,0x04,0x00,0x04,0x07,0x04,0x00,0x04,0x07,0x04,
"*",0x90,0x90,0x60,0xFC,0x60,0x90,0x90,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x00,
};




typedef struct typFNT_GB16
{
	char Index[2];
	char Msk[24];
};
__flash struct typFNT_GB16  GB_16[] = {
"科",0x8A,0x6A,0xFE,0x29,0x49,0x80,0x92,0xA4,0x80,0xFF,0x40,0x00,0x01,0x00,0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x07,0x00,0x00,
"技",0x44,0x44,0xFF,0x24,0x00,0x64,0xA4,0x3F,0xA4,0x64,0x04,0x00,0x04,0x04,0x07,0x00,0x04,0x04,0x02,0x01,0x02,0x04,0x04,0x00,
"有",0x42,0x22,0x12,0xFA,0x4E,0x4B,0x4A,0x4A,0xFA,0x02,0x02,0x00,0x00,0x00,0x00,0x07,0x01,0x01,0x01,0x05,0x07,0x00,0x00,0x00,
"限",0xFF,0x81,0x99,0xE7,0x00,0xFF,0x25,0xE5,0x25,0xBF,0x40,0x00,0x07,0x00,0x00,0x00,0x00,0x07,0x04,0x02,0x01,0x02,0x04,0x00,
"公",0x20,0x10,0x08,0x07,0xC0,0x30,0x83,0x0C,0x10,0x20,0x20,0x00,0x00,0x04,0x06,0x05,0x04,0x04,0x02,0x03,0x06,0x00,0x00,0x00,
"司",0x08,0x09,0xE9,0x29,0x29,0x29,0xED,0x09,0x01,0xFF,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x04,0x04,0x07,0x00,0x00,
"液",0x19,0xE2,0x14,0x42,0xF2,0x2E,0x72,0x8F,0xAA,0x7A,0x02,0x00,0x01,0x07,0x00,0x00,0x07,0x04,0x04,0x02,0x01,0x02,0x04,0x00,
"晶",0x00,0xC0,0x40,0x5F,0xD5,0x15,0xD5,0x55,0x5F,0x40,0xC0,0x00,0x00,0x07,0x05,0x05,0x07,0x00,0x07,0x05,0x05,0x05,0x07,0x00,
"显",0x00,0x40,0x9F,0x15,0xD5,0x15,0xD5,0x15,0x1F,0xC0,0x00,0x00,0x04,0x04,0x05,0x04,0x07,0x04,0x07,0x06,0x05,0x04,0x04,0x00,
"示",0x10,0x12,0x92,0x52,0x12,0xF2,0x12,0x12,0x53,0x92,0x10,0x00,0x02,0x01,0x00,0x04,0x04,0x07,0x00,0x00,0x00,0x00,0x03,0x00,
"的",0xFC,0x44,0x46,0x45,0xFC,0x10,0x2C,0xC7,0x04,0x04,0xFC,0x00,0x07,0x02,0x02,0x02,0x07,0x00,0x00,0x04,0x04,0x04,0x03,0x00,
"第",0x04,0xEA,0xAB,0xAE,0xAA,0xFC,0xAA,0xAB,0xAE,0xBA,0x82,0x00,0x04,0x04,0x02,0x01,0x00,0x07,0x00,0x02,0x02,0x02,0x01,0x00,
"一",0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x20,0x30,0x20,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
"行",0x48,0x24,0xF3,0x08,0x09,0x09,0x09,0x09,0xF9,0x09,0x08,0x00,0x00,0x00,0x07,0x00,0x00,0x04,0x04,0x04,0x07,0x00,0x00,0x00,
"二",0x00,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x06,0x04,0x00,0x00,0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x00,
"三",0x00,0x02,0x22,0x22,0x22,0x22,0x22,0x22,0x23,0x02,0x00,0x00,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x06,0x04,0x00,
"四",0x00,0xFF,0x81,0x41,0x3F,0x01,0x01,0xFF,0x81,0x81,0xFF,0x00,0x00,0x07,0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x07,0x00,
"五",0x00,0x11,0x11,0x91,0x7F,0x11,0x11,0x11,0xF1,0x01,0x00,0x00,0x04,0x04,0x04,0x07,0x04,0x04,0x04,0x04,0x07,0x04,0x04,0x00,
};

unsigned char GetPage(void)
{
	return CurPage;
}

unsigned char GetCol(void)
{
	return CurCol;
}

void SetPageCol(unsigned char upage, unsigned char ucol)
{
	CurPage = upage;
	CurCol = ucol;
	if(ucol<64)
	{
		set_page_L(upage);
		set_col_addr_L(ucol);
	}
	else
	{
		set_page_R(upage);
		set_col_addr_R(ucol-64);
	}
}


void SetRowCol(unsigned char urow, unsigned char ucol)
{
	unsigned char page;
	CurRow = urow;
	CurCol = ucol;

	switch(urow)
	{
		case 1:
			page=0;
			CurOffset=1;
			break;
		case 2:
			page=1;
			CurOffset=2;
			break;
		case 3:
			page=3;
			CurOffset=1;
			break;
		case 4:
			page=4;
			CurOffset=2;
			break;
		case 5:
			page=6;
			CurOffset=1;
			break;
	}
	SetPageCol(page,ucol);
}

void disp_ch(unsigned char c)
{
	unsigned char k,j,uPage,uCol,ch_r,ch_w;
	unsigned char width;
	unsigned char len;
	uPage = GetPage();
	uCol = GetCol();
	len=sizeof(ASC_16)/sizeof(ASC_16[0]);
	for(k=0;k<len;k++)
	{
		if(c == ASC_16[k].Index[0] ) break;
	}
	if(k<len)
	{

		if(c=='-'||c==':')
			width= 8 -2;
		else if(c=='|')
			width= 12 - 8;
		else
			width= 8;

		if(CurOffset==1)
		{
			for(j=0;j<width;j++)
			{
				SetPageCol(uPage,uCol+j);
				ch_w=ASC_16[k].Msk[j];
				if(uCol+j<64)	write_LCD(0,1,ch_w);
				else write_LCD(1,1,ch_w);
			}
			SetPageCol(uPage+1,uCol);

			for(j=0;j<width;j++)
			{
				SetPageCol(uPage+1,uCol+j);
				if(uCol+j<64) ch_r=read_LCD(0);
				else ch_r=read_LCD(1);
				ch_r&=0xf0;
				ch_w=ASC_16[k].Msk[8 +j]&0x0f;
				ch_w|=ch_r;
				SetPageCol(uPage+1,uCol+j);
				if(uCol+j<64)	write_LCD(0,1,ch_w);
				else write_LCD(1,1,ch_w);
			}
		}
		else
		{
			for(j=0;j<width;j++)
			{
				SetPageCol(uPage,uCol+j);
				if(uCol+j<64) ch_r=read_LCD(0);
				else ch_r=read_LCD(1);
				ch_r&=0x0f;
				ch_w=ASC_16[k].Msk[j];
				ch_w=ch_w<<4;
				ch_w|=ch_r;
				SetPageCol(uPage,uCol+j);
				if(uCol+j<64)	write_LCD(0,1,ch_w);
				else write_LCD(1,1,ch_w);
			}
			SetPageCol(uPage+1,uCol);
			for(j=0;j<width;j++)
			{
				SetPageCol(uPage+1,uCol+j);

				ch_r=ASC_16[k].Msk[j];
				ch_w=ASC_16[k].Msk[8 +j];
				ch_r=ch_r>>4;
				ch_w=ch_w<<4;
				ch_w|=ch_r;
				SetPageCol(uPage+1,uCol+j);
				if(uCol+j<64)	write_LCD(0,1,ch_w);
				else write_LCD(1,1,ch_w);
			}
		}
	}
	SetPageCol(uPage,uCol+width);
}


void disp_hz(unsigned char *hz)
{
	unsigned char k,j,uPage,uCol,ch_r,ch_w;
	uPage = GetPage();
	uCol = GetCol();
	for(k=0;k<sizeof(GB_16)/sizeof(GB_16[0]);k++)
	{
		if(hz[0] == GB_16[k].Index[0] && hz[1] == GB_16[k].Index[1])
			break;
	}

	if(CurOffset==1)
	{
	for(j=0;j< 12;j++)
	{
		SetPageCol(uPage,uCol+j);
		ch_w=GB_16[k].Msk[j];
		if(uCol+j<64)	write_LCD(0,1,ch_w);
		else write_LCD(1,1,ch_w);
	}
	SetPageCol(uPage+1,uCol);

	for(j=0;j< 12;j++)
	{
		SetPageCol(uPage+1,uCol+j);
		if(uCol+j<64) ch_r=read_LCD(0);
		else ch_r=read_LCD(1);
		ch_r&=0xf0;
		ch_w=GB_16[k].Msk[12 +j]&0x0f;
		ch_w|=ch_r;
		SetPageCol(uPage+1,uCol+j);
		if(uCol+j<64)	write_LCD(0,1,ch_w);
		else write_LCD(1,1,ch_w);
	}
	SetPageCol(uPage,uCol+ 12);
	}

	else
	{
	for(j=0;j< 12;j++)
	{
		SetPageCol(uPage,uCol+j);
		if(uCol+j<64) ch_r=read_LCD(0);
		else ch_r=read_LCD(1);
		ch_r&=0x0f;
		ch_w=GB_16[k].Msk[j];
		ch_w=ch_w<<4;
		ch_w|=ch_r;
		SetPageCol(uPage,uCol+j);
		if(uCol+j<64)	write_LCD(0,1,ch_w);
		else write_LCD(1,1,ch_w);
	}
	SetPageCol(uPage+1,uCol);
	for(j=0;j< 12;j++)
	{
		SetPageCol(uPage+1,uCol+j);

		ch_r=GB_16[k].Msk[j];
		ch_w=GB_16[k].Msk[12 +j];
		ch_r=ch_r>>4;
		ch_w=ch_w<<4;
		ch_w|=ch_r;
		SetPageCol(uPage+1,uCol+j);
		if(uCol+j<64)	write_LCD(0,1,ch_w);
		else write_LCD(1,1,ch_w);
	}
	SetPageCol(uPage,uCol+ 12);
	}
}

void disp_str(unsigned char *p)
{
	unsigned char i=0;
	while(p[i]>0)
	{
		if(p[i] < 128)
		{
			disp_ch(p[i]);
		}
		else
		{
			disp_hz(&p[i]);
			i++;
		}
		i++;
	}
}





void pixel(unsigned char xx,unsigned char yy,unsigned char flag)
{
	unsigned int y,ch;
	ch=yy%8;

	y=1;
	for(;ch!=0;)
		{
			y=y*2;
			ch--;
		}
	if(xx<64)
		{
			set_page_L(yy/8);
			set_col_addr_L(xx);
			ch=read_LCD(0);
			set_col_addr_L(xx);
			if(flag)
				write_LCD(0,1,ch|y);
			else
			{
				y=~y;
				ch&=y;
				write_LCD(0,1,ch|y);
			}
		}
	else
		{
			set_page_R(yy/8);
			set_col_addr_R(xx-64);
			ch=read_LCD(1);
			set_col_addr_R(xx-64);
			if(flag)
				write_LCD(1,1,ch|y);
			else
			{
				y=~y;
				ch&=y;
				write_LCD(1,1,ch|y);
			}
		}
}

#line 582 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"






#line 623 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"






#line 693 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"
void Linexy(unsigned char x0,unsigned char y0,unsigned char xt,unsigned char yt,unsigned char s)
{
	register unsigned char t;
	int xerr=0,yerr=0,delta_x,delta_y,distance;
	int incx,incy,uRow,uCol;

	delta_x = xt-x0;
	delta_y = yt-y0;
	uRow = x0;
	uCol = y0;
	if(delta_x>0) incx=1;
	else if( delta_x==0 ) incx=0;
		else {incx=-1;delta_x=-delta_x;}

	if(delta_y>0) incy=1;
	else if( delta_y==0 ) incy=0;
		else {incy=-1;delta_y=-delta_y;}

	if( delta_x > delta_y )	distance=delta_x;
	else distance=delta_y;

	for( t=0;t <= distance+1; t++ )
        	{
		pixel(uRow,uCol,s);
		xerr +=	delta_x	;
		yerr +=	delta_y	;

		if( xerr > distance )
                	{
			xerr-=distance;
			uRow+=incx;
			}
		if( yerr > distance )
                	{
			yerr-=distance;
			uCol+=incy;
			}
		}
}




void circle(unsigned char Ox,unsigned char Oy,unsigned char Rx,unsigned char s)
{
	unsigned int xx,rr,xt,yt,rs,row,col;
	yt=Rx;
	rr=Rx*Rx+1;
	rs=(yt+(yt>>1))>>1;
	for (xt=0;xt<=rs;xt++)
	{
		xx=xt*xt;
		while ((yt*yt)>(rr-xx))yt--;
		row=Ox+xt;
		col=Oy-yt;
		pixel(row,col,s);
		row=Ox-xt;
		pixel(row,col,s);
		col=Oy+yt;
		pixel(row,col,s);
		row=Ox+xt;
		pixel(row,col,s);



		row=Ox+yt;
		col=Oy-xt;
		pixel(row,col,s);
		row=Ox-yt;
		pixel(row,col,s);
		col=Oy+xt;
		pixel(row,col,s);
		row=Ox+yt;
		pixel(row,col,s);
	}
}
void delay(int tt)
{
 	 int i;
	 int j;
	 while((j++)>1000000)
	 {
	     for(i=0;i<tt;i++)
	     {
 asm("nop");
	     }
	}
}

void main()
{
unsigned int i;

(*(volatile unsigned char *)0x37) = 0xff;
init_lcd();

SetRowCol(1,0);
disp_str("液晶显示的第1行");
SetRowCol(2,0);
disp_str("液晶显示的第2行");
SetRowCol(3,0);
disp_str("液晶显示的第3行");
SetRowCol(4,0);
disp_str("液晶显示的第4行");
SetRowCol(5,0);
disp_str("液晶显示的第5行");









while(1);


}



#line 817 "D:\MYDOCU~1\AVR单片机应用系统开发经典实例\021、128X64液晶显示应用\icc\chengxu.c"

