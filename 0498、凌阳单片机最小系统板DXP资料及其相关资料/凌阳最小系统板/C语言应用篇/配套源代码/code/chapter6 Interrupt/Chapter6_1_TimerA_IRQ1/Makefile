#####################################################################
#																	 
#	Created by u'nSP IDE		08:54:34	11/25/05
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

INCLUDES	= -I"I:/1disktest/C_Code/chapter6 Interrupt/Chapter6_1_TimerA_IRQ1"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\Chapter6_1_TimerA_IRQ1.S37"

ARYFILE	= "$(OUTDIR)\Chapter6_1_TimerA_IRQ1.ary"

SBMFILE	= "$(OUTDIR)\Chapter6_1_TimerA_IRQ1.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\TimerA_IRQ1_Main.obj" \
	"$(OUTDIR)\ISR.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter6 Interrupt\Chapter6_1_TimerA_IRQ1\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter6 Interrupt\Chapter6_1_TimerA_IRQ1\Resource.asm" 

"$(OUTDIR)\TimerA_IRQ1_Main.asm": "I:\1disktest\C_Code\chapter6 Interrupt\Chapter6_1_TimerA_IRQ1\TimerA_IRQ1_Main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/TimerA_IRQ1_Main.asm" "I:/1disktest/C_Code/chapter6 Interrupt/Chapter6_1_TimerA_IRQ1/TimerA_IRQ1_Main.c" 

"$(OUTDIR)\TimerA_IRQ1_Main.obj": "$(OUTDIR)\TimerA_IRQ1_Main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TimerA_IRQ1_Main.lst" -o "$(OUTDIR)\TimerA_IRQ1_Main.obj" "$(OUTDIR)\TimerA_IRQ1_Main.asm" 

"$(OUTDIR)\ISR.asm": "I:\1disktest\C_Code\chapter6 Interrupt\Chapter6_1_TimerA_IRQ1\ISR.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ISR.asm" "I:/1disktest/C_Code/chapter6 Interrupt/Chapter6_1_TimerA_IRQ1/ISR.c" 

"$(OUTDIR)\ISR.obj": "$(OUTDIR)\ISR.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ISR.lst" -o "$(OUTDIR)\ISR.obj" "$(OUTDIR)\ISR.asm" 


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
	$(RM) "$(OUTDIR)\TimerA_IRQ1_Main.obj" 
	$(RM) "$(OUTDIR)\TimerA_IRQ1_Main.lst" 
	$(RM) "$(OUTDIR)\TimerA_IRQ1_Main.asm" 
	$(RM) "$(OUTDIR)\ISR.obj" 
	$(RM) "$(OUTDIR)\ISR.lst" 
	$(RM) "$(OUTDIR)\ISR.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

