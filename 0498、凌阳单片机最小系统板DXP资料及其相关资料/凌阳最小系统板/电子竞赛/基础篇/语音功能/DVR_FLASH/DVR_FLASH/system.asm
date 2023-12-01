
//============================================================
// 文件名称：system.asm
// 实现功能：键盘扫描初始化及扫描程序
// 日期： 2003/7/7
//============================================================

.INCLUDE   hardware.inc
.EXTERNAL  F_Key_Scan_Initial
.EXTERNAL  F_Key_DebounceCnt_Down
.EXTERNAL  F_Key_Scan_ServiceLoop
.CODE
//============================================================================================
//函数: System_Initial
//语法：void System_Initial()
//描述：键盘扫描初始化
//参数：无
//返回：无
//===============================================================================================


.public _System_Initial;
.public	F_System_Initial;
_System_Initial: .PROC
F_System_Initial:
	call	F_Key_Scan_Initial;		// 键盘扫描初始化，来自key.asm	
	retf;
.ENDP;
//============================================================================================
//函数: System_ServiceLoop
//语法：System_ServiceLoop()
//描述：键盘扫描
//参数：无
//返回：无
//==============================================================================================
.public _System_ServiceLoop;
.public	F_System_ServiceLoop;
_System_ServiceLoop: .PROC                  
F_System_ServiceLoop:
		call	F_Key_DebounceCnt_Down;		// 按键去抖 ，来自key.asm
		call    F_Key_Scan_ServiceLoop;		// 键盘扫描程序，来自key.asm 			
		R1=0x0001;                          // 清看门狗
		[P_Watchdog_Clear]=R1;       	    //
        retf;
        .ENDP;
 //*********************************************************//
//函数:Clear_WatchDog()
//描述:看门狗清0
//参数:无
//返回:无
//*********************************************************//
.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      	
		[P_Watchdog_Clear]=R1;       		
		retf;
		.ENDP