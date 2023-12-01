.CODE
.PUBLIC _ADD
_ADD:.PROC
	PUSH BP to [SP];				
  	BP = SP + 1;
	R1 = [BP+3];
	R2 = [BP+4];
	R1 += R2;
	POP BP from [SP];
	RETF;
.ENDP


