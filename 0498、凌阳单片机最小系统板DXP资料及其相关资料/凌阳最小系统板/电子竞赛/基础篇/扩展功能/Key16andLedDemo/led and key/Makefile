#####################################################################
#																	 
#	Created by u'nSP IDE		11:19:02	07/11/03
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

INCLUDES	= -I"F:/功能扩展/Key16angLedDemo/led and key" -I"D:/Program Files/Sunplus/unSPIDE180/Include" -I"D:/Program Files/Sunplus/unSPIDE180/Library" -I"../../../Program Files/Sunplus/unSPIDE162/Include"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\led and key test.S37"

ARYFILE	= "$(OUTDIR)\led and key test.ary"

SBMFILE	= "$(OUTDIR)\led and key test.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\key1.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\irq5.obj" \
	"$(OUTDIR)\single.obj" \
	"$(OUTDIR)\hardware.obj" 

"$(OUTDIR)\Resource.obj": "F:\功能扩展\Key16angLedDemo\led and key\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\功能扩展\Key16angLedDemo\led and key\Resource.asm" 

"$(OUTDIR)\key.obj": "F:\功能扩展\Key16angLedDemo\led and key\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\功能扩展\Key16angLedDemo\led and key\key.asm" 

"$(OUTDIR)\key1.obj": "F:\功能扩展\Key16angLedDemo\led and key\key1.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key1.lst" -o "$(OUTDIR)\key1.obj" "F:\功能扩展\Key16angLedDemo\led and key\key1.asm" 

"$(OUTDIR)\main.obj": "F:\功能扩展\Key16angLedDemo\led and key\main.c" ".\hardware.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/功能扩展/Key16angLedDemo/led and key/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\irq5.obj": "F:\功能扩展\Key16angLedDemo\led and key\irq5.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\irq5.lst" -o "$(OUTDIR)\irq5.obj" "F:\功能扩展\Key16angLedDemo\led and key\irq5.asm" 

"$(OUTDIR)\single.obj": "F:\功能扩展\Key16angLedDemo\led and key\single.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\single.lst" -o "$(OUTDIR)\single.obj" "F:\功能扩展\Key16angLedDemo\led and key\single.asm" 

"$(OUTDIR)\hardware.obj": "F:\功能扩展\Key16angLedDemo\led and key\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\功能扩展\Key16angLedDemo\led and key\hardware.asm" 


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
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\key1.obj" 
	$(RM) "$(OUTDIR)\key1.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\irq5.obj" 
	$(RM) "$(OUTDIR)\irq5.lst" 
	$(RM) "$(OUTDIR)\single.obj" 
	$(RM) "$(OUTDIR)\single.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

