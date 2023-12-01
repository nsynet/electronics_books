#####################################################################
#																	 
#	Created by u'nSP IDE		11:41:24	07/11/03
#
#####################################################################




APPDIR	= D:\PROGRA~1\Sunplus\UNSPID~2\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"E:/ele_competition/voice/a2000_manual" -I"../../../Include"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\a2000_manual.S37"

ARYFILE	= "$(OUTDIR)\a2000_manual.ary"

SBMFILE	= "$(OUTDIR)\a2000_manual.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\A32_16K_a20.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\hardware.obj" 

"$(OUTDIR)\A32_16K_a20.res": "E:\ele_competition\voice\a2000_manual\voice\A32_16K.a20"
	$(RESC) "E:\ele_competition\voice\a2000_manual\voice\A32_16K.a20" "$(OUTDIR)\A32_16K_a20.res" RES_A32_16K_A20 

"$(OUTDIR)\Resource.obj": "E:\ele_competition\voice\a2000_manual\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "E:\ele_competition\voice\a2000_manual\Resource.asm" 

"$(OUTDIR)\main.obj": "E:\ele_competition\voice\a2000_manual\main.c" ".\a2000.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "E:/ele_competition/voice/a2000_manual/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\isr.obj": "E:\ele_competition\voice\a2000_manual\isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "E:\ele_competition\voice\a2000_manual\isr.asm" 

"$(OUTDIR)\hardware.obj": "E:\ele_competition\voice\a2000_manual\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "E:\ele_competition\voice\a2000_manual\hardware.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\A32_16K_a20.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

