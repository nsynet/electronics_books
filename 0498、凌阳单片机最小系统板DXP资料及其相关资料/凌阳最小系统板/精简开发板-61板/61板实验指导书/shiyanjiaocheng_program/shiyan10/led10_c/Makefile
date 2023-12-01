#####################################################################
#																	 
#	Created by u'nSP IDE		20:15:15	08/18/04
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

INCLUDES	= -I"D:/shiyanjiaocheng_program/shiyan10/led10_c"

BODY	= -body SPCE061A -bfile "C:\Program Files\Sunplus\unSPIDE184\unSPIDE\Body\SPCE061A.cpt"

BINFILE	= "$(OUTDIR)\adled.S37"

ARYFILE	= "$(OUTDIR)\adled.ary"

SBMFILE	= "$(OUTDIR)\adled.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\mian.obj" 

"$(OUTDIR)\Resource.obj": "D:\shiyanjiaocheng_program\shiyan10\led10_c\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "D:\shiyanjiaocheng_program\shiyan10\led10_c\Resource.asm" 

"$(OUTDIR)\mian.obj": "D:\shiyanjiaocheng_program\shiyan10\led10_c\mian.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/mian.asm" "D:/shiyanjiaocheng_program/shiyan10/led10_c/mian.c" 
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\mian.lst" -o "$(OUTDIR)\mian.obj" "$(OUTDIR)\mian.asm" 


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
	$(RM) "$(OUTDIR)\mian.obj" 
	$(RM) "$(OUTDIR)\mian.lst" 
	$(RM) "$(OUTDIR)\mian.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

