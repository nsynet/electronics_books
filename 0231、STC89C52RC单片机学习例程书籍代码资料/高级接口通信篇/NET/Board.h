#ifndef __BOARD_H__
#define __BOARD_H__

#include "stc.h"



#define		CS_ENJ		0x10
#define		SI_ENJ		0x20
#define		SO_ENJ		0x40
#define		SCK_ENJ		0x80
#define		MSK_ENJ		0xB0  


#define		INT_ENJ		0x04
#define		RST_ENJ		0x08

#define     NET_PORT    P1


sbit CS	               =P1^4;
sbit MOSI              =P1^5;
sbit MISO              =P1^6;
sbit SCLK              =P1^7;


#endif
