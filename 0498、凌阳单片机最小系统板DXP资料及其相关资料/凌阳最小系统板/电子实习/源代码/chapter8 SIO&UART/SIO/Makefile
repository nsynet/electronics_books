#####################################################################
#																	 
#	Created by u'nSP IDE		01:02:43	06/01/09
#
#####################################################################




APPDIR	= F:\SPCE061A\IDE

OUTDIR	= .\Debug

CC	= $(APPDIR)\toolchain\gcc

AS	= $(APPDIR)\toolchain\xasm16

LD	= $(APPDIR)\toolchain\xlink16

AR	= $(APPDIR)\toolchain\xlib16

RESC	= $(APPDIR)\toolchain\resc

RM	= $(APPDIR)\toolchain\rm -f

INCLUDES	= -I"E:/单片机整理/凌阳单片机/凌阳16位单片机C语言程序设计/源代码/chapter8 SIO&UART/SIO" -I"F:/SPCE061A/IDE/library/include" -I"F:/SPCE061A/IDE/library/include/sys"

BODY	= -body SPCE060A_061A -bfile "F:\SPCE061A\IDE\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\SIO.S37"

ARYFILE	= "$(OUTDIR)\SIO.ary"

SBMFILE	= "$(OUTDIR)\SIO.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 -wpop

CFLAGS	= $(OPT) -B$(APPDIR)\toolchain\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= -listfile

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "E:\单片机整理\凌阳单片机\凌阳16位单片机C语言程序设计\源代码\chapter8 SIO&UART\SIO\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "E:\单片机整理\凌阳单片机\凌阳16位单片机C语言程序设计\源代码\chapter8 SIO&UART\SIO\Resource.asm" 

"$(OUTDIR)\main.asm": "E:\单片机整理\凌阳单片机\凌阳16位单片机C语言程序设计\源代码\chapter8 SIO&UART\SIO\main.c" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "E:/单片机整理/凌阳单片机/凌阳16位单片机C语言程序设计/源代码/chapter8 SIO&UART/SIO/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 BEFOREBUILD "$(OUTDIR)" $(BINFILE)

BEFOREBUILD :

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
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

