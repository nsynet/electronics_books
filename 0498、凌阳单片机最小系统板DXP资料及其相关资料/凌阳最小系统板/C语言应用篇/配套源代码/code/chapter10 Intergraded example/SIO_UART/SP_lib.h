#ifndef	__SP_LIB_H__
#define	__SP_LIB_H__
//	write your header here

//========================================================================================
// Progarm: The file be included by modules V1.0
// Arranged by: Arthur Shieh
// Plateform: SPCE , IDE 1.63, Windows 2000
//
// Date: 2002/09/29 V1.0: first version
//========================================================================================
//---------------------------------------------------------------------
//  I/O APIs
//---------------------------------------------------------------------
extern void SP_Init_IOA(unsigned int, unsigned int, unsigned int);
extern void SP_Init_IOB(unsigned int, unsigned int, unsigned int);
extern unsigned int SP_Import(unsigned int);
extern void SP_Export(unsigned int, unsigned int);

//---------------------------------------------------------------------
//  Key Scan APIs
//---------------------------------------------------------------------
extern SP_GetCh();
#endif
//---------------------------------------------------------------------
//  End of SP_LIB.h
//---------------------------------------------------------------------