#include <AT89X51.H> 

unsigned char t5hz; 

unsigned char t7hz; 

unsigned int tcnt; 

bit stop; 

bit flag; 

void main(void) 

{ 

  //unsigned char i,j; 

  TMOD=0x02; 

  TH0=0x06; 

  TL0=0x06; 

  ET0=1; 

  EA=1; 

  while(1) 

    { 

     // if(P3_7==0) 

        //{ 

          //for(i=10;i>0;i--) 

          //for(j=248;j>0;j--); 

          //if(P3_7==0) 

            //{ 

              t5hz=0; 

              t7hz=0; 

              tcnt=0; 

              flag=0; 

              stop=0; 

              TR0=1; 

              while(stop==0); 

           // } 

       // } 

    } 

} 

void t0(void) interrupt 1 using 0 

{ 

  tcnt++; 

  if(tcnt==2000) 

    { 

      tcnt=0; 

      if(flag==0) 

        { 

          flag=~flag; 

        } 

        else 

          { 

            stop=1; 

            TR0=0; 

          } 

    } 

  if(flag==0) 

    { 

      t7hz++; 

      if(t7hz==3) 

        { 

          t7hz=0; 

          P2_1=~P2_1; 

        } 

    } 

    else 

      { 

        t5hz++; 

        if(t5hz==4) 

          { 

            t5hz=0; 

            P2_1=~P2_1; 

          } 

      } 

} 
