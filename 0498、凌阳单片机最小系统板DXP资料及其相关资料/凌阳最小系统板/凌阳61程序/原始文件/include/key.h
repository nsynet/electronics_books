#ifndef	__KEY_h__
#define	__KEY_h__
//	write your header here

void Key_Init(void);
void Key_Scan(void);
unsigned Key_Get(void);

#define KEY_0		0x88
#define KEY_1		0x84
#define KEY_2		0x82
#define KEY_3		0x81
#define KEY_4		0x48
#define KEY_5		0x44
#define KEY_6		0x42
#define KEY_7		0x41
#define KEY_8		0x28
#define KEY_9		0x24
#define KEY_A		0x22
#define KEY_B		0x21
#define KEY_C		0x18
#define KEY_D		0x14
#define KEY_E		0x12
#define KEY_F		0x11

#define PAD_1		KEY_0
#define	PAD_2		KEY_1
#define	PAD_3		KEY_2
#define	PAD_4		KEY_4
#define	PAD_5		KEY_5
#define	PAD_6		KEY_6
#define	PAD_7		KEY_8
#define	PAD_8		KEY_9
#define	PAD_9		KEY_A
#define PAD_0		KEY_D
#define PAD_STAR	KEY_C
#define PAD_POUND	KEY_E
#define PAD_PGUP	KEY_3
#define PAD_PGDN	KEY_7
#define PAD_ENTER	KEY_B
#define PAD_ESC		KEY_F

#endif
