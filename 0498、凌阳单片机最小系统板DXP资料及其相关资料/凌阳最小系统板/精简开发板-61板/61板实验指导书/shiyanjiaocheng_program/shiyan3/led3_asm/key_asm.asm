.include hardware.inc

.define KEY_ALL 0xff00		//ʹ��IOA8~IOA15��Ϊ���������

//============================================================= 
//	��������:   F_GetKey
//	���ڣ�		20040816
//	�﷨��		unsigned F_GetKey(void)
//	��������:	�ȴ�ֱ���м����²�̧�𣬷��ؼ�ֵ��û��ȥ������
//	���룺		��
//	�����		��r1����16λ��ֵ
//=============================================================
.public F_GetKey;
.code
F_GetKey:
	push r2 to [sp]
	r1=[P_IOA_Dir]			//��ʼ��IOA����Ӧ�˿�Ϊ��������
	r1&=~KEY_ALL
	[P_IOA_Dir]=r1
	r1=[P_IOA_Attrib]		
	r1&=~KEY_ALL
	[P_IOA_Attrib]=r1
	r1=[P_IOA_Buffer]
	r1|=KEY_ALL
	[P_IOA_Buffer]=r1
L_WaitKeyDown:				//�ȴ��м����£����ж˿ڱ�Ϊ0
	r1=1
	[P_Watchdog_Clear]=r1	//�忴�Ź�
	r1=[P_IOA_Data]
	r1&=KEY_ALL
	r1^=KEY_ALL				//ȡ��
	jz	L_WaitKeyDown		//���r1Ϊ0˵��û�м����£������ȴ�
L_WaitKeyUp:				//����м�������ȴ��ü�̧��
	r2=1
	[P_Watchdog_Clear]=r2
	r2=[P_IOA_Data]
	r2&=KEY_ALL
	r2^=KEY_ALL
	jnz L_WaitKeyUp
	pop r2 from [sp]
	retf
