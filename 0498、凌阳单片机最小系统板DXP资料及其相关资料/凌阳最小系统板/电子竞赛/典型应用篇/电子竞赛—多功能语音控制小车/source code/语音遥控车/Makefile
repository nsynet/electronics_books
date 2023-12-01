#####################################################################
#																	 
#	Created by u'nSP IDE		13:29:33	05/19/04
#
#####################################################################




APPDIR	= C:\PROGRA~1\Sunplus\UNSPID~1\unSPIDE

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/test/CD_Root/AutoPlay/Docs/刻录光盘/电子竞赛/典型应用篇/电子竞赛—多功能语音控制小车/source code/语音遥控车" -I"../../../Library" -I"D:/Program Files/Sunplus/unSPIDE162/Include"

BODY	= -body SPCE061A -bfile "C:\Program Files\Sunplus\unSPIDE184\unSPIDE\Body\SPCE061A.cpt"

BINFILE	= "$(OUTDIR)\Guard_SD.S37"

ARYFILE	= "$(OUTDIR)\Guard_SD.ary"

SBMFILE	= "$(OUTDIR)\Guard_SD.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CASFLAGS	= -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\2_48k.res" \
	"$(OUTDIR)\3_48k.res" \
	"$(OUTDIR)\5_48k.res" \
	"$(OUTDIR)\10_48k.res" \
	"$(OUTDIR)\11_48k.res" \
	"$(OUTDIR)\15_48k.res" \
	"$(OUTDIR)\S12_24K.res" \
	"$(OUTDIR)\InitIO.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\FIQ.obj" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\singel.obj" 

"$(OUTDIR)\2_48k.res": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\2.48k"
	$(RESC) "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\2.48k" "$(OUTDIR)\2_48k.res" RES_2_48K 

"$(OUTDIR)\3_48k.res": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\3.48k"
	$(RESC) "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\3.48k" "$(OUTDIR)\3_48k.res" RES_3_48K 

"$(OUTDIR)\5_48k.res": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\5.48k"
	$(RESC) "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\5.48k" "$(OUTDIR)\5_48k.res" RES_5_48K 

"$(OUTDIR)\10_48k.res": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\10.48k"
	$(RESC) "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\10.48k" "$(OUTDIR)\10_48k.res" RES_10_48K 

"$(OUTDIR)\11_48k.res": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\11.48k"
	$(RESC) "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\11.48k" "$(OUTDIR)\11_48k.res" RES_11_48K 

"$(OUTDIR)\15_48k.res": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\15.48k"
	$(RESC) "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\15.48k" "$(OUTDIR)\15_48k.res" RES_15_48K 

"$(OUTDIR)\S12_24K.res": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\S12.24K"
	$(RESC) "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\voice\S12.24K" "$(OUTDIR)\S12_24K.res" RES_S12_24K 

"$(OUTDIR)\InitIO.obj": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\InitIO.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\InitIO.lst" -o "$(OUTDIR)\InitIO.obj" "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\InitIO.asm" 

"$(OUTDIR)\hardware.obj": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\hardware.asm" 

"$(OUTDIR)\FIQ.obj": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\FIQ.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\FIQ.lst" -o "$(OUTDIR)\FIQ.obj" "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\FIQ.asm" 

"$(OUTDIR)\Resource.obj": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\main.c" ".\bsrsd.h" ".\hardware.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/test/CD_Root/AutoPlay/Docs/刻录光盘/电子竞赛/典型应用篇/电子竞赛—多功能语音控制小车/source code/语音遥控车/main.c" 
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\singel.obj": "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\singel.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\singel.lst" -o "$(OUTDIR)\singel.obj" "F:\test\CD_Root\AutoPlay\Docs\刻录光盘\电子竞赛\典型应用篇\电子竞赛—多功能语音控制小车\source code\语音遥控车\singel.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\2_48k.res" 
	$(RM) "$(OUTDIR)\3_48k.res" 
	$(RM) "$(OUTDIR)\5_48k.res" 
	$(RM) "$(OUTDIR)\10_48k.res" 
	$(RM) "$(OUTDIR)\11_48k.res" 
	$(RM) "$(OUTDIR)\15_48k.res" 
	$(RM) "$(OUTDIR)\S12_24K.res" 
	$(RM) "$(OUTDIR)\InitIO.obj" 
	$(RM) "$(OUTDIR)\InitIO.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\FIQ.obj" 
	$(RM) "$(OUTDIR)\FIQ.lst" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\singel.obj" 
	$(RM) "$(OUTDIR)\singel.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

