// likeDlg.h : header file
//
//{{AFX_INCLUDES()
#include "mscomm.h"
//}}AFX_INCLUDES

#if !defined(AFX_RS232DLG_H__152182F5_68D4_472E_B115_5B03176C9474__INCLUDED_)
#define AFX_RS232DLG_ mH__152182F5_68D4_472E_B115_5B03176C9474__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CRs232Dlg dialog

class CRs232Dlg : public CDialog
{
// Construction
public:
	CRs232Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CRs232Dlg)
	enum { IDD = IDD_RS232_DIALOG };
	CString	m_d1;
	CString	m_d2;
	CMSComm	m_ctrlComm;
	UINT	m_add;
	BOOL	m_select;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRs232Dlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CRs232Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void Onsent();
	afx_msg void OnOnCommMscomm1();
	afx_msg void OnCLR1();
	afx_msg void OnCLR2();
	virtual void OnOK();
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RS232DLG_H__152182F5_68D4_472E_B115_5B03176C9474__INCLUDED_)
