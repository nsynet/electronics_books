#####################################################################
#																	 
#	Created by u'nSP IDE		14:47:19	07/25/09
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

INCLUDES	= -I"E:/单片机整理/凌阳单片机/电子竞赛/基础篇/基本功能/DA/DA_ch" -I"F:/SPCE061A/IDE/library/include" -I"F:/SPCE061A/IDE/library/include/sys" -I"../../../Include"

BODY	= -body SPCE060A_061A -bfile "F:\SPCE061A\IDE\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\DA_ch.S37"

ARYFILE	= "$(OUTDIR)\DA_ch.ary"

SBMFILE	= "$(OUTDIR)\DA_ch.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 -wpop

CFLAGS	= $(OPT) -B$(APPDIR)\toolchain\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= -listfile

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\DA\DA_ch\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\DA\DA_ch\Resource.asm" 

"$(OUTDIR)\hardware.obj": "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\Include\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\Include\hardware.asm" 

"$(OUTDIR)\key.obj": "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\Include\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\Include\key.asm" 

"$(OUTDIR)\main.obj": "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\DA\DA_ch\main.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "E:\单片机整理\凌阳单片机\电子竞赛\基础篇\基本功能\DA\DA_ch\main.asm" 


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
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

