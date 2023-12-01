
.INCLUDE hardware.inc
.INCLUDE key.inc

.DEFINE TIMER_CLKA_8K   0x0003
.DEFINE TIMER_CLKB_1    0x0030
.DEFINE RUN_TIMERA      0x1000
.DEFINE TIMER_DATA_FOR_8KHZ (0xFFFF-80)

.DEFINE  P_ADC_MUX_Ctrl 0x702b
.DEFINE P_INT_Ctrl_New  0x702d
.EXTERNAL  LED_No  
.CODE
//============================================================================================
//����: Clear_WatchDog()
//�﷨��void Clear_WatchDog(void)
//�������忴�Ź�
//��������
//���أ���
//============================================================================================
.PUBLIC _System_Initial;
_System_Initial: .PROC
     call L_User_Init_IO;		        //��ʼ��IO��
	 call F_Key_Scan_Initial;			//���̳�ʼ��
	 call F_ADC_Init;                   //AD��ʼ��
	 call F_SP_INT_IRQ5;                //ADC����
	 call F_SP_INT_IRQ6		            //LED��ʾ
	 r1 = 0;
	 [LED_No] = r1                      //��ʼ��LED��ʾλ��
     retf
.ENDP
//============================================================================================
//����: Clear_WatchDog()
//�﷨��void Clear_WatchDog(void)
//�������忴�Ź�
//��������
//���أ���
//============================================================================================
.PUBLIC _Clear_WatchDog;
_Clear_WatchDog:  .PROC
	r1 = 0x01;
 	[P_Watchdog_Clear] = r1;
 	retf
.ENDP

//============================================================================= 
// ������ System_ServiceLoop();
// �﷨�� System_ServiceLoop();
// ������ ����ɨ����̡�����ȥ������
// ������ ��
// ���أ� ��
//=============================================================================	

.PUBLIC _System_ServiceLoop;
_System_ServiceLoop:	.PROC
		call F_Key_Scan_ServiceLoop;	   //ɨ�����
        call F_Key_DebounceCnt_Down;	   //����ȥ��
        RETF;
 .ENDP      


//============================================================================================
//����: L_User_Init_IO
//�﷨��L_User_Init_IO()
//��������ʼ��A�ڵͰ�λΪ������������,�߰�λΪͬ��ߵ�ƽ���
//      ��ʼ��B�ڵ���λΪͬ��ߵ�ƽ�����
//��������
//���أ���
//=============================================================================================
.PUBLIC L_User_Init_IO;                
L_User_Init_IO: .PROC
   	r1 = 0xff10;      
    [P_IOA_Attrib] = r1;    
    [P_IOA_Dir] = r1;
    r1 = 0xff00;
    [P_IOA_Data] = r1;
    r1 = 0x000F;      
    [P_IOB_Attrib] = r1;    
    [P_IOB_Dir] = r1;
    [P_IOB_Data] = r1;
    RETF
.ENDP;
//============================================================================================
//����: ADC_Init()
//�﷨��void ADC_Init()
//��������ʼ��ADC
//��������
//���أ���
//=============================================================================================
.PUBLIC  _ADC_Init;
.PUBLIC  F_ADC_Init;
_ADC_Init:    .PROC
F_ADC_Init:
	r1 = 0x0004                  //ѡ��ͨ��LINE_INΪIOA4
	[P_ADC_MUX_Ctrl] = r1
	r1 = [P_ADC_Ctrl]
    r1 |= 0x0001	                 //����A/Dת��
    [P_ADC_Ctrl] = r1 	
    r1 = [P_DAC_Ctrl]
    r1 &= 0xffe7;
    [P_DAC_Ctrl] = r1
    retf	 
.ENDP

//============================================================================================
//����: SP_INT_IRQ5()
//�﷨��void SP_INT_IRQ5(void)
//��������ʼ���ж�Ϊ2HZ��ʱ�ж�Դ������ȷ��ADC����ʱ�䶨ʱ.1���Ӳ���һ��.
//��������
//���أ���
//=============================================================================================
.PUBLIC _SP_INT_IRQ5;  		       //��ʼ���ж�Ϊ2HZ��ʱ�ж�Դ
.PUBLIC F_SP_INT_IRQ5;  		   

_SP_INT_IRQ5: .PROC
F_SP_INT_IRQ5:   
    r1 =  [P_INT_Ctrl_New];     
	r1 =  r1 |0x0004;
    [P_INT_Ctrl] = r1; 
    irq on;          		       //���ж�
    retf
.ENDP;

//============================================================================================
//����: turn_off_IRQ5()
//�﷨��void SP_INT_IRQ5(void)
//��������ʼ���ж�Ϊ2HZ��ʱ�ж�Դ
//��������
//���أ���
//=============================================================================================
.PUBLIC _turn_off_IRQ5;  		       //��ʼ���ж�Ϊ2HZ��ʱ�ж�Դ
 _turn_off_IRQ5:  .PROC
     r1 =  [P_INT_Ctrl_New];
	 r1 &=  0xfffb;
     [P_INT_Ctrl_New] = r1;     
      retf;
 .ENDP    
//============================================================================================
//����: UART_Init()
//�﷨��void UART_Init(void)
//������ͨ������ͨѶ��������¶�ֵ
//��������
//���أ���
//=============================================================================================
.PUBLIC _UART_Init;
.PUBLIC F_UART_Init
_UART_Init:  .PROC
F_UART_Init:

    r1 = [P_IOB_Attrib]              //����IOB7Ϊ����IOB10Ϊ���
    r1 = r1 | 0x0480;	                
	[P_IOB_Attrib] = R1;
	r1 = [P_IOB_Dir]
	r1 = r1 | 0x0400;
	[P_IOB_Dir] = R1;
	r1 = [P_IOB_Data] 
	r1 = r1 & 0xffb7;		
	[P_IOB_Data] = R1;
	
   	R1 = 0x006b;	     	         //���ò�����Ϊ115.2Kbps
    [P_UART_BaudScalarLow] = R1;
	R1 = 0x0000;
    [P_UART_BaudScalarHigh] = R1;
	R1 = 0x0000;                     
	R4 = 0x00C0;		             //ʹ����������
	[P_UART_Command1] = R1;
	[P_UART_Command2] = R4;	
.ENDP
//============================================================================================
//����: SP_INT_IRQ6()
//�﷨��void SP_INT_IRQ6(void)
//��������ʼ���ж�IRQ6
//��������
//���أ���
//=============================================================================================
.PUBLIC _SP_INT_IRQ6;    	      //128hz
.PUBLIC F_SP_INT_IRQ6;    	      //128hz
_SP_INT_IRQ6:   .PROC
 F_SP_INT_IRQ6:
     r1 = 0x0000;
     [P_TimeBase_Setup]=r1        //128hz
     r1 =  [P_INT_Ctrl_New];
	 r1 =  r1 |0x0001;           //���ж�IRQ6   			         
	 [P_INT_Ctrl_New]= r1 
	 irq on;	 
     RETF;
.ENDP
//============================================================================================
//����: SP_INT_TIMEA()
//�﷨��void SP_INT_TIMEA(void)
//��������ʼ���ж�Ϊ1s��ʱ�ж�Դ
//��������
//���أ���
//============================================================================================
.PUBLIC _SP_INT_TIMEA;
_SP_INT_TIMEA: .PROC
	//r1 = 0x0000;                    //CPUѡƵ
    //[P_SystemClock] = r1;
    r1 = TIMER_DATA_FOR_8KHZ 
	[P_TimerA_Data] = r1;
	r1 = TIMER_CLKA_8K + TIMER_CLKB_1 
	[P_TimerA_Ctrl]=r1;                
	r1 = [P_INT_Ctrl_New];
	r1 |= 0x1000                 //IRQ1_TMA
	[P_INT_Ctrl_New] = r1;             //��TimeA �ж�
	IRQ ON;
    RETF
   .ENDP
   
//============================================================================================
//����: turn_off_timerA
//�﷨��turn_off_timerA
//�������رն�ʱ��B
//��������
//���أ���
//============================================================================================
.PUBLIC _turn_off_timerB
_turn_off_timerB:  .PROC
	 r1 =  [P_INT_Ctrl_New];
	 r1 &=  0xfbff;
     [P_INT_Ctrl_New] = r1;     
      retf;
 .ENDP
//============================================================================================
//����: turn_on_relay;
//�﷨��void turn_on_relay;
//�������򿪼̵���
//��������
//���أ���
//============================================================================================
.PUBLIC _turn_on_relay;
.PUBLIC F_turn_on_relay;
_turn_on_relay: .PROC
F_turn_on_relay:
	r1 = [P_IOA_Buffer]
	r1 |= 0x0010;
	[P_IOA_Buffer] = r1;
	retf
.ENDP
//============================================================================================
//����: turn_off_relay;
//�﷨��void turn_off_relay;
//�������رռ̵���
//��������
//���أ���
//============================================================================================
.PUBLIC _turn_off_relay;
.PUBLIC F_turn_off_relay;
_turn_off_relay: .PROC
F_turn_off_relay:
	r1 = [P_IOA_Buffer]
	r1 &= 0xffef;
	[P_IOA_Buffer] = r1;
	retf
.ENDP
//============================================================================================
//����: SP_INT_TIMEA()
//�﷨��void SP_INT_TIMEA(void)
//��������ʼ���ж�Ϊ1s��ʱ�ж�Դ
//��������
//���أ���
//============================================================================================
.PUBLIC _SP_INT_TIMEB;
_SP_INT_TIMEB: .PROC
	//r1 = 0x0000;                    //CPUѡƵ
    //[P_SystemClock] = r1;
    r1 = TIMER_DATA_FOR_8KHZ 
	[P_TimerB_Data] = r1;
	r1 = TIMER_CLKA_8K 
	[P_TimerB_Ctrl]=r1;                
	r1 = [P_INT_Ctrl_New];
	r1 |= 0x0400                       //IRQ1_TMA
	[P_INT_Ctrl_New] = r1;             //��TimeA �ж�
	IRQ ON;
    RETF
   .ENDP