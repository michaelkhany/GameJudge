object Form1: TForm1
  Left = 200
  Top = 123
  Width = 921
  Height = 481
  BiDiMode = bdLeftToRight
  Caption = 'GameJudge [version 1.0]'
  Color = clBtnFace
  Font.Charset = ARABIC_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    905
    423)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 256
    Top = 8
    Width = 9
    Height = 406
    Anchors = [akLeft, akTop, akBottom]
    Shape = bsLeftLine
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 254
    Height = 404
    Align = alLeft
    BorderStyle = bsNone
    TabOrder = 0
    object CheckListBox1: TCheckListBox
      Left = 0
      Top = 0
      Width = 254
      Height = 323
      Align = alClient
      BiDiMode = bdRightToLeft
      Ctl3D = False
      ItemHeight = 13
      ParentBiDiMode = False
      ParentCtl3D = False
      TabOrder = 0
      Visible = False
    end
    object RichEdit1: TRichEdit
      Left = 0
      Top = 0
      Width = 254
      Height = 323
      Align = alClient
      Alignment = taRightJustify
      BevelOuter = bvSpace
      BevelKind = bkSoft
      BiDiMode = bdRightToLeftNoAlign
      BorderStyle = bsNone
      Lines.Strings = (
        '')
      ParentBiDiMode = False
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object RichEdit2: TRichEdit
      Left = 0
      Top = 323
      Width = 254
      Height = 81
      Align = alBottom
      Alignment = taRightJustify
      BevelKind = bkSoft
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      ParentBiDiMode = False
      ScrollBars = ssBoth
      TabOrder = 2
      OnMouseMove = RichEdit2MouseMove
    end
    object RichEdit3: TRichEdit
      Left = 8
      Top = 8
      Width = 73
      Height = 33
      Lines.Strings = (
        'Only4Print')
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
      Visible = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 404
    Width = 905
    Height = 19
    Panels = <>
    OnClick = StatusBar1Click
    OnMouseMove = StatusBar1MouseMove
  end
  object ScrollBox2: TScrollBox
    Left = 264
    Top = 0
    Width = 633
    Height = 402
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkSoft
    BiDiMode = bdRightToLeft
    BorderStyle = bsNone
    ParentBiDiMode = False
    TabOrder = 3
    object StringGrid1: TStringGrid
      Left = 0
      Top = 0
      Width = 629
      Height = 398
      Align = alClient
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      ColCount = 3
      DefaultColWidth = 100
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goRowMoving, goEditing]
      ParentBiDiMode = False
      TabOrder = 0
      OnMouseMove = StringGrid1MouseMove
      ColWidths = (
        50
        284
        291)
    end
  end
  object Panel1: TPanel
    Left = 24
    Top = 342
    Width = 857
    Height = 67
    Anchors = [akBottom]
    BevelOuter = bvNone
    Color = clInactiveCaptionText
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 372
      Top = 7
      Width = 89
      Height = 50
      BiDiMode = bdRightToLeft
      Caption = #1605#1588#1582#1589' '#1705#1606'!'
      Flat = True
      ParentBiDiMode = False
      OnClick = SpeedButton1Click
    end
    object Bevel2: TBevel
      Left = 8
      Top = 8
      Width = 361
      Height = 49
    end
    object Bevel3: TBevel
      Left = 464
      Top = 8
      Width = 385
      Height = 49
    end
    object Label1: TLabel
      Left = 296
      Top = 16
      Width = 66
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = #1578#1602#1587#1610#1605' '#1575#1593#1590#1575#1569':'
      ParentBiDiMode = False
      Transparent = False
    end
    object SpeedButton2: TSpeedButton
      Left = 51
      Top = 16
      Width = 52
      Height = 21
      Caption = #1575#1606#1578#1582#1575#1576' '#1705#1606
      Flat = True
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 16
      Top = 16
      Width = 33
      Height = 22
      Caption = #1583#1608#1576#1575#1585#1607
      Flat = True
      OnClick = SpeedButton3Click
    end
    object Edit1: TEdit
      Left = 105
      Top = 16
      Width = 185
      Height = 21
      BevelKind = bkSoft
      BorderStyle = bsNone
      MaxLength = 5
      TabOrder = 0
      Text = #1578#1593#1583#1575#1583' '#1575#1593#1590#1575#1610' '#1605#1608#1585#1583' '#1606#1610#1575#1586
      OnChange = Edit1Change
      OnClick = Edit1Click
    end
    object BitBtn1: TBitBtn
      Left = 472
      Top = 16
      Width = 75
      Height = 33
      Caption = #1670#1575#1662
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object ProgressBar1: TProgressBar
      Left = 688
      Top = 16
      Width = 150
      Height = 33
      TabOrder = 2
    end
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    Left = 864
    Top = 344
    object N1: TMenuItem
      Caption = #1576#1575#1586#1610
      object N2: TMenuItem
        Caption = #1711#1585#1608#1607' '#1576#1606#1583#1610' '#1580#1583#1610#1583
        object N3: TMenuItem
          Caption = #1578#1588#1705#1610#1604' '#1601#1607#1585#1587#1578' '#1580#1583#1610#1583
          OnClick = N3Click
        end
        object N4: TMenuItem
          Caption = #1576#1575#1586#1705#1585#1583#1606' '#1662#1585#1608#1688#1607
          OnClick = N4Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Caption = #1584#1582#1610#1585#1607' '#1575#1591#1604#1575#1593#1575#1578
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N8: TMenuItem
        Caption = #1670#1575#1662
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N10: TMenuItem
        Caption = #1582#1585#1608#1580
        OnClick = N10Click
      end
    end
    object N11: TMenuItem
      Caption = #1601#1607#1585#1587#1578' '#1607#1575
      object N14: TMenuItem
        Caption = #1576#1575#1586#1582#1608#1575#1606#1610' '#1575#1591#1604#1575#1593#1575#1578' '#1601#1607#1585#1587#1578
        OnClick = N14Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Caption = #1670#1575#1662' '#1601#1607#1585#1587#1578' '#1578#1610#1605' '#1607#1575
        OnClick = N12Click
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object N24: TMenuItem
        Caption = #1576#1585#1711#1588#1578' '#1576#1607' '#1570#1582#1585#1610#1606' '#1578#1594#1610#1610#1585
        OnClick = N24Click
      end
    end
    object N19: TMenuItem
      Caption = #1578#1606#1592#1610#1605
      object N22: TMenuItem
        Caption = #1586#1576#1575#1606
        object N23: TMenuItem
          AutoCheck = True
          Caption = #1601#1575#1585#1587#1610
          Checked = True
          Enabled = False
        end
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N20: TMenuItem
        Caption = #1578#1606#1592#1610#1605#1575#1578
        Enabled = False
      end
    end
    object N17: TMenuItem
      Caption = #1705#1605#1705
      object N18: TMenuItem
        Caption = #1583#1585#1576#1575#1585#1607' '#1605#1575'...'
        OnClick = N18Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 832
    Top = 344
  end
  object PrintDialog1: TPrintDialog
    Left = 800
    Top = 344
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 768
    Top = 344
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Text File(*.txt)|*.txt'
    Left = 735
    Top = 343
  end
end
