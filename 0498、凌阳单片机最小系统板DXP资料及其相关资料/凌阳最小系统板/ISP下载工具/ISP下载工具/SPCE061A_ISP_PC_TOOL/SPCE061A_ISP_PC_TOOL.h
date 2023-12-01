// SPCE061A_ISP_PC_TOOL.h : main header file for the SPCE061A_ISP_PC_TOOL application
//

#if !defined(AFX_SPCE061A_ISP_PC_TOOL_H__CCD282E6_B123_4C2A_8361_F46C1C446811__INCLUDED_)
#define AFX_SPCE061A_ISP_PC_TOOL_H__CCD282E6_B123_4C2A_8361_F46C1C446811__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CSPCE061A_ISP_PC_TOOLApp:
// See SPCE061A_ISP_PC_TOOL.cpp for the implementation of this class
//

class CSPCE061A_ISP_PC_TOOLApp : public CWinApp
{
public:
	CSPCE061A_ISP_PC_TOOLApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSPCE061A_ISP_PC_TOOLApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CSPCE061A_ISP_PC_TOOLApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SPCE061A_ISP_PC_TOOL_H__CCD282E6_B123_4C2A_8361_F46C1C446811__INCLUDED_)
