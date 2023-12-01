#####################################################################
#																	 
#	Created by u'nSP IDE		09:01:51	09/08/04
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

INCLUDES	= -I"D:/program/shiyanjiaocheng_program/shiyan4/led4_c"

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
	"$(OUTDIR)\key.obj" 

"$(OUTDIR)\Resource.obj": "D:\program\shiyanjiaocheng_program\shiyan4\led4_c\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "D:\program\shiyanjiaocheng_program\shiyan4\led4_c\Resource.asm" 

"$(OUTDIR)\main.obj": "D:\program\shiyanjiaocheng_program\shiyan4\led4_c\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "D:/program/shiyanjiaocheng_program/shiyan4/led4_c/main.c" 
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\key.obj": "D:\program\shiyanjiaocheng_program\shiyan4\led4_c\key.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/key.asm" "D:/program/shiyanjiaocheng_program/shiyan4/led4_c/key.c" 
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "$(OUTDIR)\key.asm" 


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
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\key.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

