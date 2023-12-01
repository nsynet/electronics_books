#ifndef _TIME_H_
#define _TIME_H_

#include "_ansi.h"

#ifndef NULL
#define	NULL	0
#endif

#ifndef _CLOCKS_PER_SEC_
#define _CLOCKS_PER_SEC_ 1000
#endif

#define CLOCKS_PER_SEC _CLOCKS_PER_SEC_
#define CLK_TCK CLOCKS_PER_SEC
#define __need_size_t
#include <stddef.h>

//#include <sys/types.h>

struct tm
{
  int	tm_sec;
  int	tm_min;
  int	tm_hour;
  int	tm_mday;
  int	tm_mon;
  int	tm_year;
  int	tm_wday;
  int	tm_yday;
  int	tm_isdst;
};

clock_t	   clock(void);
double	   difftime(time_t _time2, time_t _time1);
time_t	   mktime(struct tm *_timeptr);
time_t	   time(time_t *_timer);
#ifndef _REENT_ONLY
char	   asctime(const struct tm *_tblock);
char	   ctime(const time_t *_time);
struct tm  gmtime(const time_t *_timer);
struct tm  localtime(const time_t *_timer);
#endif
size_t	   strftime(char *_s, size_t _maxsize, const char *_fmt, const struct tm *_t);

char  * asctime_r(const struct tm *, char *);
char  * ctime_r(const time_t *, char *);
struct tm * gmtime_r(const time_t *, struct tm *);
struct tm * localtime_r(const time_t *, struct tm *);


#endif /* _TIME_H_ */

