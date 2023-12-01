#ifndef	__PRTF_H__
#define	__PRTF_H__
//	write your header here

extern void Printf_Init(unsigned int Port_Number);
extern int  Printf(char *format,...);
extern void Printf_End();

#endif
