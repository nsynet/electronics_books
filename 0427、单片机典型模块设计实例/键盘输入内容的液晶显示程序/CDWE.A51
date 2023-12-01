;定义全局变量COM和DAT，全局函数CWE1(), DWE1(), CWE2(), DWE2()
PUBLIC	COM, DAT, CWE1, DWE1, CWE2, DWE2
;COM存放控制指令，DAT存放显示数据
RAM			SEGMENT DATA
PGM			SEGMENT	CODE
RSEG		RAM
COM:		DS	1
DAT:			DS	1
;指定控制单元地址
XSEG		AT	08000H
CWADD1:		DS	1 			;E1写指令代码地址
XSEG		AT	08200H
CRADD1:		DS	1 			;E1读状态字地址
XSEG		AT	08100H
DWADD1:		DS	1			;E1写显示数据地址
XSEG		AT	4000H
CWADD2:		DS	1 			;E2写指令代码地址
XSEG		AT	4200H
CRADD2:		DS	1 			;E2读状态字地址
XSEG		AT	4100H
DWADD2:		DS	1 			;E2写显示数据地址
RSEG	PGM

;CWE1()子函数，传递变量COM到控制器E1，参数为#CWADD1，实现控制指令的传递
CWE1:		PUSH 		DPL
		PUSH		DPH
		MOV		DPTR, 		#CRADD1
CWE101:		MOVX		A, 		@DPTR
		JB		ACC.7, 		CWE101
		MOV		DPTR, 		#CWADD1
		MOV 		A, 		COM
		MOVX		@DPTR, 		A
		POP		DPH
		POP		DPL
		RET
		
;DWE1()子函数，传递变量DAT到控制器E1，参数为#CRADD1，实现控制数据的传递
DWE1:		PUSH		DPL
		PUSH		DPH
		MOV	 	DPTR, 		#CRADD1
DWE101:		MOVX		A, 		@DPTR
		JB		ACC.7, 		DWE101
		MOV		DPTR, 		#DWADD1
		MOV		A, 		DAT
		MOVX		@DPTR, 		A
		POP		DPH
		POP		DPL
		RET
		
		;CWE2()子函数，传递变量COM到控制器E2，参数为#CWADD2，实现控制指令的传递
CWE2:		PUSH 		DPL
		PUSH		DPH
		MOV		DPTR, 		#CRADD2

CWE201:	MOVX	A, 		@DPTR
		JB		ACC.7, 		CWE201
		MOV		DPTR, 		#CWADD2
		MOV 		A, 		COM
		MOVX		@DPTR, 		A
		POP		DPH
		POP		DPL
		RET

;DWE2()子函数，传递变量DAT到控制器E2，参数为#CRADD2，实现控制数据的传递
DWE2:		PUSH		DPL
		PUSH		DPH
		MOV		DPTR, 		#CRADD2

DWE201:		MOVX		A, 		@DPTR
		JB		ACC.7, 		DWE201
		MOV		DPTR,		#DWADD2
		MOV		A, 		DAT
		MOVX		@DPTR,		A
		POP		DPH
		POP		DPL
		RET
		END

