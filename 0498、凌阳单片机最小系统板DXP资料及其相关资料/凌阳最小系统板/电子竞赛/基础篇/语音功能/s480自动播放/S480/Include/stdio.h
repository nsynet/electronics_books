/*
revision:
2002-5-28: remove printf_end by wangwenyan
*/

#ifndef _STDIO_H_
#define	_STDIO_H_

#include "_ansi.h"

#define	_FSTDIO			/* ``function stdio'' */

#define __need_size_t
#include <stddef.h>

#define __need___va_list
#include <stdarg.h>

/*
 * <sys/reent.h> defines __sFILE, _fpos_t.
 * They must be defined there because struct _reent needs them (and we don't
 * want reent.h to include this file.
 */

#include "sys/reent.h"

typedef _fpos_t fpos_t;

typedef struct __sFILE FILE;

#define	__SLBF	0x0001		/* line buffered */
#define	__SNBF	0x0002		/* unbuffered */
#define	__SRD	0x0004		/* OK to read */
#define	__SWR	0x0008		/* OK to write */
	/* RD and WR are never simultaneously asserted */
#define	__SRW	0x0010		/* open for reading & writing */
#define	__SEOF	0x0020		/* found EOF */
#define	__SERR	0x0040		/* found error */
#define	__SMBF	0x0080		/* _buf is from malloc */
#define	__SAPP	0x0100		/* fdopen()ed in append mode - so must  write to end */
#define	__SSTR	0x0200		/* this is an sprintf/snprintf string */
#define	__SOPT	0x0400		/* do fseek() optimisation */
#define	__SNPT	0x0800		/* do not do fseek() optimisation */
#define	__SOFF	0x1000		/* set iff _offset is in fact correct */
#define	__SMOD	0x2000		/* true => fgetline modified _p text */


/*
 * The following three definitions are for ANSI C, which took them
 * from System V, which stupidly took internal interface macros and
 * made them official arguments to setvbuf(), without renaming them.
 * Hence, these ugly _IOxxx names are *supposed* to appear in user code.
 *
 * Although these happen to match their counterparts above, the
 * implementation does not rely on that (so these could be renumbered).
 */
#define	_IOFBF	0		/* setvbuf should set fully buffered */
#define	_IOLBF	1		/* setvbuf should set line buffered */
#define	_IONBF	2		/* setvbuf should set unbuffered */

#ifndef NULL
#define	NULL	0
#endif

#define	BUFSIZ	1024
#define	EOF	(-1)

#define	FOPEN_MAX	20	/* must be <= OPEN_MAX <sys/syslimits.h> */
#define	FILENAME_MAX	1024	/* must be <= PATH_MAX <sys/syslimits.h> */
#define	L_tmpnam	1024	/* XXX must be == PATH_MAX */
#ifndef __STRICT_ANSI__
#define P_tmpdir        "/tmp"
#endif

#ifndef SEEK_SET
#define	SEEK_SET	0	/* set file offset to offset */
#endif
#ifndef SEEK_CUR
#define	SEEK_CUR	1	/* set file offset to current plus offset */
#endif
#ifndef SEEK_END
#define	SEEK_END	2	/* set file offset to EOF plus offset */
#endif

#define	TMP_MAX		26

#define	stdin	(_impure_ptr->_stdin)
#define	stdout	(_impure_ptr->_stdout)
#define	stderr	(_impure_ptr->_stderr)

#define _stdin_r(x)	((x)->_stdin)
#define _stdout_r(x)	((x)->_stdout)
#define _stderr_r(x)	((x)->_stderr)

/*
 * Functions defined in ANSI C standard.
 */


#define __VALIST char*


#ifndef _REENT_ONLY
extern int remove(const char *);
extern int rename(const char *, const char *);
#endif
extern char *	tempnam(const char *, const char *);
extern FILE *	tmpfile(void);
extern char *	tmpnam(char *);
extern int	fclose(FILE *);
extern int	fflush(FILE *);
extern FILE *	freopen(const char *, const char *, FILE *);
extern void	setbuf(FILE *, char *);
extern int	setvbuf(FILE *, char *, int, size_t);
extern int	fprintf(FILE *, const char *, ...);
extern int	fscanf(FILE *, const char *, ...);
//int	printf(const char *, ...);
extern void printf_init(unsigned int outport_number);
extern int  printf(const char *format,...);
//extern void printf_end();			//2002-5-28: remove by wangwenyan

extern int	scanf(const char *, ...);
extern void scanf_init(unsigned int Port_Number);			//2002-5-17 add

extern int	sscanf(const char *, const char *, ...);
extern int	vfprintf(FILE *, const char *, __VALIST);
extern int	vprintf(const char *, __VALIST);
extern int	vsprintf(char *, const char *, __VALIST);
extern int	vsnprintf(char *, size_t, const char *, __VALIST);
extern int	fgetc(FILE *);
extern char *  fgets(char *, int, FILE *);
extern int	fputc(int, FILE *);
extern int	fputs(const char *, FILE *);
extern int	getc(FILE *);
extern int	getchar(void);
extern char *  gets(char *);
extern int	putc(int, FILE *);
extern int	putchar(int);
extern int	puts(const char *);
extern int	ungetc(int, FILE *);
extern size_t	fread(_PTR, size_t _size, size_t _n, FILE *);
extern size_t	fwrite(const _PTR , size_t _size, size_t _n, FILE *);
extern int	fgetpos(FILE *, fpos_t *);
extern int	fseek(FILE *, long, int);
extern int	fsetpos(FILE *, const fpos_t *);
extern long	ftell(FILE *);
extern void	rewind(FILE *);
extern void	clearerr(FILE *);
extern int	feof(FILE *);
extern int	ferror(FILE *);
extern void     perror(const char *);
#ifndef _REENT_ONLY
extern FILE *	fopen(const char *_name, const char *_type);
extern int	sprintf(char *, const char *, ...);
extern int	snprintf(char *, size_t, const char *, ...);
#endif
#ifndef __STRICT_ANSI__
extern int	vfiprintf(FILE *, const char *, __VALIST);
extern int	iprintf(const char *, ...);
extern int	fiprintf(FILE *, const char *, ...);
extern int	siprintf(char *, const char *, ...);
#endif

/*
 * Routines in POSIX 1003.1.
 */

#ifndef __STRICT_ANSI__
#ifndef _REENT_ONLY
FILE *	fdopen(int, const char *);
#endif
extern int	fileno(FILE *);
extern int	getw(FILE *);
extern int	pclose(FILE *);
extern FILE *  popen(const char *, const char *);
extern int	putw(int, FILE *);
#endif

/*
 * Recursive versions of the above.
 */

extern FILE *	_fdopen_r(struct _reent *, int, const char *);
extern FILE *	_fopen_r(struct _reent *, const char *, const char *);
extern int	_getchar_r(struct _reent *);
extern char *	_gets_r(struct _reent *, char *);
extern int	_iprintf_r(struct _reent *, const char *, ...);
extern int	_mkstemp_r(struct _reent *, char *);
extern char *	_mktemp_r(struct _reent *, char *);
extern void	_perror_r(struct _reent *, const char *);
extern int	_printf_r(struct _reent *, const char *, ...);
extern int	_putchar_r(struct _reent *, int);
extern int	_puts_r(struct _reent *, const char *);
extern int	_remove_r(struct _reent *, const char *);
extern int	_rename_r(struct _reent *, const char *_old, const char *_new);
extern int	_scanf_r(struct _reent *, const char *, ...);
extern int	_sprintf_r(struct _reent *, char *, const char *, ...);
extern int	_snprintf_r(struct _reent *, char *, size_t, const char *, ...);
extern char *	_tempnam_r(struct _reent *, const char *, const char *);
extern FILE *	_tmpfile_r(struct _reent *);
extern char *	_tmpnam_r(struct _reent *, char *);
extern int	_vfprintf_r(struct _reent *, FILE *, const char *, __VALIST);
extern int	_vprintf_r(struct _reent *, const char *, __VALIST);
extern int	vsprintf_r(struct _reent *, char *, const char *, __VALIST);
extern int	vsnprintf_r(struct _reent *, char *, size_t, const char *, __VALIST);

/*
 * Routines internal to the implementation.
 */

extern int	__srget(FILE *);
extern int	__swbuf(int, FILE *);


/*
 * The __sfoo macros are here so that we can 
 * define function versions in the C library.
 */
#define       __sgetc_raw(p) (--(p)->_r < 0 ? __srget(p) : (int)(*(p)->_p++))

#define __sgetc(p) __sgetc_raw(p)



#define       __sputc_raw(c, p) \
	(--(p)->_w < 0 ? \
		(p)->_w >= (p)->_lbfsize ? \
			(*(p)->_p = (c)), *(p)->_p != '\n' ? \
				(int)*(p)->_p++ : \
				__swbuf('\n', p) : \
			__swbuf((int)(c), p) : \
		(*(p)->_p = (c), (int)*(p)->_p++))

#define __sputc(c, p) __sputc_raw(c, p)


#define	__sfeof(p)	(((p)->_flags & __SEOF) != 0)
#define	__sferror(p)	(((p)->_flags & __SERR) != 0)
#define	__sclearerr(p)	((void)((p)->_flags &= ~(__SERR|__SEOF)))
#define	__sfileno(p)	((p)->_file)

#define	feof(p)		__sfeof(p)
#define	ferror(p)	__sferror(p)
#define	clearerr(p)	__sclearerr(p)

#if 0 /*ndef __STRICT_ANSI__ - FIXME: must initialize stdio first, use fn */
#define	fileno(p)	__sfileno(p)
#endif

#define	getc(fp)	__sgetc(fp)
#define putc(x, fp)	__sputc(x, fp)


#define	getchar()	getc(stdin)
#define	putchar(x)	putc(x, stdout)

#ifndef __STRICT_ANSI__
/* fast always-buffered version, true iff error */
#define	fast_putc(x,p) (--(p)->_w < 0 ? \
	__swbuf((int)(x), p) == EOF : (*(p)->_p = (x), (p)->_p++, 0))

#define	L_cuserid	9		/* posix says it goes in stdio.h :( */
#endif


#endif /* _STDIO_H_ */
