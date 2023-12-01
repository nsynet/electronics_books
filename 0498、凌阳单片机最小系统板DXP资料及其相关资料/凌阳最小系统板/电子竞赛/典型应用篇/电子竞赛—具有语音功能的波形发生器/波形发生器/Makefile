#####################################################################
#																	 
#	Created by u'nSP IDE		10:38:23	07/11/03
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

INCLUDES	= -I"F:/功能扩展/UpDown" -I"D:/Program Files/Sunplus/unSPIDE180/Include" -I"D:/Program Files/Sunplus/unSPIDE180/Library" -I"../../../Program Files/Sunplus/unSPIDE162/Include"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\UpDown.S37"

ARYFILE	= "$(OUTDIR)\UpDown.ary"

SBMFILE	= "$(OUTDIR)\UpDown.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\T022_48k.res" \
	"$(OUTDIR)\T023_48k.res" \
	"$(OUTDIR)\T024_48k.res" \
	"$(OUTDIR)\T025_48k.res" \
	"$(OUTDIR)\T026_48k.res" \
	"$(OUTDIR)\T027_48k.res" \
	"$(OUTDIR)\T028_48k.res" \
	"$(OUTDIR)\T029_48k.res" \
	"$(OUTDIR)\T030_48k.res" \
	"$(OUTDIR)\T031_48k.res" \
	"$(OUTDIR)\T066_48k.res" \
	"$(OUTDIR)\T016_48k.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\line.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\key1.obj" \
	"$(OUTDIR)\initial.obj" \
	"$(OUTDIR)\delay1ms.obj" \
	"$(OUTDIR)\single.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\hardware.obj" 

"$(OUTDIR)\T022_48k.res": "F:\功能扩展\UpDown\voice\T022.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T022.48k" "$(OUTDIR)\T022_48k.res" RES_T022_48K 

"$(OUTDIR)\T023_48k.res": "F:\功能扩展\UpDown\voice\T023.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T023.48k" "$(OUTDIR)\T023_48k.res" RES_T023_48K 

"$(OUTDIR)\T024_48k.res": "F:\功能扩展\UpDown\voice\T024.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T024.48k" "$(OUTDIR)\T024_48k.res" RES_T024_48K 

"$(OUTDIR)\T025_48k.res": "F:\功能扩展\UpDown\voice\T025.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T025.48k" "$(OUTDIR)\T025_48k.res" RES_T025_48K 

"$(OUTDIR)\T026_48k.res": "F:\功能扩展\UpDown\voice\T026.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T026.48k" "$(OUTDIR)\T026_48k.res" RES_T026_48K 

"$(OUTDIR)\T027_48k.res": "F:\功能扩展\UpDown\voice\T027.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T027.48k" "$(OUTDIR)\T027_48k.res" RES_T027_48K 

"$(OUTDIR)\T028_48k.res": "F:\功能扩展\UpDown\voice\T028.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T028.48k" "$(OUTDIR)\T028_48k.res" RES_T028_48K 

"$(OUTDIR)\T029_48k.res": "F:\功能扩展\UpDown\voice\T029.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T029.48k" "$(OUTDIR)\T029_48k.res" RES_T029_48K 

"$(OUTDIR)\T030_48k.res": "F:\功能扩展\UpDown\voice\T030.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T030.48k" "$(OUTDIR)\T030_48k.res" RES_T030_48K 

"$(OUTDIR)\T031_48k.res": "F:\功能扩展\UpDown\voice\T031.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T031.48k" "$(OUTDIR)\T031_48k.res" RES_T031_48K 

"$(OUTDIR)\T066_48k.res": "F:\功能扩展\UpDown\voice\T066.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T066.48k" "$(OUTDIR)\T066_48k.res" RES_T066_48K 

"$(OUTDIR)\T016_48k.res": "F:\功能扩展\UpDown\voice\T016.48k"
	$(RESC) "F:\功能扩展\UpDown\voice\T016.48k" "$(OUTDIR)\T016_48k.res" RES_T016_48K 

"$(OUTDIR)\Resource.obj": "F:\功能扩展\UpDown\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\功能扩展\UpDown\Resource.asm" 

"$(OUTDIR)\line.obj": "F:\功能扩展\UpDown\line.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\line.lst" -o "$(OUTDIR)\line.obj" "F:\功能扩展\UpDown\line.asm" 

"$(OUTDIR)\main.obj": "F:\功能扩展\UpDown\main.c" "D:\Program Files\Sunplus\unSPIDE180\Include\hardware.h" "D:\Program Files\Sunplus\unSPIDE180\Include\s480.h" "D:\Program Files\Sunplus\unSPIDE180\Include\math.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/功能扩展/UpDown/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\key.obj": "F:\功能扩展\UpDown\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\功能扩展\UpDown\key.asm" 

"$(OUTDIR)\key1.obj": "F:\功能扩展\UpDown\key1.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key1.lst" -o "$(OUTDIR)\key1.obj" "F:\功能扩展\UpDown\key1.asm" 

"$(OUTDIR)\initial.obj": "F:\功能扩展\UpDown\initial.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\initial.lst" -o "$(OUTDIR)\initial.obj" "F:\功能扩展\UpDown\initial.asm" 

"$(OUTDIR)\delay1ms.obj": "F:\功能扩展\UpDown\delay1ms.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\delay1ms.lst" -o "$(OUTDIR)\delay1ms.obj" "F:\功能扩展\UpDown\delay1ms.asm" 

"$(OUTDIR)\single.obj": "F:\功能扩展\UpDown\single.asm" "D:\Program Files\Sunplus\unSPIDE180\Include\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\single.lst" -o "$(OUTDIR)\single.obj" "F:\功能扩展\UpDown\single.asm" 

"$(OUTDIR)\isr.obj": "F:\功能扩展\UpDown\isr.asm" ".\Resource.inc" "D:\Program Files\Sunplus\unSPIDE180\Include\S480.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\功能扩展\UpDown\isr.asm" 

"$(OUTDIR)\system.obj": "F:\功能扩展\UpDown\system.asm" "D:\Program Files\Sunplus\unSPIDE180\Include\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\功能扩展\UpDown\system.asm" 

"$(OUTDIR)\hardware.obj": "D:\Program Files\Sunplus\unSPIDE180\Include\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "D:\Program Files\Sunplus\unSPIDE180\Include\hardware.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\T022_48k.res" 
	$(RM) "$(OUTDIR)\T023_48k.res" 
	$(RM) "$(OUTDIR)\T024_48k.res" 
	$(RM) "$(OUTDIR)\T025_48k.res" 
	$(RM) "$(OUTDIR)\T026_48k.res" 
	$(RM) "$(OUTDIR)\T027_48k.res" 
	$(RM) "$(OUTDIR)\T028_48k.res" 
	$(RM) "$(OUTDIR)\T029_48k.res" 
	$(RM) "$(OUTDIR)\T030_48k.res" 
	$(RM) "$(OUTDIR)\T031_48k.res" 
	$(RM) "$(OUTDIR)\T066_48k.res" 
	$(RM) "$(OUTDIR)\T016_48k.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\line.obj" 
	$(RM) "$(OUTDIR)\line.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\key1.obj" 
	$(RM) "$(OUTDIR)\key1.lst" 
	$(RM) "$(OUTDIR)\initial.obj" 
	$(RM) "$(OUTDIR)\initial.lst" 
	$(RM) "$(OUTDIR)\delay1ms.obj" 
	$(RM) "$(OUTDIR)\delay1ms.lst" 
	$(RM) "$(OUTDIR)\single.obj" 
	$(RM) "$(OUTDIR)\single.lst" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

