#####################################################################
#																	 
#	Created by u'nSP IDE		09:01:16	11/25/05
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

INCLUDES	= -I"I:/1disktest/C_Code/chapter10 Intergraded example/SIO_UART"

BODY	= -body SPCE060A_061A -bfile "C:\Program Files\Sunplus\unSP IDE Common\Body\SPCE060A_061A.cpt"

BINFILE	= "$(OUTDIR)\SIO_UART.S37"

ARYFILE	= "$(OUTDIR)\SIO_UART.ary"

SBMFILE	= "$(OUTDIR)\SIO_UART.sbm"

OPT	= -S -gstabs -mglobal-var-iram

ASFLAGS	= -t2 -d

CASFLAGS	= -t2 

CFLAGS	= $(OPT) -B$(APPDIR)\ $(INCLUDES) 

BINTYPE	= -as

LDFLAGS	= 

EXTRAFLAGS	= 


OBJFILES	= \
	"$(OUTDIR)\Resource.obj" \
	"$(OUTDIR)\isr.obj" \
	"$(OUTDIR)\key.obj" \
	"$(OUTDIR)\main.obj" \
	"$(OUTDIR)\system.obj" \
	"$(OUTDIR)\sram.obj" \
	"$(OUTDIR)\SP_SerialFlashV1.obj" \
	"$(OUTDIR)\hardware.obj" \
	"$(OUTDIR)\FlashROM.obj" \
	"$(OUTDIR)\UartAPI.obj" \
	"$(OUTDIR)\EmbedFlashROM.obj" \
	"$(OUTDIR)\UART.obj" \
	"$(OUTDIR)\Serial_Flash.obj" 

"$(OUTDIR)\Resource.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\Resource.asm" 

"$(OUTDIR)\isr.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\isr.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\isr.asm" 

"$(OUTDIR)\key.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\key.asm" 

"$(OUTDIR)\main.asm": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\main.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "I:/1disktest/C_Code/chapter10 Intergraded example/SIO_UART/main.c" 

"$(OUTDIR)\main.obj": "$(OUTDIR)\main.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\system.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\system.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\system.asm" 

"$(OUTDIR)\sram.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\sram.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sram.lst" -o "$(OUTDIR)\sram.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\sram.asm" 

"$(OUTDIR)\SP_SerialFlashV1.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\SP_SerialFlashV1.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SP_SerialFlashV1.lst" -o "$(OUTDIR)\SP_SerialFlashV1.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\SP_SerialFlashV1.asm" 

"$(OUTDIR)\hardware.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\hardware.asm" 

"$(OUTDIR)\FlashROM.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\FlashROM.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\FlashROM.lst" -o "$(OUTDIR)\FlashROM.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\FlashROM.asm" 

"$(OUTDIR)\UartAPI.obj": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\UartAPI.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\UartAPI.lst" -o "$(OUTDIR)\UartAPI.obj" "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\UartAPI.asm" 

"$(OUTDIR)\EmbedFlashROM.asm": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\EmbedFlashROM.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/EmbedFlashROM.asm" "I:/1disktest/C_Code/chapter10 Intergraded example/SIO_UART/EmbedFlashROM.c" 

"$(OUTDIR)\EmbedFlashROM.obj": "$(OUTDIR)\EmbedFlashROM.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\EmbedFlashROM.lst" -o "$(OUTDIR)\EmbedFlashROM.obj" "$(OUTDIR)\EmbedFlashROM.asm" 

"$(OUTDIR)\UART.asm": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\UART.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/UART.asm" "I:/1disktest/C_Code/chapter10 Intergraded example/SIO_UART/UART.c" 

"$(OUTDIR)\UART.obj": "$(OUTDIR)\UART.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\UART.lst" -o "$(OUTDIR)\UART.obj" "$(OUTDIR)\UART.asm" 

"$(OUTDIR)\Serial_Flash.asm": "I:\1disktest\C_Code\chapter10 Intergraded example\SIO_UART\Serial_Flash.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/Serial_Flash.asm" "I:/1disktest/C_Code/chapter10 Intergraded example/SIO_UART/Serial_Flash.c" 

"$(OUTDIR)\Serial_Flash.obj": "$(OUTDIR)\Serial_Flash.asm"
	$(AS) $(CASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Serial_Flash.lst" -o "$(OUTDIR)\Serial_Flash.obj" "$(OUTDIR)\Serial_Flash.asm" 


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
	$(RM) "$(OUTDIR)\isr.obj" 
	$(RM) "$(OUTDIR)\isr.lst" 
	$(RM) "$(OUTDIR)\key.obj" 
	$(RM) "$(OUTDIR)\key.lst" 
	$(RM) "$(OUTDIR)\main.obj" 
	$(RM) "$(OUTDIR)\main.lst" 
	$(RM) "$(OUTDIR)\main.asm" 
	$(RM) "$(OUTDIR)\system.obj" 
	$(RM) "$(OUTDIR)\system.lst" 
	$(RM) "$(OUTDIR)\sram.obj" 
	$(RM) "$(OUTDIR)\sram.lst" 
	$(RM) "$(OUTDIR)\SP_SerialFlashV1.obj" 
	$(RM) "$(OUTDIR)\SP_SerialFlashV1.lst" 
	$(RM) "$(OUTDIR)\hardware.obj" 
	$(RM) "$(OUTDIR)\hardware.lst" 
	$(RM) "$(OUTDIR)\FlashROM.obj" 
	$(RM) "$(OUTDIR)\FlashROM.lst" 
	$(RM) "$(OUTDIR)\UartAPI.obj" 
	$(RM) "$(OUTDIR)\UartAPI.lst" 
	$(RM) "$(OUTDIR)\EmbedFlashROM.obj" 
	$(RM) "$(OUTDIR)\EmbedFlashROM.lst" 
	$(RM) "$(OUTDIR)\EmbedFlashROM.asm" 
	$(RM) "$(OUTDIR)\UART.obj" 
	$(RM) "$(OUTDIR)\UART.lst" 
	$(RM) "$(OUTDIR)\UART.asm" 
	$(RM) "$(OUTDIR)\Serial_Flash.obj" 
	$(RM) "$(OUTDIR)\Serial_Flash.lst" 
	$(RM) "$(OUTDIR)\Serial_Flash.asm" 
	$(RM) $(BINFILE) $(SBMFILE) 

.c.asm:
	$(CC) $(CFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

.asm.obj:
	$(AS) $(ASFLAGS) $(INCLUDES) -o "$(OUTDIR)/$@" $<

