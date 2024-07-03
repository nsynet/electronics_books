object Form1: TForm1
  Left = 190
  Top = 111
  Width = 690
  Height = 475
  BorderIcons = []
  Caption = #30005#26426#25511#21046#30028#38754
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = -80
    Top = 0
    Width = 761
    Height = 41
    AutoSize = False
    Caption = '                      '#30005#26426#25511#21046#24179#21488
    Color = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 273
    Height = 401
    TabOrder = 0
    object showsh1: TShape
      Left = 128
      Top = 88
      Width = 41
      Height = 41
      Shape = stCircle
    end
    object showsh2: TShape
      Left = 128
      Top = 176
      Width = 41
      Height = 41
      Shape = stCircle
    end
    object showsh3: TShape
      Left = 128
      Top = 256
      Width = 41
      Height = 41
      Shape = stCircle
    end
    object showsh4: TShape
      Left = 128
      Top = 336
      Width = 41
      Height = 41
      Shape = stCircle
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 145
      Height = 25
      AutoSize = False
      Caption = #24037#20316#29366#24577#26174#31034#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object showlab1: TLabel
      Left = 32
      Top = 56
      Width = 161
      Height = 25
      AutoSize = False
      Caption = #27491#20256
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object showlab2: TLabel
      Left = 32
      Top = 136
      Width = 161
      Height = 25
      AutoSize = False
      Caption = #21453#36716
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object showlab3: TLabel
      Left = 32
      Top = 224
      Width = 161
      Height = 25
      AutoSize = False
      Caption = #21152#36895
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object showlab4: TLabel
      Left = 32
      Top = 305
      Width = 161
      Height = 24
      AutoSize = False
      Caption = #20943#36895
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 17
      Height = 33
      AutoSize = False
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 128
      Width = 17
      Height = 25
      AutoSize = False
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 216
      Width = 17
      Height = 25
      AutoSize = False
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 296
      Width = 17
      Height = 25
      AutoSize = False
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object MSComm1: TMSComm
    Left = 576
    Top = 0
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED03000001568A64000006000000010000040000
      00020000802500000000080000000000000000003F00000001000000}
  end
  object Panel2: TPanel
    Left = 280
    Top = 40
    Width = 209
    Height = 401
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 153
      Height = 49
      AutoSize = False
      Caption = #25353#38190#25805#20316#27169#22359#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object showbut1: TBitBtn
      Left = 8
      Top = 80
      Width = 193
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = showbut1Click
    end
    object showbut4: TBitBtn
      Left = 8
      Top = 336
      Width = 193
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = showbut4Click
    end
    object showbut3: TBitBtn
      Left = 8
      Top = 256
      Width = 193
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = showbut3Click
    end
    object showbut2: TBitBtn
      Left = 8
      Top = 176
      Width = 193
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = showbut2Click
    end
  end
  object Panel3: TPanel
    Left = 496
    Top = 40
    Width = 185
    Height = 401
    TabOrder = 3
    object showsh5: TShape
      Left = 64
      Top = 40
      Width = 41
      Height = 33
      Shape = stCircle
    end
    object msclab1: TLabel
      Left = 88
      Top = 16
      Width = 89
      Height = 25
      AutoSize = False
      Caption = #20018#21475#24050#25171#24320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 8
      Width = 81
      Height = 17
      AutoSize = False
      Caption = #36890#35759#25351#31034#65306
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msclab2: TLabel
      Left = 88
      Top = 16
      Width = 89
      Height = 16
      AutoSize = False
      Caption = #20018#21475#24050#20851#38381
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object operbut: TBitBtn
      Left = 8
      Top = 80
      Width = 169
      Height = 33
      Caption = #25171#24320#20018#21475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = operbutClick
    end
    object repabut: TBitBtn
      Left = 8
      Top = 176
      Width = 169
      Height = 33
      Caption = #30005#26426#20572#27490
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = repabutClick
    end
    object outbut: TBitBtn
      Left = 8
      Top = 328
      Width = 169
      Height = 33
      Cancel = True
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = outbutClick
    end
    object Button1: TButton
      Left = 8
      Top = 248
      Width = 169
      Height = 33
      Caption = #20462#25913#21517#31216
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
  end
end
