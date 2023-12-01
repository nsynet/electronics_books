#####################################################################
#																	 
#	Created by u'nSP IDE		17:53:40	06/14/09
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

INCLUDES	= -I"E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo2" -I"F:/SPCE061A/IDE/library/include" -I"F:/SPCE061A/IDE/library/include/sys"

BODY	= -body SPCE060A_061A -bfile "F:\SPCE061A\IDE\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\TNRFD_thermoMeter.S37"

ARYFILE	= "$(OUTDIR)\TNRFD_thermoMeter.ary"

SBMFILE	= "$(OUTDIR)\TNRFD_thermoMeter.sbm"

OPT	= -S -gstabs -Wall -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 -wpop

CFLAGS	= $(OPT) -B$(APPDIR)\toolchain\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= -listfile

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\T064_48k.res" \
	"$(OUTDIR)\0_48k.res" \
	"$(OUTDIR)\1_48k.res" \
	"$(OUTDIR)\2_48k.res" \
	"$(OUTDIR)\3_48k.res" \
	"$(OUTDIR)\4_48k.res" \
	"$(OUTDIR)\5_48k.res" \
	"$(OUTDIR)\6_48k.res" \
	"$(OUTDIR)\7_48k.res" \
	"$(OUTDIR)\8_48k.res" \
	"$(OUTDIR)\9_48k.res" \
	"$(OUTDIR)\10_48k.res" \
	"$(OUTDIR)\bai_48k.res" \
	"$(OUTDIR)\hjwd_48k.res" \
	"$(OUTDIR)\mbwd_48k.res" \
	"$(OUTDIR)\ok_48k.res" \
	"$(OUTDIR)\shd_48k.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\TNRFDriver.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\TNDriverUser.obj" \
	"$(OUTDIR)\Key.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\PlayData.obj" 

"$(OUTDIR)\T064_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\T064.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\T064.48k" "$(OUTDIR)\T064_48k.res" RES_T064_48K 

"$(OUTDIR)\0_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\0.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\0.48k" "$(OUTDIR)\0_48k.res" RES_0_48K 

"$(OUTDIR)\1_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\1.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\1.48k" "$(OUTDIR)\1_48k.res" RES_1_48K 

"$(OUTDIR)\2_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\2.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\2.48k" "$(OUTDIR)\2_48k.res" RES_2_48K 

"$(OUTDIR)\3_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\3.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\3.48k" "$(OUTDIR)\3_48k.res" RES_3_48K 

"$(OUTDIR)\4_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\4.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\4.48k" "$(OUTDIR)\4_48k.res" RES_4_48K 

"$(OUTDIR)\5_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\5.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\5.48k" "$(OUTDIR)\5_48k.res" RES_5_48K 

"$(OUTDIR)\6_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\6.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\6.48k" "$(OUTDIR)\6_48k.res" RES_6_48K 

"$(OUTDIR)\7_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\7.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\7.48k" "$(OUTDIR)\7_48k.res" RES_7_48K 

"$(OUTDIR)\8_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\8.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\8.48k" "$(OUTDIR)\8_48k.res" RES_8_48K 

"$(OUTDIR)\9_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\9.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\9.48k" "$(OUTDIR)\9_48k.res" RES_9_48K 

"$(OUTDIR)\10_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\10.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\10.48k" "$(OUTDIR)\10_48k.res" RES_10_48K 

"$(OUTDIR)\bai_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\bai.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\bai.48k" "$(OUTDIR)\bai_48k.res" RES_BAI_48K 

"$(OUTDIR)\hjwd_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\hjwd.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\hjwd.48k" "$(OUTDIR)\hjwd_48k.res" RES_HJWD_48K 

"$(OUTDIR)\mbwd_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\mbwd.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\mbwd.48k" "$(OUTDIR)\mbwd_48k.res" RES_MBWD_48K 

"$(OUTDIR)\ok_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\ok.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\ok.48k" "$(OUTDIR)\ok_48k.res" RES_OK_48K 

"$(OUTDIR)\shd_48k.res": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\shd.48k"
	$(RESC) "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\voice\shd.48k" "$(OUTDIR)\shd_48k.res" RES_SHD_48K 

"$(OUTDIR)\Resource.obj": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\Resource.asm" 

"$(OUTDIR)\TNRFDriver.obj": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\TNRFDriver.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TNRFDriver.lst" -o "$(OUTDIR)\TNRFDriver.obj" "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\TNRFDriver.asm" 

"$(OUTDIR)\hardware.obj": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\hardware.asm" 

"$(OUTDIR)\isr.obj": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\isr.asm" 

"$(OUTDIR)\TNDriverUser.asm": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\TNDriverUser.c" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)/TNDriverUser.asm" "E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo2/TNDriverUser.c" 

"$(OUTDIR)\TNDriverUser.obj": "$(OUTDIR)\TNDriverUser.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\TNDriverUser.lst" -o "$(OUTDIR)\TNDriverUser.obj" "$(OUTDIR)\TNDriverUser.asm" 

"$(OUTDIR)\Key.asm": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\Key.c" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)/Key.asm" "E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo2/Key.c" 

"$(OUTDIR)\Key.obj": "$(OUTDIR)\Key.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Key.lst" -o "$(OUTDIR)\Key.obj" "$(OUTDIR)\Key.asm" 

"$(OUTDIR)\main.asm": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\main.c" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo2/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\PlayData.asm": "E:\单片机整理\凌阳单片机\模组资料\红外测温模组\Demo_Code\TNRFD_Demo2\PlayData.c" ".\s480.h" 
	set PATH="$(APPDIR)\toolchain\";%PATH% & \
	$(CC) $(CFLAGS) -o "$(OUTDIR)/PlayData.asm" "E:/单片机整理/凌阳单片机/模组资料/红外测温模组/Demo_Code/TNRFD_Demo2/PlayData.c" 

"$(OUTDIR)\PlayData.obj": "$(OUTDIR)\PlayData.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\PlayData.lst" -o "$(OUTDIR)\PlayData.obj" "$(OUTDIR)\PlayData.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 BEFOREBUILD "$(OUTDIR)" $(BINFILE)

BEFOREBUILD :

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\T064_48k.res" 
	$(RM) "$(OUTDIR)\0_48k.res" 
	$(RM) "$(OUTDIR)\1_48k.res" 
	$(RM) "$(OUTDIR)\2_48k.res" 
	$(RM) "$(OUTDIR)\3_48k.res" 
	$(RM) "$(OUTDIR)\4_48k.res" 
	$(RM) "$(OUTDIR)\5_48k.res" 
	$(RM) "$(OUTDIR)\6_48k.res" 
	$(RM) "$(OUTDIR)\7_48k.res" 
	$(RM) "$(OUTDIR)\8_48k.res" 
	$(RM) "$(OUTDIR)\9_48k.res" 
	$(RM) "$(OUTDIR)\10_48k.res" 
	$(RM) "$(OUTDIR)\bai_48k.res" 
	$(RM) "$(OUTDIR)\hjwd_48k.res" 
	$(RM) "$(OUTDIR)\mbwd_48k.res" 
	$(RM) "$(OUTDIR)\ok_48k.res" 
	$(RM) "$(OUTDIR)\shd_48k.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\TNRFDriver.obj" 
	$(RM) "$(OUTDIR)\TNRFDriver.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\TNDriverUser.obj" 
	$(RM) "$(OUTDIR)\TNDriverUser.lst" 
	$(RM) "$(OUTDIR)\TNDriverUser.asm" 
	$(RM) "$(OUTDIR)\Key.obj" 
	$(RM) "$(OUTDIR)\Key.lst" 
	$(RM) "$(OUTDIR)\Key.asm" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\PlayData.obj" 
	$(RM) "$(OUTDIR)\PlayData.lst" 
	$(RM) "$(OUTDIR)\PlayData.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

