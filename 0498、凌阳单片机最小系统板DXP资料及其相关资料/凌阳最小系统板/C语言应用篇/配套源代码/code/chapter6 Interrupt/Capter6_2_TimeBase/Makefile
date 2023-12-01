#####################################################################
#																	 
#	Created by u'nSP IDE		08:54:12	11/25/05
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

INCLUDES	= -I"I:/1disktest/C_Code/chapter6 Interrupt/Capter6_2_TimeBase"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\Capter6_2_TimeBase.S37"

ARYFILE	= "$(OUTDIR)\Capter6_2_TimeBase.ary"

SBMFILE	= "$(OUTDIR)\Capter6_2_TimeBase.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\TimeBase_Main.obj" \
	"$(OUTDIR)\ISR.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter6 Interrupt\Capter6_2_TimeBase\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter6 Interrupt\Capter6_2_TimeBase\Resource.asm" 

"$(OUTDIR)\TimeBase_Main.asm": "I:\1disktest\C_Code\chapter6 Interrupt\Capter6_2_TimeBase\TimeBase_Main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/TimeBase_Main.asm" "I:/1disktest/C_Code/chapter6 Interrupt/Capter6_2_TimeBase/TimeBase_Main.c" 

"$(OUTDIR)\TimeBase_Main.obj": "$(OUTDIR)\TimeBase_Main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TimeBase_Main.lst" -o "$(OUTDIR)\TimeBase_Main.obj" "$(OUTDIR)\TimeBase_Main.asm" 

"$(OUTDIR)\ISR.asm": "I:\1disktest\C_Code\chapter6 Interrupt\Capter6_2_TimeBase\ISR.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ISR.asm" "I:/1disktest/C_Code/chapter6 Interrupt/Capter6_2_TimeBase/ISR.c" 

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
	$(RM) "$(OUTDIR)\TimeBase_Main.obj" 
	$(RM) "$(OUTDIR)\TimeBase_Main.lst" 
	$(RM) "$(OUTDIR)\TimeBase_Main.asm" 
	$(RM) "$(OUTDIR)\ISR.obj" 
	$(RM) "$(OUTDIR)\ISR.lst" 
	$(RM) "$(OUTDIR)\ISR.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

