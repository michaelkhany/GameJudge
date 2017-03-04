object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 194
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabbedNotebook1: TTabbedNotebook
    Left = 8
    Top = 8
    Width = 319
    Height = 145
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Preferences'
      ExplicitWidth = 292
      ExplicitHeight = 222
      object Bevel1: TBevel
        Left = 8
        Top = 51
        Width = 289
        Height = 11
        Shape = bsTopLine
        Style = bsRaised
      end
      object Label1: TLabel
        Left = 16
        Top = 19
        Width = 26
        Height = 13
        Caption = 'Skin :'
      end
      object Label2: TLabel
        Left = 13
        Top = 71
        Width = 29
        Height = 13
        Caption = 'Font :'
      end
      object ComboBox1: TComboBox
        Left = 48
        Top = 16
        Width = 233
        Height = 21
        ItemIndex = 0
        TabOrder = 0
        Text = 'Light mist theme'
        Items.Strings = (
          'Light mist theme'
          'Dark night theme')
      end
      object SpinEdit1: TSpinEdit
        Left = 224
        Top = 68
        Width = 42
        Height = 25
        MaxValue = 73
        MinValue = 5
        TabOrder = 1
        Value = 8
      end
      object ButtonColor1: TButtonColor
        Left = 272
        Top = 68
        Width = 25
        TabOrder = 2
      end
      object ButtonedEdit1: TButtonedEdit
        Left = 48
        Top = 68
        Width = 170
        Height = 25
        Cursor = crHandPoint
        ReadOnly = True
        RightButton.Visible = True
        TabOrder = 3
        Text = 'Tahoma'
        OnClick = ButtonedEdit1Click
      end
      object CheckBox1: TCheckBox
        Left = 48
        Top = 96
        Width = 170
        Height = 17
        Caption = 'Apply to all'
        TabOrder = 4
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'About'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo1: TMemo
        Left = 16
        Top = 16
        Width = 281
        Height = 97
        Alignment = taCenter
        Lines.Strings = (
          'GameJudge'#8482' 2017 '#169'  is under MIT copy-right '
          'license.'
          ''
          'Developer En. Michael Bidollahkhany'
          'Do not hesitate to send us your suggestion: '
          'MichaelKhany@email.com')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Button1: TButton
    Left = 251
    Top = 159
    Width = 75
    Height = 25
    Caption = 'Thanks'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 161
    Width = 237
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
    OnClick = Button2Click
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [fdForceFontExist, fdNoStyleSel]
    Left = 288
    Top = 8
  end
end
