#ifndef __LCD1602_H__
#define __LCD1602_H__




extern void LCD1602WriteByte(UINT8 byte);
extern void LCD1602WriteCommand(UINT8 command);
extern void LCD1602SetXY(UINT8 x,UINT8 y);
extern void LCD1602PrintfChar(UINT8 x,
                              UINT8 y,
                              UINT8 c);
/*							 
extern void LCD1602PrintfNChar(UINT8 x,
                                    UINT8 y,
                                    UINT8 *s,
                                    UINT8 l);*/
extern UINT8 LCD1602PrintfString(UINT8 x,
                                 UINT8 y,
                                 UINT8 *s);

extern void LCD1602ClearScreen(void);
extern void LCD1602Init(void);



#endif
