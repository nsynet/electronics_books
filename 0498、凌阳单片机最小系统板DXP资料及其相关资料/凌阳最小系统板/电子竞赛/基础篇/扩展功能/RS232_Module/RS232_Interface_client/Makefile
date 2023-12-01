#####################################################################
#																	 
#	Created by u'nSP IDE		20:39:02	07/09/03
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

INCLUDES	= -I"F:/电子竞赛/基础篇/扩展功能－新颜/RS232_Module_DogEn/RS232_Module/RS232_Interface_client"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\RS232_Interface.S37"

ARYFILE	= "$(OUTDIR)\RS232_Interface.ary"

SBMFILE	= "$(OUTDIR)\RS232_Interface.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\uart.obj" 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\RS232_Module_DogEn\RS232_Module\RS232_Interface_client\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\基础篇\扩展功能－新颜\RS232_Module_DogEn\RS232_Module\RS232_Interface_client\Resource.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\RS232_Module_DogEn\RS232_Module\RS232_Interface_client\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/基础篇/扩展功能－新颜/RS232_Module_DogEn/RS232_Module/RS232_Interface_client/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\system.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\RS232_Module_DogEn\RS232_Module\RS232_Interface_client\system.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\电子竞赛\基础篇\扩展功能－新颜\RS232_Module_DogEn\RS232_Module\RS232_Interface_client\system.asm" 

"$(OUTDIR)\uart.obj": "F:\电子竞赛\基础篇\扩展功能－新颜\RS232_Module_DogEn\RS232_Module\RS232_Interface_client\uart.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\uart.lst" -o "$(OUTDIR)\uart.obj" "F:\电子竞赛\基础篇\扩展功能－新颜\RS232_Module_DogEn\RS232_Module\RS232_Interface_client\uart.asm" 


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
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\uart.obj" 
	$(RM) "$(OUTDIR)\uart.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

