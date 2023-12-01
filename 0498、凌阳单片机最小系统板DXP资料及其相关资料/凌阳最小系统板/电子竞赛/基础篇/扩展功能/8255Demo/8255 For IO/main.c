
main()
{
   int iRData=0,iWData=0;
   Init_IOB();
   while(1)
   {
   ClearWatchDog();
   Init_WR_InABC();             //8255A向控制寄存器写入,工作方式0，全置输入
   ClearWatchDog();
   iRData=Read_PA();            //A口   到    数据总线
   ClearWatchDog();
   iRData=Read_PB();            //B口   到    数据总线
   ClearWatchDog();
   iRData=Read_PC();            //C口   到    数据总线
   ClearWatchDog();
   Init_WR_OutABC();            //8255A向控制寄存器写入,工作方式0，全置输出
   iWData=0x3333;
   ClearWatchDog();
   Writer_PA(iWData);           // 数据总线  到  A口
   ClearWatchDog();
   iWData=0x4444;
   Writer_PB(iWData);           // 数据总线  到  B口
   ClearWatchDog();
   iWData=0x5555;
   Writer_PC(iWData);           // 数据总线  到  C口
   }
}