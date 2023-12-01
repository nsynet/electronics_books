//======================================================
// �ļ�����:	PWM.asm
// ����������   PWM���÷��� 
// ������ڣ�   2003-8-13
//======================================================
.DEFINE	timefosc_2		0x0230;	//clkAѡ��fosc/2Hz
.DEFINE		timefosc_256	0x0231;	//clkAѡ��fosc/256Hz
.DEFINE		timeclk_32768	0x0232;	//clkAѡ��32768Hz
.DEFINE		timeclk_8192	0x0233;	//clkAѡ��8192Hz
.DEFINE		timeclk_4096	0x0234;	//clkAѡ��4096Hz
.DEFINE		timeclk_2048	0x0205;	//clkBѡ��2048Hz
.DEFINE		timeclk_1024	0x020d;	//clkBѡ��1024Hz
.DEFINE		timeclk_256		0x0215; //clkBѡ��256Hz
.DEFINE		timeclk_4		0x0225; //clkBѡ��4Hz
.DEFINE		timeclk_2		0x0065;	//clkBѡ��2HzHz
 
//Ƶ��ѡ��fosc/2Hz;
//ʹ����Ҳ�����Լ����ò�ͬƵ���µ�ռ�ձȣ�
 
.DEFINE		timepwm_1		0x0070; 	//����ѡ��1/6
.DEFINE		timepwm_2		0x00b0;	    //����ѡ��2/6
.DEFINE		timepwm_3		0x00f0;		//����ѡ��3/6
.DEFINE		timepwm_4		0x0130;		//����ѡ��4/6 		
.DEFINE		timepwm_5		0x0170;		//����ѡ��5/6 		 
.DEFINE		timepwm_6		0x01b0;		//����ѡ��6/6 		
.DEFINE		timepwm_7		0x01f0;		//����ѡ��7/6 	
.DEFINE		timepwm_8		0x0230;		//����ѡ��8/6 		
.DEFINE		timepwm_9		0x0270;		//����ѡ��9/6        
.DEFINE		timepwm_10		0x02b0;		//����ѡ��10/6 		
.DEFINE		timepwm_11		0x02f0;		//����ѡ��11/6 		
.DEFINE		timepwm_12		0x0330;		//����ѡ��12/6 		
.DEFINE		timepwm_13		0x0370;		//����ѡ��13/6 		
.DEFINE		timepwm_14		0x03b0;		//����ѡ��14/6
 
.DEFINE		time_clk	timefosc_256;	//Ƶ��ѡ��
.DEFINE		time_pwm	timepwm_4;	 	//����ѡ��
 
.DEFINE	    P_TimerB_Data	  0x700C;
.DEFINE	    P_TimerB_Ctrl	  0x700D;
.DEFINE     P_IOB_DATA  	  0x7005;
.DEFINE    	P_IOB_DIR   	  0x7007;
.DEFINE	    P_IOB_ATTRI		  0x7008;
.DEFINE    	P_Feedback		  0x7009;
.define     p_watchdog_clear  0x7012;
.DEFINE		P_INT_CTRL		  0x7010;
.DEFINE		P_INT_CLEAR		  0x7011;

.code
//======================================================
// ��������:	F_Pwm
// ʵ�ֹ���:    PWM����
// ��ڲ�����   Ƶ������ֵ��ռ�ձ�����ֵ
// ���ڲ�����   ��
// �ƻ��Ĵ���:  r1��r2
//======================================================
.public _F_Pwm;	
_F_Pwm:
    push bp to  [sp];
   bp=sp+3  
   r1=[bp+1]; 
 //	r1=0x0200; 			    	//IOB8����Ϊͬ��͵�ƽ����� 
 //   [P_IOB_DIR] = r1; 
//	[P_IOB_ATTRI] = r1; 
//	r1 = 0x0000; 
//	[P_IOB_DATA ] = r1;
//    r1=	0x0030	        
	[P_TimerB_Data]=r1; 
	r2=[bp+2];
//	r2=0x0100;
	[P_TimerB_Ctrl]=r2; 
	
	r1=0x0000;
	[P_Feedback]=r1;        //����IOB8��ΪAPWMO�˿�
	pop bp from  [sp];
	retf
