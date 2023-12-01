#####################################################################
#																	 
#	Created by u'nSP IDE		18:08:17	11/24/05
#
#####################################################################




APPDIR	= C:\PROGRA~1\Sunplus\UNSPID~1.0

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"I:/1disktest/C_Code/chapter4 SystemSetup/WatchDog"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\WatchDog.S37"

ARYFILE	= "$(OUTDIR)\WatchDog.ary"

SBMFILE	= "$(OUTDIR)\WatchDog.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\Watchdog.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter4 SystemSetup\WatchDog\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter4 SystemSetup\WatchDog\Resource.asm" 

"$(OUTDIR)\Watchdog.asm": "I:\1disktest\C_Code\chapter4 SystemSetup\WatchDog\Watchdog.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/Watchdog.asm" "I:/1disktest/C_Code/chapter4 SystemSetup/WatchDog/Watchdog.c" 

"$(OUTDIR)\Watchdog.obj": "$(OUTDIR)\Watchdog.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Watchdog.lst" -o "$(OUTDIR)\Watchdog.obj" "$(OUTDIR)\Watchdog.asm" 


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

