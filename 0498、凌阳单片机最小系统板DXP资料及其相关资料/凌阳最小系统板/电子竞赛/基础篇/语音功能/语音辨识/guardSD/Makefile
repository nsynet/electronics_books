#####################################################################
#																	 
#	Created by u'nSP IDE		10:12:10	07/11/03
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

INCLUDES	= -I"F:/电子竞赛/竞赛光盘/基础篇/语音功能－向/guardSD"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\guardSD.S37"

ARYFILE	= "$(OUTDIR)\guardSD.ary"

SBMFILE	= "$(OUTDIR)\guardSD.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\1_48k.res" \
	"$(OUTDIR)\12_48k.res" \
	"$(OUTDIR)\15_48k.res" \
	"$(OUTDIR)\2_48k.res" \
	"$(OUTDIR)\3_48k.res" \
	"$(OUTDIR)\7_48k.res" \
	"$(OUTDIR)\6_48k.res" \
	"$(OUTDIR)\5_48k.res" \
	"$(OUTDIR)\18_48k.res" \
	"$(OUTDIR)\17_48k.res" \
	"$(OUTDIR)\16_48k.res" \
	"$(OUTDIR)\4_48k.res" \
	"$(OUTDIR)\4com_48k.res" \
	"$(OUTDIR)\3Com_48k.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\initIO.obj" \
	"$(OUTDIR)\fiq.obj" \
	"$(OUTDIR)\hardware.obj" 

"$(OUTDIR)\1_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\1.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\1.48k" "$(OUTDIR)\1_48k.res" RES_1_48K 

"$(OUTDIR)\12_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\12.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\12.48k" "$(OUTDIR)\12_48k.res" RES_12_48K 

"$(OUTDIR)\15_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\15.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\15.48k" "$(OUTDIR)\15_48k.res" RES_15_48K 

"$(OUTDIR)\2_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\2.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\2.48k" "$(OUTDIR)\2_48k.res" RES_2_48K 

"$(OUTDIR)\3_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\3.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\3.48k" "$(OUTDIR)\3_48k.res" RES_3_48K 

"$(OUTDIR)\7_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\7.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\7.48k" "$(OUTDIR)\7_48k.res" RES_7_48K 

"$(OUTDIR)\6_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\6.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\6.48k" "$(OUTDIR)\6_48k.res" RES_6_48K 

"$(OUTDIR)\5_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\5.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\5.48k" "$(OUTDIR)\5_48k.res" RES_5_48K 

"$(OUTDIR)\18_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\18.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\18.48k" "$(OUTDIR)\18_48k.res" RES_18_48K 

"$(OUTDIR)\17_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\17.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\17.48k" "$(OUTDIR)\17_48k.res" RES_17_48K 

"$(OUTDIR)\16_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\16.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\16.48k" "$(OUTDIR)\16_48k.res" RES_16_48K 

"$(OUTDIR)\4_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\4.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\4.48k" "$(OUTDIR)\4_48k.res" RES_4_48K 

"$(OUTDIR)\4com_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\4com.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\4com.48k" "$(OUTDIR)\4com_48k.res" RES_4COM_48K 

"$(OUTDIR)\3Com_48k.res": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\3Com.48k"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\voice\3Com.48k" "$(OUTDIR)\3Com_48k.res" RES_3COM_48K 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/竞赛光盘/基础篇/语音功能－向/guardSD/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\initIO.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\initIO.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\initIO.lst" -o "$(OUTDIR)\initIO.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\initIO.asm" 

"$(OUTDIR)\fiq.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\fiq.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\fiq.lst" -o "$(OUTDIR)\fiq.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\fiq.asm" 

"$(OUTDIR)\hardware.obj": "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\电子竞赛\竞赛光盘\基础篇\语音功能－向\guardSD\hardware.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\1_48k.res" 
	$(RM) "$(OUTDIR)\12_48k.res" 
	$(RM) "$(OUTDIR)\15_48k.res" 
	$(RM) "$(OUTDIR)\2_48k.res" 
	$(RM) "$(OUTDIR)\3_48k.res" 
	$(RM) "$(OUTDIR)\7_48k.res" 
	$(RM) "$(OUTDIR)\6_48k.res" 
	$(RM) "$(OUTDIR)\5_48k.res" 
	$(RM) "$(OUTDIR)\18_48k.res" 
	$(RM) "$(OUTDIR)\17_48k.res" 
	$(RM) "$(OUTDIR)\16_48k.res" 
	$(RM) "$(OUTDIR)\4_48k.res" 
	$(RM) "$(OUTDIR)\4com_48k.res" 
	$(RM) "$(OUTDIR)\3Com_48k.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\initIO.obj" 
	$(RM) "$(OUTDIR)\initIO.lst" 
	$(RM) "$(OUTDIR)\fiq.obj" 
	$(RM) "$(OUTDIR)\fiq.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

