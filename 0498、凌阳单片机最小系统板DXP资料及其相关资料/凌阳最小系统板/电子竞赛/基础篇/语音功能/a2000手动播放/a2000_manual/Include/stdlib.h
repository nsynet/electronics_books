#ifndef  _STDLIB_H_
#define  _STDLIB_H_

#include "sys/reent.h"

typedef struct 
{
  int quot; /* quotient */
  int rem; /* remainder */
} div_t;

typedef struct 
{
  long quot; /* quotient */
  long rem; /* remainder */
} ldiv_t;

#ifndef NULL
#define NULL 0
#endif

//#define	RAND_MAX 0x7fffffff
#if INT_MAX == 32767
#define __RAND_MAX 32767
#else
#define __RAND_MAX 0x7fffffff
#endif

#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0

int    		__ten_mul(float *acc, int digit);
float		__adjust(struct _reent *ptr, float *acc, int dexp, int sign);
const float	__exp10(unsigned x);
void assert(int expression);

//extern int error_massage;
extern int abs(int);
extern int atoi(char*s);
extern int strtoi(char *s,char **endptr,int radix); 
extern long int atol(char *s);
extern long int strtol(char *s,char **endptr,int radix);
extern float atoff(char*s);
extern double atof(char*s);
extern double strtod(char *s,char **endptr);
extern float strtodf(char *s,char **endptr);
extern int *bsearch(void*key,char*base, int nmemb, int size, int (*compare)(char *, char*)); 
extern div_t div(int number,int denom);
extern ldiv_t ldiv(long int number,long int denom);
extern long int labs(long int);
extern int rand(void);
extern int rand_r(unsigned int *seed);
extern unsigned long int strtoul(char *s,char **endptr,int radix);
extern char * dtoa(double,int,int,int *,int*,char**);
extern char * _dtoa_r(struct _reent *,double,int,int,int *,int*,char**);

/*---------------------------------------------------------*/
#define		wchar_t  	char
extern int	mblen(const char *s, unsigned int  n);
extern int  _mblen_r(struct _reent *,const char *s, unsigned int n, int *state);
extern int   mbtowc(wchar_t *pwc, const char *s, int n);
extern int   mbtowcs(wchar_t *pwc, const char *s, int n);
extern int _mbtowc_r(struct _reent *,wchar_t  *pwc,const char  *s,unsigned n, int *state);
extern int  _mbstowcs_r(struct _reent *r, wchar_t  *pwcs, const char *s, int n, int state);

extern int wcstombs(char *s,const wchar_t *pwcs,int n);
extern int _wcstombs_r(struct _reent *,char *s,const wchar_t *pwcs,int n,int *state);
extern int wctomb(char *s, wchar_t);
extern int _wctomb_r(struct _reent *, char *, wchar_t, int *state);

extern unsigned long int strtoul_r(struct _reent *,char *s,char **endptr,int radix);
extern void srand(unsigned __seed);

#define ENV_LOCK __env_lock(reent_ptr)
#define ENV_UNLOCK __env_unlock(reent_ptr)

extern char *ecvtf(float , int , int *, int *);
extern char *fcvtf(float , int , int *, int *);
extern char *gcvtf(float , int , char*);

extern int random();
extern long srandom(unsigned __seed);

extern void*	malloc(int __size);
extern void*	_malloc_r(struct _reent *, int  __size);
extern void*	calloc( int __nmemb, int __size);
extern void*	_calloc_r(struct _reent *, int  __nmemb,int  __size);
extern void*	realloc(void* __r,int __size);
extern void* 	_realloc_r(struct _reent *,void* _r,int __size);
extern void*   __malloc_lock(struct _reent *);
extern void*   __malloc_unlock(struct _reent *);

extern __env_lock(struct _reent *);
extern __env_unlock(struct _reent *);
extern char* strdup(const char *__string);	
//extern char* strchr(const char *__string, int c);
extern char* getenv(const char *__string);
extern char* _getenv_r(struct _reent *, const char *__string);
extern char * _findenv(const char *__string, int *offset);
extern char * _findenv_r(struct _reent *,const char *__string, int *offset);

extern int setenv(const char *__string, const char *__value, int __overwrite);
extern int _setenv_r(struct _reent *, const char *__string, const char *__value, int __overwrite);
extern void unsetenv(const char *__string);
extern void unsetenv_r(struct _reent *, const char *__string);
extern int    putenv(const char *__string);
extern void   free(void *block);
extern void   cfree(void*block);
extern void   _free_r(struct _reent *, void *block);

extern int getopt(int nargc,char * const *nargv,const char *ostr);


extern int  atexit(void (*__func)(void));
extern void exit(int code);
extern void abort(void);
extern void __eprintf (const char *format,const char *file,unsigned int line,const char *expression);


extern void _malloc_stats_r (struct _reent *);
extern void  _mstats_r(struct _reent *,char *s);
extern void mstats(char *s);

extern int   system(const char *);//*__string);
extern int  _system_r (struct _reent *, char *__string);


#endif /* _STDLIB_H_ */

