#####################################################################
#																	 
#	Created by u'nSP IDE		18:06:38	11/24/05
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

INCLUDES	= -I"I:/1disktest/C_Code/chapter2 C Language/pointer"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\pointer.S37"

ARYFILE	= "$(OUTDIR)\pointer.ary"

SBMFILE	= "$(OUTDIR)\pointer.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\pointer.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter2 C Language\pointer\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter2 C Language\pointer\Resource.asm" 

"$(OUTDIR)\pointer.asm": "I:\1disktest\C_Code\chapter2 C Language\pointer\pointer.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/pointer.asm" "I:/1disktest/C_Code/chapter2 C Language/pointer/pointer.c" 

"$(OUTDIR)\pointer.obj": "$(OUTDIR)\pointer.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\pointer.lst" -o "$(OUTDIR)\pointer.obj" "$(OUTDIR)\pointer.asm" 


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
	$(RM) "$(OUTDIR)\pointer.obj" 
	$(RM) "$(OUTDIR)\pointer.lst" 
	$(RM) "$(OUTDIR)\pointer.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

