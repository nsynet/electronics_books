#####################################################################
#																	 
#	Created by u'nSP IDE		08:53:30	11/25/05
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

INCLUDES	= -I"I:/1disktest/C_Code/chapter5 Timer/TG026_Chapter5_TimerRectangle"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\TG026_Chapter5_TimerRectangle.S37"

ARYFILE	= "$(OUTDIR)\TG026_Chapter5_TimerRectangle.ary"

SBMFILE	= "$(OUTDIR)\TG026_Chapter5_TimerRectangle.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter5 Timer\TG026_Chapter5_TimerRectangle\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter5 Timer\TG026_Chapter5_TimerRectangle\Resource.asm" 

"$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.asm": "I:\1disktest\C_Code\chapter5 Timer\TG026_Chapter5_TimerRectangle\TG026_Chapter5_TimerRectangle_Main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/TG026_Chapter5_TimerRectangle_Main.asm" "I:/1disktest/C_Code/chapter5 Timer/TG026_Chapter5_TimerRectangle/TG026_Chapter5_TimerRectangle_Main.c" 

"$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.obj": "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.lst" -o "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.obj" "$(OUTDIR)\TG026_Chapter5_TimerRectangle_Main.asm" 


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

