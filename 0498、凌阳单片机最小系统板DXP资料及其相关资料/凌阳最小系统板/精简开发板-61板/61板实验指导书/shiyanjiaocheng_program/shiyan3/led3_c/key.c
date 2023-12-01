#define P_IOA_Data			(volatile unsigned int *)0x7000
#define P_IOA_Buffer		(volatile unsigned int *)0x7001
#define P_IOA_Dir			(volatile unsigned int *)0x7002
#define P_IOA_Attrib		(volatile unsigned int *)0x7003

#define P_Watchdog_Clear 	(volatile unsigned int *)0x7012

#define KEY_ALL 0xff00		//ʹ��IOA8~IOA15��Ϊ���������
//============================================================= 
//	��������:   GetKey()
//	���ڣ�		20040816
//	��������:	�ȴ�ֱ���м����²�̧�𣬷��ؼ�ֵ��û��ȥ������
//	���룺		��
//	�����		����16λ��ֵ
//=============================================================
unsigned GetKey(void)
{
	
	unsigned KeyValue;

	//��ʼ��IOA����Ӧ�˿�Ϊ��������
	*P_IOA_Dir&=~KEY_ALL;
	*P_IOA_Attrib&=~KEY_ALL;
	*P_IOA_Buffer|=KEY_ALL;
	
	//�ȴ��м����£����ж˿ڱ�Ϊ0
	while(KeyValue==0)
	{
		KeyValue=(*P_IOA_Data & KEY_ALL)^KEY_ALL;
		*P_Watchdog_Clear=1;         //�忴�Ź�
	}
	KeyValue=(*P_IOA_Data&KEY_ALL)^KEY_ALL;
	//�ȴ�����̧��
	while((*P_IOA_Data&KEY_ALL)^KEY_ALL)
	{
		*P_Watchdog_Clear=1;
	}
	return KeyValue;
}