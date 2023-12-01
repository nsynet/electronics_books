#ifndef __74LS164_H__
#define __74LS164_H__

#define LS164_DATA(x)       {if((x))P0_4=1;else P0_4=0;}         
#define LS164_CLK(x)        {if((x))P0_5=1;else P0_5=0;} 

extern void LS164Send(UINT8 byte);


#endif
