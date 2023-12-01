#include "lab_parameter.h"
extern mode2;
extern dance1;
extern w1;
main()
{
	Init_sys();	
	FG_InitGraphic();
	FG_SetLineStyle(3);
	FG_Ellipse(60,30,15,15);
	FG_PutStr("I LOVE YOU!",3,100,60);
	FG_PutStr("SUNPLUS",3,90,20);
	FG_ClearScreen(1);
	FG_PutPixel(30,30);
	FG_ClearScreen(0);
	FG_PutPixel(30,30);
	FG_ClearScreen(1);
	FG_PutPixel(30,30,1);
	FG_ClearScreen(0);
	FG_PutPixel(30,30,1);
	FG_ClearScreen(1);
	FG_PutPixel(30,30,2);
	FG_ClearScreen(0);
	FG_PutPixel(30,30,2);

	FG_SetLineStyle(0);
	FG_PutPixel(30,29);
	FG_SetBMPMode(DG_BMP_COVER);
	FG_ClearScreen(1);
	FG_PutBitmap(&mode2,127,64);
	FG_ClearScreen(0);
	FG_PutBitmap(&mode2,127,64);
	FG_SetBMPMode(DG_BMP_CLEAR);
	FG_ClearScreen(1);
	FG_PutBitmap(&mode2,127,64);
	FG_ClearScreen(0);
	FG_PutBitmap(&mode2,127,64);
	FG_SetBMPMode(DG_BMP_XOR);
	FG_ClearScreen(1);
	FG_PutBitmap(&mode2,127,64);
	FG_ClearScreen(0);
	FG_PutBitmap(&mode2,127,64);
//	FG_ClearScreen(1);
	FG_GetCharHeight("a",tiny);
	FG_GetCharHeight("a",small);
	FG_GetCharHeight("a",smallb);
	FG_GetCharHeight("a",large);
	FG_GetCharHeight("a",narrow);
	
	FG_SetLineStyle(DG_LINE_HOLLOW_ERASE);
	FG_Rectangle(10,10,30,40);
	FG_SetLineStyle(0);
	FG_PutPixel(30,30);
	FG_SetLineStyle(0);
	FG_PutPixel(30,29);
	FG_SetLineStyle(DG_RECT_DOTTED);
	FG_Rectangle(10,10,30,40);
	
	
	
}