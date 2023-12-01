#ifndef __TYPEDEF_H__
#define __TYPEDEF_H__

typedef unsigned char   UINT8;
typedef unsigned int	UINT16;
typedef unsigned long   UINT32;     

typedef char            INT8;
typedef int             INT16;
typedef long            INT32;

#ifdef __C51__
typedef bit             BOOL;
#else
typedef UINT8           BOOL;
#endif

typedef void *          LPVOID;


#endif