// SPCE061A_ISP_PC_TOOL.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "SPCE061A_ISP_PC_TOOL.h"
#include "SPCE061A_ISP_PC_TOOLDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSPCE061A_ISP_PC_TOOLApp

BEGIN_MESSAGE_MAP(CSPCE061A_ISP_PC_TOOLApp, CWinApp)
	//{{AFX_MSG_MAP(CSPCE061A_ISP_PC_TOOLApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSPCE061A_ISP_PC_TOOLApp construction

CSPCE061A_ISP_PC_TOOLApp::CSPCE061A_ISP_PC_TOOLApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CSPCE061A_ISP_PC_TOOLApp object

CSPCE061A_ISP_PC_TOOLApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CSPCE061A_ISP_PC_TOOLApp initialization

BOOL CSPCE061A_ISP_PC_TOOLApp::InitInstance()
{
	// Standard initialization
	// If you are not using these features and wish to reduce the size
	//  of your final executable, you should remove from the following
	//  the specific initialization routines you do not need.

	CSPCE061A_ISP_PC_TOOLDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with OK
	}
	else if (nResponse == IDCANCEL)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with Cancel
	}

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}
