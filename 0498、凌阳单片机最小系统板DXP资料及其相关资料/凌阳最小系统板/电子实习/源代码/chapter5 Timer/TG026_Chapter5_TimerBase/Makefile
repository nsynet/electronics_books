#####################################################################
#																	 
#	Created by u'nSP IDE		16:42:15	07/09/03
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

INCLUDES	= -I"F:/电子竞赛/C语言应用篇/Source Code/chapter5 Timer/TG026_Chapter5_TimerBase"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\TG026_Chapter5_TimerBase.S37"

ARYFILE	= "$(OUTDIR)\TG026_Chapter5_TimerBase.ary"

SBMFILE	= "$(OUTDIR)\TG026_Chapter5_TimerBase.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\TG026_Chapter5_TimeBase_Main.obj" \
	"$(OUTDIR)\ISR.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter5 Timer\TG026_Chapter5_TimerBase\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter5 Timer\TG026_Chapter5_TimerBase\Resource.asm" 

"$(OUTDIR)\TG026_Chapter5_TimeBase_Main.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter5 Timer\TG026_Chapter5_TimerBase\TG026_Chapter5_TimeBase_Main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/TG026_Chapter5_TimeBase_Main.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter5 Timer/TG026_Chapter5_TimerBase/TG026_Chapter5_TimeBase_Main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TG026_Chapter5_TimeBase_Main.lst" -o "$(OUTDIR)\TG026_Chapter5_TimeBase_Main.obj" "$(OUTDIR)\TG026_Chapter5_TimeBase_Main.asm" 

"$(OUTDIR)\ISR.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter5 Timer\TG026_Chapter5_TimerBase\ISR.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ISR.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter5 Timer/TG026_Chapter5_TimerBase/ISR.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ISR.lst" -o "$(OUTDIR)\ISR.obj" "$(OUTDIR)\ISR.asm" 


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
	$(RM) "$(OUTDIR)\TG026_Chapter5_TimeBase_Main.obj" 
	$(RM) "$(OUTDIR)\TG026_Chapter5_TimeBase_Main.lst" 
	$(RM) "$(OUTDIR)\TG026_Chapter5_TimeBase_Main.asm" 
	$(RM) "$(OUTDIR)\ISR.obj" 
	$(RM) "$(OUTDIR)\ISR.lst" 
	$(RM) "$(OUTDIR)\ISR.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

