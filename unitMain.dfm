object frmMain: TfrmMain
  Left = 17
  Top = 53
  Caption = 'Clock'
  ClientHeight = 410
  ClientWidth = 1013
  Color = clMaroon
  TransparentColorValue = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  PopupMenu = popupMainForm
  Position = poDesigned
  Visible = True
  OnCreate = FormCreate
  TextHeight = 13
  object lblHours10: TLabel
    Left = 6
    Top = 0
    Width = 139
    Height = 270
    AutoSize = False
    Caption = '0'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -240
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblMinutes10: TLabel
    Left = 349
    Top = 0
    Width = 139
    Height = 270
    AutoSize = False
    Caption = '0'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -240
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblSeconds10: TLabel
    Left = 698
    Top = 0
    Width = 138
    Height = 270
    AutoSize = False
    Caption = '0'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -240
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblDate: TLabel
    Left = 120
    Top = 264
    Width = 738
    Height = 67
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblDate'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblHours01: TLabel
    Left = 130
    Top = 0
    Width = 213
    Height = 270
    AutoSize = False
    Caption = '0:'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -240
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblMinutes01: TLabel
    Left = 483
    Top = 0
    Width = 213
    Height = 270
    AutoSize = False
    Caption = '0:'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -240
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblSeconds01: TLabel
    Left = 842
    Top = 0
    Width = 163
    Height = 270
    AutoSize = False
    Caption = '0'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -240
    Font.Name = 'Fixedsys'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object lblAlarm1: TLabel
    Left = 8
    Top = 276
    Width = 106
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = 'Alarm'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object lblAlarm2: TLabel
    Left = 893
    Top = 276
    Width = 115
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = 'Alarm'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object lblAlarmCountDown: TLabel
    Left = 448
    Top = 338
    Width = 84
    Height = 64
    Alignment = taCenter
    Caption = 'test'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -53
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object dtpickerOffSet: TDateTimePicker
    Left = 8
    Top = 322
    Width = 137
    Height = 21
    Date = 38501.000000000000000000
    Time = 0.010416666656965390
    Kind = dtkTime
    TabOrder = 0
    Visible = False
  end
  object btnGo: TButton
    Left = 8
    Top = 349
    Width = 75
    Height = 25
    Caption = '&Go'
    TabOrder = 1
    Visible = False
    OnClick = btnGoClick
  end
  object btnCancel: TButton
    Left = 80
    Top = 349
    Width = 65
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    Visible = False
    OnClick = btnCancelClick
  end
  object pnlAlarm: TPanel
    Left = 752
    Top = 322
    Width = 253
    Height = 84
    BevelOuter = bvNone
    Color = clMaroon
    TabOrder = 3
    Visible = False
    object dtpickerAlarm: TDateTimePicker
      Left = 0
      Top = 1
      Width = 233
      Height = 21
      Date = 45187.000000000000000000
      Time = 0.312500000000000000
      Kind = dtkTime
      TabOrder = 0
    end
    object btnAlarmOff: TButton
      Left = 181
      Top = 27
      Width = 52
      Height = 25
      Action = actAlarmOff
      Caption = 'Alarm off'
      TabOrder = 1
    end
    object btnAlarmOn: TButton
      Left = -2
      Top = 28
      Width = 52
      Height = 25
      Action = actAlarmOn
      TabOrder = 2
    end
    object btnSnooze: TButton
      Left = 56
      Top = 28
      Width = 119
      Height = 25
      Action = actSnooze
      TabOrder = 3
    end
    object btnEndOfDay: TButton
      Left = 181
      Top = 58
      Width = 52
      Height = 25
      Caption = 'End Day'
      TabOrder = 4
      OnClick = btnEndOfDayClick
    end
    object btnStartDay: TButton
      Left = -2
      Top = 59
      Width = 52
      Height = 25
      Caption = 'Start Day'
      TabOrder = 5
      OnClick = btnStartDayClick
    end
    object btnAddedTime: TButton
      Left = 56
      Top = 58
      Width = 119
      Height = 25
      Caption = 'Added Time'
      TabOrder = 6
      OnClick = btnAddedTimeClick
    end
  end
  object pnlAlarmSetup: TPanel
    Left = 120
    Top = 81
    Width = 738
    Height = 189
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    Visible = False
    object lblAlarmSetup: TLabel
      Left = 24
      Top = 8
      Width = 143
      Height = 29
      Caption = 'Alarm Setup'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 17
      Top = 57
      Width = 91
      Height = 25
      Caption = 'Start Day'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 208
      Top = 57
      Width = 83
      Height = 25
      Caption = 'End Day'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 552
      Top = 57
      Width = 129
      Height = 25
      Caption = 'Snooze Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 379
      Top = 8
      Width = 133
      Height = 74
      AutoSize = False
      Caption = 'Current Time Plus This Amount'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 374
      Top = 134
      Width = 175
      Height = 25
      Caption = 'Snoozes Allowed:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object tpStartDay: TTimePicker
      Left = 17
      Top = 88
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 0
      Time = 45187.373724629630000000
      TimeFormat = 'hh:nn'
    end
    object tpEndDay: TTimePicker
      Left = 198
      Top = 88
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 1
      Time = 45187.374125590280000000
      TimeFormat = 'hh:nn'
    end
    object tpSnoozeTime: TTimePicker
      Left = 560
      Top = 88
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 2
      Time = 45187.374796076390000000
      TimeFormat = 'hh:nn'
    end
    object btnAlarmSetupSave: TButton
      Left = 17
      Top = 134
      Width = 75
      Height = 25
      Action = actAlarmSetupSave
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object btnAlarmSetupCancel: TButton
      Left = 198
      Top = 134
      Width = 75
      Height = 25
      Action = actAlarmSetupCancel
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object tpAddedTime: TTimePicker
      Left = 374
      Top = 88
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 5
      Time = 45187.374125590280000000
      TimeFormat = 'hh:nn'
    end
    object nbSnoozesAllowed: TNumberBox
      Left = 555
      Top = 134
      Width = 38
      Height = 25
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MinValue = 1.000000000000000000
      MaxValue = 99.000000000000000000
      MaxLength = 2
      ParentFont = False
      TabOrder = 6
      Value = 7.000000000000000000
    end
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 64
    Top = 8
  end
  object popupMainForm: TPopupMenu
    Left = 464
    Top = 8
    object Mode1: TMenuItem
      Caption = '&Mode'
      object Clock1: TMenuItem
        Action = ActClock
        AutoCheck = True
        RadioItem = True
      end
      object CountDown1: TMenuItem
        Action = actCountDown
        AutoCheck = True
        RadioItem = True
      end
      object CountUp1: TMenuItem
        Action = actCountUp
        AutoCheck = True
        RadioItem = True
      end
    end
    object Alarm1: TMenuItem
      Action = actAlarmPanelVisible
      Caption = 'Alarm'
    end
    object miAlarmSetup: TMenuItem
      Action = actAlarmSetup
    end
    object popupFormColor: TMenuItem
      Action = actFormColor
    end
    object popupClockColor: TMenuItem
      Action = actClockColor
    end
    object popupClockFont: TMenuItem
      Action = actClockFont
    end
    object popupDateColor: TMenuItem
      Action = actDateColor
    end
    object popupDateFont: TMenuItem
      Action = actDateFont
    end
    object PopupAlarmFont: TMenuItem
      Action = actAlarmFont
    end
    object StayonTop1: TMenuItem
      Action = actStayOnTop
      AutoCheck = True
    end
  end
  object actListColor: TActionList
    Left = 232
    Top = 8
    object actClockColor: TAction
      Caption = '&Clock Color'
      OnExecute = actClockColorExecute
    end
    object actDateColor: TAction
      Caption = '&DateColor'
      OnExecute = actDateColorExecute
    end
    object actFormColor: TAction
      Caption = '&Form Color'
      OnExecute = actFormColorExecute
    end
    object actAlarmFont: TAction
      Caption = 'Alarm Font'
      OnExecute = actAlarmFontExecute
    end
    object actClockFont: TAction
      Caption = 'Clock Font'
      OnExecute = actClockFontExecute
    end
    object actTimeToAlarm: TAction
      Caption = 'Time to Alarm'
      OnExecute = actCountUpExecute
    end
    object actDateFont: TAction
      Caption = 'Date Font'
      OnExecute = actDateFontExecute
    end
    object actStayOnTop: TAction
      AutoCheck = True
      Caption = 'Stay on &Top'
      OnExecute = actStayOnTopExecute
    end
    object ActClock: TAction
      AutoCheck = True
      Caption = 'Clock'
      Checked = True
      OnExecute = actClockExecute
    end
    object actCountDown: TAction
      AutoCheck = True
      Caption = 'Count Down'
      OnExecute = actCountDownExecute
    end
    object actCountUp: TAction
      AutoCheck = True
      Caption = 'Count Up'
      OnExecute = actCountUpExecute
    end
    object actAlarmOff: TAction
      Caption = '&Alarm Off'
      OnExecute = actAlarmOffExecute
    end
    object actAlarmOn: TAction
      Caption = '&Set Alarm'
      OnExecute = actAlarmOnExecute
    end
    object actAlarmPanelVisible: TAction
      OnExecute = actAlarmPanelVisibleExecute
    end
    object actSnooze: TAction
      Caption = 'Snooze'
      OnExecute = actAlarmSnoozeExecute
    end
  end
  object dialColor: TColorDialog
    CustomColors.Strings = (
      'ColorA=FFFFFFFF'
      'ColorB=FFFFFFFF'
      'ColorC=FFFFFFFF'
      'ColorD=FFFFFFFF'
      'ColorE=FFFFFFFF'
      'ColorF=FFFFFFFF'
      'ColorG=FFFFFFFF'
      'ColorH=FFFFFFFF'
      'ColorI=FFFFFFFF'
      'ColorJ=FFFFFFFF'
      'ColorK=FFFFFFFF'
      'ColorL=FFFFFFFF'
      'ColorM=FFFFFFFF'
      'ColorN=FFFFFFFF'
      'ColorO=FFFFFFFF'
      'ColorP=FFFFFFFF')
    Left = 288
    Top = 8
  end
  object dialFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 344
    Top = 8
  end
  object frmMainPos: TMPCFormPosSave
    OnReadIni = frmMainPosReadIni
    NameKey = 'software\mpc\clock'
    UseIniFile = False
    Left = 888
    Top = 65528
  end
  object timerScreenSaver: TTimer
    Interval = 30000
    OnTimer = timerScreenSaverTimer
    Left = 112
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 352
    Top = 360
    object miAbout: TMenuItem
      Action = actAbout
    end
  end
  object ActionList1: TActionList
    Left = 552
    Top = 352
    object actAbout: TAction
      Caption = '&About'
      OnExecute = actAboutExecute
    end
    object actAlarmSetup: TAction
      Caption = 'Alarm Setup'
      OnExecute = actAlarmSetupExecute
    end
    object actAlarmSetupSave: TAction
      Caption = 'Save'
      OnExecute = actAlarmSetupSaveExecute
    end
    object actAlarmSetupCancel: TAction
      Caption = 'Cancel'
      OnExecute = actAlarmSetupCancelExecute
    end
  end
end
