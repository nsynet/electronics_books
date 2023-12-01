int main(void)
{
  int foo;
  int bar;
  foo=3;
  bar=5;
  asm("%0=%1":"=r"(bar):"i"(3));
  asm("%0=%1+%2":"=r"(foo):"r"(bar),"i"(10));
  asm("%0 += %1" : "+r"(foo): "r"(bar));
  asm(".define  unsp 0x7016"); 
  asm("[unsp]=%0"::"r"(8));	
  
 foo++; 
return 0;
}

