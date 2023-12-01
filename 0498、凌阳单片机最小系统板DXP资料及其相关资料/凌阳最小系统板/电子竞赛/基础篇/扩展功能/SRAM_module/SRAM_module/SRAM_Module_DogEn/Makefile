#####################################################################
#																	 
#	Created by u'nSP IDE		12:33:19	07/10/03
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

INCLUDES	= -I"F:/电子竞赛/竞赛光盘/基础篇/扩展功能－新颜/SRAM_module/SRAM_module/SRAM_Module_DogEn"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\SRAM_Module.S37"

ARYFILE	= "$(OUTDIR)\SRAM_Module.ary"

SBMFILE	= "$(OUTDIR)\SRAM_Module.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\sram.obj" \
	"$(OUTDIR)\main.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\SRAM_module\SRAM_module\SRAM_Module_DogEn\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\SRAM_module\SRAM_module\SRAM_Module_DogEn\Resource.asm" 

"$(OUTDIR)\system.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\SRAM_module\SRAM_module\SRAM_Module_DogEn\system.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\SRAM_module\SRAM_module\SRAM_Module_DogEn\system.asm" 

"$(OUTDIR)\sram.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\SRAM_module\SRAM_module\SRAM_Module_DogEn\sram.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sram.lst" -o "$(OUTDIR)\sram.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\SRAM_module\SRAM_module\SRAM_Module_DogEn\sram.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\SRAM_module\SRAM_module\SRAM_Module_DogEn\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/竞赛光盘/基础篇/扩展功能－新颜/SRAM_module/SRAM_module/SRAM_Module_DogEn/main.c" 
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
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\sram.obj" 
	$(RM) "$(OUTDIR)\sram.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

