#####################################################################
#																	 
#	Created by u'nSP IDE		09:33:10	11/21/02
#
#####################################################################




APPDIR	= C:\PROGRA~1\SUNPLUS\UNSPID~1

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"E:/wrz/splc501/splc501"

BODY	= -body SPCE500A -bfile "$(APPDIR)\body.dat"

BINFILE	= "$(OUTDIR)\splc501.S37"

ARYFILE	= "$(OUTDIR)\splc501.ary"

OPT	= -S -gstabs

ASFLAGS	= -d

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

LDFLAGS	= -a 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\test.obj" \
	"$(OUTDIR)\Splc501sys.obj" \
	"$(OUTDIR)\Splc501var.obj" \
	"$(OUTDIR)\SPLC501Hardware.obj" \
	"$(OUTDIR)\SPLC501DisplayTAB.obj" 

"$(OUTDIR)\Resource.obj": "E:\wrz\splc501\splc501\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "E:\wrz\splc501\splc501\Resource.asm" 

"$(OUTDIR)\hardware.obj": "E:\wrz\splc501\splc501\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "E:\wrz\splc501\splc501\hardware.asm" 

"$(OUTDIR)\test.obj": "E:\wrz\splc501\splc501\test.c" ".\lab_parameter.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/test.asm" "E:/wrz/splc501/splc501/test.c" 
	$(AS) $(INCLUDES) -l "$(OUTDIR)\test.lst" -o "$(OUTDIR)\test.obj" "$(OUTDIR)\test.asm" 

"$(OUTDIR)\Splc501sys.obj": "E:\wrz\splc501\splc501\Splc501sys.asm" ".\hardware.inc" ".\splc501c_io.inc" ".\splc501c.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Splc501sys.lst" -o "$(OUTDIR)\Splc501sys.obj" "E:\wrz\splc501\splc501\Splc501sys.asm" 

"$(OUTDIR)\Splc501var.obj": "E:\wrz\splc501\splc501\Splc501var.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Splc501var.lst" -o "$(OUTDIR)\Splc501var.obj" "E:\wrz\splc501\splc501\Splc501var.asm" 

"$(OUTDIR)\SPLC501Hardware.obj": "E:\wrz\splc501\splc501\SPLC501Hardware.asm" ".\hardware.inc" ".\splc501c_io.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SPLC501Hardware.lst" -o "$(OUTDIR)\SPLC501Hardware.obj" "E:\wrz\splc501\splc501\SPLC501Hardware.asm" 

"$(OUTDIR)\SPLC501DisplayTAB.obj": "E:\wrz\splc501\splc501\SPLC501DisplayTAB.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SPLC501DisplayTAB.lst" -o "$(OUTDIR)\SPLC501DisplayTAB.obj" "E:\wrz\splc501\splc501\SPLC501DisplayTAB.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(LDFLAGS) $(ARYFILE) $(BINFILE) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\test.obj" 
	$(RM) "$(OUTDIR)\test.asm" 
	$(RM) "$(OUTDIR)\Splc501sys.obj" 
	$(RM) "$(OUTDIR)\Splc501var.obj" 
	$(RM) "$(OUTDIR)\SPLC501Hardware.obj" 
	$(RM) "$(OUTDIR)\SPLC501DisplayTAB.obj" 
	$(RM) $(BINFILE) $(ARYFILE) "$(OUTDIR)\*.sbm" "$(OUTDIR)\*.dbg"

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

