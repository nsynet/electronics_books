
//============================================================
// �ļ����ƣ�system.asm
// ʵ�ֹ��ܣ�����ɨ���ʼ����ɨ�����
// ���ڣ� 2003/7/7
//============================================================

.INCLUDE   hardware.inc
.EXTERNAL  F_Key_Scan_Initial
.EXTERNAL  F_Key_DebounceCnt_Down
.EXTERNAL  F_Key_Scan_ServiceLoop
.CODE
//============================================================================================
//����: System_Initial
//�﷨��void System_Initial()
//����������ɨ���ʼ��
//��������
//���أ���
//===============================================================================================


.public _System_Initial;
.public	F_System_Initial;
_System_Initial: .PROC
F_System_Initial:
	call	F_Key_Scan_Initial;		// ����ɨ���ʼ��������key.asm	
	retf;
.ENDP;
//============================================================================================
//����: System_ServiceLoop
//�﷨��System_ServiceLoop()
//����������ɨ��
//��������
//���أ���
//==============================================================================================
.public _System_ServiceLoop;
.public	F_System_ServiceLoop;
_System_ServiceLoop: .PROC                  
F_System_ServiceLoop:
		call	F_Key_DebounceCnt_Down;		// ����ȥ�� ������key.asm
		call    F_Key_Scan_ServiceLoop;		// ����ɨ���������key.asm 			
		R1=0x0001;                          // �忴�Ź�
		[P_Watchdog_Clear]=R1;       	    //
        retf;
        .ENDP;
 //*********************************************************//
//����:Clear_WatchDog()
//����:���Ź���0
//����:��
//����:��
//*********************************************************//
.public _Clear_WatchDog;
_Clear_WatchDog: 	.PROC
		R1=0x0001;                      	
		[P_Watchdog_Clear]=R1;       		
		retf;
		.ENDP