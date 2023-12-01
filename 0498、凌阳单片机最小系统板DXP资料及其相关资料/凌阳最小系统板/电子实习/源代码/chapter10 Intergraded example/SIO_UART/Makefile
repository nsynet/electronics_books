#####################################################################
#																	 
#	Created by u'nSP IDE		16:38:28	07/09/03
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

INCLUDES	= -I"F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART"

BODY	= -body SPCE061A_EZPROBE -bfile "$(APPDIR)\Body\SPCE061A_EZPROBE.cpt"

BINFILE	= "$(OUTDIR)\SIO_UART.S37"

ARYFILE	= "$(OUTDIR)\SIO_UART.ary"

SBMFILE	= "$(OUTDIR)\SIO_UART.sbm"

OPT	= -S -gstabs 

ASFLAGS	= -d -t2

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

"$(OUTDIR)\Resource.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\Resource.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Resource.lst" -o "$(OUTDIR)\Resource.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\Resource.asm" 

"$(OUTDIR)\isr.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\isr.asm" ".\dvr.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\isr.lst" -o "$(OUTDIR)\isr.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\isr.asm" 

"$(OUTDIR)\key.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\key.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\key.lst" -o "$(OUTDIR)\key.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\key.asm" 

"$(OUTDIR)\main.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\main.c" ".\spce.h" ".\dvr.h" ".\SIO_UART.h" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/main.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART/main.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\main.lst" -o "$(OUTDIR)\main.obj" "$(OUTDIR)\main.asm" 

"$(OUTDIR)\system.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\system.asm" ".\resource.inc" ".\spce.inc" ".\key.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\system.lst" -o "$(OUTDIR)\system.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\system.asm" 

"$(OUTDIR)\sram.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\sram.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\sram.lst" -o "$(OUTDIR)\sram.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\sram.asm" 

"$(OUTDIR)\SP_SerialFlashV1.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\SP_SerialFlashV1.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\SP_SerialFlashV1.lst" -o "$(OUTDIR)\SP_SerialFlashV1.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\SP_SerialFlashV1.asm" 

"$(OUTDIR)\hardware.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\hardware.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\hardware.lst" -o "$(OUTDIR)\hardware.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\hardware.asm" 

"$(OUTDIR)\FlashROM.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\FlashROM.asm" ".\spce.inc" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\FlashROM.lst" -o "$(OUTDIR)\FlashROM.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\FlashROM.asm" 

"$(OUTDIR)\UartAPI.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\UartAPI.asm" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\UartAPI.lst" -o "$(OUTDIR)\UartAPI.obj" "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\UartAPI.asm" 

"$(OUTDIR)\EmbedFlashROM.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\EmbedFlashROM.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/EmbedFlashROM.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART/EmbedFlashROM.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\EmbedFlashROM.lst" -o "$(OUTDIR)\EmbedFlashROM.obj" "$(OUTDIR)\EmbedFlashROM.asm" 

"$(OUTDIR)\UART.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\UART.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/UART.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART/UART.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\UART.lst" -o "$(OUTDIR)\UART.obj" "$(OUTDIR)\UART.asm" 

"$(OUTDIR)\Serial_Flash.obj": "F:\电子竞赛\C语言应用篇\Source Code\chapter10 Intergraded example\SIO_UART\Serial_Flash.c" 
	$(CC) $(CFLAGS) -o "$(OUTDIR)/Serial_Flash.asm" "F:/电子竞赛/C语言应用篇/Source Code/chapter10 Intergraded example/SIO_UART/Serial_Flash.c" 
	$(AS) $(ASFLAGS) $(INCLUDES) -l "$(OUTDIR)\Serial_Flash.lst" -o "$(OUTDIR)\Serial_Flash.obj" "$(OUTDIR)\Serial_Flash.asm" 


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

