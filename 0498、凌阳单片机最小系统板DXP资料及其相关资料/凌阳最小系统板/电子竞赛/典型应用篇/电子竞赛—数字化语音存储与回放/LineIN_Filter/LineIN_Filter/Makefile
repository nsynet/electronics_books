#####################################################################
#																	 
#	Created by u'nSP IDE		09:30:53	07/11/03
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

INCLUDES	= -I"F:/电子竞赛/竞赛光盘/典型应用篇/电子竞赛—数字化语音存储与回放/LineIN_Filter/LineIN_Filter"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\LineIN_Record_DigitalFilter.S37"

ARYFILE	= "$(OUTDIR)\LineIN_Record_DigitalFilter.ary"

SBMFILE	= "$(OUTDIR)\LineIN_Record_DigitalFilter.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\System.obj" \
	"$(OUTDIR)\SP_SerialFlashV1.obj" \
	"$(OUTDIR)\ISR.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\Resource.asm" 

"$(OUTDIR)\System.obj": "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\System.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\System.lst" -o "$(OUTDIR)\System.obj" "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\System.asm" 

"$(OUTDIR)\SP_SerialFlashV1.obj": "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\SP_SerialFlashV1.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SP_SerialFlashV1.lst" -o "$(OUTDIR)\SP_SerialFlashV1.obj" "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\SP_SerialFlashV1.asm" 

"$(OUTDIR)\ISR.obj": "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\ISR.c" ".\SPCE061V004.H" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ISR.asm" "F:/电子竞赛/竞赛光盘/典型应用篇/电子竞赛—数字化语音存储与回放/LineIN_Filter/LineIN_Filter/ISR.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ISR.lst" -o "$(OUTDIR)\ISR.obj" "$(OUTDIR)\ISR.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\竞赛光盘\典型应用篇\电子竞赛—数字化语音存储与回放\LineIN_Filter\LineIN_Filter\main.c" ".\SPCE061V004.H" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/竞赛光盘/典型应用篇/电子竞赛—数字化语音存储与回放/LineIN_Filter/LineIN_Filter/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 


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
	$(RM) "$(OUTDIR)\System.obj" 
	$(RM) "$(OUTDIR)\System.lst" 
	$(RM) "$(OUTDIR)\SP_SerialFlashV1.obj" 
	$(RM) "$(OUTDIR)\SP_SerialFlashV1.lst" 
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

