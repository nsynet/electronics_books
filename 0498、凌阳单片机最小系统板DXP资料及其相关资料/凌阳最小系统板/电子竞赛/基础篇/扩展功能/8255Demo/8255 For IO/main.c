
main()
{
   int iRData=0,iWData=0;
   Init_IOB();
   while(1)
   {
   ClearWatchDog();
   Init_WR_InABC();             //8255A����ƼĴ���д��,������ʽ0��ȫ������
   ClearWatchDog();
   iRData=Read_PA();            //A��   ��    ��������
   ClearWatchDog();
   iRData=Read_PB();            //B��   ��    ��������
   ClearWatchDog();
   iRData=Read_PC();            //C��   ��    ��������
   ClearWatchDog();
   Init_WR_OutABC();            //8255A����ƼĴ���д��,������ʽ0��ȫ�����
   iWData=0x3333;
   ClearWatchDog();
   Writer_PA(iWData);           // ��������  ��  A��
   ClearWatchDog();
   iWData=0x4444;
   Writer_PB(iWData);           // ��������  ��  B��
   ClearWatchDog();
   iWData=0x5555;
   Writer_PC(iWData);           // ��������  ��  C��
   }
}