#####################################################################
#																	 
#	Created by u'nSP IDE		12:16:57	07/11/03
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

INCLUDES	= -I"F:/电子竞赛/竞赛光盘/基础篇/语音功能－向/ele_competition/ele_competition/voice/s480_key"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\s480_key.S37"

ARYFILE	= "$(OUTDIR)\s480_key.ary"

SBMFILE	= "$(OUTDIR)\s480_key.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\48_48K.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\key.obj" 

"$(OUTDIR)\48_48K.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\voice\48.48K"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\voice\48.48K" "$(OUTDIR)\48_48K.res" RES_48_48K 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/竞赛光盘/基础篇/语音功能－向/ele_competition/ele_competition/voice/s480_key/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\isr.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\isr.asm" 

"$(OUTDIR)\system.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\system.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\system.asm" 

"$(OUTDIR)\hardware.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\hardware.asm" 

"$(OUTDIR)\key.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\ele_competition\ele_competition\voice\s480_key\key.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\48_48K.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

