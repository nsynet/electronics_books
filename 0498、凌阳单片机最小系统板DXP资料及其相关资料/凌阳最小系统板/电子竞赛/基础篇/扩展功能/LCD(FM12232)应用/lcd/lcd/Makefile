#####################################################################
#																	 
#	Created by u'nSP IDE		12:29:34	07/11/03
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

INCLUDES	= -I"F:/电子竞赛/竞赛光盘/基础篇/扩展功能－新颜/LCD(FM12232)应用/lcd/lcd" -I"../include"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\lcd.S37"

ARYFILE	= "$(OUTDIR)\lcd.ary"

SBMFILE	= "$(OUTDIR)\lcd.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\A32_16K_a20.res" \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\sacmV32.obj" \
	"$(OUTDIR)\SP_lib.obj" \
	"$(OUTDIR)\spce.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\lcd_driver.obj" \
	"$(OUTDIR)\sacm_user.obj" \
	"$(OUTDIR)\system.obj" 

"$(OUTDIR)\A32_16K_a20.res": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\voice\A32_16K.a20"
	$(RESC) "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\voice\A32_16K.a20" "$(OUTDIR)\A32_16K_a20.res" RES_A32_16K_A20 

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\Resource.asm" 

"$(OUTDIR)\sacmV32.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\sacmV32.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sacmV32.lst" -o "$(OUTDIR)\sacmV32.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\sacmV32.asm" 

"$(OUTDIR)\SP_lib.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\SP_lib.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SP_lib.lst" -o "$(OUTDIR)\SP_lib.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\SP_lib.asm" 

"$(OUTDIR)\spce.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\spce.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\spce.lst" -o "$(OUTDIR)\spce.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\spce.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\main.c" ".\sacmv32.h" ".\sp_lib.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/竞赛光盘/基础篇/扩展功能－新颜/LCD(FM12232)应用/lcd/lcd/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\isr.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\isr.asm" ".\sp_lib.inc" ".\a2000.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\isr.asm" 

"$(OUTDIR)\lcd_driver.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\lcd_driver.asm" ".\spce.inc" ".\sp_lib.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\lcd_driver.lst" -o "$(OUTDIR)\lcd_driver.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\lcd_driver.asm" 

"$(OUTDIR)\sacm_user.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\sacm_user.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sacm_user.lst" -o "$(OUTDIR)\sacm_user.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\sacm_user.asm" 

"$(OUTDIR)\system.obj": "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\system.asm" ".\spce.inc" ".\sp_lib.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\电子竞赛\竞赛光盘\基础篇\扩展功能－新颜\LCD(FM12232)应用\lcd\lcd\system.asm" 


.SUFFIXES : .c .asm .obj .s37 .tsk .res

all :	 "$(OUTDIR)" $(BINFILE)

"$(OUTDIR)" :
	if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

$(BINFILE) : $(OBJFILES) 
	$(LD) $(BINTYPE) $(ARYFILE) $(BINFILE) $(LDFLAGS) $(BODY) $(EXTRAFLAGS)

compile :	 $(OBJFILES)

clean :
	$(RM) "$(OUTDIR)\A32_16K_a20.res" 
	$(RM) "$(OUTDIR)\Resource.obj" 
	$(RM) "$(OUTDIR)\Resource.lst" 
	$(RM) "$(OUTDIR)\sacmV32.obj" 
	$(RM) "$(OUTDIR)\sacmV32.lst" 
	$(RM) "$(OUTDIR)\SP_lib.obj" 
	$(RM) "$(OUTDIR)\SP_lib.lst" 
	$(RM) "$(OUTDIR)\spce.obj" 
	$(RM) "$(OUTDIR)\spce.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\lcd_driver.obj" 
	$(RM) "$(OUTDIR)\lcd_driver.lst" 
	$(RM) "$(OUTDIR)\sacm_user.obj" 
	$(RM) "$(OUTDIR)\sacm_user.lst" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

