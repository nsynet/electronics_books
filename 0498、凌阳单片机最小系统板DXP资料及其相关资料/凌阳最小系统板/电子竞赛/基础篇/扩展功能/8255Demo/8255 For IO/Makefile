#####################################################################
#																	 
#	Created by u'nSP IDE		21:00:58	07/09/03
#
#####################################################################




APPDIR	= E:\PROGRA~1\Sunplus\UNSPID~3\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/电子竞赛/基础篇/扩展功能－新颜/8255Demo/8255 For IO" -I"../../../Program Files/Sunplus/unSPIDE162/Include"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\8255 For IO.S37"

ARYFILE	= "$(OUTDIR)\8255 For IO.ary"

SBMFILE	= "$(OUTDIR)\8255 For IO.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\8255sub.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\8255Demo\8255 For IO\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\基础篇\扩展功能－新颜\8255Demo\8255 For IO\Resource.asm" 

"$(OUTDIR)\hardware.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\8255Demo\8255 For IO\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\电子竞赛\基础篇\扩展功能－新颜\8255Demo\8255 For IO\hardware.asm" 

"$(OUTDIR)\8255sub.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\8255Demo\8255 For IO\8255sub.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\8255sub.lst" -o "$(OUTDIR)\8255sub.obj" "F:\电子竞赛\基础篇\扩展功能－新颜\8255Demo\8255 For IO\8255sub.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\8255Demo\8255 For IO\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/基础篇/扩展功能－新颜/8255Demo/8255 For IO/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 


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
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\8255sub.obj" 
	$(RM) "$(OUTDIR)\8255sub.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

