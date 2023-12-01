#ifndef	__4096_h__
#define	__4096_h__
//	write your header here
void SP_SIOInitial(void);
void SP_SIOSendAByte(unsigned long Addr, unsigned int Data);
unsigned int SP_SIOReadAByte(unsigned long Addr);
void SP_SIOSendAWord(unsigned long Addr, unsigned int Data);
unsigned int SP_SIOReadAWord(unsigned long Addr);
void SP_SIOMassErase(void);
void SP_SIOSectorErase(unsigned int Sector);

#endif
