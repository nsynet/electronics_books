#####################################################################
#																	 
#	Created by u'nSP IDE		09:35:24	08/18/05
#
#####################################################################




APPDIR	= C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/2005年7月工作USBUART/Demo1_UART"

BODY	= -body SPCE060A_061A -bfile "d:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\Demo1_UART.S37"

ARYFILE	= "$(OUTDIR)\Demo1_UART.ary"

SBMFILE	= "$(OUTDIR)\Demo1_UART.sbm"

OPT	= -S -gstabs -Wall 

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "F:\2005年7月工作USBUART\Demo1_UART\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\2005年7月工作USBUART\Demo1_UART\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\2005年7月工作USBUART\Demo1_UART\main.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "F:\2005年7月工作USBUART\Demo1_UART\main.asm" 


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
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

