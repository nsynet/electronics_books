#ifndef __GLOBAL_H__
#define __GLOBAL_H__
#include <intrins.h>

typedef unsigned char   UINT8;
typedef unsigned int	UINT16;
typedef unsigned long   UINT32;  
typedef char            INT8;
typedef int             INT16;
typedef long            INT32;
typedef unsigned char   BOOL;


#define CODE            code

#define NOP()              _nop_() 
#define HIGH               1
#define LOW                0
#define NULL              (void *)0

#define TRUE               1
#define FALSE              0


extern void DelayNus(UINT16 t);
extern void DelayNms(UINT16 t);


typedef union _WORD2BYTE
{
	UINT16 m_word;
    UINT8  m_byte[2];

}WORD2BYTE;

extern BOOL BufCpy(UINT8 * dest,UINT8 * src,UINT32 size);
extern void itoa(UINT32 val,UINT8 *str,UINT8 DecOrHex);



#endif
