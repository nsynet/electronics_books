#####################################################################
#																	 
#	Created by u'nSP IDE		16:45:46	07/09/03
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

INCLUDES	= -I"F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/S240"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\S240.S37"

ARYFILE	= "$(OUTDIR)\S240.ary"

SBMFILE	= "$(OUTDIR)\S240.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\pk3.res" \
	"$(OUTDIR)\pk2.res" \
	"$(OUTDIR)\pk1.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\spce.obj" \
	"$(OUTDIR)\SP_lib.obj" \
	"$(OUTDIR)\sacmV32.obj" \
	"$(OUTDIR)\ISR.obj" 

"$(OUTDIR)\pk3.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\voice\pk3"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\voice\pk3" "$(OUTDIR)\pk3.res" RES_PK3 

"$(OUTDIR)\pk2.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\voice\pk2"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\voice\pk2" "$(OUTDIR)\pk2.res" RES_PK2 

"$(OUTDIR)\pk1.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\voice\pk1"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\voice\pk1" "$(OUTDIR)\pk1.res" RES_PK1 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\main.c" ".\sp_lib.h" ".\sacmv32.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/S240/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\system.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\system.asm" ".\spce.inc" ".\sp_lib.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\system.asm" 

"$(OUTDIR)\spce.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\spce.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\spce.lst" -o "$(OUTDIR)\spce.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\spce.asm" 

"$(OUTDIR)\SP_lib.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\SP_lib.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SP_lib.lst" -o "$(OUTDIR)\SP_lib.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\SP_lib.asm" 

"$(OUTDIR)\sacmV32.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\sacmV32.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sacmV32.lst" -o "$(OUTDIR)\sacmV32.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\sacmV32.asm" 

"$(OUTDIR)\ISR.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\S240\ISR.c" ".\SPCE061V004.H" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ISR.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/S240/ISR.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ISR.lst" -o "$(OUTDIR)\ISR.obj" "$(OUTDIR)\ISR.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\pk3.res" 
	$(RM) "$(OUTDIR)\pk2.res" 
	$(RM) "$(OUTDIR)\pk1.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\spce.obj" 
	$(RM) "$(OUTDIR)\spce.lst" 
	$(RM) "$(OUTDIR)\SP_lib.obj" 
	$(RM) "$(OUTDIR)\SP_lib.lst" 
	$(RM) "$(OUTDIR)\sacmV32.obj" 
	$(RM) "$(OUTDIR)\sacmV32.lst" 
	$(RM) "$(OUTDIR)\ISR.obj" 
	$(RM) "$(OUTDIR)\ISR.lst" 
	$(RM) "$(OUTDIR)\ISR.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

