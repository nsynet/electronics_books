// rs232.h : main header file for the RS232 application
//

#if !defined(AFX_RS232_H__C33CB330_1AE1_45FD_AEA8_DCE20A84A3D3__INCLUDED_)
#define AFX_RS232_H__C33CB330_1AE1_45FD_AEA8_DCE20A84A3D3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CRs232App:
// See rs232.cpp for the implementation of this class
//

class CRs232App : public CWinApp
{
public:
	CRs232App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRs232App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CRs232App)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RS232_H__C33CB330_1AE1_45FD_AEA8_DCE20A84A3D3__INCLUDED_)
