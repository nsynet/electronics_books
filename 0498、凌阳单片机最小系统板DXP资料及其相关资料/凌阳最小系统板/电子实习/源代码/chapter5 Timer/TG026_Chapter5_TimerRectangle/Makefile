#####################################################################
#																	 
#	Created by u'nSP IDE		16:42:03	07/09/03
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

INCLUDES	= -I"F:/电子竞赛/C语言应用篇/Source Code/chapter5 Timer/TG026_Chapter5_TimerRectangle"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\TG026_Chapter5_TimerRectangle.S37"

ARYFILE	= "$(OUTDIR)\TG026_Chapter5_TimerRectangle.ary"

SBMFILE	= "$(OUTDIR)\TG026_Chapter5_TimerRectangle.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter5 Timer\TG026_Chapter5_TimerRectangle\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter5 Timer\TG026_Chapter5_TimerRectangle\Resource.asm" 

"$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter5 Timer\TG026_Chapter5_TimerRectangle\TG026_Chapter5_TimerRectangle_Main.c" ".\SPCE061.H" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/TG026_Chapter5_TimerRectangle_Main.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter5 Timer/TG026_Chapter5_TimerRectangle/TG026_Chapter5_TimerRectangle_Main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.lst" -o "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.obj" "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.asm" 


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
	$(RM) "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.obj" 
	$(RM) "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.lst" 
	$(RM) "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

