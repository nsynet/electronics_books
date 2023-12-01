#####################################################################
#																	 
#	Created by u'nSP IDE		16:41:39	07/09/03
#
#####################################################################




APPDIR	= E:\PROGRA~1\Sunplus\UNSPID~3\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/电子竞赛/C语言应用篇/Source Code/chapter4 SystemSetup/WatchDog"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\WatchDog.S37"

ARYFILE	= "$(OUTDIR)\WatchDog.ary"

SBMFILE	= "$(OUTDIR)\WatchDog.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\Watchdog.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter4 SystemSetup\WatchDog\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter4 SystemSetup\WatchDog\Resource.asm" 

"$(OUTDIR)\Watchdog.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter4 SystemSetup\WatchDog\Watchdog.c" ".\SPCE061.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/Watchdog.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter4 SystemSetup/WatchDog/Watchdog.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Watchdog.lst" -o "$(OUTDIR)\Watchdog.obj" "$(OUTDIR)\Watchdog.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\Watchdog.obj" 
	$(RM) "$(OUTDIR)\Watchdog.lst" 
	$(RM) "$(OUTDIR)\Watchdog.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

