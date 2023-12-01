#####################################################################
#																	 
#	Created by u'nSP IDE		10:07:28	11/25/05
#
#####################################################################




APPDIR	= C:\PROGRA~1\Sunplus\UNSPID~1.0

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"I:/1disktest/C_Code/chapter9 Audio/S240"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\S240.S37"

ARYFILE	= "$(OUTDIR)\S240.ary"

SBMFILE	= "$(OUTDIR)\S240.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\pk3.res" \
	"$(OUTDIR)\pk2.res" \
	"$(OUTDIR)\pk1.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\spce.obj" \
	"$(OUTDIR)\SP_lib.obj" \
	"$(OUTDIR)\sacmV32.obj" \
	"$(OUTDIR)\ISR.obj" 

"$(OUTDIR)\pk3.res": "I:\1disktest\C_Code\chapter9 Audio\S240\voice\pk3"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\S240\voice\pk3" "$(OUTDIR)\pk3.res" RES_PK3 

"$(OUTDIR)\pk2.res": "I:\1disktest\C_Code\chapter9 Audio\S240\voice\pk2"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\S240\voice\pk2" "$(OUTDIR)\pk2.res" RES_PK2 

"$(OUTDIR)\pk1.res": "I:\1disktest\C_Code\chapter9 Audio\S240\voice\pk1"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\S240\voice\pk1" "$(OUTDIR)\pk1.res" RES_PK1 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter9 Audio\S240\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter9 Audio\S240\Resource.asm" 

"$(OUTDIR)\main.asm": "I:\1disktest\C_Code\chapter9 Audio\S240\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "I:/1disktest/C_Code/chapter9 Audio/S240/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\system.obj": "I:\1disktest\C_Code\chapter9 Audio\S240\system.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "I:\1disktest\C_Code\chapter9 Audio\S240\system.asm" 

"$(OUTDIR)\spce.obj": "I:\1disktest\C_Code\chapter9 Audio\S240\spce.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\spce.lst" -o "$(OUTDIR)\spce.obj" "I:\1disktest\C_Code\chapter9 Audio\S240\spce.asm" 

"$(OUTDIR)\SP_lib.obj": "I:\1disktest\C_Code\chapter9 Audio\S240\SP_lib.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SP_lib.lst" -o "$(OUTDIR)\SP_lib.obj" "I:\1disktest\C_Code\chapter9 Audio\S240\SP_lib.asm" 

"$(OUTDIR)\sacmV32.obj": "I:\1disktest\C_Code\chapter9 Audio\S240\sacmV32.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sacmV32.lst" -o "$(OUTDIR)\sacmV32.obj" "I:\1disktest\C_Code\chapter9 Audio\S240\sacmV32.asm" 

"$(OUTDIR)\ISR.asm": "I:\1disktest\C_Code\chapter9 Audio\S240\ISR.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/ISR.asm" "I:/1disktest/C_Code/chapter9 Audio/S240/ISR.c" 

"$(OUTDIR)\ISR.obj": "$(OUTDIR)\ISR.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\ISR.lst" -o "$(OUTDIR)\ISR.obj" "$(OUTDIR)\ISR.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\pk3.res" 
	$(RM) "$(OUTDIR)\pk2.res" 
	$(RM) "$(OUTDIR)\pk1.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\spce.obj" 
	$(RM) "$(OUTDIR)\spce.lst" 
	$(RM) "$(OUTDIR)\SP_lib.obj" 
	$(RM) "$(OUTDIR)\SP_lib.lst" 
	$(RM) "$(OUTDIR)\sacmV32.obj" 
	$(RM) "$(OUTDIR)\sacmV32.lst" 
	$(RM) "$(OUTDIR)\ISR.obj" 
	$(RM) "$(OUTDIR)\ISR.lst" 
	$(RM) "$(OUTDIR)\ISR.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

