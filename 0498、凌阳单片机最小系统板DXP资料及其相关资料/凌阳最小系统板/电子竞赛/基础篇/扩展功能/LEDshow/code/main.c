unsigned int uiDelay=0x0008;
main()
{
unsigned int * ClearWatchdog = 0x7012;
unsigned int i;
* ClearWatchdog = 0x0001; 
while(1)
{
for(i=0;i<0x88;i++)
{
F_SingleLed(0,0);
F_SingleLed(1,1);
F_SingleLed(2,2);
F_SingleLed(3,3);
F_SingleLed(4,4);
F_SingleLed(5,5);
}
for(i=0;i<0x88;i++)
{
F_SingleLed(0,6);
F_SingleLed(1,7);
F_SingleLed(2,8);
F_SingleLed(3,9);
F_SingleLed(4,0);
}
for(i=0;i<0x88;i++)
{
F_SingleLed(0,10);
F_SingleLed(1,11);
F_SingleLed(2,12);
F_SingleLed(3,13);
F_SingleLed(4,14);
F_SingleLed(5,15);
}
for(i=0;i<0x88;i++)
{
F_SingleLed(0,16);
F_SingleLed(1,17);
F_SingleLed(2,18);
F_SingleLed(3,19);
F_SingleLed(4,10);
}
}
}