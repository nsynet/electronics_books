/* math.h -- Definitions for the math floating point package.  */

#ifndef  _MATH_H_
#define  _MATH_H_

#define	HUGE_VAL	(float)3.40282346638528860e+38

/* 
 * set X_TLOSS = pi*2**52
 */

#define X_TLOSS		1.41484755040568800000e+16 


struct complex
{
	float x;
	float y;
};

#define cabsf(z)     (hypot  ((z).x, (z).y))


/* Reentrant ANSI C functions.  */
extern double atan(double);
extern double cos(double);
extern double sin(double);
extern double tan(double);
extern double tanh(double);
extern double frexp(double, int *);
extern double modf(double, double *);
extern double ceil(double);
extern double fabs(double);
extern double floor(double);

/* Non reentrant ANSI C functions.  */
extern double acos(double);
extern double asin(double);
extern double atan2(double, double);
extern double cosh(double);
extern double sinh(double);
extern double exp(double);
extern double ldexp(double, int);
extern double log(double);
extern double log10(double);
extern double pow(double, double);
extern double sqrt(double);
extern double fmod(double, double);

/* Non ANSI double precision functions.  */
extern double infinity(void);
extern double nan(void);
extern int isnan(double);
extern int isinf(double);
extern int finite(double);
extern double copysign(double, double);
extern int ilogb(double);

extern double asinh(double);
extern double cbrt(double);
extern double nextafter(double, double);
extern double rint(double);
extern double scalbn(double, int);

extern double log1p(double);
extern double expm1(double);

extern double acosh(double);
extern double atanh(double);
extern double remainder(double, double);
extern double gamma(double);
extern double gamma_r(double, int *);
extern double lgamma(double);
extern double lgamma_r(double, int *);
extern double erf(double);
extern double erfc(double);
extern double y0(double);
extern double y1(double);
extern double yn(int, double);
extern double j0(double);
extern double j1(double);
extern double jn(int, double);
extern double poly(double x,int n,double c[]);
#define log2(x) (log (x) / M_LOG2_E)

extern double hypot(double, double);

//extern double cabs(struct complex z);
extern double drem(double, double);

/* Single precision versions of ANSI functions.  */
extern float atanf(float);
extern float cosf(float);
extern float sinf(float);
extern float tanf(float);
extern float tanhf(float);
extern float frexpf(float, int *);
extern float modff(float, float *);
extern float ceilf(float);
extern float fabsf(float);
extern float floorf(float);

extern float acosf(float);
extern float asinf(float);
extern float atan2f(float, float);
extern float coshf(float);
extern float sinhf(float);
extern float expf(float);
extern float ldexpf(float, int);
extern float logf(float);
extern float log10f(float);
extern float powf(float, float);
extern float sqrtf(float);
extern float fmodf(float, float);

/* Other single precision functions.  */

extern float infinityf(void);
extern float nanf(void);
extern int isnanf(float);
extern int isinff(float);
extern int finitef(float);
extern float copysignf(float, float);
extern int ilogbf(float);

extern float asinhf(float);
extern float cbrtf(float);
extern float nextafterf(float, float);
extern float rintf(float);
extern float scalbnf(float, int);
extern float log1pf(float);
extern float expm1f(float);

extern float acoshf(float);
extern float atanhf(float);
extern float remainderf(float, float);
extern float gammaf(float);
extern float gammaf_r(float, int *);
extern float lgammaf(float);
extern float lgammaf_r(float, int *);
extern float erff(float);
extern float erfcf(float);
extern float y0f(float);
extern float y1f(float);
extern float ynf(int, float);
extern float j0f(float);
extern float j1f(float);
extern float jnf(int, float);
extern float polyf(float x,int n,float c[]);
#define log2f(x) (logf (x) / (float) M_LOG2_E)
extern float hypotf(float, float);

//extern float cabsf(struct complex z);
extern float dremf(float, float);

/* The gamma functions use a global variable, signgam.  */

extern int signgam;

/* The exception structure passed to the matherr routine.  */

#ifdef __cplusplus
struct __exception 
#else
struct exception 
#endif
{
  int type;
  char *name;
  double arg1;
  double arg2;
  double retval;
  int err;
};

#ifdef __cplusplus
extern int matherr(struct __exception *e);
#else
extern int matherr(struct exception *e);
#endif

/* Values for the type field of struct exception.  */

#define DOMAIN 1
#define SING 2
#define OVERFLOW 3
#define UNDERFLOW 4
#define TLOSS 5
#define PLOSS 6

/* Useful constants.  */

#define M_E		2.7182818284590452354
#define M_LOG2E		1.4426950408889634074
#define M_LOG10E	0.43429448190325182765
#define M_LN2		0.69314718055994530942
#define M_LN10		2.30258509299404568402
#define M_PI		3.14159265358979323846
#define M_TWOPI         (M_PI * 2.0)
#define M_PI_2		1.57079632679489661923
#define M_PI_4		0.78539816339744830962
#define M_3PI_4		2.3561944901923448370E0
#define M_SQRTPI        1.77245385090551602792981
#define M_1_PI		0.31830988618379067154
#define M_2_PI		0.63661977236758134308
#define M_2_SQRTPI	1.12837916709551257390
#define M_SQRT2		1.41421356237309504880
#define M_SQRT1_2	0.70710678118654752440
#define M_LN2LO         1.9082149292705877000E-10
#define M_LN2HI         6.9314718036912381649E-1
#define M_SQRT3   	1.73205080756887719000
#define M_IVLN10        0.43429448190325182765 /* 1 / log(10) */
#define M_LOG2_E        0.693147180559945309417
#define M_INVLN2        1.4426950408889633870E0  /* 1 / log(2) */



/* CYGNUS LOCAL: Default to XOPEN_MODE.  */
#define _XOPEN_MODE

#define	HUGE	((float)3.40282346638528860e+38)

/* 
 * set X_TLOSS = pi*2**52, which is possibly defined in <values.h>
 * (one may replace the following line by "#include <values.h>")
 */

#define X_TLOSS		1.41484755040568800000e+16 

/* Functions that are not documented, and are not in <math.h>.  */

extern double logb(double);
#ifdef _SCALB_INT
extern double scalb(double, int);
#else
extern double scalb(double, double);
#endif
extern double significand(double);

/* ieee style elementary functions */
extern double __ieee754_sqrt(double);			
extern double __ieee754_acos(double);			
extern double __ieee754_acosh(double);			
extern double __ieee754_log(double);			
extern double __ieee754_atanh(double);			
extern double __ieee754_asin(double);			
extern double __ieee754_atan2(double,double);			
extern double __ieee754_exp(double);
extern double __ieee754_cosh(double);
extern double __ieee754_fmod(double,double);
extern double __ieee754_pow(double,double);
extern double __ieee754_lgamma_r(double,int *);
extern double __ieee754_gamma_r(double,int *);
extern double __ieee754_log10(double);
extern double __ieee754_sinh(double);
extern double __ieee754_hypot(double,double);
extern double __ieee754_j0(double);
extern double __ieee754_j1(double);
extern double __ieee754_y0(double);
extern double __ieee754_y1(double);
extern double __ieee754_jn(int,double);
extern double __ieee754_yn(int,double);
extern double __ieee754_remainder(double,double);
extern long __ieee754_rem_pio2(double,double*);
#ifdef _SCALB_INT
extern double __ieee754_scalb(double,int);
#else
extern double __ieee754_scalb(double,double);
#endif

/* fdlibm kernel function */
extern double __kernel_standard(double,double,int);
extern double __kernel_sin(double,double,int);
extern double __kernel_cos(double,double);
extern double __kernel_tan(double,double,int);
//extern int    __kernel_rem_pio2 __P((double*,double*,int,int,int,const __int32_t*));
extern int    __kernel_rem_pio2(double*,double*,int,int,int,const int*);	

/* Undocumented float functions.  */
extern float logbf(float);
#ifdef _SCALB_INT
extern float scalbf(float, int);
#else
extern float scalbf(float, float);
#endif
extern float significandf(float);

/* ieee style elementary float functions */
extern float __ieee754_sqrtf(float);			
extern float __ieee754_acosf(float);			
extern float __ieee754_acoshf(float);			
extern float __ieee754_logf(float);			
extern float __ieee754_atanhf(float);			
extern float __ieee754_asinf(float);			
extern float __ieee754_atan2f(float,float);			
extern float __ieee754_expf(float);
extern float __ieee754_coshf(float);
extern float __ieee754_fmodf(float,float);
extern float __ieee754_powf(float,float);
extern float __ieee754_lgammaf_r(float,int *);
extern float __ieee754_gammaf_r(float,int *);
extern float __ieee754_log10f(float);
extern float __ieee754_sinhf(float);
extern float __ieee754_hypotf(float,float);
extern float __ieee754_j0f(float);
extern float __ieee754_j1f(float);
extern float __ieee754_y0f(float);
extern float __ieee754_y1f(float);
extern float __ieee754_jnf(int,float);
extern float __ieee754_ynf(int,float);
extern float __ieee754_remainderf(float,float);
extern long __ieee754_rem_pio2f(float,float*);
#ifdef _SCALB_INT
extern float __ieee754_scalbf(float,int);
#else
extern float __ieee754_scalbf(float,float);
#endif

/* float versions of fdlibm kernel functions */
extern float __kernel_sinf(float,float,int);
extern float __kernel_cosf(float,float);
extern float __kernel_tanf(float,float,int);
//extern int   __kernel_rem_pio2f(float*,float*,int,int,int,const __int32_t*);
extern int   __kernel_rem_pio2f(float*,float*,int,int,int,const int*);	




/* A union which permits us to convert between a float and a 32 bit
   int.  */

typedef union
{
  float value;
  long word;
} ieee_float_shape_type;

/* Get a 32 bit int from a float.  */

#define GET_FLOAT_WORD(i,d)					\
do {								\
  ieee_float_shape_type gf_u;					\
  gf_u.value = (d);						\
  (i) = gf_u.word;						\
} while (0)

/* Set a float from a 32 bit int.  */

#define SET_FLOAT_WORD(d,i)					\
do {								\
  ieee_float_shape_type sf_u;					\
  sf_u.word = (i);						\
  (d) = sf_u.value;						\
} while (0)


#endif /* _MATH_H_ */
