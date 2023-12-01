#####################################################################
#																	 
#	Created by u'nSP IDE		19:13:45	09/12/09
#
#####################################################################




APPDIR	= C:\PROGRA~1\Sunplus\UNSPID~1.0

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/NEW 光盘资料/凌阳最小系统板/电子实习/声控小车/音控小车" -I"../../../Library" -I"D:/Program Files/Sunplus/unSPIDE162/Include"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\Guard_SD.S37"

ARYFILE	= "$(OUTDIR)\Guard_SD.ary"

SBMFILE	= "$(OUTDIR)\Guard_SD.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\dcqzy_48k.res" \
	"$(OUTDIR)\fbf_48k.res" \
	"$(OUTDIR)\gjg_48k.res" \
	"$(OUTDIR)\qj_48k.res" \
	"$(OUTDIR)\ssmay_48k.res" \
	"$(OUTDIR)\yeah_48k.res" \
	"$(OUTDIR)\S12_24K.res" \
	"$(OUTDIR)\InitIO.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\FIQ.obj" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\Flash.obj" \
	"$(OUTDIR)\Bpwm.obj" \
	"$(OUTDIR)\SetIOBit.obj" 

"$(OUTDIR)\dcqzy_48k.res": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\dcqzy.48k"
	$(RESC) "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\dcqzy.48k" "$(OUTDIR)\dcqzy_48k.res" RES_DCQZY_48K 

"$(OUTDIR)\fbf_48k.res": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\fbf.48k"
	$(RESC) "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\fbf.48k" "$(OUTDIR)\fbf_48k.res" RES_FBF_48K 

"$(OUTDIR)\gjg_48k.res": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\gjg.48k"
	$(RESC) "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\gjg.48k" "$(OUTDIR)\gjg_48k.res" RES_GJG_48K 

"$(OUTDIR)\qj_48k.res": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\qj.48k"
	$(RESC) "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\qj.48k" "$(OUTDIR)\qj_48k.res" RES_QJ_48K 

"$(OUTDIR)\ssmay_48k.res": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\ssmay.48k"
	$(RESC) "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\ssmay.48k" "$(OUTDIR)\ssmay_48k.res" RES_SSMAY_48K 

"$(OUTDIR)\yeah_48k.res": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\yeah.48k"
	$(RESC) "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\yeah.48k" "$(OUTDIR)\yeah_48k.res" RES_YEAH_48K 

"$(OUTDIR)\S12_24K.res": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\S12.24K"
	$(RESC) "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\voice\S12.24K" "$(OUTDIR)\S12_24K.res" RES_S12_24K 

"$(OUTDIR)\InitIO.obj": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\InitIO.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\InitIO.lst" -o "$(OUTDIR)\InitIO.obj" "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\InitIO.asm" 

"$(OUTDIR)\hardware.obj": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\hardware.asm" 

"$(OUTDIR)\FIQ.obj": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\FIQ.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\FIQ.lst" -o "$(OUTDIR)\FIQ.obj" "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\FIQ.asm" 

"$(OUTDIR)\Resource.obj": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\Resource.asm" 

"$(OUTDIR)\main.asm": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\main.c" ".\bsrsd.h" ".\hardware.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/NEW 光盘资料/凌阳最小系统板/电子实习/声控小车/音控小车/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\Flash.obj": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\Flash.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Flash.lst" -o "$(OUTDIR)\Flash.obj" "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\Flash.asm" 

"$(OUTDIR)\Bpwm.obj": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\Bpwm.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Bpwm.lst" -o "$(OUTDIR)\Bpwm.obj" "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\Bpwm.asm" 

"$(OUTDIR)\SetIOBit.obj": "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\SetIOBit.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SetIOBit.lst" -o "$(OUTDIR)\SetIOBit.obj" "F:\NEW 光盘资料\凌阳最小系统板\电子实习\声控小车\音控小车\SetIOBit.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\dcqzy_48k.res" 
	$(RM) "$(OUTDIR)\fbf_48k.res" 
	$(RM) "$(OUTDIR)\gjg_48k.res" 
	$(RM) "$(OUTDIR)\qj_48k.res" 
	$(RM) "$(OUTDIR)\ssmay_48k.res" 
	$(RM) "$(OUTDIR)\yeah_48k.res" 
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
	$(RM) "$(OUTDIR)\Flash.obj" 
	$(RM) "$(OUTDIR)\Flash.lst" 
	$(RM) "$(OUTDIR)\Bpwm.obj" 
	$(RM) "$(OUTDIR)\Bpwm.lst" 
	$(RM) "$(OUTDIR)\SetIOBit.obj" 
	$(RM) "$(OUTDIR)\SetIOBit.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

