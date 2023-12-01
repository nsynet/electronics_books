#####################################################################
#																	 
#	Created by u'nSP IDE		16:45:17	07/09/03
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

INCLUDES	= -I"F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/BSR"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\BSR.S37"

ARYFILE	= "$(OUTDIR)\BSR.ary"

SBMFILE	= "$(OUTDIR)\BSR.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\1_48k.res" \
	"$(OUTDIR)\10_48k.res" \
	"$(OUTDIR)\11_48k.res" \
	"$(OUTDIR)\12_48k.res" \
	"$(OUTDIR)\15_48k.res" \
	"$(OUTDIR)\2_48k.res" \
	"$(OUTDIR)\3_48k.res" \
	"$(OUTDIR)\4_48k.res" \
	"$(OUTDIR)\5_48k.res" \
	"$(OUTDIR)\6_48k.res" \
	"$(OUTDIR)\7_48k.res" \
	"$(OUTDIR)\S12_24K.res" \
	"$(OUTDIR)\18_48k.res" \
	"$(OUTDIR)\17_48k.res" \
	"$(OUTDIR)\16_48k.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\InitIO.obj" \
	"$(OUTDIR)\FIQ.obj" 

"$(OUTDIR)\1_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\1.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\1.48k" "$(OUTDIR)\1_48k.res" RES_1_48K 

"$(OUTDIR)\10_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\10.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\10.48k" "$(OUTDIR)\10_48k.res" RES_10_48K 

"$(OUTDIR)\11_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\11.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\11.48k" "$(OUTDIR)\11_48k.res" RES_11_48K 

"$(OUTDIR)\12_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\12.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\12.48k" "$(OUTDIR)\12_48k.res" RES_12_48K 

"$(OUTDIR)\15_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\15.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\15.48k" "$(OUTDIR)\15_48k.res" RES_15_48K 

"$(OUTDIR)\2_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\2.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\2.48k" "$(OUTDIR)\2_48k.res" RES_2_48K 

"$(OUTDIR)\3_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\3.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\3.48k" "$(OUTDIR)\3_48k.res" RES_3_48K 

"$(OUTDIR)\4_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\4.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\4.48k" "$(OUTDIR)\4_48k.res" RES_4_48K 

"$(OUTDIR)\5_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\5.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\5.48k" "$(OUTDIR)\5_48k.res" RES_5_48K 

"$(OUTDIR)\6_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\6.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\6.48k" "$(OUTDIR)\6_48k.res" RES_6_48K 

"$(OUTDIR)\7_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\7.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\7.48k" "$(OUTDIR)\7_48k.res" RES_7_48K 

"$(OUTDIR)\S12_24K.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\S12.24K"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\S12.24K" "$(OUTDIR)\S12_24K.res" RES_S12_24K 

"$(OUTDIR)\18_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\18.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\18.48k" "$(OUTDIR)\18_48k.res" RES_18_48K 

"$(OUTDIR)\17_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\17.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\17.48k" "$(OUTDIR)\17_48k.res" RES_17_48K 

"$(OUTDIR)\16_48k.res": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\16.48k"
	$(RESC) "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\voice\16.48k" "$(OUTDIR)\16_48k.res" RES_16_48K 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter9 Audio/BSR/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\hardware.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\hardware.asm" 

"$(OUTDIR)\InitIO.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\InitIO.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\InitIO.lst" -o "$(OUTDIR)\InitIO.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\InitIO.asm" 

"$(OUTDIR)\FIQ.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\FIQ.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\FIQ.lst" -o "$(OUTDIR)\FIQ.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter9 Audio\BSR\FIQ.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\1_48k.res" 
	$(RM) "$(OUTDIR)\10_48k.res" 
	$(RM) "$(OUTDIR)\11_48k.res" 
	$(RM) "$(OUTDIR)\12_48k.res" 
	$(RM) "$(OUTDIR)\15_48k.res" 
	$(RM) "$(OUTDIR)\2_48k.res" 
	$(RM) "$(OUTDIR)\3_48k.res" 
	$(RM) "$(OUTDIR)\4_48k.res" 
	$(RM) "$(OUTDIR)\5_48k.res" 
	$(RM) "$(OUTDIR)\6_48k.res" 
	$(RM) "$(OUTDIR)\7_48k.res" 
	$(RM) "$(OUTDIR)\S12_24K.res" 
	$(RM) "$(OUTDIR)\18_48k.res" 
	$(RM) "$(OUTDIR)\17_48k.res" 
	$(RM) "$(OUTDIR)\16_48k.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\InitIO.obj" 
	$(RM) "$(OUTDIR)\InitIO.lst" 
	$(RM) "$(OUTDIR)\FIQ.obj" 
	$(RM) "$(OUTDIR)\FIQ.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

