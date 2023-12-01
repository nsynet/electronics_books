// FT245Test1.h : main header file for the FT245TEST1 application
//

#if !defined(AFX_FT245TEST1_H__174ECA17_05E3_4F5C_ADC2_BE0ECA3C9212__INCLUDED_)
#define AFX_FT245TEST1_H__174ECA17_05E3_4F5C_ADC2_BE0ECA3C9212__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols
#include "Ftd2xx.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CFT245Test1App:
// See FT245Test1.cpp for the implementation of this class
//

class CFT245Test1App : public CWinApp
{
public:

	CFT245Test1App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFT245Test1App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CFT245Test1App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FT245TEST1_H__174ECA17_05E3_4F5C_ADC2_BE0ECA3C9212__INCLUDED_)
