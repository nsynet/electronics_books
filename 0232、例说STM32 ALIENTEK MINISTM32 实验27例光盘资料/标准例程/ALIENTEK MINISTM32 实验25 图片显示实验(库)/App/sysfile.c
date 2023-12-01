#include "sysfile.h"
#include "fat.h"
//Mini STM32������
//ϵͳ�ļ����Ҵ���					  
//����ԭ��@ALIENTEK
//2010/6/18
				   
u32 PICCLUSTER=0;//ͼƬ�ļ��е�ַ	 
u32 sys_ico[9];  //ϵͳͼ�껺����!���ܴ۸�!
u32 file_ico[4]; //�ļ�ͼ�껺���� folder;mus;pic;book;
 											    
//ϵͳ�ļ���		  
const unsigned char *folder[]=
{
"SYSTEM",
"FONT",
"SYSICO",
"PICTURE",
"GAME",
"LEVEL1",
"LEVEL2",
"LEVEL3",	 
};		   

//ϵͳ�ļ�������
const unsigned char *sysfile[]=
{			  
//ϵͳ����ͼ�� 0��ʼ
"GBK16.FON",
"GBK12.FON",
"UNI2GBK.SYS",
//ϵͳ�ļ�ͼ��	3��ʼ
"FOLDER.BMP",
"MUS.BMP",
"PIC.BMP",
"BOOK.BMP",
//ϵͳ������ͼ�� 7��ʼ
"MUSIC.BMP",
"PICTURE.BMP",
"GAME.BMP",
"ALARM.BMP",
"TIME.BMP",
"SETTING.BMP",  
"TXT.BMP",
"RADIO.BMP",
"LIGHT.BMP",  	  
};

//��ȡϵͳ�ļ��Ĵ洢��ַ
//�β�����,���޷�����!!!
//����0���ɹ��������������������	   
//sel:0 ϵͳ�ļ�
//sel:1 ͼƬ�ļ���
u8 SysInfoGet(u8 sel)
{			 		   
	u32 cluster=0;
	u32 syscluster=0;
	u8 t=0;	
	FileInfoStruct t_file;  	  						    	 
	//�õ���Ŀ¼�Ĵغ�
	if(FAT32_Enable)cluster=FirstDirClust;
	else cluster=0;			   

	if(sel==1)//����ͼƬ�ļ���
	{	
		t_file=F_Search(cluster,(unsigned char *)folder[3],T_FILE);//����PICTURE�ļ���
		if(t_file.F_StartCluster==0)return 1;//ͼƬ�ļ��ж�ʧ
		PICCLUSTER=t_file.F_StartCluster;//ͼƬ�ļ������ڴغ�	 
	}else//����ϵͳ�ļ�
	{	
		t_file=F_Search(cluster,(unsigned char *)folder[0],T_FILE);//����system�ļ���
		if(t_file.F_StartCluster==0)return 2;//ϵͳ�ļ��ж�ʧ
		syscluster=t_file.F_StartCluster;//����ϵͳ�ļ������ڴغ�	  	   
		t_file=F_Search(syscluster,(unsigned char *)folder[2],T_FILE);//��system�ļ����²���SYSICO�ļ���
		if(t_file.F_StartCluster==0)return 3; 
		cluster=t_file.F_StartCluster;//����SYSICO�ļ��дغ�
		for(t=0;t<9;t++)//����ϵͳͼ��,�Ÿ�
		{
			t_file=F_Search(cluster,(unsigned char *)sysfile[t+7],T_BMP);//��SYSICO�ļ����²���ϵͳͼ��
			sys_ico[t]=t_file.F_StartCluster;
			if(t_file.F_StartCluster==0)return 4;//ʧ��	
		}
		for(t=3;t<7;t++)//�����ļ�ͼ��,4��
		{
			t_file=F_Search(cluster,(unsigned char *)sysfile[t],T_BMP);//��SYSICO�ļ����²����ļ�ͼ��
			file_ico[t-3]=t_file.F_StartCluster;
			if(file_ico[t-3]==0)return 5;//ʧ�� 	  
		}
	}
	return 0;//�ɹ�
}

			 






