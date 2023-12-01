// FT245Test1Dlg.h : header file
//

#if !defined(AFX_FT245TEST1DLG_H__89065FA4_9BCF_482E_8FE3_4284FBFD4476__INCLUDED_)
#define AFX_FT245TEST1DLG_H__89065FA4_9BCF_482E_8FE3_4284FBFD4476__INCLUDED_

#include "FTD2XX.H"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CFT245Test1Dlg dialog

class CFT245Test1Dlg : public CDialog
{
// Construction
public:
	FT_HANDLE Usb_hWnd;
	CFT245Test1Dlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CFT245Test1Dlg)
	enum { IDD = IDD_FT245TEST1_DIALOG };
	BYTE	m_Value;
	CString	m_Rdata;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFT245Test1Dlg)
	public:
	virtual BOOL DestroyWindow();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CFT245Test1Dlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButton1();
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnButton2();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FT245TEST1DLG_H__89065FA4_9BCF_482E_8FE3_4284FBFD4476__INCLUDED_)
