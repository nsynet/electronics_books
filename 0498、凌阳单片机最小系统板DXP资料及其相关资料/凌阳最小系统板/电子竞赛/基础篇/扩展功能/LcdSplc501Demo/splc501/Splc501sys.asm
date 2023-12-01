//////////////////////////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////////////////////////
.include		hardware.inc
.include		splc501c_io.inc
.include		splc501c.inc
.external		F_Set_LCD_Page_No
.external		F_Set_LCD_Column_Addr
.external		F_Read_Lcd_data
.external		_Init_LCD_501
.external		F_Fill_All_LCD_Value
.external		F_Send_data
.external		_Read_Lcd_data
.external		F_Display_point
.external		_Init_IO

.RAM
.CODE
//////////////////////////////////////////////////////////////////////////////
//Filename : _Init_sys
//Function  Description	:	initialize systemClock and Find the "zk_data" position
//Input    : no
//Output   : [bank1]	zk_data at rom bank 
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.public		_Init_sys
_Init_sys:
F_Init_sys:		.proc
	r1=0x0000
	[P_SystemClock]=r1
//	call _F_image_bank
	call F_zk_bank
    RETF
	.endp
	
//////////////////////////////////////////////////////////////////////////////
//Filename : F_zk_bank
//Function  Description	:	Find the "zk_data" position
//Input    : none
//Output   : [bank1]	  zk_data at rom bank
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////	
.external bank1
.external	tiny3		//zk_data
.public		F_zk_bank
F_zk_bank:
		r4=0x00
		//////
		r2=sr
		r2&=0x03ff
		r1=tiny3		//zk_data    			//zk_data at zk.asm
F_zk_bank_loop:		
		sr=r2
		r3=D:[r1]
		cmp r3,0x00ff
		je F_zk_bank_0
		r4+=0x0400
		r2+=0x0400
		jmp F_zk_bank_loop
F_zk_bank_0:	
		[bank1]=r4
		retf		
//////////////////////////////////////////////////////////////////////////////  
//Filename : _pixel
//Function : display appoint pixel
//Input    : x,y
//Output   : display a appoint pixel on lcd
//Destroy  : R1,r2,r3
////////////////////////////////////////////////////////////////////////////// 	
.external		pixel_page
.external		pixel_column
.external		pixel_bit
.external		TAB_pixel	
.public	_pixel 
_pixel:  .proc
		PUSH BP,BP TO [SP];
		bp=sp
		bp+=0x04
		r1=[bp]
		bp+=0x01
		r2=[bp]
F_pixel: 		
		[pixel_column]=r1			//work out column
		r1=0x00
		[pixel_page]=r1
F_pixel_2:	
		cmp	r2,0x08
		jb	F_pixel_1
		cmp	r2,0x08
		je	F_pixel_1
		r2-=0x08
		r1=[pixel_page]
		r1+=0x01
		[pixel_page]=r1
		jmp F_pixel_2
F_pixel_1:	
		r1=TAB_pixel
		r1+=r2
		r2=[r1]
		[pixel_bit]=r2				//work out pixel_bit,pixel_page
//		R1 = [pixel_page]               
//        CALL    F_Set_LCD_Page_No
//        R2 = [pixel_column]                
//        CALL    F_Set_LCD_Column_Addr
		r1=[pixel_page]                   
		[_page]=r1
		r1=[pixel_column]
        [_page_place]=r1    
        r3=[pixel_bit]
        [_point_value]=r3
        call	display_a_point
        r3=[sign]
        r3&=0x01
        jnz	F_pixel_end
        POP BP,BP FROM [SP]
F_pixel_end:
		r3=[sign]
        r3&=0xfffe
        [sign]=r3		
		retf
        .endp
//////////////////////////////////////////////////////////////////////////////  
//Filename : F_Get_pixel
//参数: PlotX,PlotY
//Function : appoint pixel state,if r1=0 then point is white else point is black.
//Get the pixel color at (PlotX,PlotY), and store in A.
//Input    : x,y
//Output   : r1      appoint pixel state on lcd
//Destroy  : R1,r2,r3
//用法: 	FG_GetPixel(short PlotX,short PlotY)
//Example:	FG_GetPixel()
//			FG_GetPixel(10,20)
//////////////////////////////////////////////////////////////////////////////         
F_Get_pixel:
		[pixel_column]=r1			//work out column
		r1=0x00
		[pixel_page]=r1
F_Get_pixel_2:	
		cmp	r2,0x08
		jb	F_Get_pixel_1
		cmp	r2,0x08
		je	F_Get_pixel_1
		r2-=0x08
		r1=[pixel_page]
		r1+=0x01
		[pixel_page]=r1
		jmp F_Get_pixel_2
F_Get_pixel_1:	
		r1=TAB_pixel				
		r1+=r2
		r2=[r1]
		[pixel_bit]=r2				//work out pixel_bit,pixel_page
		R1 = [pixel_page]               
        CALL    F_Set_LCD_Page_No
        R2 = [pixel_column]                
        CALL    F_Set_LCD_Column_Addr
        call	F_Read_Lcd_data
        r1=[pixel_bit]
        r3=r3 lsr 0x04
        r3=r3 lsr 0x04
        r1&=r3
F_Get_pixel_end:
		retf
//////////////////////////////////////////////////////////////////////////////  
//Filename : image
//Function : display image
//Input    : x,y,tab
//Output   : display image at appoint place
//Destroy  : R1,r2,r3
////////////////////////////////////////////////////////////////////////////// 
.external		image_width_byte
.external		image_high_bit
.external		image_jumpoff_point_x
.external		image_jumpoff_point_y
.external		image_tab
.external		image_page			
.external		image_bit
.external		image_lcd_data
.external		image_temp_data	
.external		image_temp_data1
.external		image_tab_pointer	
.public		image
image:			.proc
		PUSH BP,BP TO [SP];
		bp=sp
		bp+=0x04
		r1=[bp]
		[image_jumpoff_point_x]=r1
		bp+=0x01
		r1=[bp]
		[image_jumpoff_point_y]=r1
		bp+=0x01
		r1=[bp]
		r1+=0x01
		[image_tab]=r1
		bp+=0x01
		r1=[bp]
		[image_width_byte]=r1
		bp+=0x01
		r1=[bp]
		[image_high_bit]=r1					//get parameter form c
F_image:
		r1=0x00
		[image_page]=r1
		[image_temp_data1]=r1
		r2=[image_jumpoff_point_y]
F_image_page_no_end:		
		cmp	r2,0x08
		jb	F_image_page_end
		cmp	r2,0x08
		je	F_image_page_end
		r2-=0x08
		r1=[image_page]
		r1+=0x01
		[image_page]=r1
		jmp F_image_page_no_end
F_image_page_end:
		[image_bit]=r2						//work out page and bit of jumping off point 		
		r2=0x00
F_image_no_end:		
		r1=[image_tab]	
		[image_tab_pointer]=r1
		r1=[image_jumpoff_point_x]	
		push r1,r2 to [sp]					//save [image_jumpoff_point_x],r2
//		call	F_image_process_1			//display eight row
		call	F_image_display_eightrow 
		pop r1,r2 from [sp]
		r2+=0x01
		[image_jumpoff_point_x]=r1
		r1=[image_tab]
		r1+=0x01
		[image_tab]=r1	
		[image_tab_pointer]=r1				//data pointer of image
		R1 = [image_page]
		r1-=0x01
		[image_page]=r1
		cmp	r2,[image_width_byte]			//if image end
		je	F_image_finish
		jmp	F_image_no_end
F_image_finish:
		r1=[sign]							//if assembler transfer
		r1&=0x01
		jne	F_image_end
		POP BP,BP FROM [SP];
F_image_end:
		r1=[sign]
		r1&=0xfffe
		[sign]=r1		
		retf
        .endp
/////////////////////////////////////////////////////////////////////////        
F_image_display_eightrow:
		r4=0x00								//pointer of tier data
image_display_eightrow_begin:		 
		R1 = [image_page]  
		cmp	r1,0x0009						//area of	page
		jb	  image_eightrow_begin
		retf
image_eightrow_begin:             
        CALL    F_Set_LCD_Page_No
        R2 = [image_jumpoff_point_x]
        CALL    F_Set_LCD_Column_Addr
        call	F_Read_Lcd_data				//read data on lcd
        r3&=0xff00
        [image_lcd_data]=r3
        R2 = [image_jumpoff_point_x]
        CALL    F_Set_LCD_Column_Addr
		r3=[image_tab_pointer]
		push r1 to [sp]
		r1=[sign]
		r1&=sign_zk_bank //0x008
		jz image_process_bank_1
		sr|=[bank]						//
		r3=d:[r3]
		jmp	image_process_bank_2
image_process_bank_1:	
		r3=[r3]
image_process_bank_2:
		pop  r1 from  [sp]	
		r4+=0x01
		r2=[image_bit]						//analyze place of image
		cmp	r2,0x04							//split data of image begin
		ja image_split_1_1
image_split_1_2:
		cmp r2 ,0x00
		je	image_split_1_3
		r3=r3 lsl 0x01		
		r2-=0x01
		jmp	image_split_1_2
image_split_1_1:
		r3=r3 lsl 0x04
		r2-=0x04
image_split_1_4:	
		cmp r2 ,0x00
		je	image_split_1_3
		r3=r3 lsl 0x01
		r2-=0x01
		jmp	image_split_1_4
image_split_1_3:
		[image_temp_data]=r3				//split data of image end
		//r3&=0xff00
	
		r3&=0xff00
		r1=[R_GraphicMode_temp]
		r1&=0x001c0
image_process_cover_frist:	
		jnz	image_process_xor_frist
		r3|=[image_lcd_data]				//or data on lcd
		
		jmp	image_proc_mod_frist_end
image_process_xor_frist:
		cmp	r1,0x0100
		je	image_process_clear_frist
		r3^=[image_lcd_data]				//xor data on lcd
		jmp	image_proc_mod_frist_end
image_process_clear_frist:		
		r3^=0xff00
		r3&=[image_lcd_data]
image_proc_mod_frist_end:
			
		//r3|=[image_lcd_data]		
		r3=r3 lsr 0x04
		r3=r3 lsr 0x04
		call	F_Display_point				//display frist part  data
		
		R1 = [image_page]
		r1-=0x01 
		cmp	r1,0x08							//if overstep area
		jb	  image_second_begin
		goto	image_process_end
image_second_begin:		
        CALL    F_Set_LCD_Page_No
        R2 = [image_jumpoff_point_x]                
        CALL    F_Set_LCD_Column_Addr
        call	F_Read_Lcd_data				//read data on lcd
        r3&=0xff00
        r3=r3 lsr 0x04
        r3=r3 lsr 0x04
        [image_lcd_data]=r3
        R2 = [image_jumpoff_point_x]
        CALL    F_Set_LCD_Column_Addr
		r3=[image_temp_data]
		//r3|=[image_lcd_data]
		r3&=0x00ff	
		
		r1=[R_GraphicMode_temp]
		r1&=bmp_mode_bit
image_process_cover_second:	
		jne	image_process_xor_second
		r3|=[image_lcd_data]				//or data on lcd
//		[image_temp_data1]=r3
		jmp	image_proc_mod_second_end
image_process_xor_second:
		cmp	r1,0x0100
		je	image_process_clear_second
		r3^=[image_lcd_data]				//xor data on lcd
		jmp	image_proc_mod_second_end
image_process_clear_second:		
		r3^=0x00ff
		r3&=[image_lcd_data]
image_proc_mod_second_end:	
		call	F_Display_point				//display remanent part  data
image_process_end:	
		r1=[image_jumpoff_point_x]
		r1-=0x01
		[image_jumpoff_point_x]=r1
		r3=[image_tab_pointer]
		r3+=[image_width_byte]
		[image_tab_pointer]=r3
		cmp	r4,[image_high_bit]
		je	image_process_complete				//if display complete 
		goto	image_display_eightrow_begin
image_process_complete:		
		retf

//////////////////////////////////////////////////////////////////////////////  
//R_GraphicMode:
//		1 byte for graphic mode.
//
//		Bit7,6:	Bitmap/Char/String
//						00:COVER		;Default Mode
//						01:AND
//						10:OR
//						11:XOR
//		Bit5:	(unused)
//		Bit4,3:	Rect/Line/Pixel
//					 	00:SOLID_COVER	;Default (Bar) Mode
//					 	01:DOTTED_COVER
//				     	10:SOLID_XOR
//				     	11:DOTTED_XOR
//
//		Bit2:	Pixel Toggle
//						0:COVER(black)(default)
//						1:ERASE(white)
//
//					(Toggle Bit for Dotted Line Mode)
//					IF bit3=1, that is dotted mode
//					then bit2 will be toggled between pixels
//					IF bit3=0 then no toggle occured

//		Bit1:	(unused)
//		Bit0:	Swapping Flag for LineTo
//		@

//X0: 1 byte x-coordinate of current point (CP).
//Y0: 1 byte y-coordinate of CP.	
.external		R_GraphicMode
.external		_x0
.external		_y0
///////////////////////////////////////////////////////////////////
//Function Name: FG_InitGraphic
//Parameters:
//Description: Initializing LCD graphics parameters
//Destroy:r1,r2,f3
//Memory Modified:
//Usage: FG_InitGraphic()
//Example:
//	FG_InitGraphic()
///////////////////////////////////////////////////////////////////
.public		_FG_InitGraphic
_FG_InitGraphic:		.proc
		call	_Init_IO		//Initial i/o
		call	_Init_LCD_501	//Initial SPLC501
		r1=0x00
		[R_GraphicMode_temp]=r1
		[sign]=r1
		[_x0]=r1
		[_y0]=r1
		retf
		.endp
		
///////////////////////////////////////////////////////////////////
//Function Name: FG_ClearScreen
//Parameters: DG_CLS_ERASE(default), DG_CLS_FILL
//Description: Clear LCD screen with 0 or 1.
//Destroy: r1,r2,r3,r4
//Memory Modified: None
//Usage: 	FG_ClearScreen(short arg)
//Example:
//	FG_ClearScreen()
//	FG_ClearScreen(DG_CLS_FILL)
///////////////////////////////////////////////////////////////////
.public		_FG_ClearScreen
_FG_ClearScreen:		.proc
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		r2-=r1
		cmp	r2,0x04
		je	clearscreen
		bp=sp
		bp+=0x04
		r1=[bp]
		cmp	r1,0x00
		je	clearscreen
		jmp	fillscreen
clearscreen:
		r3=0x0000
		jmp	fillaction
fillscreen:		
		r3=0xff00
fillaction:
		call	F_Fill_All_LCD_Value	
		pop	bp,bp from	[sp]
		retf
		.endp
///////////////////////////////////////////////////////////////////		
//Function Name:	FG_GetBMPMode
//				FG_GetLineStyle
//				FG_GetRectStyle
//				FG_GetCircleStyle
//				FG_GetEllipseStyle
//				FG_GetCharMode
//Description: Get current graphic mode.
//Destroy: r1
//Memory Modified: 
//Usage:
//	FG_GetBMPMode()
//	FG_GetLineStyle()
//	FG_GetRectStyle()
//	FG_GetCircleStyle()
//	FG_GetEllipseStyle()
//	FG_GetCharMode()
///////////////////////////////////////////////////////////////////
.public		_FG_GetBMPMode
_FG_GetBMPMode:		.proc
	PUSH BP,BP TO [SP]
	r1=[R_GraphicMode_temp]
	r1&=bmp_mode_bit_clear
	[R_GraphicMode_temp]=r1
	r1=[R_GraphicMode]
	r1&=bmp_mode_bit
	r1|=[R_GraphicMode_temp]
	[R_GraphicMode_temp]=r1
	pop	bp,bp from	[sp]
	retf
	.endp
//*****************************************************************
.public		_FG_GetLineStyle
_FG_GetLineStyle:		.proc
	PUSH BP,BP TO [SP]
	r1=[R_GraphicMode_temp]
	r1&=dotted_mode_bit_clear
	[R_GraphicMode_temp]=r1
	r1=[R_GraphicMode]
	r1&=dotted_mode_bit
	r1|=[R_GraphicMode_temp]
	[R_GraphicMode_temp]=r1
	pop	bp,bp from	[sp]
	retf
	.endp
//*****************************************************************
.public		_FG_GetRectStyle
_FG_GetRectStyle:		.proc
	call	_FG_GetLineStyle
	retf
	.endp
//*****************************************************************
.public		_FG_GetCircleStyle
_FG_GetCircleStyle:		.proc
	call	_FG_GetLineStyle
	retf
	.endp
//*****************************************************************
.public		_FG_GetEllipseStyle
_FG_GetEllipseStyle:		.proc
	call	_FG_GetLineStyle
	retf
	.endp
//*****************************************************************
.public		_FG_GetCharMode
_FG_GetCharMode:		.proc
	call	_FG_GetBMPMode
	retf
	.endp
///////////////////////////////////////////////////////////////////
//Function Name: FG_SetBMPMode
//Parameters: Mode
//Description: Set bitmap put style.
//Mode: DG_BMP_COVER(default)
//      DG_BMP_and
//      DG_BMP_XOR
//Destroy: r1,r2
//Memory Modified: R_GraphicMode
//Usage:
//	FG_SetBMPMode(short Mode)
//Example:
//	FG_SetBMPMode(DG_BMP_clear)
///////////////////////////////////////////////////////////////////
.public	_FG_SetBMPMode
_FG_SetBMPMode:		.proc
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		r2-=r1
		cmp	r2,0x04
		je	L_no_SetBMPMode_Parameters				//parmeters?
		bp=sp
		bp+=0x04
		r1=[bp]							//get parmeters
		cmp	r1,DG_BMP_COVER
		jne	L_SetBMPMode_1_Parameters
L_SetBMPMode_0_Parameters:		
L_no_SetBMPMode_Parameters:
		r1=[R_GraphicMode]
		r1&=bmp_mode_bit_clear
		[R_GraphicMode]=r1
		jmp	l_SetBMPMode_end
L_SetBMPMode_1_Parameters:
		cmp	r1,DG_BMP_CLEAR
		jne	L_SetBMPMode_2_Parameters		
		r1=[R_GraphicMode]
		r1&=bmp_mode_bit_clear
		r1|=BMP_mode_CLEAR
		[R_GraphicMode]=r1
		jmp	l_SetBMPMode_end
L_SetBMPMode_2_Parameters:
		cmp	r1,DG_BMP_XOR
		jne	l_SetBMPMode_end		
		r1=[R_GraphicMode]
		r1&=bmp_mode_bit_clear
		r1|=BMP_mode_XOR
		[R_GraphicMode]=r1		
l_SetBMPMode_end:
		call	_FG_GetBMPMode	
		pop	bp,bp from	[sp]
		retf
		.endp
//*****************************************************************
.public	_FG_SetCharMode
_FG_SetCharMode:
		goto	_FG_SetBMPMode
//*****************************************************************
.public	_FG_SetLineStyle
_FG_SetLineStyle:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		r2-=r1
		cmp	r2,0x04
		je	L_no_SetLineMode_Parameters	//parmeters?
		bp=sp
		bp+=0x04
		r1=[bp]							//get parmeters
L_cover_SetLineMode_Parameters:		
		cmp	r1,DG_LINE_COVER
		jne	L_erase_SetLineMode_Parameters
L_no_SetLineMode_Parameters:
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		[R_GraphicMode]=r1
L_erase_SetLineMode_Parameters:		
		cmp	r1,DG_LINE_ERASE
		jne L_solid_SetLineMode_Parameters
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		r1|=line_mode_ERASE
		[R_GraphicMode]=r1
		jmp	l_SetLineMode_end
L_solid_SetLineMode_Parameters:
		cmp	r1,DG_LINE_HOLLOW
		jne L_dotted_SetLineMode_Parameters
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		r1|=line_mode_HOLLOW
		[R_GraphicMode]=r1
		jmp	l_SetLineMode_end
L_dotted_SetLineMode_Parameters:
		cmp	r1,DG_LINE_DOTTED
		jne L_solid_cover_SetLineMode
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		r1|=line_mode_DOTTED
		[R_GraphicMode]=r1
		jmp	l_SetLineMode_end
L_solid_cover_SetLineMode:
		cmp	r1,DG_LINE_HOLLOW_ERASE
		jne L_dotted_cover_SetLineMode
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		r1|=line_mode_HOLLOW_ERASE
		[R_GraphicMode]=r1
		jmp	l_SetLineMode_end
L_dotted_cover_SetLineMode:
		cmp	r1,DG_LINE_DOTTED_COVER
		jne L_solid_xor_SetLineMode
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		r1|=line_mode_DOTTED_COVER
		[R_GraphicMode]=r1
		jmp	l_SetLineMode_end
L_solid_xor_SetLineMode:
		cmp	r1,DG_LINE_SOLID_XOR
		jne L_dotted_xor_SetLineMode
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		r1|=line_mode_SOLID_XOR
		[R_GraphicMode]=r1
		jmp	l_SetLineMode_end
L_dotted_xor_SetLineMode:
		cmp	r1,DG_LINE_DOTTED_XOR
		jne l_SetLineMode_end
		r1=[R_GraphicMode]
		r1&=line_mode_bit_clear
		r1|=line_mode_DOTTED_XOR
		[R_GraphicMode]=r1				
l_SetLineMode_end:
		call	_FG_GetLineStyle	
		pop	bp,bp from	[sp]
		retf
//*****************************************************************
.public	_FG_SetRectStyle
_FG_SetRectStyle:
		goto _FG_SetLineStyle
//*****************************************************************
.public	_FG_SetCircleStyle
_FG_SetCircleStyle:
		goto _FG_SetLineStyle
//*****************************************************************
.public	_FG_SetEllipseStyle
_FG_SetEllipseStyle:
		goto _FG_SetLineStyle
//*****************************************************************
FG_SetMode:		.proc
L_SetMode_cover_Parameters:
		cmp	r1,DG_PIXEL_COVER
		jne	L_SetMode_clear_Parameters
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
		jmp	l_SetMode_end
L_SetMode_clear_Parameters:	
		cmp	r1,DG_PIXEL_CLEAR
		jne	L_xor_Parameters
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=pixel_mode_CLEAR
		[R_GraphicMode_temp]=r1				
		jmp	l_SetMode_end
L_xor_Parameters:		
		cmp	r1,DG_PIXEL_XOR
		jne	l_SetMode_end
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=pixel_mode_XOR
		[R_GraphicMode_temp]=r1
l_SetMode_end:
		retf
		.endp
//*****************************************************************
FG_SetStyle:
L_cover_SetStyle_Parameters:
		cmp	r1,DRAW_COVER
		jne	L_erase_SetStyle_Parameters
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
L_erase_SetStyle_Parameters:		
		cmp	r1,DRAW_ERASE
		jne L_solid_SetStyle_Parameters
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=draw_mode_ERASE
		[R_GraphicMode_temp]=r1
		jmp	l_SetStyle_end
L_solid_SetStyle_Parameters:
		cmp	r1,DRAW_HOLLOW
		jne L_dotted_SetStyle_Parameters
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=draw_mode_HOLLOW
		[R_GraphicMode_temp]=r1
		jmp	l_SetStyle_end
L_dotted_SetStyle_Parameters:
		cmp	r1,DRAW_DOTTED
		jne L_solid_cover_SetStyle
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=draw_mode_DOTTED
		[R_GraphicMode_temp]=r1
		jmp	l_SetStyle_end
L_solid_cover_SetStyle:
		cmp	r1,DRAW_HOLLOW_ERASE
		jne L_dotted_cover_SetStyle
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=draw_mode_HOLLOW_ERASE
		[R_GraphicMode_temp]=r1
		jmp	l_SetStyle_end
L_dotted_cover_SetStyle:
		cmp	r1,DRAW_DOTTED_COVER
		jne L_solid_xor_SetStyle
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=draw_mode_DOTTED_COVER
		[R_GraphicMode_temp]=r1
		jmp	l_SetStyle_end
L_solid_xor_SetStyle:
		cmp	r1,DRAW_SOLID_XOR
		jne L_dotted_xor_SetStyle
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=draw_mode_SOLID_XOR
		[R_GraphicMode_temp]=r1
		jmp	l_SetStyle_end
L_dotted_xor_SetStyle:
		cmp	r1,DRAW_DOTTED_XOR
		jne l_SetStyle_end
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=line_mode_bit
		[R_GraphicMode_temp]=r1				
l_SetStyle_end:
		retf
///////////////////////////////////////////////////////////////////
//Function Name: FG_PutBitmap
//Parameters: BmpX,BmpY,BmpNum,Mode
//Description: Print a bitmap at (BmpX,BmpY) with assigned mode.
//Mode:
//	DG_BMP_COVER(default)
//	DG_BMP_clear
//	DG_BMP_XOR
//Destroy: r1,r2,r3,r4
//Usage: FG_PutBitmap(short BmpNum,short BmpX,short BmpY,short Mode)
//Example:
//	FG_PutBitmap(0,10,tab,DG_BMP_COVER)
//	FG_PutBitmap(1,10,tab)
//	FG_PutBitmap(tab,DG_BMP_XOR)
//	FG_PutBitmap(tab)
///////////////////////////////////////////////////////////////////
.external		bp_temp
.external		R_GraphicMode_temp
.external		_TAB_0
.external		sign
//-----------------------------------
.public			_FG_PutBitmap
_FG_PutBitmap:		.proc
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
		push r1,r4 to [sp]
		call _F_image_bank
		pop r1,r4 from [sp]
L_PutBitmap_Parameters_none:
		cmp	r2,0x04
		je	L_no_PutBitmap_Parameters
L_PutBitmap_Parameters_one:
		cmp	r2,0x05
		jne	L_PutBitmap_Parameters_two
		call	F_PutBitmap_Parameters_one
		jmp		L_PutBitmap
L_PutBitmap_Parameters_two:		
		cmp	r2,0x06
		jne	L_PutBitmap_Parameters_three
		call	F_PutBitmap_Parameters_two
		jmp		L_PutBitmap
L_PutBitmap_Parameters_three:
		cmp	r2,0x07
		jne	L_PutBitmap_Parameters_four
		call	F_PutBitmap_Parameters_three
		jmp		L_PutBitmap
L_PutBitmap_Parameters_four:
		cmp	r2,0x08
		jne	L_PutBitmap_Parameters_three
		call	F_PutBitmap_Parameters_four
L_PutBitmap:
		r1=[sign]
		r1|=0x09
		[sign]=r1
	//	CALL	F_image_bank
		call	F_image
		r1=[sign]
		r1&=0xfff7
		[sign]=r1
		r1=[R_GraphicMode_temp]
		r1&=bmp_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r1=[R_GraphicMode]
		r1&=bmp_mode_bit
		r1|=[R_GraphicMode_temp]
		[R_GraphicMode_temp]=r1
			
L_no_PutBitmap_Parameters:			
		POP	BP,BP FROM [SP]
		retf
		.endp
/////////////////////////////////	
.external  picture_data
.external  bank
.public		_F_image_bank
_F_image_bank:
		r4=0x00
		//////
		r2=sr
		r2&=0x03ff
		r1+=0x04
		r1=[r1]
F_image_bank_loop:		
		sr=r2
		r3=D:[r1]
		cmp r3,r1
		je F_image_bank_0
		r4+=0x0400
		r2+=0x0400
		jmp F_image_bank_loop
F_image_bank_0:	
		[bank]=r4
		retf
//----------------------------------------------------------------
F_PutBitmap_Parameters_one:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		r1+=0x01
		[image_tab]=r1
		r1=[_x0]
		[image_jumpoff_point_x]=r1
		r1=[_y0]
		[image_jumpoff_point_y]=r1
		r1=[R_GraphicMode_temp]
		r1&=bmp_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r1=[R_GraphicMode]
		r1&=bmp_mode_bit
		r1|=[R_GraphicMode_temp]
		[R_GraphicMode_temp]=r1
		
		r2=[image_tab]
		r2-=0x02
		sr|=[bank]
		r1=d:[r2]
		[image_high_bit]=r1
		r2=[image_tab]
		r2-=0x03
		r1=d:[r2]
		[image_width_byte]=r1
		retf
//----------------------------------------------------------------
F_PutBitmap_Parameters_two:
		r1=[R_GraphicMode_temp]
		r1&=bmp_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
F_Put_Para_two_1:	
		cmp	r1,DG_BMP_CLEAR
		jne	F_Put_Para_two_2
		r1=[R_GraphicMode_temp]
		r1|=BMP_mode_CLEAR
		[R_GraphicMode_temp]=r1
		jmp	F_Put_Para_two_0
F_Put_Para_two_2:
		cmp	r1,DG_BMP_XOR
		jne	F_Put_Para_two_0
		r1=[R_GraphicMode_temp]
		r1|=BMP_mode_XOR
		[R_GraphicMode_temp]=r1
F_Put_Para_two_0:				
		r2-=0x01
		r1=[r2]
		r1+=0x01
		[image_tab]=r1
		r1=[_x0]
		[image_jumpoff_point_x]=r1
		r1=[_y0]
		[image_jumpoff_point_y]=r1
		sr|=[bank]
		r2=[image_tab]
		r2-=0x02
		r1=d:[r2]
		[image_high_bit]=r1
		r2=[image_tab]
		r2-=0x03
		r1=d:[r2]
		[image_width_byte]=r1
		retf
//----------------------------------------------------------------
F_PutBitmap_Parameters_three:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_y]=r1
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_x]=r1
		r2-=0x01
		r1=[r2]
		r1+=0x01
		[image_tab]=r1
	
		r1=[R_GraphicMode_temp]
		r1&=bmp_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r1=[R_GraphicMode]
		r1&=bmp_mode_bit
		r1|=[R_GraphicMode_temp]
		[R_GraphicMode_temp]=r1
	
		r2=[image_tab]
		r2-=0x02
		sr|=[bank]
		r1=d:[r2]
		[image_high_bit]=r1
		r2=[image_tab]
		r2-=0x03
		r1=d:[r2]
		[image_width_byte]=r1
		retf
//----------------------------------------------------------------
F_PutBitmap_Parameters_four:
		r1=[R_GraphicMode_temp]
		r1&=bmp_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
F_Put_Para_four_1:	
		cmp	r1,DG_BMP_CLEAR
		jne	F_Put_Para_four_2
		r1=[R_GraphicMode_temp]
		r1|=BMP_mode_CLEAR
		[R_GraphicMode_temp]=r1
		jmp	F_Put_Para_four_0
F_Put_Para_four_2:
		cmp	r1,DG_BMP_XOR
		jne	F_Put_Para_four_0
		r1=[R_GraphicMode_temp]
		r1|=BMP_mode_XOR
		[R_GraphicMode_temp]=r1
F_Put_Para_four_0:
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_y]=r1
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_x]=r1
		r2-=0x01
		r1=[r2]
		r1+=0x01
		[image_tab]=r1
		r2=[image_tab]
		r2-=0x02
		sr|=[bank]
		r1=d:[r2]
		[image_high_bit]=r1
		r2=[image_tab]
		r2-=0x03
		r1=d:[r2]
		[image_width_byte]=r1
		retf

//////////////////////////////////////////////////////////////////////////////
//Filename : _FG_LineTo
//参数: _line_x0,_line_y0,_line_x1,_line_y1
//Mode:	DG_LINE_COVER(default)
//		DG_LINE_ERASE
//		DG_LINE_SOLID
//		DG_LINE_DOTTED
//		DG_LINE_SOLID_COVER
//		DG_LINE_DOTTED_COVER
//		DG_LINE_SOLID_XOR
//		DG_LINE_DOTTED_XOR
//Function  Description	:GIVE A jumping_off POINT and end point
//  					 DISPLAY A line ON LCD with the style assigned in R_GraphicMode.
//			 
//Input    :(_line_x0,_line_y0)(_line_x1,_line_y1)
//Output   :
//Destory  : R1,R2,R3,R4
//用法:	FG_LineTo(short StartX,short StartY,short EndX,short EndY)
//Example:	FG_LineTo(0,0,20,20)
//			FG_LineTo(R_Var1,R_Var2)
//////////////////////////////////////////////////////////////////////////////
.external	_line_x0								//直线起点X值
.external	_line_x1								//直线终点X值
.external	_line_y0								//直线起点Y值
.external	_line_y1								//直线终点Y值
.external	_line_x									//直线上点X值
.external	_line_y									//直线上点Y值
.external	_lineparameter_a						//直线参数A
.external	_lineparameter_b						//直线参数B
.external	_lineparameter_a_temp					//直线参数A
.external	_lineparameter_b_temp					//直线参数B

.PUBLIC		_FG_LineTo
_FG_LineTo:
			
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_LINE_Parameters_two:
		cmp	r2,0x06
		jne	L_LINE_Parameters_four
		call	F_LINE_Parameters_two
		jmp		L_LINE
L_LINE_Parameters_four:		
		cmp	r2,0x08
		jne		L_LINE
		call	F_LINE_Parameters_four
L_LINE:		
		call	DISPLAY_A_LINE
		pop	bp from	[sp]
		retf
//----------------------------------------
F_LINE_Parameters_two:
		r1=[R_GraphicMode_temp]
		r1&=dotted_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r1=[R_GraphicMode]
		r1&=dotted_mode_bit
		r1|=[R_GraphicMode_temp]
		[R_GraphicMode_temp]=r1
		r1=[_x0]
		[_line_x0]=r1
		r1=[_y0]
		[_line_y0]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_line_y1]=r1
		r2-=0x01
		r1=[r2]
		[_line_x1]=r1
		retf
//----------------------------------------
F_LINE_Parameters_four:
		r1=[R_GraphicMode_temp]
		r1&=dotted_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r1=[R_GraphicMode]
		r1&=dotted_mode_bit
		r1|=[R_GraphicMode_temp]
		[R_GraphicMode_temp]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_line_y1]=r1
		r2-=0x01
		r1=[r2]
		[_line_x1]=r1
		r2-=0x01
		r1=[r2]
		[_line_y0]=r1
		r2-=0x01
		r1=[r2]
		[_line_x0]=r1
		retf
//----------------------------------------
DISPLAY_A_LINE:		.PROC
		r1=[R_GraphicMode_temp]
		r1&=0x0004
		jz	DISPLAY_no_dotted_LINE
		r1=[sign]
		r1|=0x0010
		[sign]=r1
		jmp DISPLAY_LINE_mode_end
DISPLAY_no_dotted_LINE:	
		r1=[sign]
		r1&=0xffef
		[sign]=r1
DISPLAY_LINE_mode_end:	
line_parameter_adjust:	
		r1=[_line_x0]
		cmp	r1,[_line_x1]
		jb	line_begin
		je	line_begin
		r1=[_line_x0]
		r2=[_line_x1]
		[_line_x1]=r1
		[_line_x0]=r2
		r1=[_line_y0]
		r2=[_line_y1]
		[_line_y1]=r1
		[_line_y0]=r2
		jmp	line_parameter_adjust	
line_begin:		
		r1=[_line_y1]
		cmp	r1,[_line_y0]
		jb	line_slopeplus
		//>=      \    //
		call line_slope_negative //line_a
		retf
line_slopeplus:		
		//<			/
		call	line_slope_plus
		RETF
		.ENDP
/////////////////////////////////////////////////////////////////////////////
//	line_slope_negative
//////////////////////////////////////////////////////////////////////////////
line_slope_negative:		.proc
		//得到a b [1]      	 
		r1=[_line_x1]
		r2=[_line_x0]
		r1-=r2
		[_lineparameter_b]=r1
		[_lineparameter_b_temp]=r1
		r1=[_line_y1]
		r2=[_line_y0]
		r1-=r2
		[_lineparameter_a_temp]=r1
		[_lineparameter_a]=r1
		//////////////////////////
		cmp r1,[_lineparameter_b]
		jae	line_slope_negative_yfrist
		//小于
		call	line_slope_neg_xfrist //line_process3
		retf
line_slope_negative_yfrist:
		//大于等于	
		call	line_slope_neg_yfrist //line_process1
		
		RETF
		.ENDP
/////////////////////////////////////////////////////////////////////////////
//	line_slope_plus
//////////////////////////////////////////////////////////////////////////////
line_slope_plus:		.proc
		//得到a b [2]      	 
		r1=[_line_x1]
		r2=[_line_x0]
		r1-=r2
		[_lineparameter_b]=r1
		[_lineparameter_b_temp]=r1
		r1=[_line_y0]
		r2=[_line_y1]
		r1-=r2
		[_lineparameter_a_temp]=r1
		[_lineparameter_a]=r1
		//////////////////////////
		cmp r1,[_lineparameter_b]
		jae	line_slopeplus_yfrist
		//小于
		call	line_slope_plus_xfrist   // line_process5
		retf
line_slopeplus_yfrist:
		//大于等于	
		call	line_slope_plus_yfrist   //line_process4
		RETF
		.ENDP
				

/////////////////////////////////////////////////////////////////////////////
//	line_slope_neg_yfrist
//////////////////////////////////////////////////////////////////////////////
//line_process1:		.proc
line_slope_neg_yfrist:
		//y先加 a>b 
		r1=[_line_x0]
		[_line_x]=r1
		r1=[_line_y0]
		[_line_y]=r1
		call	line_display_a_point //line_process2
//line_process1_1:
slope_neg_yfrist_begin:
		r1=[_lineparameter_a]
		r1-=[_lineparameter_b]
		cmp	r1,[_lineparameter_b_temp]
		ja	slope_neg_yfrist_addy	//line_process1_2
		r1=[_line_y]
		r1+=0x01
		[_line_y]=r1
		r1=[_line_x]
		r1+=0x01
		[_line_x]=r1
		r1=[_lineparameter_b_temp]
		r1+=[_lineparameter_b]
		r1-=[_lineparameter_a]
		[_lineparameter_b_temp]=r1
		call	line_display_a_point //line_process2
		r1=[_line_y]
		cmp	r1,[_line_y1]
		jae	slope_neg_yfrist_end		//line_process1_3	
		goto	slope_neg_yfrist_begin	//line_process1_1	
//line_process1_2:			
slope_neg_yfrist_addy:
		r1=[_line_y]
		r1+=0x01
		[_line_y]=r1
		r1=[_lineparameter_b_temp]
		r1+=[_lineparameter_b]
		[_lineparameter_b_temp]=r1
		call	line_display_a_point //line_process2
		r1=[_line_y]	
		cmp	r1,[_line_y1]
		jae	slope_neg_yfrist_end		//line_process1_3	
		goto	slope_neg_yfrist_begin	//line_process1_1	
//line_process1_3:		
slope_neg_yfrist_end:
		RETF

/////////////////////////////////////////////////////////////////////////////
//	line_display_a_point //line_process2
//////////////////////////////////////////////////////////////////////////////	
line_display_a_point:
		r1=[_line_x]
		[_x]=r1
		r1=[_line_y]
		[_y]=r1
		call  DISPLAY_A_POINT
		RETF
/////////////////////////////////////////////////////////////////////////////
// 	line_slope_neg_xfrist
//////////////////////////////////////////////////////////////////////////////
line_slope_neg_xfrist:
		//x先加 a>b 
		r1=[_line_x0]
		[_line_x]=r1
		r1=[_line_y0]
		[_line_y]=r1
		call	line_display_a_point //line_process2
line_slope_neg_xfrist_begin:
		r1=[_lineparameter_b]
		r1-=[_lineparameter_a]
		cmp	r1,[_lineparameter_a_temp]
		ja	slope_neg_xfrist_addx  	//line_process3_2
		r1=[_line_x]
		r1+=0x01
		[_line_x]=r1
		r1=[_line_y]
		r1+=0x01
		[_line_y]=r1
		r1=[_lineparameter_a_temp]
		r1+=[_lineparameter_a]
		r1-=[_lineparameter_b]
		[_lineparameter_a_temp]=r1
		call	line_display_a_point //line_process2
		r1=[_line_x]
		cmp	r1,[_line_x1]
		jae	slope_neg_xfrist_end		//line_process3_3	
		goto	line_slope_neg_xfrist_begin		//line_process3_1			
slope_neg_xfrist_addx:
		r1=[_line_x]
		r1+=0x01
		[_line_x]=r1
		r1=[_lineparameter_a_temp]
		r1+=[_lineparameter_a]
		[_lineparameter_a_temp]=r1
		call	line_display_a_point //line_process2
		r1=[_line_x]	
		cmp	r1,[_line_x1]
		jae	slope_neg_xfrist_end		//line_process3_3	
		goto	line_slope_neg_xfrist_begin		//line_process3_1		
slope_neg_xfrist_end:
		RETF		
/////////////////////////////////////////////////////////////////////////////
//	line_slope_plus_yfrist
//////////////////////////////////////////////////////////////////////////////
line_slope_plus_yfrist:
		//y先加 a>b 
		r1=[_line_x0]
		[_line_x]=r1
		r1=[_line_y0]
		[_line_y]=r1
		call	line_display_a_point 
slope_plus_yfrist_begin:
		r1=[_lineparameter_a]
		r1-=[_lineparameter_b]
		cmp	r1,[_lineparameter_b_temp]
		ja	slope_plus_yfrist_suby	
		r1=[_line_y]
		r1-=0x01
		[_line_y]=r1
		r1=[_line_x]
		r1+=0x01
		[_line_x]=r1
		r1=[_lineparameter_b_temp]
		r1+=[_lineparameter_b]
		r1-=[_lineparameter_a]
		[_lineparameter_b_temp]=r1
		call	line_display_a_point 
		r1=[_line_y]
		cmp	r1,[_line_y1]
		jbe	slope_plus_yfrist_end		
		goto	slope_plus_yfrist_begin		
slope_plus_yfrist_suby:			
		r1=[_line_y]
		r1-=0x01
		[_line_y]=r1
		r1=[_lineparameter_b_temp]
		r1+=[_lineparameter_b]
		[_lineparameter_b_temp]=r1
		call	line_display_a_point 
		r1=[_line_y]	
		cmp	r1,[_line_y1]
		jbe	slope_plus_yfrist_end		
		goto	slope_plus_yfrist_begin	
slope_plus_yfrist_end:	
		RETF
/////////////////////////////////////////////////////////////////////////////
//  line_slope_plus_xfrist
//////////////////////////////////////////////////////////////////////////////
line_slope_plus_xfrist:
		//x先加 a>b 
		r1=[_line_x0]
		[_line_x]=r1
		r1=[_line_y0]
		[_line_y]=r1
		call	line_display_a_point //line_process2
slope_plus_xfrist_begin:
		r1=[_lineparameter_b]
		r1-=[_lineparameter_a]
		cmp	r1,[_lineparameter_a_temp]
		ja	slope_plus_xfrist_addx		//line_process5_2
		r1=[_line_x]
		r1+=0x01
		[_line_x]=r1
		r1=[_line_y]
		r1-=0x01
		[_line_y]=r1
		r1=[_lineparameter_a_temp]
		r1+=[_lineparameter_a]
		r1-=[_lineparameter_b]
		[_lineparameter_a_temp]=r1
		call	line_display_a_point //line_process2
		r1=[_line_x]
		cmp	r1,[_line_x1]
		jae	slope_plus_xfrist_end		//line_process5_3	
		goto	slope_plus_xfrist_begin		//line_process5_1		
slope_plus_xfrist_addx:	
		r1=[_line_x]
		r1+=0x01
		[_line_x]=r1
		r1=[_lineparameter_a_temp]
		r1+=[_lineparameter_a]
		[_lineparameter_a_temp]=r1
		call	line_display_a_point //line_process2
		r1=[_line_x]	
		cmp	r1,[_line_x1]
		jae	slope_plus_xfrist_end		//line_process5_3	
		goto	slope_plus_xfrist_begin		//line_process5_1			
slope_plus_xfrist_end:
		RETF

	

//////////////////////////////////////////////////////////////////////////////
//	GIVE A POINT TO （X，Y）DISPLAY A POINT ON LCD 
//			Give	x->[_x],y->[_y];
//			call	_DISPLAY_A_POINT
//////////////////////////////////////////////////////////////////////////////
.external	_x										//点X坐标
.external	_y										//点Y坐标
.external	_page_place_bit							//点在PAGE place上位置
.external	_page									//点所在PAGE
.external	_page_place								//点在PAGE上 place	
.external	_public_area_sign						//点坐标显示范围标志
.external	_point_value
.external	TAB_pixel

.PUBLIC		DISPLAY_A_POINT
DISPLAY_A_POINT:		.PROC
	CALL	get_a_point_address
	r1=0xff
	cmp	r1,[_public_area_sign]
	je		DISPLAY_A_POINT_1
	CALL	display_a_point
DISPLAY_A_POINT_1:
	RETF
	.ENDP
	
//------------------------------------------------------------------------------	
display_a_point:	.proc
		R1 =[_page]          
        CALL    F_Set_LCD_Page_No
		R2 =[_page_place]
        CALL    F_Set_LCD_Column_Addr
display_a_point_cover:	
		r4=[R_GraphicMode_temp]
		r4&=line_mode_bit
    	cmp r4,draw_mode_COVER
		jne	display_a_point_erase
		call display_point_cover
display_a_point_erase:
		r4&=line_mode_bit
		cmp r4,draw_mode_ERASE
		jne	display_a_point_solid
		call display_point_erase
display_a_point_solid:
		r4&=line_mode_bit
		cmp r4,draw_mode_HOLLOW
		jne	display_a_point_dotted
		call display_point_solid
display_a_point_dotted:
		r4&=line_mode_bit
		cmp r4,draw_mode_DOTTED
		jne	display_a_point_solid_cover
		call display_point_dotted
display_a_point_solid_cover:
		r4&=line_mode_bit
		cmp r4,draw_mode_HOLLOW_ERASE
		jne	display_a_point_dotted_cover
		call display_point_solid_cover
display_a_point_dotted_cover:
		r4&=line_mode_bit
		cmp r4,draw_mode_DOTTED_COVER
		jne	display_a_point_solid_xor
		call display_point_dotted_cover
display_a_point_solid_xor:
		r4&=line_mode_bit
		cmp r4,draw_mode_SOLID_XOR
		jne	display_a_point_dotted_xor
		call display_point_solid_xor
display_a_point_dotted_xor:
		r4&=line_mode_bit
		cmp r4,draw_mode_DOTTED_XOR
		jne	display_a_point_mod_end	
		call display_point_dotted_xor	
display_a_point_mod_end:      
		R1 =[_page];                    
        CALL    F_Set_LCD_Page_No;
        R2 =[_page_place]
        CALL    F_Set_LCD_Column_Addr;
        r3=[_point_value]
        call	F_Display_point
        retf
        .endp	
//----------------------------------------------------------------------------  
display_point_cover:
		r2=[_page_place_bit]
        r1=TAB_pixel;
        r1=r1+r2;
        r1=[r1]
		push	r1 to [sp]
		call	_Read_Lcd_data
		r3=r3 lsr	0x04
		r3=r3 lsr	0x04
		pop		r1 from [sp]
		r1|=r3
		[_point_value]=r1
        retf
//----------------------------------------------------------------------------  
display_point_erase:
		r2=[_page_place_bit]
        r1=TAB_pixel;
        r1=r1+r2;
        r1=[r1]
		push	r1 to [sp]
		call	_Read_Lcd_data
		r3=r3 lsr	0x04
		r3=r3 lsr	0x04
		pop		r1 from [sp]
		r1^=0xff
		r3&=r1
		[_point_value]=r3
        retf
//----------------------------------------------------------------------------  
display_point_solid:
		r2=[_page_place_bit]
        r1=TAB_pixel;
        r1=r1+r2;
        r1=[r1]
		push	r1 to [sp]
		call	_Read_Lcd_data
		r3=r3 lsr	0x04
		r3=r3 lsr	0x04
		pop		r1 from [sp]
		r1|=r3
		[_point_value]=r1
        retf
//----------------------------------------------------------------------------  
display_point_dotted:
		r1=[sign]
		r1&=0x0010
		jz	display_a_empty_point
		call display_point_solid		
		r1=[sign]
		r1&=0xffef
		[sign]=r1
		retf
display_a_empty_point:	
//		call display_point_erase
		r2=[_page_place_bit]
        r1=TAB_pixel;
        r1=r1+r2;
        r1=[r1]
		push	r1 to [sp]
		call	_Read_Lcd_data
		r3=r3 lsr	0x04
		r3=r3 lsr	0x04
		pop		r1 from [sp]
//		r1^=0xff
//		r3&=r1
		[_point_value]=r3
		r1=[sign]
		r1|=0x0010
		[sign]=r1
        retf
//----------------------------------------------------------------------------  
display_point_solid_cover:
		call	display_point_erase
        retf
//----------------------------------------------------------------------------  
display_point_dotted_cover:
		r1=[sign]
		r1&=0x0010
		jz	display_dotted_cover_empty_point
		call display_point_solid
		r1=[sign]
		r1&=0xffef
		[sign]=r1
		retf
display_dotted_cover_empty_point:	
		call display_point_erase
		r1=[sign]
		r1|=0x0010
		[sign]=r1
        retf
//----------------------------------------------------------------------------  
display_point_solid_xor:
		r2=[_page_place_bit]
        r1=TAB_pixel;
        r1=r1+r2;
        r1=[r1]
		push	r1 to [sp]
		call	_Read_Lcd_data
		r3=r3 lsr	0x04
		r3=r3 lsr	0x04
		pop		r1 from [sp]
		r1^=r3
		[_point_value]=r1
        retf
//----------------------------------------------------------------------------        
display_point_dotted_xor:
		r1=[sign]
		r1&=0x0010
		jz	display_xor_empty_point
		call display_point_solid_xor
		r1=[sign]
		r1&=0xffef
		[sign]=r1
		retf
display_xor_empty_point:	
		r2=[_page_place_bit]
        r1=TAB_pixel;
        r1=r1+r2;
        r1=[r1]
		push	r1 to [sp]
		call	_Read_Lcd_data
		r3=r3 lsr	0x04
		r3=r3 lsr	0x04
		pop		r1 from [sp]
		r3^=r1
		r3^=r1
		[_point_value]=r3
		r1=[sign]
		r1|=0x0010
		[sign]=r1
        retf      
//---------------------------------------------------------------------------------		   
////Filename : get_a_point_address
//Function  Description	:work out place of appoint point
//Input    : [_x][_y]
//Output   : [_page][_page_place][_page_place_bit]
//Destory  : R1,R2,R3,R4
//---------------------------------------------------------------------------------	
.public get_a_point_address		
get_a_point_address:     .proc 	
//get a point	page,page_place_bit,page_place
		r1=0x00
		[_page]=r1
		[_page_place]=r1
		[_page_place_bit]=r1		
		r1=[_x]
		[_page_place]=r1	
		r1=[_y]
		[_y]=r1
		cmp	r1,_public_area_y_l
		jae	lab_get_address_1
		r1=0xff
		[_public_area_sign]=r1
		retf
lab_get_address_1:
		cmp	r1,_public_area_y_h
		jb	lab_get_address_2
		r1=0xff
		[_public_area_sign]=r1
		retf
lab_get_address_2:
		cmp	r1,_public_area_x_l
		jae	lab_get_address_3
		r1=0xff
		[_public_area_sign]=r1
		retf
lab_get_address_3:
		cmp	r1,_public_area_x_h
		jb	lab_get_page
		r1=0xff
		[_public_area_sign]=r1
		retf	
lab_get_page:
		r1=0x00
		[_public_area_sign]=r1
		r1=[_y]
		r1+=0x01	
lab_get_page1:			
		cmp	r1,	0x08
		jbe lab_get_page_place_bit
		r1-=0x08
		r2=r1
		r1=[_page]
		r1+=0x01
		[_page]=r1
		r1=r2
		jmp lab_get_page1
lab_get_page_place_bit:
		[_page_place_bit]=r1
lab_get_address_end:	
	retf
	.endp
//////////////////////////////////////////////////////////////////////////////
//Filename : _FG_Rectangle
//Function  Description	:display a rectangle on lcd 
//Input    : [_rectangle_jumping_off_y][_rectangle_jumping_off_x]
//			 [_rectangle_end_point_x][_rectangle_end_point_y]
//the jump off point must is left downside point of rectangle.the end point must is
//right upside of rectangle 
//Mode:
//	DG_RECT_COVER			(default)
//	DG_RECT_ERASE			
//	DG_RECT_HOLLOW	
//	DG_RECT_DOTTED			
//	DG_RECT_HOLLOW_ERASE	
//	DG_RECT_DOTTED_COVER
//	DG_RECT_SOLID_XOR	
//	DG_RECT_DOTTED_XOR	
//usage: FG_Rectangle(short _rectangle_jumping_off_x,short _rectangle_jumping_off_y
//					  ,short _rectangle_end_point_x,short _rectangle_end_point_y)
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.public		_FG_Rectangle
_FG_Rectangle:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_Rectangle_Parameters_two:
		cmp	r2,0x06
		jne	L_Rectangle_Parameters_four
		call	F_Rectangle_Parameters_two
		jmp		L_Rectangle
L_Rectangle_Parameters_four:		
		cmp	r2,0x08
		jne		L_Rectangle
		call	F_Rectangle_Parameters_four
L_Rectangle:		
		call	rectagle		//_rectagle1
		pop	bp from	[sp]
		retf	 
//----------------------------------------------------------------------------
F_Rectangle_Parameters_two:
		r1=[R_GraphicMode_temp]
		r1&=dotted_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r1=[R_GraphicMode]
		r1&=dotted_mode_bit
		r1|=[R_GraphicMode_temp]
		[R_GraphicMode_temp]=r1
		r1=[_x0]
		[_rectangle_jumping_off_x]=r1
		r1=[_y0]
		[_rectangle_jumping_off_y]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		retf
//----------------------------------------
F_Rectangle_Parameters_four:
		r1=[R_GraphicMode_temp]
		r1&=dotted_mode_bit_clear
		[R_GraphicMode_temp]=r1
		r1=[R_GraphicMode]
		r1&=dotted_mode_bit
		r1|=[R_GraphicMode_temp]
		[R_GraphicMode_temp]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_y]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		retf
//----------------------------------------------------------------------------
	
//////////////////////////////////////////////////////////////////////////////
//	display a rectange on lcd
//input		_rectangle_jumping_off_x,_rectangle_jumping_off_y,_rectagle_shape
//			_rectagle_mode,_rectangle_wide,_rectangle_high
//////////////////////////////////////////////////////////////////////////////
.external	_rectagle_shape
.external	_rectagle_mode
.external	_rectagle_high_temp
.external	_rectagle_wide_temp
.external	_rectangle_temp_x					//矩形x
//.public		_rectagle		
//_rectagle:		.proc
rectangle_hollow:
		r1=[_rectangle_jumping_off_x]
		[_line_x0]=r1
		r1+=[_rectangle_wide]
		r1-=0x01
		[_line_x1]=r1
		r1=[_rectangle_jumping_off_y]
		[_line_y0]=r1
		[_line_y1]=r1
		call	DISPLAY_A_LINE
		r1=[_line_x0]
		[_line_x1]=r1
		r1=[_line_y0]
		r1+=[_rectangle_high]
		r1-=0x01		
		[_line_y1]=r1
		call	DISPLAY_A_LINE	
		r1=[_line_y1]
		[_line_y0]=r1
		r1=[_line_x1]
		r1+=[_rectangle_wide]
		r1-=0x01
		[_line_x1]=r1
		call	DISPLAY_A_LINE	
		r1=[_line_x1]
		[_line_x0]=r1
		r1=[_line_y1]
		r1-=[_rectangle_high]
		r1+=0x01
		[_line_y1]=r1	
		call	DISPLAY_A_LINE
		retf

//----------------------------------------------------------
//r2-->high
rectangle_dotted:
		r1=[R_GraphicMode_temp]
		r1|=0x0004
		[R_GraphicMode_temp]=r1
		r2=0x00
		r1=[_rectangle_jumping_off_x]
		[_line_x0]=r1
		r1=[_rectangle_jumping_off_y]
		[_line_y0]=r1
		[_line_y1]=r1
		r1=[_rectangle_jumping_off_x]
		r1+=[_rectangle_wide]
		r1-=0x01
		[_line_x1]=r1
rectangle_dotted_loop:	
		push r2 to [sp]
		call	DISPLAY_A_LINE
		r1=[R_GraphicMode_temp]
		r1^=0x0004
		[R_GraphicMode_temp]=r1
		pop r2 from [sp]
		r2+=0x01
		cmp	r2,[_rectangle_high]
		je 	rectangle_dotted_end
		r1=[_line_y0]
		r1+=0x01
		[_line_y0]=r1
		[_line_y1]=r1
		jmp rectangle_dotted_loop
rectangle_dotted_end:		
		retf		
					
//////////////////////////////////////////////////////////////////////////////
//	display a rectange on lcd
// put in	[_rectangle_jumping_off_x][_rectangle_jumping_off_y]
//			[_rectangle_high][_rectangle_wide]
//////////////////////////////////////////////////////////////////////////////
.external	_rectangle_jumping_off_x					//矩形起点x
.external	_rectangle_jumping_off_y					//矩形起点y
.external	_rectangle_high								//矩形高
.external	_rectangle_wide								//矩形宽
.external	_rectangle_jumping_off_page					//矩形起点page
.external	_rectangle_jumping_off_place				//矩形起点place
.external	_rectangle_jumping_off_bit					//矩形起点bit
.external	_rectangle_end_place						//矩形终点page
.external	_rectangle_end_page							//矩形终点place
.external	_rectangle_end_bit							//矩形终点bit

//.public		_rectagle1		
//_rectagle1:		.proc
rectagle:	
		r4=[R_GraphicMode_temp]
rectangle_mod_dotted:
		r4&=line_mode_bit
		cmp r4,rect_mode_DOTTED
		jne	rectangle_mod_dotted_cove
		call	rectangle_dotted
		retf
rectangle_mod_dotted_cove:	
		r4&=line_mode_bit
		cmp r4,rect_mode_DOTTED_COVER
		jne	rectangle_mod_dotted_xor
		call	rectangle_dotted
		retf
rectangle_mod_dotted_xor:
		r4&=line_mode_bit
		cmp r4,rect_mode_DOTTED_XOR
		jne	rectangle_process3_loop_solid
		call	rectangle_dotted
		retf
rectangle_process3_loop_solid:
		r4&=line_mode_bit
		cmp r4,rect_mode_HOLLOW
		jne	rectangle_process3_loop_solid_cover
		call	rectangle_hollow			//_rectagle
		retf
rectangle_process3_loop_solid_cover:
		r4&=line_mode_bit
		cmp r4,rect_mode_HOLLOW_ERASE
		jne	rectangle_mod_part_end
		r1=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=rect_mode_ERASE
		[R_GraphicMode_temp]=r1
		push r1 to [sp]
		call	rectangle_hollow			//_rectagle
		pop r1 from [sp]
		[R_GraphicMode_temp]=r1
		retf
rectangle_mod_part_end:		
		r1=[_rectangle_jumping_off_x]
		[_x]=r1
		r1=[_rectangle_jumping_off_y]
		[_y]=r1
		call	get_a_point_address
		r1=[_page]
		[_rectangle_jumping_off_page]=r1
		r1=[_page_place]
		[_rectangle_end_place]=r1
		r1=[_page_place_bit]
		[_rectangle_jumping_off_bit]=r1	
		
		
		r1=[_rectangle_high]
		r1-=0x01
		r1+=[_rectangle_jumping_off_y]
	//	r1-=0x01
		[_y]=r1
		r1=[_rectangle_jumping_off_x]
		[_x]=r1
		call	get_a_point_address
		r1=[_page]
		[_rectangle_end_page]=r1
		r1=[_page_place_bit]
		[_rectangle_end_bit]=r1	
		
		r1=[_rectangle_end_page]
		cmp	r1,[_rectangle_jumping_off_page]
		jae		rectangle_entity				//rectangle_1
		r1=[_rectangle_high]
		jne	rectangle_entity
//		r1=[_public_area_sign]
//		cmp	r1,0xff
//		jne	rectangle_5
//		call 	rectangle_process1
		//小于非法
//rectangle_5:	
		retf
//rectangle_1:
rectangle_entity:
		r1=[_rectangle_end_page]
		cmp	r1,[_rectangle_jumping_off_page]
		je		rectangle_2	
		//大于
		call 	rectangle_entity_frist		//rectangle_process1
		retf
rectangle_2:
		//等于
		r1=[_public_area_sign]
		cmp	r1,0xff
		jne	rectangle_3
		call 	rectangle_entity_frist		//rectangle_process1
		jmp	rectangle_4
rectangle_3:		
		call 	rectangle_entity_second		//rectangle_process2	
rectangle_4:						
		retf	

//////////////////////////////////////////////////////////////////////////////
//rectangle_process1
//rectangle_entity_frist
//////////////////////////////////////////////////////////////////////////////
.external  tab_rectangle2
.external  tab_rectangle1
.external	_rectangle_jumping_off_page_temp
//.public	rectangle_process1
//rectangle_process1:		.proc
rectangle_entity_frist:
		r1=[_rectangle_jumping_off_page]
		[_page]=r1
		r2=[_rectangle_jumping_off_bit]
        r1=tab_rectangle2;
        r1=r1+r2;
        r1=[r1]
        [rectangle_temp_bit]=r1
        call	rectangle_display_in_a_page		//rectangle_process3
        r2=[_rectangle_jumping_off_page]
//rectangle_process1_loop1:
rectangle_entity_frist_loop:
		r2=[_page]
		r2+=0x01
		[_page]=r2
		
		cmp	r2,0x08
		//jae	rectangle_process1_1
		jae	rectangle_entity_frist_1
		r1=[_public_area_sign]
		cmp	r1,	0xff
		//jne	rectangle_process1_2
		//jmp	rectangle_process1_3
		jne	rectangle_entity_frist_2
		jmp	rectangle_entity_frist_3
//rectangle_process1_2:
rectangle_entity_frist_2:
		cmp	r2,[_rectangle_end_page]
		//jae	rectangle_process1_1
		jae	rectangle_entity_frist_1
//rectangle_process1_3:
rectangle_entity_frist_3:		
		r1=0xff
		[rectangle_temp_bit]=r1
        call	rectangle_display_in_a_page		//rectangle_process3
		goto	 rectangle_entity_frist_loop		//rectangle_process1_loop1
//rectangle_process1_1:
rectangle_entity_frist_1:
		r1=[_public_area_sign]
		cmp	r1,	0xff
		//jne	rectangle_process1_4
		//jmp	rectangle_process1_5
		jne	rectangle_entity_frist_4
		jmp	rectangle_entity_frist_5
//rectangle_process1_4:
rectangle_entity_frist_4:
		r1=[_rectangle_end_page]
		[_page]=r1
		r2=[_rectangle_end_bit]
        r1=tab_rectangle1;
        r1=r1+r2;
        r1=[r1]
        [rectangle_temp_bit]=r1
        call	rectangle_display_in_a_page		//rectangle_process3	
//rectangle_process1_5:
rectangle_entity_frist_5:         	      
		retf	

//////////////////////////////////////////////////////////////////////////////
//rectangle_process2
//rectangle_entity_second
//////////////////////////////////////////////////////////////////////////////
.external		rectangle_temp_bit
.external		rectangle_temp_page
.external		_rectangle_jumping_off_bit_temp
//.public	rectangle_process2
//rectangle_process2:		.proc
rectangle_entity_second:
		r1=[_rectangle_end_page]
		[_page]=r1
		r1=[_rectangle_end_bit]
		cmp	r1,[_rectangle_jumping_off_bit]
		//jae	rectangle_process2_1
		jae	rectangle_entity_second_begin
		retf
//rectangle_process2_1:
rectangle_entity_second_begin:
		r2=[_rectangle_jumping_off_bit]
        r1=TAB_pixel;
        r1=r1+r2;
        r2=[r1]
		[rectangle_temp_bit]=r2
		r1=[_rectangle_end_bit]
		r1-=[_rectangle_jumping_off_bit]
		r3=r1
//		cmp		r3,0x01
//		je		rectangle_process2_loop
		cmp		r3,0x00
		//je		rectangle_process2_2
		je		rectangle_entity_second_2
		r2=[rectangle_temp_bit]
		[_rectangle_jumping_off_bit_temp]=r2
//		r3-=0x01
//rectangle_process2_loop:	
rectangle_entity_second_loop:
		r2=	[_rectangle_jumping_off_bit_temp]
		r2=r2 lsl	0x01
		[_rectangle_jumping_off_bit_temp]=r2
		r2+=[rectangle_temp_bit]
		[rectangle_temp_bit]=r2
		r3-=0x01
		cmp		r3,0x00
		jbe		rectangle_entity_second_2
		goto	rectangle_entity_second_loop	
rectangle_entity_second_2:
		//jbe		rectangle_process2_2
		//goto	rectangle_process2_loop	
//rectangle_process2_2:
		r1=[rectangle_temp_bit]	
		call	rectangle_display_in_a_page		//rectangle_process3
//rectangle_process2_3:
rectangle_entity_second_3:	
		retf	

//////////////////////////////////////////////////////////////////////////////
//rectangle_process3
//rectangle_display_in_a_page
//////////////////////////////////////////////////////////////////////////////
.external		_rectangle_wide_temp
.external		 _rectangle_end_place_temp
//.public	rectangle_process3
//rectangle_process3:		.proc
rectangle_display_in_a_page:
		r1=[_rectangle_wide]
        [_rectangle_wide_temp]=r1
		R1 =[_page];                    
        CALL    F_Set_LCD_Page_No;
		R2 =[_rectangle_end_place]
		[_rectangle_end_place_temp]=r2
        CALL    F_Set_LCD_Column_Addr	
rectangle_process3_loop:  
		call	_Read_Lcd_data
		r3=r3 lsr 0x04
		r3=r3 lsr 0x04
rectangle_process3_loop_cover:	
		r4=[R_GraphicMode_temp]
		r4&=line_mode_bit
    	cmp r4,0x00
		jne	rectangle_process3_loop_erase
		r3|=[rectangle_temp_bit]
rectangle_process3_loop_erase:
		r4&=line_mode_bit
		cmp r4,0x08
		jne	rectangle_process3_loop_solid_xor
		push r1,r2 to [sp]
		r1=[rectangle_temp_bit]
		r1^=0xff
		r3&=r1
		pop  r1,r2 from [sp]	
rectangle_process3_loop_solid_xor:
		r4&=line_mode_bit
		cmp r4,0x30
		jne	rectangle_process3_mod_loop_end
		push r1,r2 to [sp]
		r1=[rectangle_temp_bit]
		r2=r3
		r3&=r1
		r3^=r1
		r1^=0xff
		r2&=r1
		r3|=r2		
		pop  r1,r2 from [sp]
rectangle_process3_mod_loop_end:
		R2 =[_rectangle_end_place_temp]
//		r2+=0x01
//		[_rectangle_end_place_temp]=r2
        CALL    F_Set_LCD_Column_Addr;
        
	
		call	F_Display_point
		
		R2 =[_rectangle_end_place_temp]
		r2+=0x01
		[_rectangle_end_place_temp]=r2
        CALL    F_Set_LCD_Column_Addr;
        
        r1=[_rectangle_wide_temp]
        r1-=0x01
        [_rectangle_wide_temp]=r1
        cmp	r1,0x00
        je	rectangle_process3_1
        goto	rectangle_process3_loop
rectangle_process3_1:
		retf	

//////////////////////////////////////////////////////////////////////////////
//Filename : _FG_Circle
//Function  Description	:display a Circle on lcd 
//Input    : [_ellipse_origin_y][_ellipse_origin_x]
//			 [_ellipse_long_axes][_ellipse_short_axes]
//Mode:
//	DG_CIRCLE_COVER			(default)
//	DG_CIRCLE_ERASE		
//	DG_CIRCLE_HOLLOW	
//	DG_CIRCLE_DOTTED	
//	DG_CIRCLE_HOLLOW_ERASE	
//	DG_CIRCLE_DOTTED_COVER	
//	DG_CIRCLE_SOLID_XOR	
//	DG_CIRCLE_DOTTED_XOR
//usage: FG_Circle(short originx,short originy,short radius)
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.public	_FG_Circle
_FG_Circle:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_Circle_Parameters_three:		
		cmp	r2,0x07
		jne		L_Circle
		call	F_Circle_Parameters_three
L_Circle:		
//		call	_ellipes
		call	ellipes
		pop	bp from	[sp]
		retf
//------------------------------------------------------------------------------
F_Circle_Parameters_three:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_ellipse_short_axes]=r1
		[_ellipse_long_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_y]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_x]=r1		
		retf
//////////////////////////////////////////////////////////////////////////////
//Filename : _FG_Ellipse
//Function  Description	:display a Ellipse on lcd 
//Input    : [_ellipse_origin_y][_ellipse_origin_x]
//			 [_ellipse_long_axes][_ellipse_short_axes]
//Mode:
//	DG_ELLIPSE_COVER			(default)
//	DG_ELLIPSE_ERASE		
//	DG_ELLIPSE_HOLLOW	
//	DG_ELLIPSE_DOTTED	
//	DG_ELLIPSE_HOLLOW_ERASE	
//	DG_ELLIPSE_DOTTED_COVER	
//	DG_ELLIPSE_SOLID_XOR	
//
//usage: FG_Ellipse(short originx,short originy,short radius)
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.public		_FG_Ellipse
_FG_Ellipse:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_Ellipse_Parameters_four:		
		cmp	r2,0x08
		jne		L_Ellipse
		call	F_Ellipse_Parameters_four		
		call	ellipes
L_Ellipse:	
		pop	bp from	[sp]
		
		retf
//----------------------------------------------------------------------------
F_Ellipse_Parameters_four:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_ellipse_short_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_long_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_y]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_x]=r1
		retf
//-----------------------------------------------------------------------------
.external	_ellipse_long_axes
.external	_ellipse_short_axes
.external	_ellipse_x
.external	_ellipse_y
.external	_ellipse_origin_x
.external	_ellipse_origin_y
.external	_ellipse_x_temp							//public
.external	_ellipse_y_temp							//public

.external	_a_square_mul_y_square_l					//a平方乘以y平方
.external	_a_square_mul_y_square_h					//a平方乘以y平方
.external	_b_square_mul_x_square_l					//b平方乘以x平方
.external	_b_square_mul_x_square_h					//b平方乘以x平方
.external	_a_square_mul_b_square_l					//a平方乘以b平方
.external	_a_square_mul_b_square_h					//b平方乘以b平方



.external	_ellipse_reckon_offset_first_l				//椭圆计偏移量X-1，Y-1
.external	_ellipse_reckon_offset_first_h				//椭圆计偏移量X-1，Y-1
.external	_ellipse_reckon_offset_second_l				//椭圆计偏移量
.external	_ellipse_reckon_offset_second_h				//椭圆计偏移量
.external	_ellipse_reckon_offset_sign					//椭圆计偏移量符号

ellipes:		.proc
		r1=0x00
		[_ellipse_x]=r1
		r1=[_ellipse_long_axes]
		[_public_b]=r1
		
		r1=[_ellipse_short_axes]
		[_public_a]=r1
		[_ellipse_y]=r1
		call	_a_square_b_square
		r1=[_public_a_squ_mul_b_squ_l]
		[_a_square_mul_b_square_l]=r1
		[_public_offset_in_a_l]=r1
		r1=[_public_a_squ_mul_b_squ_h]
		[_a_square_mul_b_square_h]=r1
		[_public_offset_in_a_h]=r1
		
		r1=0x00
		r1+=[_ellipse_origin_x]
		[_x]=r1
		r1=[_ellipse_short_axes]
		r1+=[_ellipse_origin_y]
		[_y]=r1
		r1=[sign]
	
		r4=[R_GraphicMode_temp]
		r4&=0x0030
		cmp r4,0x10
		jne	_ellipes_mode_solidcover1
		call  _ellipse_process3
		jmp _ellipes_loop
_ellipes_mode_solidcover1:
		r4&=line_mode_bit
		cmp r4,0x20
		jne	_ellipes_loop
		call  _ellipse_process3	
_ellipes_loop:

		r1=[_ellipse_y]
		cmp r1,0x00
		ja	ellipes_5
		goto	ellipse_end	
ellipse_1_temp:
		goto	ellipse_1
ellipes_5:	
		r1=[_ellipse_y]
		r1-=0x01
		[_ellipse_y_temp]=r1
		r1=[_ellipse_x]	
		r1+=0x01
		[_ellipse_x_temp]=r1
			
		call	_ellipse_process1
		call	_offset
	
		r1=[_public_offset_out_l]
		[_ellipse_reckon_offset_first_l]=r1
		r1=[_public_offset_out_h]
		[_ellipse_reckon_offset_first_h]=r1	
		r1=	[_sign]
		[_ellipse_reckon_offset_sign]=r1
		
		r1=[_ellipse_reckon_offset_sign]
		cmp		r1,0xff
		je		ellipse_1_temp
		//右上点
		r1=[_ellipse_y]
		[_ellipse_y_temp]=r1
		r1=[_ellipse_x]	
		r1+=0x01
		[_ellipse_x_temp]=r1
		call	_ellipse_process1
		call	_offset
		r1=[_public_offset_out_l]
		[_ellipse_reckon_offset_second_l]=r1
		r1=[_public_offset_out_h]
		[_ellipse_reckon_offset_second_h]=r1
	
		call	_ellipse_process2
		r1=0x00
		cmp	r1,[_process_sign]
		je		ellipse_2
		//选择对角点
		r1=[_ellipse_y]								///***
		r1-=0x01
		[_ellipse_y]=r1
		r1+=[_ellipse_origin_y]
		[_y]=r1
		r1=[_ellipse_x]	
		r1+=0x01
		[_ellipse_x]=r1
		r1+=[_ellipse_origin_x]
		[_x]=r1

		r4=[R_GraphicMode_temp]
		r4&=line_mode_bit
		cmp r4,0x10
		jne	_ellipes_mode_solidcover2
		call  _ellipse_process3
		goto	_ellipes_loop
_ellipes_mode_solidcover2:
		r4&=line_mode_bit
		cmp r4,0x20
		jne	ellipse_mode_solidecover3
		call  _ellipse_process3
		goto	_ellipes_loop
ellipse_mode_solidecover3:
		call  _ellipse_process4	
				
		goto	_ellipes_loop		
ellipse_2:
		//选择右上点
		r1=[_ellipse_y]
		[_ellipse_y]=r1
		r1+=[_ellipse_origin_y]
		[_y]=r1
		r1=[_ellipse_x]	
		r1+=0x01
		[_ellipse_x]=r1
		r1+=[_ellipse_origin_x]
		[_x]=r1
//		call  _ellipse_process3

		r4=[R_GraphicMode_temp]
		r4&=line_mode_bit
		cmp r4,0x10
		jne	_ellipes_mode_solidcover4
		call  _ellipse_process3
_ellipes_mode_solidcover4:
		r4&=line_mode_bit
		cmp r4,0x20
		jne	ellipse_mode_solidecover5
		call  _ellipse_process3
ellipse_mode_solidecover5:
		
		goto	_ellipes_loop	
ellipse_1:	
		//左下点
		r1=[_ellipse_y]							///****
		r1-=0x01
		[_ellipse_y_temp]=r1
		r1=[_ellipse_x]	

		[_ellipse_x_temp]=r1
		call	_ellipse_process1
		call	_offset
	
		r1=[_public_offset_out_l]
		[_ellipse_reckon_offset_second_l]=r1
		r1=[_public_offset_out_h]
		[_ellipse_reckon_offset_second_h]=r1	
		call	_ellipse_process2
		r1=0x00
		cmp	r1,[_process_sign]
		je		ellipse_3
		//选择对角点
		r1=[_ellipse_y]
		r1-=0x01
		[_ellipse_y]=r1				///****
		r1+=[_ellipse_origin_y]
		[_y]=r1
		r1=[_ellipse_x]	
		r1+=0x01
		[_ellipse_x]=r1
		r1+=[_ellipse_origin_x]
		[_x]=r1
//		call  _ellipse_process3

		r4=[R_GraphicMode_temp]
		r4&=line_mode_bit
		cmp r4,0x10
		jne	_ellipes_mode_solidcover6
		call  _ellipse_process3
		goto	_ellipes_loop
_ellipes_mode_solidcover6:
		r4&=line_mode_bit
		cmp r4,0x20
		jne	ellipse_mode_solidecover7
		call  _ellipse_process3
		goto	_ellipes_loop
ellipse_mode_solidecover7:
		call  _ellipse_process4
		goto	_ellipes_loop
ellipse_3:
		//左下点
		r1=[_ellipse_y]
		r1-=0x01
		[_ellipse_y]=r1						///***
		r1+=[_ellipse_origin_y]
		[_y]=r1
		r1=[_ellipse_x]	
		[_ellipse_x]=r1
		r1+=[_ellipse_origin_x]
		[_x]=r1
//		call  _ellipse_process3

		r4=[R_GraphicMode_temp]
		r4&=line_mode_bit
		cmp r4,0x10
		jne	_ellipes_mode_solidcover8
		call  _ellipse_process3
		goto	_ellipes_loop
_ellipes_mode_solidcover8:
		r4&=line_mode_bit
		cmp r4,0x20
		jne	ellipse_mode_solidecover9
		call  _ellipse_process3
		goto	_ellipes_loop
ellipse_mode_solidecover9:
		call  _ellipse_process4		
		goto	_ellipes_loop				
ellipse_end:
		retf
		.endp
//////////////////////////////////////////////////////////////////////////////
// ellipse process 1
////////////////////////////////////////////////////////////////////////////// 
.public		_ellipse_process1
_ellipse_process1:	.proc
		r1=[_ellipse_long_axes]
		[_public_b]=r1
		r1=[_ellipse_y_temp]
		[_public_a]=r1
		call	_a_square_b_square
		r1=[_public_a_squ_mul_b_squ_l]
		[_a_square_mul_y_square_l]=r1
		[_public_offset_in_b_l]=r1
		r1=[_public_a_squ_mul_b_squ_h]
		[_a_square_mul_y_square_h]=r1
		[_public_offset_in_b_h]=r1
	
		r1=[_ellipse_short_axes]
		[_public_b]=r1
		r1=[_ellipse_x_temp]
		[_public_a]=r1
		call	_a_square_b_square
		r1=[_public_a_squ_mul_b_squ_l]
		[_b_square_mul_x_square_l]=r1
		[_public_offset_in_c_l]=r1
		r1=[_public_a_squ_mul_b_squ_h]
		[_b_square_mul_x_square_h]=r1
		[_public_offset_in_c_h]=r1
		
		
		retf
		.endp
//////////////////////////////////////////////////////////////////////////////
// ellipse process 2
////////////////////////////////////////////////////////////////////////////// 
.external		_process_sign
.public	_ellipse_process2	
_ellipse_process2:			.proc
		r1=[_ellipse_reckon_offset_first_h]	
		cmp r1,[_ellipse_reckon_offset_second_h]
		jb	_ellipse_process2_1
		//大于等于
		r1=[_ellipse_reckon_offset_first_h]	
		cmp r1,[_ellipse_reckon_offset_second_h]
		je	_ellipse_process2_2
		r1=0x00
		[_process_sign]=r1
		retf
_ellipse_process2_2:
		//高位等于
		r1=[_ellipse_reckon_offset_first_l]	
		cmp r1,[_ellipse_reckon_offset_second_l]
		jb	_ellipse_process2_1
		r1=0x00
		[_process_sign]=r1
		retf		
_ellipse_process2_1:
		//小于
		r1=0xff
		[_process_sign]=r1
		
		retf
		.endp
//////////////////////////////////////////////////////////////////////////////
// ellipse process 3
////////////////////////////////////////////////////////////////////////////// 
.public	_ellipse_process3	
_ellipse_process3:			.proc
		r1=[sign]
		push r1 to [sp]
		call  DISPLAY_A_POINT
		pop  r1 from [sp]
		[sign]=r1
		r1=[_x]
		r1-=[_ellipse_x]
		r1-=[_ellipse_x]
		[_x]=r1
		r1=[sign]
		push r1 to [sp]
		call  DISPLAY_A_POINT
		pop  r1 from [sp]
		[sign]=r1
		r1=[_y]
		r1-=[_ellipse_y]
		r1-=[_ellipse_y]
		[_y]=r1
		r1=[sign]
		push r1 to [sp]
		call  DISPLAY_A_POINT
		pop  r1 from [sp]
		[sign]=r1
		r1=[_x]
		r1+=[_ellipse_x]
		r1+=[_ellipse_x]
		[_x]=r1
		call  DISPLAY_A_POINT
		retf
		.endp	
//////////////////////////////////////////////////////////////////////////////
// ellipse process4
////////////////////////////////////////////////////////////////////////////// 
.public	_ellipse_process4
_ellipse_process4:
		r1=[_y]
		r1-=[_ellipse_origin_y]
		je	_ellipse_process4_1
		r1=[_x]
		[_line_x0]=r1
		r1-=[_ellipse_x]
		cmp r1, [_ellipse_x]
		jae	_ellipse_process4_2
		r1=0x00
		[_line_x1]=r1
		jmp _ellipse_process4_3
_ellipse_process4_2:
		r1-=[_ellipse_x]	
		[_line_x1]=r1
_ellipse_process4_3:		
		r1=[_y]
		[_line_y0]=r1
		[_line_y1]=r1
		call	DISPLAY_A_LINE
_ellipse_process4_1:	
		r1=[_y]
		r1-=[_ellipse_y]
		r1-=[_ellipse_y]
		[_line_y0]=r1
		[_line_y1]=r1
		r1=[_x]
		[_line_x0]=r1
		r1-=[_ellipse_x]
		cmp r1, [_ellipse_x]
		jae	_ellipse_process4_4
		r1=0x00
		[_line_x1]=r1
		jmp _ellipse_process4_5
_ellipse_process4_4:
		r1-=[_ellipse_x]	
		[_line_x1]=r1
_ellipse_process4_5:
		call	DISPLAY_A_LINE
		retf
//////////////////////////////////////////////////////////////////////////////
// work out offset 
// put in  [_public_offset_in_a_l][_public_offset_in_a_h]
//         [_public_offset_in_b_l][_public_offset_in_b_h]
//         [_public_offset_in_c_l][_public_offset_in_c_h] 
// put out [_public_offset_out_l][_public_offset_out_h]
//		   [_sign]
////////////////////////////////////////////////////////////////////////////// 
.external		_public_offset_in_a_l				//输入a2b2
.external		_public_offset_in_a_h				//输入a2b2
.external		_public_offset_in_b_l				//输入a2y2
.external		_public_offset_in_b_h				//输入a2y2
.external		_public_offset_in_c_l				//输入b2x2
.external		_public_offset_in_c_h				//输入b2x2
.external		_public_offset_out_l				//输出
.external		_public_offset_out_h				//输出
.external		_sign								//符号[00]+[ff]-


.public				_offset
_offset:			.proc
		r1=[_public_offset_in_a_l]
		[_public_c_l]=r1
		r1=[_public_offset_in_a_h]
		[_public_c_h]=r1		
		r1=[_public_offset_in_b_l]
		[_public_d_l]=r1
		r1=[_public_offset_in_b_h]
		[_public_d_h]=r1
		call	_sub
		
		r1=[_public_sbc_h]
		cmp	r1,[_public_offset_in_c_h]
		jae		offset_1
		//小于
		r1=[_public_offset_in_c_l]
		[_public_c_l]=r1
		r1=[_public_offset_in_c_h]
		[_public_c_h]=r1		
		r1=[_public_sbc_h]
		[_public_d_h]=r1
		r1=[_public_sbc_l]
		[_public_d_l]=r1
		call	_sub
		r1=[_public_offset_in_b_l]
		[_public_d_l]=r1
		r1=[_public_offset_in_b_h]
		[_public_d_h]=r1
		r1=0xff
		[_sign]=r1
		retf
offset_1:
		r1=[_public_sbc_h]
		cmp	r1,[_public_offset_in_c_h]
		je		offset_2	
		//大于
		r1=[_public_sbc_l]
		[_public_c_l]=r1
		r1=[_public_sbc_h]
		[_public_c_h]=r1
		r1=[_public_offset_in_c_l]
		[_public_d_l]=r1
		r1=[_public_offset_in_c_h]
		[_public_d_h]=r1		
		call	_sub
		r1=[_public_sbc_l]
		[_public_offset_out_l]=r1
		r1=[_public_sbc_h]
		[_public_offset_out_h]=r1
		r1=0x00
		[_sign]=r1
		retf

offset_2:
		//高位等于	
		r1=[_public_sbc_l]
		cmp	r1,[_public_offset_in_c_l]
		jae		offset_3
		//小于
		r1=[_public_offset_in_c_l]
		[_public_c_l]=r1
		r1=[_public_offset_in_c_h]
		[_public_c_h]=r1		
		r1=[_public_sbc_h]
		[_public_d_h]=r1
		r1=[_public_sbc_l]
		[_public_d_l]=r1
		call	_sub
		r1=[_public_sbc_l]
		[_public_offset_out_l]=r1
		r1=[_public_sbc_h]
		[_public_offset_out_h]=r1
		r1=0xff
		[_sign]=r1
		retf

offset_3:
		r1=[_public_sbc_l]
		cmp	r1,[_public_offset_in_c_l]
		je		offset_4	
		//大于
		r1=[_public_sbc_l]
		[_public_c_l]=r1
		r1=[_public_sbc_h]
		[_public_c_h]=r1
		r1=[_public_offset_in_c_l]
		[_public_d_l]=r1
		r1=[_public_offset_in_c_h]
		[_public_d_h]=r1		
		call	_sub
		r1=[_public_sbc_l]
		[_public_offset_out_l]=r1
		r1=[_public_sbc_h]
		[_public_offset_out_h]=r1
		r1=0x00
		[_sign]=r1
		retf

offset_4:
		//等于
		r1=0x00
		[_public_offset_out_l]=r1
		[_public_offset_out_h]=r1
		r1=0x00
		[_sign]=r1
		retf
		.endp

//////////////////////////////////////////////////////////////////////////////
// work out double beyte sub	c-d	
// put in  [_public_c_l][_public_c_h][_public_d_l][_public_d_h] 
// put out [_public_sbc_l][_public_sbc_h]
////////////////////////////////////////////////////////////////////////////// 
.external	_public_c_l									//public 
.external	_public_c_h									//public 
.external	_public_d_l									//public
.external	_public_d_h									//public
.external	_public_sbc_l
.external	_public_sbc_h
.public _sub
_sub:	.proc
		r1=[_public_c_l]
		r2=[_public_d_l]
		cmp	r1,r2
		jbe		sub_1
		r1-=r2
		[_public_sbc_l]=r1
		r1=[_public_c_h]
		r2=[_public_d_h]
		r1-=r2
		[_public_sbc_h]=r1
		goto	sub_3
sub_1:
		r1=[_public_c_l]
		r2=[_public_d_l]
		cmp	r1,r2
		je		sub_2
		r1=[_public_c_h]
		r1-=0x01
		[_public_sbc_h]=r1
		r1=0xffff
		r1-=[_public_d_l]
		r1+=[_public_c_l]
		r1+=0x01
		[_public_sbc_l]=r1
		r1=[_public_sbc_h]
		r2=[_public_d_h]
		r1-=r2
		[_public_sbc_h]=r1
		goto	sub_3
sub_2:
		r1=0x00
		[_public_sbc_l]=r1
		r1=[_public_c_h]
		r2=[_public_d_h]
		r1-=r2
		[_public_sbc_h]=r1
sub_3:
		retf
		.endp

//////////////////////////////////////////////////////////////////////////////
// work out a square mul b square
//put in  [_public_b][_public_a]
//put out [_public_a_squ_mul_b_squ_l]
//  	  [_public_a_squ_mul_b_squ_h]
//////////////////////////////////////////////////////////////////////////////   
.external	_public_b
.external	_public_a
.external	_public_a_squ_mul_b_squ_l
.external	_public_a_squ_mul_b_squ_h   
.public				_a_square_b_square
_a_square_b_square:		.proc
		r1=[_public_b]
		r2=[_public_b]
		mr=r1*r2
		[_public_b]=r3
		r1=[_public_a]
		r2=[_public_a]
		mr=r1*r2
		[_public_a]=r3
		r1=[_public_b]
		r2=[_public_a]
		mr=r1*r2
		[_public_a_squ_mul_b_squ_l]=r3
		[_public_a_squ_mul_b_squ_h]=r4
		retf
		.endp	
//////////////////////////////////////////////////////////////////////////////
//Filename : FG_PutChar
//Function  Description	:display a Char on lcd 
//Input    : [char][font] [startx][starty]
//mode:		
//	DG_CHAR_COVER	(default)
//	DG_CHAR_CLEAR
//	DG_CHAR_XOR	
//font:
//		tiny(default)
//		small	
//		smallb	
//		large	
//		narrow	
//usage: FG_PutChar(char char,short font,short startx,short starty)
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.external	tiny
.external	narrow1
.external	tiny3
.external	large1
.external	smallb1
.external	small1
.external	charnum										//字符序号
.external	charwide									//字符宽度
.external	charhigh									//字符高
.external	chartemp
.external	label4
.external	constant
.public		_FG_PutChar		
_FG_PutChar:	.proc
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_Char_Parameters_two:
		cmp	r2,0x06
		jne	L_Char_Parameters_four
		call	F_Char_Parameters_two
		jmp		L_Char
L_Char_Parameters_four:		
		cmp	r2,0x08
		jne		L_Char
		call	F_Char_Parameters_four
L_Char:		
		//		call	PutChar_tiny
		//		call	PutChar_small
		//		call	PutChar_large	
		call	PutChar
		pop	bp from	[sp]
		retf	 
		.endp
//----------------------------------------------------------------------------
//bit8		tiny标志
//bit9		small标志
//bit10		smallb标志
//bit11		large标志
//bit12		narrow标志
F_Char_Parameters_two:
		r1=[_x0]
		[image_jumpoff_point_x]=r1
		r1=[_y0]
		[image_jumpoff_point_y]=r1
		r2=[bp_temp]
F_Char_Parameters_two_four:		
		r3=[sign]
		r3&=0xe0ff
		[sign]=r3
		r2-=0x01
		r1=[r2]
char_parameter_two_tiny:	
		cmp	r1,0x00
		jne	char_parameter_two_small
		r3=[sign]
		r3|=0x0100
		[sign]=r3
		jmp char_parameter_two_modend
char_parameter_two_small:
		cmp	r1,0x01
		jne	char_parameter_two_smallb
		r3=[sign]
		r3|=0x0200
		[sign]=r3
		jmp char_parameter_two_modend
char_parameter_two_smallb:
		cmp	r1,0x02
		jne	char_parameter_two_large
		r3=[sign]
		r3|=0x0400
		[sign]=r3
		jmp char_parameter_two_modend
char_parameter_two_large:
		cmp	r1,0x03
		jne	char_parameter_two_narrow
		r3=[sign]
		r3|=0x0800
		[sign]=r3
		jmp	char_parameter_two_modend
char_parameter_two_narrow:
		cmp	r1,0x04
		jne	char_parameter_two_modend
		r3=[sign]
		r3|=0x1000
		[sign]=r3
char_parameter_two_modend:
		r2-=0x01
		r1=[r2]
		cmp r1,0x95
		jb	char_parameter_two_loop_1
		r1-=0x24
		[charnum]=r1
char_parameter_two_loop_1:		
		r1-=0x1f
		[charnum]=r1
		retf
//----------------------------------------
F_Char_Parameters_four:
//		r1=[R_GraphicMode_temp]
///		r1&=dotted_mode_bit_clear
//		[R_GraphicMode_temp]=r1
//		r1=[R_GraphicMode]
//		r1&=dotted_mode_bit
//		r1|=[R_GraphicMode_temp]
//		[R_GraphicMode_temp]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_y]=r1
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_x]=r1
		goto F_Char_Parameters_two_four
//		retf
//----------------------------------------------------------------------------	
PutChar:
		r1=[sign]
		r1&=0x0100
		jz PutChar_other
		call PutChar_tiny
		jmp	PutChar_end
PutChar_other:	
		call	PutChar_othermode
PutChar_end:	
		retf
//////////////////////////////////////////////////////////////////////////////
//r2-->pointer   r3-->字号	r1-->data
PutChar_tiny:		
		////////////1
		r3=0x01
		[image_width_byte]=r3
		r3=0x00				//存入字号
		[charhigh]=r3
	//	[image_high_bit]=r3
		r1=[sign]
		r1&=0xfffd
		[sign]=r1
		r1=label4
		r1+=0x01
		[image_tab]=r1
		/////////////
		r2=tiny3
		sr|=[bank1]
		r1=d:[r2]
		jmp	PutChar_tiny_find_data2
PutChar_tiny_find_data:	
		r2+=0x01
		r1=d:[r2]
PutChar_tiny_find_data2:	
		[chartemp]=r1
		r1&=0xff00
		r1=r1 lsr 0x04
		r1=r1 lsr 0x04
		cmp r1,0xff
		jne	PutChar_tiny_find_data1
		r3+=0x01
		cmp	r3	,[charnum]
		jne	PutChar_tiny_find_data1
		call	PutChar_tiny_get_data
		jmp	PutChar_tiny_find_data3
PutChar_tiny_find_data1:
		r1=[chartemp]
		r1&=0x00ff
		cmp r1,0xff
		jne	PutChar_tiny_find_data
		r3+=0x01
		cmp	r3	,[charnum]
		jne	PutChar_tiny_find_data
		r1=[sign]
		r1|=0x02
		[sign]=r1
		call	PutChar_tiny_get_data
PutChar_tiny_find_data3:		
		r1=[sign]
		r1&=0x04
		jnz	PutChar_tiny_find_end
		
		r1=[sign]
		r1|=0x01
		[sign]=r1
		
		call	F_image
PutChar_tiny_find_end:		
		retf	 
//--------------------------------------------------	
PutChar_tiny_get_data:
		///////
		r4=label4
		///////
		r1=[sign]
		r1&=0x0002
		jnz	tiny_get_data1
		//r1未取完
		r1=0x00
		[r4]=r1
		call	tiny_full_data
		retf
tiny_get_data1:		
		//r1取完
		call	tiny_full_data
		retf
//--------------------------------------------------
//r3-->charhigh	r4-->full pointer r2-->data pointer r1-->data
//--------------------------------------------------
tiny_full_data:
		///////
		r3=0x00
		///////
tiny_full_data1:	
		r2+=0x01
		sr|=[bank1]
		r1=d:[r2]
		push r1 to [sp]
		r1&=0xff00
		r1=r1 lsr 0x04
		r1=r1 lsr 0x04
		cmp r1,0xff
		jne	tiny_full_data2
		pop r1 from [sp]
		[charhigh]=r3
		[image_high_bit]=r3	
		retf
tiny_full_data2:
		r3+=0x01
		r4+=0x01
		[r4]=r1	
		pop r1 from [sp]
		r1&=0x00ff
		cmp r1,0xff
		je	tiny_full_data3
		r3+=0x01
		r4+=0x01
		[r4]=r1	
		jmp	tiny_full_data1
tiny_full_data3:
		[charhigh]=r3
		[image_high_bit]=r3				
		retf
//--------------------------------------------------
//**************************************************
PutChar_othermode:				
		////////////1
		r3=0x02
		[image_width_byte]=r3
		r3=0x00				
		[charhigh]=r3
	//	[image_high_bit]=r3
		r1=label4
		[image_tab]=r1
		/////////////
PutChar_othermode_small:
		r1=[sign]
		r1&=0x0200
		jz	PutChar_othermode_smallb
		r2=small1
		r1=0xffc0
		[constant]=r1
		jmp	PutChar_modechange_end
PutChar_othermode_smallb:	
		r1=[sign]
		r1&=0x0400
		jz 	PutChar_othermode_large
		r2=smallb1
		r1=0xffc0
		[constant]=r1
		jmp	PutChar_modechange_end
PutChar_othermode_large:	
		r1=[sign]
		r1&=0x0800
		jz	PutChar_othermode_narrow
		r2=large1
		r1=0xfff8
		[constant]=r1
		jmp	PutChar_modechange_end
PutChar_othermode_narrow:	
		r1=[sign]
		r1&=0x1000
		jz	PutChar_modechange_end
		r2=narrow1
		r1=0xffc0
		[constant]=r1
PutChar_modechange_end:	
		sr|=[bank1]
		r1=d:[r2]
		jmp	PutChar_small_find_data2
PutChar_small_find_data:	
		r2+=0x01
		r1=d:[r2]
PutChar_small_find_data2:	
		cmp r1,[constant] //0xfff8
		jne	PutChar_small_find_data
		r3+=0x01
		cmp	r3	,[charnum]
		jne	PutChar_small_find_data
		call	PutChar_small_get_data
PutChar_small_find_data1:		
		r1=[sign]
		r1&=0x04
		jnz	PutChar_other_find_end
		r1=[sign]
		r1|=0x01
		[sign]=r1
		call	F_image
PutChar_other_find_end:		
		retf
//--------------------------------------------------
//r3-->charhigh	r4-->full pointer r2-->data pointer r1-->data
//--------------------------------------------------
PutChar_small_get_data:
		///////
		r3=0x00
		r4=label4
		///////
PutChar_small_full_data:		
		r2+=0x01
		sr|=[bank1]
		r1=d:[r2]
		cmp	r1,[constant]
		je	small_get_data_end
		[chartemp]=r1
		r1=r1 lsr 0x04
		r1=r1 lsr 0x04
		r1&=0x00ff
		[r4]=r1
		r4+=0x01
		r1=[chartemp]
		r1&=0x00ff
		[r4]=r1
		r4+=0x01
		r3+=0x01
		jmp PutChar_small_full_data
small_get_data_end:	
		[charhigh]=r3
		[image_high_bit]=r3		
		retf
//////////////////////////////////////////////////////////////////////////////
//Filename : FG_PutStr
//Function  Description	:print a string at (startx,starty)
//Input    : string,[font][startx][starty]
//the start point is left upside point of string
//mode:		
//	DG_CHAR_COVER	(default)
//	DG_CHAR_CLEAR
//	DG_CHAR_XOR	
//font:
//		tiny(default)
//		small	
//		smallb	
//		large	
//		narrow	
//usage: FG_PutStr("string",short font,short startx,short starty)
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.external	str_tab										//字符串起始地址
.external	str_x
.external	str_y
.public	_FG_PutStr
_FG_PutStr:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
PutStr_two:	
		cmp	r2,0x06
		jne	PutStr_four
		call	PutStr_parameter_two
		jmp	PutStr
PutStr_four:
		cmp	r2,0x08
		jne	PutStr
		call	PutStr_parameter_four
PutStr:	
//r2-->data pointer,r1-->data
//		r1=0x70
//		[str_x]=r1
//		r2=_TAB_100
		r2=[str_tab]
PutStr_loop:			
		r1=[r2]
		cmp	r1 ,0x00
		je	PutStr_end
		cmp r1,0x95
		jb	PutStr_loop_1
		r1-=0x24
		[charnum]=r1
		jmp	PutStr_loop_2
PutStr_loop_1:		
		r1-=0x1f
		[charnum]=r1
PutStr_loop_2:	
		push	r2 to [sp]	
		call	PutChar
		pop	r2 from [sp]
		r2+=0x01
		r1=[image_jumpoff_point_x]
		r1-=[charhigh]
		[image_jumpoff_point_x]=r1
		jmp	PutStr_loop
PutStr_end:
		pop bp from	[sp]
		retf
//--------------------------------------------------
PutStr_parameter_two:
		r1=[_x0]
		r1=0x60
		[image_jumpoff_point_x]=r1
		r1=[_y0]
		r1=40
		[image_jumpoff_point_y]=r1
		r2=[bp_temp]
PutStr_Parameters_two_four:		
		r3=[sign]
		r3&=0xe0ff
		[sign]=r3
		r2-=0x01
		r1=[r2]
Str_parameter_two_tiny:	
		cmp	r1,0x00
		jne	Str_parameter_two_small
		r3=[sign]
		r3|=0x0100
		[sign]=r3
		jmp Str_parameter_two_modend
Str_parameter_two_small:
		cmp	r1,0x01
		jne	Str_parameter_two_smallb
		r3=[sign]
		r3|=0x0200
		[sign]=r3
		jmp Str_parameter_two_modend
Str_parameter_two_smallb:
		cmp	r1,0x02
		jne	Str_parameter_two_large
		r3=[sign]
		r3|=0x0400
		[sign]=r3
		jmp Str_parameter_two_modend
Str_parameter_two_large:
		cmp	r1,0x03
		jne	Str_parameter_two_narrow
		r3=[sign]
		r3|=0x0800
		[sign]=r3
		jmp	Str_parameter_two_modend
Str_parameter_two_narrow:
		cmp	r1,0x04
		jne	Str_parameter_two_modend
		r3=[sign]
		r3|=0x1000
		[sign]=r3
Str_parameter_two_modend:
		r2-=0x01
		r2=[r2]
		[str_tab]=r2
		retf
//--------------------------------------------------
PutStr_parameter_four:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_y]=r1
		r2-=0x01
		r1=[r2]
		[image_jumpoff_point_x]=r1
		goto PutStr_Parameters_two_four
//		retf
//--------------------------------------------------
//--------------------------------------------------
//////////////////////////////////////////////////////////////////////////////2
//Filename : FG_GetPixel
//Function  Get the pixel color at (plotX,ploty),and store in r1
//Input    : [plotX][ploty]
//usage: FG_GetPixel(short plotX,short ploty)
//Example:
//		 FG_GetPixel()
//		 FG_GetPixel(10,20)
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.public	_FG_GetPixel
_FG_GetPixel:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_GetPixel_Parameters_none:
		cmp	r2,0x04
		jne	L_GetPixel_Parameters_two
		r1=[_x0]
		r2=[_y0]
		jmp L_GetPixel_Parameters_end
L_GetPixel_Parameters_two:
		cmp	r2,0x06
		jne	L_GetPixel_Parameters_end
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		r2+=0x01
		r2=[r2]
L_GetPixel_Parameters_end:		
		call	F_Get_pixel
		pop	bp from [sp]
		retf
//////////////////////////////////////////////////////////////////////////////3
//Filename : FG_PutPixel
//Function  draw the pixel with assigned mode or R_GraphicMode
//Input    : [plotX][ploty]
//Mode:
//	DG_PIXEL_COVER	(default)
//	DG_PIXEL_CLEAR	
//	DG_PIXEL_XOR
//usage: FG_PutPixel(short plotX,short ploty,short mode)
//Example:
//		 FG_PutPixel()
//		 FG_PutPixel(10,20,DG_PIXEL_XOR)
//Destory  : R1,R2,R3,R4
//////////////////////////////////////////////////////////////////////////////
.public	_FG_PutPixel
_FG_PutPixel:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_PutPixel_Parameters_none:
		cmp	r2,0x04
		jne	L_PutPixel_Parameters_two
		r1=[_x0]
		r2=[_y0]
		jmp L_PutPixel_Parameters_end
L_PutPixel_Parameters_two:
		cmp	r2,0x06
		jne	L_PutPixel_Parameters_three
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		r2+=0x01
		r2=[r2]
		jmp L_PutPixel_Parameters_end
L_PutPixel_Parameters_three:
		cmp	r2,0x07
		jne	L_PutPixel_Parameters_end
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		call	FG_SetMode
		r2-=0x02
		r1=[r2]
		r2+=0x01
		r2=[r2]
L_PutPixel_Parameters_end:
		r3=[sign]
		r3|=0x01
		[sign]=r3		
		call	F_pixel
		pop	bp from [sp]	
		retf
//////////////////////////////////////////////////////////////////////////////9
//Filename :FG_GetY  FG_GetX
//参数:
//功能: Get current (X0,Y0) and store in r1.
//用法:	FG_GetX()	FG_GetY()
//////////////////////////////////////////////////////////////////////////////
.public	_FG_GetY
_FG_GetY:
		r1=[_y0]
		retf
.public	_FG_GetX
_FG_GetX:
		r1=[_x0]
		retf
//////////////////////////////////////////////////////////////////////////////5
//Filename :_FG_GetCharHeight
//参数: Char,Font
//功能: Get the height of char(pixels), store in A.
//用法: 	FG_GetCharHeight(char Char,short Font)
//Example:  FG_GetCharHeight('a',Large)
//////////////////////////////////////////////////////////////////////////////

.public	_FG_GetCharHeight
_FG_GetCharHeight:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_CharHeight_Parameters_two:
		cmp	r2,0x06
		jne	L_CharHeight_end
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		cmp r1 ,0x00
		jne L_CharHeight_large
		r1=0x08
		jmp	L_CharHeight_end
L_CharHeight_large:
		cmp r1 ,0x02
		ja L_CharHeight_other
		r1=0x0a	
		jmp	L_CharHeight_end
L_CharHeight_other:
		cmp r1 ,0x03
		jne L_CharHeight_other1
		r1=0x0d
		jmp	L_CharHeight_end
L_CharHeight_other1:	
		r1=0x0a	
L_CharHeight_end:
		pop bp from [sp]
		retf
//////////////////////////////////////////////////////////////////////////////6
//Filename :_FG_GetCharWidth
//参数: Char,Font
//功能: Get the width of char(pixels), store in r1.
//用法: 	FG_GetCharWidth(char Char,short Font)
//Example:  FG_GetCharWidth('A',Tiny)
//////////////////////////////////////////////////////////////////////////////
.public	_FG_GetCharWidth
_FG_GetCharWidth:
		push r2,r4 to [sp]
		PUSH BP,BP TO [SP]
		r1=[sign]
		r1|=0x04
		[sign]=r1
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_GetChar_Parameters_two:
		cmp	r2,0x09
		jne	L_GetChar_end
		call	F_CharWidth_Parameters_two
		call	PutChar
L_GetChar_end:
		r1=[sign]
		r1&=0xfffb
		[sign]=r1
		r1=[charhigh]
		pop bp from [sp]
		pop r2,r4 from [sp]
		retf
	
F_CharWidth_Parameters_two:
		r2=[bp_temp]
F_CharWidth_Parameters_two_four:		
		r3=[sign]
		r3&=0xe0ff
		[sign]=r3
		r2-=0x01
		r1=[r2]
CharWidth_parameter_two_tiny:	
		cmp	r1,0x00
		jne	CharWidth_parameter_two_small
		r3=[sign]
		r3|=0x0100
		[sign]=r3
		jmp CharWidth_parameter_two_modend
CharWidth_parameter_two_small:
		cmp	r1,0x01
		jne	CharWidth_parameter_two_smallb
		r3=[sign]
		r3|=0x0200
		[sign]=r3
		jmp CharWidth_parameter_two_modend
CharWidth_parameter_two_smallb:
		cmp	r1,0x02
		jne	CharWidth_parameter_two_large
		r3=[sign]
		r3|=0x0400
		[sign]=r3
		jmp CharWidth_parameter_two_modend
CharWidth_parameter_two_large:
		cmp	r1,0x03
		jne	CharWidth_parameter_two_narrow
		r3=[sign]
		r3|=0x0800
		[sign]=r3
		jmp	CharWidth_parameter_two_modend
CharWidth_parameter_two_narrow:
		cmp	r1,0x04
		jne	CharWidth_parameter_two_modend
		r3=[sign]
		r3|=0x1000
		[sign]=r3
CharWidth_parameter_two_modend:
		r2-=0x01
		r1=[r2]
		cmp r1,0x95
		jb	CharWidth_parameter_two_loop_1
		r1-=0x24
		[charnum]=r1
CharWidth_parameter_two_loop_1:		
		r1-=0x1f
		[charnum]=r1
		retf
//////////////////////////////////////////////////////////////////////////////4
////Filename :FG_GetStrWidth
//参数: StrPtr,Font
//功能: Get the width of string(pixels), store in r1.
//用法:	FG_GetStrWidth(char *StrPtr,short Font)
//Example:	FG_GetStrWidth(StringPointer,Tiny)
//////////////////////////////////////////////////////////////////////////////
.public	_FG_GetStrWidth
_FG_GetStrWidth:
		push r2,r5 to [sp]
		r1=[sign]
		r1|=0x04
		[sign]=r1
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_GetCharWidth_Parameters_two:
		cmp	r2,0x09
		jne	L_GetCharWidth_end		
		call	StrWidth_parameter_two
		r3=0x00
GetCharWidth_loop:					
		r1=[r2]
		cmp	r1 ,0x00
		je	L_GetCharWidth_end
		cmp r1,0x95
		jb	GetCharWidth_loop_1
		r1-=0x24
		[charnum]=r1
		jmp	GetCharWidth_loop_2
GetCharWidth_loop_1:		
		r1-=0x1f
		[charnum]=r1
GetCharWidth_loop_2:	
		push r2,r3 to [sp]	
		call	PutChar
		pop	r2,r3 from [sp]
		r2+=0x01
		r1=[charhigh]
		r3+=r1
		jmp	GetCharWidth_loop		
L_GetCharWidth_end:
		r1=[sign]
		r1&=0xfffb
		[sign]=r1
		r1=r3
		pop r2,r5 from [sp]
		retf
//------------------------------------------------------------------	
StrWidth_parameter_two:
		r2=[bp_temp]
StrWidth_Parameters_two_four:		
		r3=[sign]
		r3&=0xe0ff
		[sign]=r3
		r2-=0x01
		r1=[r2]
StrWidth_parameter_two_tiny:	
		cmp	r1,0x00
		jne	StrWidth_parameter_two_small
		r3=[sign]
		r3|=0x0100
		[sign]=r3
		jmp StrWidth_parameter_two_modend
StrWidth_parameter_two_small:
		cmp	r1,0x01
		jne	StrWidth_parameter_two_smallb
		r3=[sign]
		r3|=0x0200
		[sign]=r3
		jmp StrWidth_parameter_two_modend
StrWidth_parameter_two_smallb:
		cmp	r1,0x02
		jne	StrWidth_parameter_two_large
		r3=[sign]
		r3|=0x0400
		[sign]=r3
		jmp StrWidth_parameter_two_modend
StrWidth_parameter_two_large:
		cmp	r1,0x03
		jne	StrWidth_parameter_two_narrow
		r3=[sign]
		r3|=0x0800
		[sign]=r3
		jmp	StrWidth_parameter_two_modend
StrWidth_parameter_two_narrow:
		cmp	r1,0x04
		jne	StrWidth_parameter_two_modend
		r3=[sign]
		r3|=0x1000
		[sign]=r3
StrWidth_parameter_two_modend:
		r2-=0x01
		r2=[r2]
		[str_tab]=r2
		retf
//////////////////////////////////////////////////////////////////////////////10
//Filename :_FG_MoveDelta
//参数: DeltaX,DeltaY
//功能: Mover (X0,Y0) to a new location. New X0=X0+DeltaX.
//Destroy: A
//Memory Modified: X0->X0+DeltaX, Y0->Y0+DeltaY
//用法:		FG_MoveDelta(short DeltaX,short DeltaY)
//Example:	FG_MoveDelta(10,10)
//////////////////////////////////////////////////////////////////////////////
.public	_FG_MoveDelta
_FG_MoveDelta:
		push bp to [sp]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_MoveDelta_Parameters_two:
		cmp	r2,0x06
		jne	L_MoveDelta_end
		r2=[bp_temp]
		r2-=0x01
		r1=[_y0]
		r1+=[r2]
		[_y0]=r1
		r2-=0x01
		r1=[_x0]
		r1+=[r2]
		[_x0]=r1
L_MoveDelta_end:
		pop bp from [sp]
		retf
//////////////////////////////////////////////////////////////////////////////11
//Filename :_FG_MoveTo
//参数: NewX,NewY
//功能: Move (X0,Y0) to a new location.
//Destroy: AMemory Modified: X0->NewX, Y0->NewY
//用法: 	FG_MoveTo(short NewX,short NewY)
//Example:	FG_MoveTo(20,30)	
//FG_MoveTo(R_Var1,R_Var2)
//////////////////////////////////////////////////////////////////////////////
.public	_FG_MoveTo
_FG_MoveTo:
		push bp to [sp]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
L_MoveTo_Parameters_two:
		cmp	r2,0x06
		jne	L_MoveTo_end
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_y0]=r1
		r2-=0x01
		r1=[r2]
		[_x0]=r1
L_MoveTo_end:
		pop bp from [sp]
		retf
//////////////////////////////////////////////////////////////////////////////12
//Filename : _FG_Bar
//参数: StartX,StartY,EndX,EndY,Mode
//功能: Draw a bar with the style assigned in R_GraphicMode.
//Mode: DG_BAR_FILL(default),DG_BAR_ERASE,DG_BAR_INVERSE
//Destroy: AMemory Modified: X0->EndX, Y0->EndY
//用法: 	FG_Bar(short StartX,short StartY,short EndX,short EndY,short Mode)
//Example:		FG_Bar(0,0,20,20,DG_BAR_FILL)	
//				FG_Bar(0,0,R_Var1,R_Var2)
//				FG_Bar(20,20,DG_BAR_ERASE)
//				FG_Bar(R_Var1,R_Var2)
//////////////////////////////////////////////////////////////////////////////
.public	_FG_Bar
_FG_Bar:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
PutBar_two:	
		cmp	r2,0x06
		jne	PutBar_three
		call	PutBar_parameter_two
		jmp	PutBar
PutBar_three:	
		cmp	r2,0x07
		jne	PutBar_four
		call	PutBar_parameter_three
		jmp	PutBar
PutBar_four:
		cmp	r2,0x08
		jne	PutBar_five
		call	PutBar_parameter_four
		jmp	PutBar
PutBar_five:	
		cmp	r2,0x09
		jne	PutBar
		call	PutBar_parameter_five
PutBar:	
		call	FG_putBar
		pop bp from [sp]	
		retf
//-----------------------------------------------------

FG_putBar:	
		push r2 to [sp]
		call	rectagle			//_rectagle1
		pop r2 from [sp]
		[R_GraphicMode_temp]=r2
		retf
//-----------------------------------------------------
PutBar_parameter_two:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r1=[_y0]
		[_rectangle_jumping_off_y]=r1
		r1=[_x0]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		retf
//-----------------------------------------------------
PutBar_parameter_three:
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r1=[_y0]
		[_rectangle_jumping_off_y]=r1
		r1=[_x0]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		cmp r1,0x00
		jne PutBar_parameter_three_1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		jmp PutBar_parameter_three_end
PutBar_parameter_three_1:
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
PutBar_parameter_three_end:
		retf
//-----------------------------------------------------
PutBar_parameter_four:
		call	_FG_GetBMPMode
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_y]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		retf
//-----------------------------------------------------
PutBar_parameter_five:
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_y]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		cmp r1,0x00
		jne PutBar_parameter_five_1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		jmp PutBar_parameter_five_end
PutBar_parameter_five_1:
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
PutBar_parameter_five_end:
		retf
//-----------------------------------------------------
///////////////////////////////////////////////////////////////////
//Function Name: FG_ClearRect
//参数: _rectangle_jumping_off_y,_rectangle_jumping_off_y,EndX,EndY,Mode
//功能: Clear a rectangular area with 0 or 1.
//Mode: DG_CLEAR_ERASE(default),DG_CLEAR_FILL
//the jump off point must is left downside point of rectangle.the end point must is
//right upside of rectangle 
//FG_ClearRect(short StartX,short StartY,short EndX,short EndY,short Mode)
//Example:	
//FG_ClearRect(0,0,20,20,DG_CLEAR_FILL)	
//FG_ClearRect(0,0,R_Var1,R_Var2)	
//FG_ClearRect(20,20,DG_CLEAR_ERASE)	
//FG_ClearRect(R_Var1,R_Var2)
///////////////////////////////////////////////////////////////////
.public	_FG_ClearRect
_FG_ClearRect:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
ClearRect_two:	
		cmp	r2,0x06
		jne	ClearRect_three
		call	ClearRect_parameter_two
		jmp	ClearRect
ClearRect_three:	
		cmp	r2,0x07
		jne	ClearRect_four
		call	ClearRect_parameter_three
		jmp	ClearRect
ClearRect_four:
		cmp	r2,0x08
		jne	ClearRect_five
		call	ClearRect_parameter_four
		jmp	ClearRect
ClearRect_five:	
		cmp	r2,0x09
		jne	ClearRect
		call	ClearRect_parameter_five
ClearRect:	
		call	FG_ClearRect
		pop bp from [sp]	
		retf
//-----------------------------------------------------
FG_ClearRect:	
		push r2 to [sp]
		call	rectagle		//_rectagle1
		pop r2 from [sp]
		[R_GraphicMode_temp]=r2
		retf
//-----------------------------------------------------
ClearRect_parameter_two:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r1=[_y0]
		[_rectangle_jumping_off_y]=r1
		r1=[_x0]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		retf
//-----------------------------------------------------
ClearRect_parameter_three:
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r1=[_y0]
		[_rectangle_jumping_off_y]=r1
		r1=[_x0]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		cmp r1,0x00
		jne ClearRect_parameter_three_1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		jmp ClearRect_parameter_three_end
ClearRect_parameter_three_1:
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
ClearRect_parameter_three_end:
		retf
//-----------------------------------------------------
ClearRect_parameter_four:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_y]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		retf
//-----------------------------------------------------
ClearRect_parameter_five:
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		[_rectangle_high]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_wide]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_y]=r1
		r2-=0x01
		r1=[r2]
		[_rectangle_jumping_off_x]=r1
		r1=[_rectangle_wide]
		r1-=[_rectangle_jumping_off_x]
		[_rectangle_wide]=r1
		r1=[_rectangle_high]
		r1-=[_rectangle_jumping_off_y]
		[_rectangle_high]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		cmp r1,0x00
		jne ClearRect_parameter_five_1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		jmp ClearRect_parameter_five_end
ClearRect_parameter_five_1:
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
ClearRect_parameter_five_end:
		retf
//-----------------------------------------------------
//////////////////////////////////////////////////////////////////////////////1
//Filename : _FG_ClearEllipse
//参数: OriginX, OriginY, RadiusX, RadiusY,Mode
//功能: Clear a ellipse area with 0 or 1.
//Mode: DG_CLEAR_ERASE(default),DG_CLEAR_FILL
//Destroy: AMemory Modified:
//用法:	FG_ClearEllipse(short OriginX,short OriginY,short RadiusX,short RadiusY,short Mode)
//Example:	FG_ClearEllipse(20,20,5,4,DG_CLEAR_ERASE)	
//FG_ClearEllipse(R_Var1,R_Var2,R_Var1,R_Var2,R_Var3,R_Var4)
//////////////////////////////////////////////////////////////////////////////1
.public	_FG_ClearEllipse
_FG_ClearEllipse:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
ClearEllipse_four:	
		cmp	r2,0x08
		jne	ClearEllipse_five
		call	ClearEllipse_parameter_four
		jmp	ClearEllipse
ClearEllipse_five:	
		cmp	r2,0x09
		jne	ClearEllipse
		call	ClearEllipse_parameter_five
ClearEllipse:	
		call	FG_ClearEllipse
		pop bp from [sp]	
		retf
//-----------------------------------------------------
FG_ClearEllipse:	
		push r2 to [sp]
		call	ellipes
		pop r2 from [sp]
		[R_GraphicMode_temp]=r2
		retf
//-----------------------------------------------------
ClearEllipse_parameter_four:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_ellipse_short_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_long_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_y]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_x]=r1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		retf
//-----------------------------------------------------
ClearEllipse_parameter_five:
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		[_ellipse_short_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_long_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_y]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_x]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		cmp r1,0x00
		jne ClearEllipse_parameter_five_1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		jmp ClearEllipse_parameter_five_end
ClearEllipse_parameter_five_1:
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
ClearEllipse_parameter_five_end:
		retf
//////////////////////////////////////////////////////////////////////////////15
//Filename : _FG_ClearCircle
//参数: OriginX, OriginY, Radius,Mode
//功能: Clear a circle area with 0 or 1.
//Mode: DG_CLEAR_ERASE(default),DG_CLEAR_FILL
//用法:	FG_ClearCircle(short OriginX,short OriginY,short Radius,short Mode)
//Example:	FG_ClearCircle(20,20,DG_CLEAR_ERASE)
//	FG_ClearCircle(R_Var1,R_Var2)
//////////////////////////////////////////////////////////////////////////////15
.public	_FG_ClearCircle
_FG_ClearCircle:
		PUSH BP,BP TO [SP]
		r1=sp
		r2=bp
		[bp_temp]=r2
		r2-=r1
ClearCircle_four:	
		cmp	r2,0x07
		jne	ClearCircle_five
		call	ClearCircle_parameter_three
		jmp	ClearCircle
ClearCircle_five:	
		cmp	r2,0x08
		jne	ClearCircle
		call	ClearCircle_parameter_four
ClearCircle:	
		call	FG_ClearCircle
		pop bp from [sp]	
		retf
//-----------------------------------------------------
FG_ClearCircle:	
		push r2 to [sp]
		call	ellipes
		pop r2 from [sp]
		[R_GraphicMode_temp]=r2
		retf
//-----------------------------------------------------
ClearCircle_parameter_three:
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		[_ellipse_short_axes]=r1
		[_ellipse_long_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_y]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_x]=r1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		retf
//-----------------------------------------------------
ClearCircle_parameter_four:
		r2=[bp_temp]
		r2-=0x02
		r1=[r2]
		[_ellipse_short_axes]=r1
		[_ellipse_long_axes]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_y]=r1
		r2-=0x01
		r1=[r2]
		[_ellipse_origin_x]=r1
		r2=[bp_temp]
		r2-=0x01
		r1=[r2]
		cmp r1,0x00
		jne ClearCircle_parameter_five_1
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		r1|=0x0008
		[R_GraphicMode_temp]=r1
		jmp ClearCircle_parameter_five_end
ClearCircle_parameter_five_1:
		r1=[R_GraphicMode_temp]
		r2=[R_GraphicMode_temp]
		r1&=line_mode_bit_clear
		[R_GraphicMode_temp]=r1
ClearCircle_parameter_five_end:
		retf
	
	.dw		0x08,0x60
.public  _mode2
_mode2:

//;Sunnorth code.
//;Written by: Bai-yawei.
//;3.BM_
//;width=64(8byte)		height=96
.dw	 _mode2
.dw 0x00,0x00,0x00,0x00,0x00,0x01,0xf8,0x00,0x00,0x00,0x00,0x00,0x00,0x06,0x94,0x00
.dw 0x00,0x00,0x00,0x00,0x00,0x08,0xfb,0x00,0x00,0x00,0x00,0x00,0x00,0x09,0x0d,0x00
.dw 0x00,0x00,0x00,0x00,0x00,0x0a,0x01,0x80,0x00,0x00,0x00,0x00,0x00,0x0c,0x00,0x80
.dw 0x00,0x00,0x00,0x00,0x00,0x1c,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
.dw 0x00,0x00,0x00,0x00,0x00,0x28,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x68,0x00,0x00
.dw 0x00,0x00,0x00,0x00,0x01,0xf0,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x30,0x00,0x00
.dw 0x00,0x00,0x00,0x00,0x0e,0x30,0x00,0x00,0x00,0x00,0x00,0x00,0x73,0x40,0x00,0x00
.dw 0x00,0x00,0x00,0x01,0x81,0x80,0x00,0x00,0x00,0x00,0x00,0x0e,0x8e,0x00,0x00,0x00
.dw 0x00,0x00,0x00,0x10,0xf0,0x00,0x00,0x00,0x00,0x00,0x00,0x3f,0x00,0x00,0x00,0x00
.dw 0x00,0x00,0x00,0x24,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x48,0x00,0x00,0x78,0x00
.dw 0x00,0x00,0x00,0x88,0x00,0x00,0x86,0x00,0x00,0x00,0x00,0xf8,0x00,0x03,0x03,0x00
.dw 0x00,0x00,0x00,0x90,0x7f,0xfc,0x00,0x80,0x00,0x00,0x00,0x91,0xc0,0x00,0x00,0xc0
.dw 0x00,0x00,0x00,0x96,0x00,0x00,0x00,0x60,0x00,0x00,0x00,0x88,0x00,0x00,0x00,0x10
.dw 0x00,0x00,0x00,0x90,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x60,0x00,0x00,0x00,0x08
.dw 0x00,0x00,0x00,0xc0,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x02
.dw 0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x02,0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x01
.dw 0x00,0x00,0x01,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x02,0x00,0x00,0x00,0x00,0x01
.dw 0x00,0x00,0x02,0x00,0x00,0x00,0x03,0xf1,0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x2e
.dw 0x00,0x00,0x04,0x00,0x00,0x00,0x04,0x10,0x00,0x00,0x04,0x00,0x00,0x00,0x08,0x10
.dw 0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x08,0x00,0x3f,0xe0,0x00,0x00,0x00,0x18,0x08
.dw 0x00,0xc0,0x18,0x00,0x00,0x00,0x16,0x08,0x01,0x80,0x04,0x00,0x00,0x00,0x21,0x88
.dw 0x03,0x00,0x02,0x00,0x00,0x00,0x20,0x70,0x04,0x00,0x01,0x00,0x00,0x00,0xc0,0x00
.dw 0x04,0x0f,0x81,0x00,0x00,0x03,0x20,0x00,0x08,0x10,0x60,0x00,0x00,0x0c,0x30,0x00
.dw 0x08,0x20,0x30,0x80,0x00,0x00,0x20,0x00,0x08,0x20,0x10,0x80,0x00,0x00,0x20,0x00
.dw 0x08,0x20,0x08,0x80,0x00,0x00,0x20,0x00,0x08,0x20,0x08,0x5f,0x80,0x00,0x20,0x00
.dw 0x08,0x20,0x78,0x00,0xc0,0x00,0x20,0x00,0x08,0x11,0x80,0x00,0x30,0x00,0x20,0x00
.dw 0x08,0x1e,0x00,0x00,0x04,0x28,0x20,0x00,0x04,0x0c,0x00,0x00,0x03,0x40,0x20,0x00
.dw 0x04,0x00,0x00,0x06,0x01,0x12,0x20,0x00,0x03,0x00,0x00,0x39,0x80,0xc4,0x20,0x00
.dw 0x00,0xe0,0x00,0x40,0x40,0x68,0x20,0x00,0x00,0x60,0x00,0x80,0x40,0x60,0x20,0x00
.dw 0x00,0x40,0x00,0xc3,0x20,0xf8,0x20,0x00,0x00,0x80,0x00,0x8f,0xe1,0x04,0x20,0x00
.dw 0x00,0x80,0x00,0x8f,0xe3,0x02,0x20,0x00,0x00,0x80,0x00,0x5e,0x62,0x00,0x30,0x00
.dw 0x01,0x00,0x00,0x3f,0xc2,0x01,0x30,0x00,0x01,0x00,0x00,0x0f,0x82,0x01,0x10,0x00
.dw 0x01,0x00,0x00,0x00,0x02,0x01,0x10,0x00,0x01,0x00,0x00,0x00,0x02,0x01,0x08,0x00
.dw 0x01,0x00,0x00,0x00,0x01,0x02,0x08,0x00,0x01,0x00,0x00,0x00,0x01,0x02,0x04,0x00
.dw 0x01,0x00,0x00,0x1f,0x00,0x84,0x04,0x00,0x01,0x00,0x00,0x79,0xc0,0xf8,0x02,0x00
.dw 0x00,0x80,0x00,0x9c,0xe0,0x38,0x03,0x00,0x00,0x80,0x00,0x9f,0xe0,0x38,0x01,0x00
.dw 0x00,0x80,0x01,0x0f,0xf0,0x24,0x01,0x00,0x00,0x80,0x00,0x87,0x10,0x59,0x01,0x00
.dw 0x00,0x40,0x00,0x80,0x20,0x44,0x01,0x00,0x00,0xc0,0x00,0x80,0x20,0x8c,0x00,0x80
.dw 0x01,0x00,0x00,0x40,0x00,0x02,0x00,0x80,0x02,0x00,0x00,0x30,0xc1,0x02,0x00,0x80
.dw 0x04,0x10,0x00,0x1f,0x02,0x01,0x00,0x80,0x04,0x68,0x00,0x00,0x04,0x01,0x80,0x80
.dw 0x08,0x44,0x00,0x00,0x06,0x00,0xc0,0x80,0x08,0x83,0x00,0x00,0x1a,0x00,0x61,0x00
.dw 0x08,0x80,0x80,0x00,0x61,0x00,0x5a,0x00,0x08,0x80,0x60,0x00,0xc0,0x80,0x4c,0x00
.dw 0x08,0x80,0x18,0x03,0x00,0x80,0x40,0x00,0x08,0x80,0x04,0x1c,0x00,0x60,0x20,0x00
.dw 0x08,0x40,0x08,0x30,0x00,0x38,0x20,0x00,0x04,0x40,0x08,0x20,0x00,0x0c,0x20,0x00
.dw 0x04,0x30,0x30,0x20,0x00,0x04,0x20,0x00,0x04,0x0f,0xc0,0x40,0x00,0x03,0x20,0x00
.dw 0x02,0x00,0x00,0xc0,0x00,0x00,0xe0,0x00,0x01,0x00,0x01,0x00,0x00,0x00,0x00,0x00
.dw 0x00,0x80,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x60,0x04,0x00,0x00,0x00,0x00,0x00
.dw 0x00,0x1f,0xf8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
