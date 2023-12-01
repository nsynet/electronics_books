#####################################################################
#																	 
#	Created by u'nSP IDE		22:00:26	07/09/03
#
#####################################################################




APPDIR	= D:\PROGRA~1\Sunplus\UNSPID~1\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/功能扩展/LcdSplc501Demo/splc501" -I"D:/Program Files/Sunplus/unSPIDE180/Include"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\splc501.S37"

ARYFILE	= "$(OUTDIR)\splc501.ary"

SBMFILE	= "$(OUTDIR)\splc501.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\Splc501sys.obj" \
	"$(OUTDIR)\Splc501var.obj" \
	"$(OUTDIR)\SPLC501Hardware.obj" \
	"$(OUTDIR)\SPLC501DisplayTAB.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\irq.obj" 

"$(OUTDIR)\Resource.obj": "F:\功能扩展\LcdSplc501Demo\splc501\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\功能扩展\LcdSplc501Demo\splc501\Resource.asm" 

"$(OUTDIR)\hardware.obj": "F:\功能扩展\LcdSplc501Demo\splc501\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\功能扩展\LcdSplc501Demo\splc501\hardware.asm" 

"$(OUTDIR)\Splc501sys.obj": "F:\功能扩展\LcdSplc501Demo\splc501\Splc501sys.asm" ".\hardware.inc" ".\splc501c_io.inc" ".\splc501c.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Splc501sys.lst" -o "$(OUTDIR)\Splc501sys.obj" "F:\功能扩展\LcdSplc501Demo\splc501\Splc501sys.asm" 

"$(OUTDIR)\Splc501var.obj": "F:\功能扩展\LcdSplc501Demo\splc501\Splc501var.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Splc501var.lst" -o "$(OUTDIR)\Splc501var.obj" "F:\功能扩展\LcdSplc501Demo\splc501\Splc501var.asm" 

"$(OUTDIR)\SPLC501Hardware.obj": "F:\功能扩展\LcdSplc501Demo\splc501\SPLC501Hardware.asm" ".\hardware.inc" ".\splc501c_io.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SPLC501Hardware.lst" -o "$(OUTDIR)\SPLC501Hardware.obj" "F:\功能扩展\LcdSplc501Demo\splc501\SPLC501Hardware.asm" 

"$(OUTDIR)\SPLC501DisplayTAB.obj": "F:\功能扩展\LcdSplc501Demo\splc501\SPLC501DisplayTAB.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SPLC501DisplayTAB.lst" -o "$(OUTDIR)\SPLC501DisplayTAB.obj" "F:\功能扩展\LcdSplc501Demo\splc501\SPLC501DisplayTAB.asm" 

"$(OUTDIR)\main.obj": "F:\功能扩展\LcdSplc501Demo\splc501\main.c" ".\lab_parameter.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/功能扩展/LcdSplc501Demo/splc501/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\irq.obj": "F:\功能扩展\LcdSplc501Demo\splc501\irq.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\irq.lst" -o "$(OUTDIR)\irq.obj" "F:\功能扩展\LcdSplc501Demo\splc501\irq.asm" 


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
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\Splc501sys.obj" 
	$(RM) "$(OUTDIR)\Splc501sys.lst" 
	$(RM) "$(OUTDIR)\Splc501var.obj" 
	$(RM) "$(OUTDIR)\Splc501var.lst" 
	$(RM) "$(OUTDIR)\SPLC501Hardware.obj" 
	$(RM) "$(OUTDIR)\SPLC501Hardware.lst" 
	$(RM) "$(OUTDIR)\SPLC501DisplayTAB.obj" 
	$(RM) "$(OUTDIR)\SPLC501DisplayTAB.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\irq.obj" 
	$(RM) "$(OUTDIR)\irq.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

