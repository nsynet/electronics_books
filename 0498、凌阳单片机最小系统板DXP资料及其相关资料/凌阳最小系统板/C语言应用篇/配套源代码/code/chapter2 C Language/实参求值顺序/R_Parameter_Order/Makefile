#####################################################################
#																	 
#	Created by u'nSP IDE		10:30:00	11/25/05
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

INCLUDES	= -I"I:/1disktest/R_Parameter_Order"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\R_Parameter_Order.S37"

ARYFILE	= "$(OUTDIR)\R_Parameter_Order.ary"

SBMFILE	= "$(OUTDIR)\R_Parameter_Order.sbm"

OPT	= -S -gstabs -Wall -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\shican.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\R_Parameter_Order\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\R_Parameter_Order\Resource.asm" 

"$(OUTDIR)\shican.asm": "I:\1disktest\R_Parameter_Order\shican.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/shican.asm" "I:/1disktest/R_Parameter_Order/shican.c" 

"$(OUTDIR)\shican.obj": "$(OUTDIR)\shican.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\shican.lst" -o "$(OUTDIR)\shican.obj" "$(OUTDIR)\shican.asm" 


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
	$(RM) "$(OUTDIR)\shican.obj" 
	$(RM) "$(OUTDIR)\shican.lst" 
	$(RM) "$(OUTDIR)\shican.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

