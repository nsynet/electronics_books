//==========================================================
//文件名称:isr.asm
//功能描述:在FIQ中断里调用语音播放函数播放语音
//         在IRQ4_4KHz里调用数码管显示驱动函数
//维护记录 2005.12.2 by hongyan.Feng
//==========================================================
.INCLUDE SPCE061A.inc
.INCLUDE s480.inc
.EXTERNAL F_DIG_Drive
.text
.PUBLIC _FIQ
_FIQ:
	reti	
.PUBLIC _IRQ0
_IRQ0:	
	reti
.PUBLIC _IRQ1
_IRQ1:	
	reti
.PUBLIC _IRQ2
_IRQ2:	
	reti	
.PUBLIC _IRQ3
_IRQ3:	
	reti		  
.PUBLIC _IRQ4
_IRQ4:
	reti
.PUBLIC _IRQ5
_IRQ5:	
	reti
.PUBLIC _IRQ6
_IRQ6:	
	reti
.PUBLIC _IRQ7
_IRQ7:	
	reti
.PUBLIC _BREAK
_BREAK:	
	reti

.END
