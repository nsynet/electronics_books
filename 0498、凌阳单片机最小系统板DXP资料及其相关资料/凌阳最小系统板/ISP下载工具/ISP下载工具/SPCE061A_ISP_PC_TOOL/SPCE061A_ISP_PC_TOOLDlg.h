// SPCE061A_ISP_PC_TOOLDlg.h : header file
//
#include "ISP\ISP.h"
#if !defined(AFX_SPCE061A_ISP_PC_TOOLDLG_H__2DCFE224_9F54_4F18_A6BB_34D9E61900D4__INCLUDED_)
#define AFX_SPCE061A_ISP_PC_TOOLDLG_H__2DCFE224_9F54_4F18_A6BB_34D9E61900D4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CSPCE061A_ISP_PC_TOOLDlg dialog

class CSPCE061A_ISP_PC_TOOLDlg : public CDialog
{
// Construction
public:
	CSPCE061A_ISP_PC_TOOLDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CSPCE061A_ISP_PC_TOOLDlg)
	enum { IDD = IDD_SPCE061A_ISP_PC_TOOL_DIALOG };
	CComboBox	m_CommSel;
	CString	m_FileName;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSPCE061A_ISP_PC_TOOLDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	CStatusBarCtrl m_StatusBar;
	ISP m_ISP;

	BOOL CheckFile(CString FileName);
	void DoDownload(CString FileName);
	// Generated message map functions
	//{{AFX_MSG(CSPCE061A_ISP_PC_TOOLDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnOpenFile();
	afx_msg void OnDownload();
	afx_msg void OnDisConnect();
	afx_msg void OnDump();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SPCE061A_ISP_PC_TOOLDLG_H__2DCFE224_9F54_4F18_A6BB_34D9E61900D4__INCLUDED_)
