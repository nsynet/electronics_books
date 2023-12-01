#####################################################################
#																	 
#	Created by u'nSP IDE		17:54:13	11/24/05
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

INCLUDES	= -I"I:/1disktest/C_Code/chapter2 C Language/ASMcallC"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\ASMcallC.S37"

ARYFILE	= "$(OUTDIR)\ASMcallC.ary"

SBMFILE	= "$(OUTDIR)\ASMcallC.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\ADD.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter2 C Language\ASMcallC\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter2 C Language\ASMcallC\Resource.asm" 

"$(OUTDIR)\main.obj": "I:\1disktest\C_Code\chapter2 C Language\ASMcallC\main.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "I:\1disktest\C_Code\chapter2 C Language\ASMcallC\main.asm" 

"$(OUTDIR)\ADD.asm": "I:\1disktest\C_Code\chapter2 C Language\ASMcallC\ADD.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ADD.asm" "I:/1disktest/C_Code/chapter2 C Language/ASMcallC/ADD.c" 

"$(OUTDIR)\ADD.obj": "$(OUTDIR)\ADD.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ADD.lst" -o "$(OUTDIR)\ADD.obj" "$(OUTDIR)\ADD.asm" 


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
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\ADD.obj" 
	$(RM) "$(OUTDIR)\ADD.lst" 
	$(RM) "$(OUTDIR)\ADD.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

