.include hardware.inc
.iram
.public RecBuffer
RecBuffer: .dw 100 dup(0)
//.ram
//.var recFlag					//是否接受数据，0未接受数据，1接收数据

.code
.public _main
_main:
	r4 = RecBuffer				//存储接收的数据   指针
	
//	r1 = 0x0000					//初始化标志位
//	[recFlag] = r1
	
	r1 = 0x0000					//初始化中断，禁止
	[P_INT_Ctrl] = r1
	
	r1 = 0x0480
	[P_IOB_Attrib] = r1			//初始化IO口，IOB7输入，IOB10输出
	r1 = 0x0400
	[P_IOB_Dir] = r1
	r1 = 0x0000
	[P_IOB_Data] = r1
	
	r1 = 0x0080					//设置波特率
	[P_UART_BaudScalarLow] = r1
	r1 = 0x0002
	[P_UART_BaudScalarHigh] = r1
	
	r1 = 0x0000					//输入输出使能
	[P_UART_Command1] = r1
	r1 = 0x0080
	[P_UART_Command2] = r1
	
Loop:

RecWait:
	r1 = 0x0001					//清看门狗
	[P_Watchdog_Clear] = r1

	r1 = [P_UART_Command2]
	r1 &= 0x0080
	jz RecWait
	
	r1 = [P_UART_Data]
	cmp r1,0x35
	jz Rec100
	jmp Loop
	
Rec100:
	r2 = 100					//用于循环
	r1 = 0x0001
	[P_Watchdog_Clear] = r1
	
	r1 = [P_UART_Command2]
	r1 &= 0x0080
	jz Rec100
	
	r1 = [P_UART_Data]
	[r4]= r1
	r4 +=1
	cmp r1,0x30
	jz Tran
	
	r2 -= 1
	jz Exit
	jmp Rec100
Tran:
	r4 = RecBuffer
	r1 = 0x0040
	[P_UART_Command2] = r1 
Tran1:
	r1 = [r4]
	[P_UART_Data] = r1
T_Wait:
	r1 = [P_UART_Command2]
	r1 &= 0x0040
	jz T_Wait
	r4 += 1
	r2 += 1
	cmp r2,100
	jz Exit	
	jmp Tran1
Exit:
	r1 = 0x0000
	[P_UART_Command2] = r1
	r1 = 0x0001
	[P_Watchdog_Clear] = r1
	jmp Exit