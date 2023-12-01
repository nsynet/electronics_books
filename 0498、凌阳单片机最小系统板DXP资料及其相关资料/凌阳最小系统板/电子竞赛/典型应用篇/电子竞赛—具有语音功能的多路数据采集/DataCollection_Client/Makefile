#####################################################################
#																	 
#	Created by u'nSP IDE		01:39:22	07/12/03
#
#####################################################################




APPDIR	= D:\PROGRA~1\Sunplus\UNSPID~2\IDE180

OUTDIR	= .\Debug

CC	= $(APPDIR)\gcc

AS	= $(APPDIR)\xasm16

LD	= $(APPDIR)\xlink16

AR	= $(APPDIR)\xLib16

RESC	= $(APPDIR)\resc

RM	= $(APPDIR)\rm -f

INCLUDES	= -I"F:/DXJH/e_design/Data_Sample/release/DataCollection_code/DataCollection_Client"

BODY	= -body SPCE061A_PROBE -bfile "$(APPDIR)\Body\SPCE061A_PROBE.cpt"

BINFILE	= "$(OUTDIR)\DataCollection_Client.S37"

ARYFILE	= "$(OUTDIR)\DataCollection_Client.ary"

SBMFILE	= "$(OUTDIR)\DataCollection_Client.sbm"

OPT	= -S -gstabs

ASFLAGS	= -d -t2

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	=   

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\Main.obj" \
	"$(OUTDIR)\UART.obj" \
	"$(OUTDIR)\System.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\Ad.obj" 

"$(OUTDIR)\Resource.obj": "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\Resource.asm" 

"$(OUTDIR)\Main.obj": "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\Main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/Main.asm" "F:/DXJH/e_design/Data_Sample/release/DataCollection_code/DataCollection_Client/Main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Main.lst" -o "$(OUTDIR)\Main.obj" "$(OUTDIR)\Main.asm" 

"$(OUTDIR)\UART.obj": "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\UART.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\UART.lst" -o "$(OUTDIR)\UART.obj" "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\UART.asm" 

"$(OUTDIR)\System.obj": "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\System.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\System.lst" -o "$(OUTDIR)\System.obj" "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\System.asm" 

"$(OUTDIR)\isr.obj": "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\isr.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\isr.asm" 

"$(OUTDIR)\Ad.obj": "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\Ad.asm" ".\hardware.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Ad.lst" -o "$(OUTDIR)\Ad.obj" "F:\DXJH\e_design\Data_Sample\release\DataCollection_code\DataCollection_Client\Ad.asm" 


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
	$(RM) "$(OUTDIR)\Main.obj" 
	$(RM) "$(OUTDIR)\Main.lst" 
	$(RM) "$(OUTDIR)\Main.asm" 
	$(RM) "$(OUTDIR)\UART.obj" 
	$(RM) "$(OUTDIR)\UART.lst" 
	$(RM) "$(OUTDIR)\System.obj" 
	$(RM) "$(OUTDIR)\System.lst" 
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\Ad.obj" 
	$(RM) "$(OUTDIR)\Ad.lst" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

