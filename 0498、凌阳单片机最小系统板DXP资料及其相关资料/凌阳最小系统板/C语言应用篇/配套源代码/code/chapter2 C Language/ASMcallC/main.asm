.EXTERNAL _ADD;
.RAM
.VAR SUM
.CODE
.PUBLIC _main;
_main:
	R1 = 3;
	PUSH R1 TO [SP]; 		//第3个参数入栈
	R1 = 2;
	PUSH R1 TO [SP];		//第2个参数入栈
	CALL _ADD;
	[SUM]=R1;
	POP R1 FROM [SP];		//弹出参数恢复SP指针
.END	
	