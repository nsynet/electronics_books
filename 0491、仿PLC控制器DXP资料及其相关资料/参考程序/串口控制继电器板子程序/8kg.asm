
;CodeVisionAVR C Compiler V1.24.8b Professional
;(C) Copyright 1998-2006 Pavel Haiduc, HP InfoTech s.r.l.
;http://www.hpinfotech.com

;Chip type              : ATmega8
;Program type           : Application
;Clock frequency        : 8.000000 MHz
;Memory model           : Small
;Optimize for           : Size
;(s)printf features     : int, width
;(s)scanf features      : int, width
;External SRAM size     : 0
;Data Stack size        : 256 byte(s)
;Heap size              : 0 byte(s)
;Promote char to int    : No
;char is unsigned       : Yes
;8 bit enums            : Yes
;Word align FLASH struct: No
;Enhanced core instructions    : On
;Automatic register allocation : On

	#pragma AVRPART ADMIN PART_NAME ATmega8
	#pragma AVRPART MEMORY PROG_FLASH 8192
	#pragma AVRPART MEMORY EEPROM 512
	#pragma AVRPART MEMORY INT_SRAM SIZE 1024
	#pragma AVRPART MEMORY INT_SRAM START_ADDR 0x60

	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU GICR=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F

	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31

	.EQU __se_bit=0x80
	.EQU __sm_mask=0x70
	.EQU __sm_adc_noise_red=0x10
	.EQU __sm_powerdown=0x20
	.EQU __sm_powersave=0x30
	.EQU __sm_standby=0x60
	.EQU __sm_ext_standby=0x70

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDB1MN
	SUBI R30,LOW(-@0-(@1))
	.ENDM
	.MACRO __ADDB2MN
	SUBI R26,LOW(-@0-(@1))
	.ENDM
	.MACRO __ADDW1MN
	SUBI R30,LOW(-@0-(@1))
	SBCI R31,HIGH(-@0-(@1))
	.ENDM
	.MACRO __ADDW2MN
	SUBI R26,LOW(-@0-(@1))
	SBCI R27,HIGH(-@0-(@1))
	.ENDM
	.MACRO __ADDW1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	.ENDM
	.MACRO __ADDD1FN
	SUBI R30,LOW(-2*@0-(@1))
	SBCI R31,HIGH(-2*@0-(@1))
	SBCI R22,BYTE3(-2*@0-(@1))
	.ENDM
	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDBMNN
	LDS  R30,@0+@1
	ANDI R30,LOW(@2)
	STS  @0+@1,R30
	.ENDM

	.MACRO __ANDWMNN
	LDS  R30,@0+@1
	ANDI R30,LOW(@2)
	STS  @0+@1,R30
	LDS  R30,@0+@1+1
	ANDI R30,HIGH(@2)
	STS  @0+@1+1,R30
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ORBMNN
	LDS  R30,@0+@1
	ORI  R30,LOW(@2)
	STS  @0+@1,R30
	.ENDM

	.MACRO __ORWMNN
	LDS  R30,@0+@1
	ORI  R30,LOW(@2)
	STS  @0+@1,R30
	LDS  R30,@0+@1+1
	ORI  R30,HIGH(@2)
	STS  @0+@1+1,R30
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __CLRD1S
	LDI  R30,0
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __PUTD2S
	STD  Y+@0,R26
	STD  Y+@0+1,R27
	STD  Y+@0+2,R24
	STD  Y+@0+3,R25
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+@1)
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+@1)
	LDI  R31,HIGH(@0+@1)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+@1)
	LDI  R31,HIGH(2*@0+@1)
	.ENDM

	.MACRO __POINTD1FN
	LDI  R30,LOW(2*@0+@1)
	LDI  R31,HIGH(2*@0+@1)
	LDI  R22,BYTE3(2*@0+@1)
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+@1)
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+@1)
	LDI  R27,HIGH(@0+@1)
	.ENDM

	.MACRO __POINTBRM
	LDI  R@0,LOW(@1)
	.ENDM

	.MACRO __POINTWRM
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __POINTBRMN
	LDI  R@0,LOW(@1+@2)
	.ENDM

	.MACRO __POINTWRMN
	LDI  R@0,LOW(@2+@3)
	LDI  R@1,HIGH(@2+@3)
	.ENDM

	.MACRO __POINTWRFN
	LDI  R@0,LOW(@2*2+@3)
	LDI  R@1,HIGH(@2*2+@3)
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+@1
	.ENDM

	.MACRO __GETB1HMN
	LDS  R31,@0+@1
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+@1
	LDS  R31,@0+@1+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+@1
	LDS  R31,@0+@1+1
	LDS  R22,@0+@1+2
	LDS  R23,@0+@1+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@0,@1+@2
	.ENDM

	.MACRO __GETWRMN
	LDS  R@0,@2+@3
	LDS  R@1,@2+@3+1
	.ENDM

	.MACRO __GETWRZ
	LDD  R@0,Z+@2
	LDD  R@1,Z+@2+1
	.ENDM

	.MACRO __GETD2Z
	LDD  R26,Z+@0
	LDD  R27,Z+@0+1
	LDD  R24,Z+@0+2
	LDD  R25,Z+@0+3
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+@1
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+@1
	LDS  R27,@0+@1+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+@1
	LDS  R27,@0+@1+1
	LDS  R24,@0+@1+2
	LDS  R25,@0+@1+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+@1,R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+@1,R30
	STS  @0+@1+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+@1,R30
	STS  @0+@1+1,R31
	STS  @0+@1+2,R22
	STS  @0+@1+3,R23
	.ENDM

	.MACRO __PUTDZ2
	STD  Z+@0,R26
	STD  Z+@0+1,R27
	STD  Z+@0+2,R24
	STD  Z+@0+3,R25
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+@1,R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+@1,R@2
	STS  @0+@1+1,R@3
	.ENDM

	.MACRO __PUTBZR
	STD  Z+@1,R@0
	.ENDM

	.MACRO __PUTWZR
	STD  Z+@2,R@0
	STD  Z+@2+1,R@1
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+@1
	LDS  R31,@0+@1+1
	ICALL
	.ENDM

	.MACRO __CALL1FN
	LDI  R30,LOW(2*@0+@1)
	LDI  R31,HIGH(2*@0+@1)
	RCALL __GETW1PF
	ICALL
	.ENDM

	.MACRO __CALL2EN
	LDI  R26,LOW(@0+@1)
	LDI  R27,HIGH(@0+@1)
	RCALL __EEPROMRDW
	ICALL
	.ENDM

	.MACRO __GETW1STACK
	IN   R26,SPL
	IN   R27,SPH
	ADIW R26,@0+1
	LD   R30,X+
	LD   R31,X
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RN
	MOVW R26,R@0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RNS
	MOVW R26,R@0
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RNS
	MOVW R26,R@0
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RON
	MOV  R26,R@0
	MOV  R27,R@1
	SUBI R26,LOW(-@2)
	SBCI R27,HIGH(-@2)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X,R30
	.ENDM

	.MACRO __PUTW1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1RONS
	MOV  R26,R@0
	MOV  R27,R@1
	ADIW R26,@2
	RCALL __PUTDP1
	.ENDM


	.MACRO __GETB1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETB1HSX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	.ENDM

	.MACRO __GETW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOVW R30,R0
	.ENDM

	.MACRO __GETB2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOVW R26,R0
	.ENDM

	.MACRO __GETBRSX
	MOVW R30,R28
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __LSLW8SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	CLR  R0
	ST   Z+,R0
	ST   Z,R0
	.ENDM

	.MACRO __CLRD1SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	CLR  R0
	ST   Z+,R0
	ST   Z+,R0
	ST   Z+,R0
	ST   Z,R0
	.ENDM

	.MACRO __PUTB2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTD2SX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z+,R27
	ST   Z+,R24
	ST   Z,R25
	.ENDM

	.MACRO __PUTBSRX
	MOVW R30,R28
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R@1
	.ENDM

	.MACRO __PUTWSRX
	MOVW R30,R28
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOVW R26,R28
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __MULBRR
	MULS R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRRU
	MUL  R@0,R@1
	MOVW R30,R0
	.ENDM

	.MACRO __MULBRR0
	MULS R@0,R@1
	.ENDM

	.MACRO __MULBRRU0
	MUL  R@0,R@1
	.ENDM

	.MACRO __MULBNWRU
	LDI  R26,@2
	MUL  R26,R@0
	MOVW R30,R0
	MUL  R26,R@1
	ADD  R31,R0
	.ENDM

	.CSEG
	.ORG 0

	.INCLUDE "8kg.vec"
	.INCLUDE "8kg.inc"

__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30

;INTERRUPT VECTORS ARE PLACED
;AT THE START OF FLASH
	LDI  R31,1
	OUT  GICR,R31
	OUT  GICR,R30
	OUT  MCUCR,R30

;DISABLE WATCHDOG
	LDI  R31,0x18
	OUT  WDTCR,R31
	OUT  WDTCR,R30

;CLEAR R2-R14
	LDI  R24,13
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(0x400)
	LDI  R25,HIGH(0x400)
	LDI  R26,0x60
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM  R24,Z+
	LPM  R25,Z+
	SBIW R24,0
	BREQ __GLOBAL_INI_END
	LPM  R26,Z+
	LPM  R27,Z+
	LPM  R0,Z+
	LPM  R1,Z+
	MOVW R22,R30
	MOVW R30,R0
__GLOBAL_INI_LOOP:
	LPM  R0,Z+
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOVW R30,R22
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;STACK POINTER INITIALIZATION
	LDI  R30,LOW(0x45F)
	OUT  SPL,R30
	LDI  R30,HIGH(0x45F)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(0x160)
	LDI  R29,HIGH(0x160)

	RJMP _main

	.ESEG
	.ORG 0

	.DSEG
	.ORG 0x160
;       1 /*****************************************************
;       2 Project : 
;       3 Version : 
;       4 Date    : 2009-8-12
;       5 Author  : F4CG                            
;       6 Company : F4CG                            
;       7 Comments: 
;       8 
;       9 
;      10 Chip type           : ATmega8
;      11 Program type        : Application
;      12 Clock frequency     : 8.000000 MHz
;      13 Memory model        : Small
;      14 External SRAM size  : 0
;      15 Data Stack size     : 256
;      16 *****************************************************/
;      17 #include <mega8.h>
;      18 #include <delay.h>  
;      19 
;      20 #define uchar unsigned char
;      21 #define uint  unsigned int
;      22 #define BAUD  9600  //设置波特率为     9600
;      23 #define CRS    8000000   //设置晶振   4MHZ
;      24 
;      25 #define BAUD_SET (unsigned int)  ((unsigned long)CRS/(16*(unsigned long)BAUD)-1) 
;      26 #define BAUD_H   (unsigned char) (BAUD_SET>>8) 
;      27 #define BAUD_L   (unsigned char) (BAUD_SET)
;      28 //定义UCSRA寄存器的位    控制和状态寄存器
;      29 #define RXC  7
;      30 #define TXC  6
;      31 #define UDRE 5
;      32 
;      33 #define FE   4
;      34 #define DOR  3
;      35 #define PE   2
;      36 #define U2X  1
;      37 #define MPCM 0 
;      38 //定义UCSRB寄存器的位   控制和状态寄存器
;      39 #define RXCIE 7
;      40 #define TXCIE  6
;      41 #define UDRIE  5
;      42 #define RXEN   4
;      43 #define TXEN   3
;      44 #define UCSZ2  2
;      45 #define RXB8   1
;      46 #define TXB8   0
;      47 //定义UCSRC寄存器的位    控制和状态寄存器
;      48 #define URSEL  7
;      49 #define UMSEL  6
;      50 #define UPM1   5
;      51 #define UPM0   4
;      52 #define USBS   3
;      53 #define UCSZ1  2
;      54 #define UCSZ0  1
;      55 #define UCPOL  0 
;      56 
;      57 #define FRAMING_ERROR  (1<<FE)
;      58 #define PARITY_ERROR   (1<<PE) 
;      59 #define DATA_OVERRUN     (1<<DOR)
;      60 #define DATA_REGISTER_EMPTY  (1<<UDRE)  
;      61 //定义继电器的输出端口
;      62 #define io1 PORTC.0
;      63 #define io2 PORTC.1
;      64 #define io3 PORTC.2
;      65 #define io4 PORTC.3
;      66 #define io5 PORTB.0
;      67 #define io6 PORTB.1
;      68 #define io7 PORTB.2
;      69 #define io8 PORTB.3
;      70 //定义单片机输入的端口
;      71 // #define  input7 PIND.0
;      72 // #define  input8 PIND.1
;      73 //  以上被串口传送占据故省略
;      74 #define  input1 PIND.2
;      75 #define  input2 PIND.3
;      76 #define  input3 PIND.4
;      77 #define  input4 PIND.5
;      78 #define  input5 PIND.6
;      79 #define  input6 PIND.7
;      80 // 定义串口读取数据的时候用的存储变量
;      81 uchar data;//  那个通道标志
;      82 uchar temp;//状态标志   
;      83 //定义函数处理数据时用的变量 
;      84 uchar  datak;
;      85 uchar tempK,tempG,tempD; 
;      86 uchar new_data,old_data; 
;      87 uchar new_num1,old_num1,new_num2,old_num2,new_num3,old_num3,new_num4,old_num4,new_num5,old_num5,new_num6,old_num6;
_old_num2:
	.BYTE 0x1
_new_num3:
	.BYTE 0x1
_old_num3:
	.BYTE 0x1
_new_num4:
	.BYTE 0x1
_old_num4:
	.BYTE 0x1
_new_num5:
	.BYTE 0x1
_old_num5:
	.BYTE 0x1
_new_num6:
	.BYTE 0x1
_old_num6:
	.BYTE 0x1
;      88 uint  counter;   
_counter:
	.BYTE 0x2
;      89 flash uchar  code[9]={'0','1','2','3','4','5','6','F','C'}; 

	.CSEG
;      90 void UART_SCEND(uchar data)
;      91 {
_UART_SCEND:
;      92   while(!(UCSRA&DATA_REGISTER_EMPTY));
;	data -> Y+0
_0x3:
	SBIS 0xB,5
	RJMP _0x3
;      93     UDR=data; 
	LD   R30,Y
	OUT  0xC,R30
;      94 }
	ADIW R28,1
	RET
;      95 void scend_head()  //发送头文件字符FF 0
;      96 {
_scend_head:
;      97 UART_SCEND(code[7]);
	RCALL SUBOPT_0x0
;      98 UART_SCEND(code[7]);
	RCALL SUBOPT_0x0
;      99 UART_SCEND(code[0]);
	RCALL SUBOPT_0x1
;     100 }
	RET
;     101 void scend_end()  //发送结束文件字符FC
;     102 {
_scend_end:
;     103 UART_SCEND(code[7]);
	RCALL SUBOPT_0x0
;     104 UART_SCEND(code[8]);
	__POINTW1FN _code,8
	RCALL SUBOPT_0x2
;     105 }
	RET
;     106 void rs232_scend(uchar i,uchar j)
;     107 { 
_rs232_scend:
;     108 scend_head();
;	i -> Y+1
;	j -> Y+0
	RCALL _scend_head
;     109 UART_SCEND(code[i]);
	LDD  R30,Y+1
	RCALL SUBOPT_0x3
;     110 UART_SCEND(code[0]); //固定的状态
	RCALL SUBOPT_0x1
;     111 UART_SCEND(code[j]);
	LD   R30,Y
	RCALL SUBOPT_0x3
;     112 scend_end();
	RCALL _scend_end
;     113 
;     114 }  
	ADIW R28,2
	RET
;     115 void PD_canshu_int()
;     116 {
_PD_canshu_int:
;     117 new_num1=1;
	LDI  R30,LOW(1)
	MOV  R12,R30
;     118  old_num1=new_num1; 
	MOV  R13,R12
;     119  new_num2=1;
	MOV  R14,R30
;     120  old_num2=new_num2; 
	STS  _old_num2,R14
;     121   new_num3=1;
	RCALL SUBOPT_0x4
;     122  old_num3=new_num3; 
	STS  _old_num3,R30
;     123   new_num4=1;
	LDI  R30,LOW(1)
	RCALL SUBOPT_0x5
;     124  old_num4=new_num4; 
	STS  _old_num4,R30
;     125   new_num5=1;
	LDI  R30,LOW(1)
	RCALL SUBOPT_0x6
;     126  old_num5=new_num5; 
	STS  _old_num5,R30
;     127   new_num6=1;
	LDI  R30,LOW(1)
	RCALL SUBOPT_0x7
;     128  old_num6=new_num6; 
	STS  _old_num6,R30
;     129 }
	RET
;     130 void read_d1()
;     131 { 
_read_d1:
;     132   new_num1=input1;
	LDI  R30,0
	SBIC 0x10,2
	LDI  R30,1
	MOV  R12,R30
;     133  if(old_num1==new_num1 )
	CP   R12,R13
	BRNE _0x6
;     134     {  
;     135      old_num1=new_num1; 
	MOV  R13,R12
;     136     }  
;     137   else
	RJMP _0x7
_0x6:
;     138     { rs232_scend(1,new_num1);
	LDI  R30,LOW(1)
	ST   -Y,R30
	ST   -Y,R12
	RCALL _rs232_scend
;     139       old_num1=new_num1;  
	MOV  R13,R12
;     140       delay_ms(2); 
	RCALL SUBOPT_0x8
;     141     }
_0x7:
;     142 } 
	RET
;     143 void read_d2()
;     144 { 
_read_d2:
;     145   new_num2=input2;
	LDI  R30,0
	SBIC 0x10,3
	LDI  R30,1
	MOV  R14,R30
;     146  if(old_num2==new_num2 )
	LDS  R26,_old_num2
	CP   R14,R26
	BRNE _0x8
;     147     {  
;     148      old_num2=new_num2; 
	STS  _old_num2,R14
;     149     }  
;     150   else
	RJMP _0x9
_0x8:
;     151     { rs232_scend(2,new_num2);
	LDI  R30,LOW(2)
	ST   -Y,R30
	ST   -Y,R14
	RCALL _rs232_scend
;     152       old_num2=new_num2;  
	STS  _old_num2,R14
;     153       delay_ms(2); 
	RCALL SUBOPT_0x8
;     154     }
_0x9:
;     155 }
	RET
;     156 void read_d3()
;     157 { 
_read_d3:
;     158   new_num3=input3;
	LDI  R30,0
	SBIC 0x10,4
	LDI  R30,1
	RCALL SUBOPT_0x4
;     159  if(old_num3==new_num3 )
	LDS  R26,_old_num3
	CP   R30,R26
	BRNE _0xA
;     160     {  
;     161      old_num3=new_num3; 
	LDS  R30,_new_num3
	STS  _old_num3,R30
;     162     }  
;     163   else
	RJMP _0xB
_0xA:
;     164     { rs232_scend(3,new_num3);
	LDI  R30,LOW(3)
	ST   -Y,R30
	LDS  R30,_new_num3
	RCALL SUBOPT_0x9
;     165       old_num3=new_num3;  
	LDS  R30,_new_num3
	STS  _old_num3,R30
;     166       delay_ms(2); 
	RCALL SUBOPT_0x8
;     167     }
_0xB:
;     168 }
	RET
;     169 void read_d4()
;     170 { 
_read_d4:
;     171   new_num4=input4;
	LDI  R30,0
	SBIC 0x10,5
	LDI  R30,1
	RCALL SUBOPT_0x5
;     172  if(old_num4==new_num4 )
	LDS  R26,_old_num4
	CP   R30,R26
	BRNE _0xC
;     173     {  
;     174      old_num4=new_num4; 
	LDS  R30,_new_num4
	STS  _old_num4,R30
;     175     }  
;     176   else
	RJMP _0xD
_0xC:
;     177     { rs232_scend(4,new_num4);
	LDI  R30,LOW(4)
	ST   -Y,R30
	LDS  R30,_new_num4
	RCALL SUBOPT_0x9
;     178       old_num4=new_num4;  
	LDS  R30,_new_num4
	STS  _old_num4,R30
;     179       delay_ms(2); 
	RCALL SUBOPT_0x8
;     180     }
_0xD:
;     181 }
	RET
;     182 void read_d5()
;     183 { 
_read_d5:
;     184   new_num5=input5;
	LDI  R30,0
	SBIC 0x10,6
	LDI  R30,1
	RCALL SUBOPT_0x6
;     185  if(old_num5==new_num5 )
	LDS  R26,_old_num5
	CP   R30,R26
	BRNE _0xE
;     186     {  
;     187      old_num5=new_num5; 
	LDS  R30,_new_num5
	STS  _old_num5,R30
;     188     }  
;     189   else
	RJMP _0xF
_0xE:
;     190     { rs232_scend(5,new_num5);
	LDI  R30,LOW(5)
	ST   -Y,R30
	LDS  R30,_new_num5
	RCALL SUBOPT_0x9
;     191       old_num5=new_num5;  
	LDS  R30,_new_num5
	STS  _old_num5,R30
;     192       delay_ms(2); 
	RCALL SUBOPT_0x8
;     193     }
_0xF:
;     194 }
	RET
;     195 void read_d6()
;     196 { 
_read_d6:
;     197   new_num6=input6;
	LDI  R30,0
	SBIC 0x10,7
	LDI  R30,1
	RCALL SUBOPT_0x7
;     198  if(old_num6==new_num6 )
	LDS  R26,_old_num6
	CP   R30,R26
	BRNE _0x10
;     199     {  
;     200      old_num6=new_num6; 
	LDS  R30,_new_num6
	STS  _old_num6,R30
;     201     }  
;     202   else
	RJMP _0x11
_0x10:
;     203     { rs232_scend(6,new_num6);
	LDI  R30,LOW(6)
	ST   -Y,R30
	LDS  R30,_new_num6
	RCALL SUBOPT_0x9
;     204       old_num6=new_num6;  
	LDS  R30,_new_num6
	STS  _old_num6,R30
;     205       delay_ms(2); 
	RCALL SUBOPT_0x8
;     206     }
_0x11:
;     207 }
	RET
;     208 void check_every()
;     209 {
_check_every:
;     210 read_d1(); 
	RCALL _read_d1
;     211 read_d2(); 
	RCALL _read_d2
;     212 read_d3(); 
	RCALL _read_d3
;     213 read_d4(); 
	RCALL _read_d4
;     214 read_d5(); 
	RCALL _read_d5
;     215 read_d6(); 
	RCALL _read_d6
;     216 } 
	RET
;     217 void check_D()
;     218 {   
_check_D:
;     219  // uchar new_data,old_data;
;     220  new_data=PIND&0XFC;//屏蔽PD0 PD1
	IN   R30,0x10
	ANDI R30,LOW(0xFC)
	MOV  R10,R30
;     221  if(old_data==new_data )
	CP   R10,R11
	BRNE _0x12
;     222     {  
;     223      old_data=new_data; 
	MOV  R11,R10
;     224     }  
;     225   else
	RJMP _0x13
_0x12:
;     226     { check_every();
	RCALL _check_every
;     227       old_data=new_data;  
	MOV  R11,R10
;     228       delay_ms(40); 
	LDI  R30,LOW(40)
	LDI  R31,HIGH(40)
	RCALL SUBOPT_0xA
;     229     }
_0x13:
;     230  }
	RET
;     231 void main(void)
;     232 {
_main:
;     233     #asm("wdr")
	wdr
;     234  UCSRA=0X00;
	LDI  R30,LOW(0)
	OUT  0xB,R30
;     235  UCSRB=0X98;
	LDI  R30,LOW(152)
	OUT  0xA,R30
;     236  UCSRC=0X86;
	LDI  R30,LOW(134)
	OUT  0x20,R30
;     237  UBRRH=BAUD_H;
	LDI  R30,LOW(0)
	OUT  0x20,R30
;     238  UBRRL=BAUD_L; 
	LDI  R30,LOW(51)
	OUT  0x9,R30
;     239  PORTC=0X00;
	LDI  R30,LOW(0)
	OUT  0x15,R30
;     240  PORTB=0X00;
	OUT  0x18,R30
;     241  DDRC=0XFF;
	LDI  R30,LOW(255)
	OUT  0x14,R30
;     242  DDRB=0XFF;
	OUT  0x17,R30
;     243  PORTC=0XFF;
	OUT  0x15,R30
;     244  PORTB=0XFF;
	OUT  0x18,R30
;     245  DDRD=0X03; 
	LDI  R30,LOW(3)
	OUT  0x11,R30
;     246     #asm("wdr")         
	wdr
;     247  new_data=PIND&0XFC;
	IN   R30,0x10
	ANDI R30,LOW(0xFC)
	MOV  R10,R30
;     248  old_data=new_data;  
	MOV  R11,R10
;     249  PD_canshu_int();  
	RCALL _PD_canshu_int
;     250  tempK='';
	CLR  R7
;     251  tempD='';
	CLR  R9
;     252  tempG='';
	CLR  R8
;     253     #asm("wdr")
	wdr
;     254  #asm("sei")
	sei
;     255 while (1)
_0x14:
;     256       {
;     257        check_D();   
	RCALL _check_D
;     258        datak=data; 
	MOV  R6,R4
;     259        switch(datak)
	MOV  R30,R6
;     260           {
;     261             case 'K':  
	CPI  R30,LOW(0x4B)
	BRNE _0x1A
;     262                {   #asm("wdr")
	wdr
;     263                  tempK=temp;
	MOV  R7,R5
;     264                  temp='';
	RJMP _0x3A
;     265                } break;
;     266             case 'G':
_0x1A:
	CPI  R30,LOW(0x47)
	BRNE _0x1B
;     267                {  // #asm("wdr")
;     268                  tempG=temp;
	MOV  R8,R5
;     269                    temp=''; 
	RJMP _0x3A
;     270                     } break;
;     271             case 'C': 
_0x1B:
	CPI  R30,LOW(0x43)
	BRNE _0x19
;     272                 {  // #asm("wdr")  
;     273                    tempD=temp;
	MOV  R9,R5
;     274                    temp=''; 
_0x3A:
	CLR  R5
;     275                    } break;    
;     276        } 
_0x19:
;     277      switch(tempK)
	MOV  R30,R7
;     278                    {  #asm("wdr")
	wdr
;     279                     case '1': io1=0; break;
	CPI  R30,LOW(0x31)
	BRNE _0x20
	CBI  0x15,0
	RJMP _0x1F
;     280                     case '2': io2=0; break;
_0x20:
	CPI  R30,LOW(0x32)
	BRNE _0x21
	CBI  0x15,1
	RJMP _0x1F
;     281                     case '3': io3=0; break;
_0x21:
	CPI  R30,LOW(0x33)
	BRNE _0x22
	CBI  0x15,2
	RJMP _0x1F
;     282                     case '4': io4=0; break;
_0x22:
	CPI  R30,LOW(0x34)
	BRNE _0x23
	CBI  0x15,3
	RJMP _0x1F
;     283                     case '5': io5=0; break;
_0x23:
	CPI  R30,LOW(0x35)
	BRNE _0x24
	CBI  0x18,0
	RJMP _0x1F
;     284                     case '6': io6=0; break;
_0x24:
	CPI  R30,LOW(0x36)
	BRNE _0x25
	CBI  0x18,1
	RJMP _0x1F
;     285                     case '7': io7=0; break;
_0x25:
	CPI  R30,LOW(0x37)
	BRNE _0x26
	CBI  0x18,2
	RJMP _0x1F
;     286                     case '8': io8=0; break;
_0x26:
	CPI  R30,LOW(0x38)
	BRNE _0x1F
	CBI  0x18,3
;     287                     }
_0x1F:
;     288                      #asm("wdr")
	wdr
;     289      switch(tempG)
	MOV  R30,R8
;     290                    {
;     291                     case '1': io1=1; break;
	CPI  R30,LOW(0x31)
	BRNE _0x2B
	SBI  0x15,0
	RJMP _0x2A
;     292                     case '2': io2=1; break;
_0x2B:
	CPI  R30,LOW(0x32)
	BRNE _0x2C
	SBI  0x15,1
	RJMP _0x2A
;     293                     case '3': io3=1; break;
_0x2C:
	CPI  R30,LOW(0x33)
	BRNE _0x2D
	SBI  0x15,2
	RJMP _0x2A
;     294                     case '4': io4=1; break;
_0x2D:
	CPI  R30,LOW(0x34)
	BRNE _0x2E
	SBI  0x15,3
	RJMP _0x2A
;     295                     case '5': io5=1; break;
_0x2E:
	CPI  R30,LOW(0x35)
	BRNE _0x2F
	SBI  0x18,0
	RJMP _0x2A
;     296                     case '6': io6=1; break;
_0x2F:
	CPI  R30,LOW(0x36)
	BRNE _0x30
	SBI  0x18,1
	RJMP _0x2A
;     297                     case '7': io7=1; break;
_0x30:
	CPI  R30,LOW(0x37)
	BRNE _0x31
	SBI  0x18,2
	RJMP _0x2A
;     298                     case '8': io8=1; break;
_0x31:
	CPI  R30,LOW(0x38)
	BRNE _0x2A
	SBI  0x18,3
;     299                     } //#asm("wdr")
_0x2A:
;     300    if(tempD=='D') 
	LDI  R30,LOW(68)
	CP   R30,R9
	BRNE _0x33
;     301     {  #asm("wdr")   delay_ms(3);   #asm("wdr")                  
	wdr
	RCALL SUBOPT_0xB
	wdr
;     302       rs232_scend(1, input1); 
	LDI  R30,LOW(1)
	ST   -Y,R30
	LDI  R30,0
	SBIC 0x10,2
	LDI  R30,1
	RCALL SUBOPT_0x9
;     303       delay_ms(3);
	RCALL SUBOPT_0xB
;     304       rs232_scend(2, input2);    delay_ms(3);// #asm("wdr") 
	LDI  R30,LOW(2)
	ST   -Y,R30
	LDI  R30,0
	SBIC 0x10,3
	LDI  R30,1
	RCALL SUBOPT_0x9
	RCALL SUBOPT_0xB
;     305       rs232_scend(3, input3);  #asm("wdr")    delay_ms(3);
	LDI  R30,LOW(3)
	ST   -Y,R30
	LDI  R30,0
	SBIC 0x10,4
	LDI  R30,1
	RCALL SUBOPT_0x9
	wdr
	RCALL SUBOPT_0xB
;     306       rs232_scend(4, input4);    delay_ms(3);// #asm("wdr") 
	LDI  R30,LOW(4)
	ST   -Y,R30
	LDI  R30,0
	SBIC 0x10,5
	LDI  R30,1
	RCALL SUBOPT_0x9
	RCALL SUBOPT_0xB
;     307       rs232_scend(5, input5);  #asm("wdr")    delay_ms(3);
	LDI  R30,LOW(5)
	ST   -Y,R30
	LDI  R30,0
	SBIC 0x10,6
	LDI  R30,1
	RCALL SUBOPT_0x9
	wdr
	RCALL SUBOPT_0xB
;     308       rs232_scend(6, input6);    delay_ms(3);// #asm("wdr") 
	LDI  R30,LOW(6)
	ST   -Y,R30
	LDI  R30,0
	SBIC 0x10,7
	LDI  R30,1
	RCALL SUBOPT_0x9
	RCALL SUBOPT_0xB
;     309     }      
;     310       };
_0x33:
	RJMP _0x14
;     311 }
_0x34:
	RJMP _0x34
;     312 interrupt [USART_RXC] void ucsra_rx(void)
;     313 {  
_ucsra_rx:
	ST   -Y,R26
	ST   -Y,R30
	ST   -Y,R31
	IN   R30,SREG
	ST   -Y,R30
;     314      counter++;  
	RCALL SUBOPT_0xC
	ADIW R30,1
	STS  _counter,R30
	STS  _counter+1,R31
;     315      switch(counter)
	RCALL SUBOPT_0xC
;     316          {
;     317             case 1:     #asm("wdr")  data=UDR; break;
	CPI  R30,LOW(0x1)
	LDI  R26,HIGH(0x1)
	CPC  R31,R26
	BRNE _0x38
	wdr
	IN   R4,12
	RJMP _0x37
;     318             case 2:   {   
_0x38:
	CPI  R30,LOW(0x2)
	LDI  R26,HIGH(0x2)
	CPC  R31,R26
	BRNE _0x37
;     319                          temp=UDR;    
	IN   R5,12
;     320                          counter=0;      
	LDI  R30,0
	STS  _counter,R30
	STS  _counter+1,R30
;     321                        }
;     322                       break;  
;     323          } #asm("wdr")
_0x37:
	wdr
;     324 } 
	LD   R30,Y+
	OUT  SREG,R30
	LD   R31,Y+
	LD   R30,Y+
	LD   R26,Y+
	RETI


;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:6 WORDS
SUBOPT_0x0:
	__POINTW1FN _code,7
	LPM  R30,Z
	ST   -Y,R30
	RJMP _UART_SCEND

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x1:
	LDI  R30,LOW(_code*2)
	LDI  R31,HIGH(_code*2)
	LPM  R30,Z
	ST   -Y,R30
	RJMP _UART_SCEND

;OPTIMIZER ADDED SUBROUTINE, CALLED 3 TIMES, CODE SIZE REDUCTION:2 WORDS
SUBOPT_0x2:
	LPM  R30,Z
	ST   -Y,R30
	RJMP _UART_SCEND

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:3 WORDS
SUBOPT_0x3:
	LDI  R31,0
	SUBI R30,LOW(-_code*2)
	SBCI R31,HIGH(-_code*2)
	RJMP SUBOPT_0x2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x4:
	STS  _new_num3,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x5:
	STS  _new_num4,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x6:
	STS  _new_num5,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0x7:
	STS  _new_num6,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 6 TIMES, CODE SIZE REDUCTION:18 WORDS
SUBOPT_0x8:
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	ST   -Y,R31
	ST   -Y,R30
	RJMP _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 10 TIMES, CODE SIZE REDUCTION:7 WORDS
SUBOPT_0x9:
	ST   -Y,R30
	RJMP _rs232_scend

;OPTIMIZER ADDED SUBROUTINE, CALLED 8 TIMES, CODE SIZE REDUCTION:12 WORDS
SUBOPT_0xA:
	ST   -Y,R31
	ST   -Y,R30
	RJMP _delay_ms

;OPTIMIZER ADDED SUBROUTINE, CALLED 7 TIMES, CODE SIZE REDUCTION:10 WORDS
SUBOPT_0xB:
	LDI  R30,LOW(3)
	LDI  R31,HIGH(3)
	RJMP SUBOPT_0xA

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES, CODE SIZE REDUCTION:1 WORDS
SUBOPT_0xC:
	LDS  R30,_counter
	LDS  R31,_counter+1
	RET

_delay_ms:
	ld   r30,y+
	ld   r31,y+
	adiw r30,0
	breq __delay_ms1
__delay_ms0:
	__DELAY_USW 0x7D0
	wdr
	sbiw r30,1
	brne __delay_ms0
__delay_ms1:
	ret

;END OF CODE MARKER
__END_OF_CODE:
