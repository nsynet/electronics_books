#####################################################################
#																	 
#	Created by u'nSP IDE		09:00:03	11/25/05
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

INCLUDES	= -I"I:/1disktest/C_Code/chapter9 Audio/MS01"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\MS01.S37"

ARYFILE	= "$(OUTDIR)\MS01.ary"

SBMFILE	= "$(OUTDIR)\MS01.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\WISH1_BIN.res" \
	"$(OUTDIR)\ALA1_BIN.res" \
	"$(OUTDIR)\ALAINS_BIN.res" \
	"$(OUTDIR)\DECK1_BIN.res" \
	"$(OUTDIR)\GREEN1_BIN.res" \
	"$(OUTDIR)\HK1_BIN.res" \
	"$(OUTDIR)\LA1_BIN.res" \
	"$(OUTDIR)\PP1_BIN.res" \
	"$(OUTDIR)\S31_BIN.res" \
	"$(OUTDIR)\TW1_BIN.res" \
	"$(OUTDIR)\WINE1_BIN.res" \
	"$(OUTDIR)\1231_BIN.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\System.obj" \
	"$(OUTDIR)\sacmV32.obj" \
	"$(OUTDIR)\SP_lib.obj" \
	"$(OUTDIR)\spce.obj" \
	"$(OUTDIR)\SACM_user.obj" \
	"$(OUTDIR)\Isr.obj" 

"$(OUTDIR)\WISH1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\WISH1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\WISH1.BIN" "$(OUTDIR)\WISH1_BIN.res" RES_WISH1_BIN 

"$(OUTDIR)\ALA1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\ALA1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\ALA1.BIN" "$(OUTDIR)\ALA1_BIN.res" RES_ALA1_BIN 

"$(OUTDIR)\ALAINS_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\ALAINS.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\ALAINS.BIN" "$(OUTDIR)\ALAINS_BIN.res" RES_ALAINS_BIN 

"$(OUTDIR)\DECK1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\DECK1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\DECK1.BIN" "$(OUTDIR)\DECK1_BIN.res" RES_DECK1_BIN 

"$(OUTDIR)\GREEN1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\GREEN1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\GREEN1.BIN" "$(OUTDIR)\GREEN1_BIN.res" RES_GREEN1_BIN 

"$(OUTDIR)\HK1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\HK1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\HK1.BIN" "$(OUTDIR)\HK1_BIN.res" RES_HK1_BIN 

"$(OUTDIR)\LA1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\LA1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\LA1.BIN" "$(OUTDIR)\LA1_BIN.res" RES_LA1_BIN 

"$(OUTDIR)\PP1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\PP1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\PP1.BIN" "$(OUTDIR)\PP1_BIN.res" RES_PP1_BIN 

"$(OUTDIR)\S31_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\S31.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\S31.BIN" "$(OUTDIR)\S31_BIN.res" RES_S31_BIN 

"$(OUTDIR)\TW1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\TW1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\TW1.BIN" "$(OUTDIR)\TW1_BIN.res" RES_TW1_BIN 

"$(OUTDIR)\WINE1_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\WINE1.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\WINE1.BIN" "$(OUTDIR)\WINE1_BIN.res" RES_WINE1_BIN 

"$(OUTDIR)\1231_BIN.res": "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\1231.BIN"
	$(RESC) "I:\1disktest\C_Code\chapter9 Audio\MS01\SONG\1231.BIN" "$(OUTDIR)\1231_BIN.res" RES_1231_BIN 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter9 Audio\MS01\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter9 Audio\MS01\Resource.asm" 

"$(OUTDIR)\main.asm": "I:\1disktest\C_Code\chapter9 Audio\MS01\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "I:/1disktest/C_Code/chapter9 Audio/MS01/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\System.obj": "I:\1disktest\C_Code\chapter9 Audio\MS01\System.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\System.lst" -o "$(OUTDIR)\System.obj" "I:\1disktest\C_Code\chapter9 Audio\MS01\System.asm" 

"$(OUTDIR)\sacmV32.obj": "I:\1disktest\C_Code\chapter9 Audio\MS01\sacmV32.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sacmV32.lst" -o "$(OUTDIR)\sacmV32.obj" "I:\1disktest\C_Code\chapter9 Audio\MS01\sacmV32.asm" 

"$(OUTDIR)\SP_lib.obj": "I:\1disktest\C_Code\chapter9 Audio\MS01\SP_lib.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SP_lib.lst" -o "$(OUTDIR)\SP_lib.obj" "I:\1disktest\C_Code\chapter9 Audio\MS01\SP_lib.asm" 

"$(OUTDIR)\spce.obj": "I:\1disktest\C_Code\chapter9 Audio\MS01\spce.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\spce.lst" -o "$(OUTDIR)\spce.obj" "I:\1disktest\C_Code\chapter9 Audio\MS01\spce.asm" 

"$(OUTDIR)\SACM_user.obj": "I:\1disktest\C_Code\chapter9 Audio\MS01\SACM_user.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SACM_user.lst" -o "$(OUTDIR)\SACM_user.obj" "I:\1disktest\C_Code\chapter9 Audio\MS01\SACM_user.asm" 

"$(OUTDIR)\Isr.obj": "I:\1disktest\C_Code\chapter9 Audio\MS01\Isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Isr.lst" -o "$(OUTDIR)\Isr.obj" "I:\1disktest\C_Code\chapter9 Audio\MS01\Isr.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\WISH1_BIN.res" 
	$(RM) "$(OUTDIR)\ALA1_BIN.res" 
	$(RM) "$(OUTDIR)\ALAINS_BIN.res" 
	$(RM) "$(OUTDIR)\DECK1_BIN.res" 
	$(RM) "$(OUTDIR)\GREEN1_BIN.res" 
	$(RM) "$(OUTDIR)\HK1_BIN.res" 
	$(RM) "$(OUTDIR)\LA1_BIN.res" 
	$(RM) "$(OUTDIR)\PP1_BIN.res" 
	$(RM) "$(OUTDIR)\S31_BIN.res" 
	$(RM) "$(OUTDIR)\TW1_BIN.res" 
	$(RM) "$(OUTDIR)\WINE1_BIN.res" 
	$(RM) "$(OUTDIR)\1231_BIN.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\System.obj" 
	$(RM) "$(OUTDIR)\System.lst" 
	$(RM) "$(OUTDIR)\sacmV32.obj" 
	$(RM) "$(OUTDIR)\sacmV32.lst" 
	$(RM) "$(OUTDIR)\SP_lib.obj" 
	$(RM) "$(OUTDIR)\SP_lib.lst" 
	$(RM) "$(OUTDIR)\spce.obj" 
	$(RM) "$(OUTDIR)\spce.lst" 
	$(RM) "$(OUTDIR)\SACM_user.obj" 
	$(RM) "$(OUTDIR)\SACM_user.lst" 
	$(RM) "$(OUTDIR)\Isr.obj" 
	$(RM) "$(OUTDIR)\Isr.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

