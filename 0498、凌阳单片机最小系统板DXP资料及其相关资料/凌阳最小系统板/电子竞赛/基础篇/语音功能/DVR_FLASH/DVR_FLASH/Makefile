#####################################################################
#																	 
#	Created by u'nSP IDE		10:34:57	07/10/03
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

INCLUDES	= -I"F:/电子竞赛/竞赛光盘/基础篇/语音功能－向/DVR_FLASH/DVR_FLASH" -I"../../../Include"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\DVR_FLASH.S37"

ARYFILE	= "$(OUTDIR)\DVR_FLASH.ary"

SBMFILE	= "$(OUTDIR)\DVR_FLASH.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\flash.obj" \
	"$(OUTDIR)\sram.obj" \
	"$(OUTDIR)\hardware.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/竞赛光盘/基础篇/语音功能－向/DVR_FLASH/DVR_FLASH/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\isr.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\isr.asm" 

"$(OUTDIR)\system.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\system.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\system.asm" 

"$(OUTDIR)\key.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\Include\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\Include\key.asm" 

"$(OUTDIR)\flash.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\flash.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\flash.lst" -o "$(OUTDIR)\flash.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\flash.asm" 

"$(OUTDIR)\sram.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\sram.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sram.lst" -o "$(OUTDIR)\sram.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\DVR_FLASH\DVR_FLASH\sram.asm" 

"$(OUTDIR)\hardware.obj": "D:\Program Files\sunplus\unSPIDE180\Example\IntExa\ex9_Record\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "D:\Program Files\sunplus\unSPIDE180\Example\IntExa\ex9_Record\hardware.asm" 


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
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\flash.obj" 
	$(RM) "$(OUTDIR)\flash.lst" 
	$(RM) "$(OUTDIR)\sram.obj" 
	$(RM) "$(OUTDIR)\sram.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

