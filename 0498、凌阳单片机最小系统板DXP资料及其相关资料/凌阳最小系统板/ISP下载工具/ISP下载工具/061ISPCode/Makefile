#####################################################################
#																	 
#	Created by u'nSP IDE		18:32:06	09/12/09
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

INCLUDES	= -I"F:/NEW 光盘资料/凌阳最小系统板/ISP下载工具/ISP下载工具/061ISPCode"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\061ISPCode.S37"

ARYFILE	= "$(OUTDIR)\061ISPCode.ary"

SBMFILE	= "$(OUTDIR)\061ISPCode.sbm"

OPT	= -S -gstabs -Wall -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= -listfile

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\ISP.obj" 

"$(OUTDIR)\main.obj": "F:\NEW 光盘资料\凌阳最小系统板\ISP下载工具\ISP下载工具\061ISPCode\main.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "F:\NEW 光盘资料\凌阳最小系统板\ISP下载工具\ISP下载工具\061ISPCode\main.asm" 

"$(OUTDIR)\Resource.obj": "F:\NEW 光盘资料\凌阳最小系统板\ISP下载工具\ISP下载工具\061ISPCode\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\NEW 光盘资料\凌阳最小系统板\ISP下载工具\ISP下载工具\061ISPCode\Resource.asm" 

"$(OUTDIR)\ISP.obj": "F:\NEW 光盘资料\凌阳最小系统板\ISP下载工具\ISP下载工具\061ISPCode\ISP.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ISP.lst" -o "$(OUTDIR)\ISP.obj" "F:\NEW 光盘资料\凌阳最小系统板\ISP下载工具\ISP下载工具\061ISPCode\ISP.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\ISP.obj" 
	$(RM) "$(OUTDIR)\ISP.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

