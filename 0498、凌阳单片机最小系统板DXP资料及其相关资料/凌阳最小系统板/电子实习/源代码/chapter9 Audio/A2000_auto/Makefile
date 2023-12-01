#####################################################################
#																	 
#	Created by u'nSP IDE		16:48:40	07/09/03
#
#####################################################################




APPDIR	= E:\PROGRA~1\Sunplus\UNSPID~3\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/A2000_auto"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\A2000_auto.S37"

ARYFILE	= "$(OUTDIR)\A2000_auto.ary"

SBMFILE	= "$(OUTDIR)\A2000_auto.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\ww_24k.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\ISR.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\ww_24k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\voice\ww.24k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\voice\ww.24k" "$(OUTDIR)\ww_24k.res" RES_WW_24K 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\Resource.asm" 

"$(OUTDIR)\hardware.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\hardware.asm" 

"$(OUTDIR)\ISR.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\ISR.c" ".\SPCE061V004.H" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ISR.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/A2000_auto/ISR.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ISR.lst" -o "$(OUTDIR)\ISR.obj" "$(OUTDIR)\ISR.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\A2000_auto\main.c" ".\SPCE061V004.H" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/A2000_auto/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\ww_24k.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\ISR.obj" 
	$(RM) "$(OUTDIR)\ISR.lst" 
	$(RM) "$(OUTDIR)\ISR.asm" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

