#####################################################################
#																	 
#	Created by u'nSP IDE		09:14:13	09/08/04
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

INCLUDES	= -I"D:/program/shiyanjiaocheng_program/shiyan4/led4_asm"

BODY	= -body SPCE061A -bfile "C:\Program Files\Sunplus\unSPIDE184\unSPIDE\Body\SPCE061A.cpt"

BINFILE	= "$(OUTDIR)\led4.S37"

ARYFILE	= "$(OUTDIR)\led4.ary"

SBMFILE	= "$(OUTDIR)\led4.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\key_asm.obj" 

"$(OUTDIR)\Resource.obj": "D:\program\shiyanjiaocheng_program\shiyan4\led4_asm\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "D:\program\shiyanjiaocheng_program\shiyan4\led4_asm\Resource.asm" 

"$(OUTDIR)\main.obj": "D:\program\shiyanjiaocheng_program\shiyan4\led4_asm\main.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "D:\program\shiyanjiaocheng_program\shiyan4\led4_asm\main.asm" 

"$(OUTDIR)\key_asm.obj": "D:\program\shiyanjiaocheng_program\shiyan4\led4_asm\key_asm.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key_asm.lst" -o "$(OUTDIR)\key_asm.obj" "D:\program\shiyanjiaocheng_program\shiyan4\led4_asm\key_asm.asm" 


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
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\key_asm.obj" 
	$(RM) "$(OUTDIR)\key_asm.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

