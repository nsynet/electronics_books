#ifndef	__DIG_h__
#define	__DIG_h__
//	write your header here
void DIG_Init(void);
void DIG_Set(const unsigned DigPos, const unsigned DigBuffer);
void DIG_SetAll(const unsigned *DigBuffer);
unsigned DIG_Get(const unsigned DigPos);
unsigned *DIG_GetAll(const unsigned *DigBuffer);
void DIG_Clear(void);
void DIG_Drive(void);
void DIG_Off(void);
void DIG_On(void);

#endif
