#####################################################################
#																	 
#	Created by u'nSP IDE		17:38:54	06/14/09
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

INCLUDES	= -I"E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo1" -I"F:/SPCE061A/IDE/library/include" -I"F:/SPCE061A/IDE/library/include/sys"

BODY	= -body SPCE060A_061A -bfile "F:\SPCE061A\IDE\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\TNRFD_Demo1.S37"

ARYFILE	= "$(OUTDIR)\TNRFD_Demo1.ary"

SBMFILE	= "$(OUTDIR)\TNRFD_Demo1.sbm"

OPT	= -S -gstabs -Wall -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 -wpop

CFLAGS	= $(OPT) -B$(APPDIR)\toolchain\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= -listfile

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\TNRFDriver.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\TNDriverUser.obj" 

"$(OUTDIR)\Resource.obj": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\Resource.asm" 

"$(OUTDIR)\isr.obj": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\isr.asm" 

"$(OUTDIR)\TNRFDriver.obj": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\TNRFDriver.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TNRFDriver.lst" -o "$(OUTDIR)\TNRFDriver.obj" "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\TNRFDriver.asm" 

"$(OUTDIR)\main.asm": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\main.c" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo1/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\TNDriverUser.asm": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo1\TNDriverUser.c" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)/TNDriverUser.asm" "E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo1/TNDriverUser.c" 

"$(OUTDIR)\TNDriverUser.obj": "$(OUTDIR)\TNDriverUser.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TNDriverUser.lst" -o "$(OUTDIR)\TNDriverUser.obj" "$(OUTDIR)\TNDriverUser.asm" 


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
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\TNRFDriver.obj" 
	$(RM) "$(OUTDIR)\TNRFDriver.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\TNDriverUser.obj" 
	$(RM) "$(OUTDIR)\TNDriverUser.lst" 
	$(RM) "$(OUTDIR)\TNDriverUser.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

