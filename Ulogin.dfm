object Flogin: TFlogin
  Left = 0
  Top = 0
  Caption = 'Flogin'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 52
    Height = 13
    Caption = 'ussername'
  end
  object Label2: TLabel
    Left = 40
    Top = 80
    Width = 46
    Height = 13
    Caption = 'password'
  end
  object Label3: TLabel
    Left = 8
    Top = 160
    Width = 89
    Height = 13
    Caption = 'ussername : Renal'
  end
  object Label4: TLabel
    Left = 8
    Top = 180
    Width = 98
    Height = 13
    Caption = 'Password : renal123'
  end
  object Edit1: TEdit
    Left = 120
    Top = 37
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 120
    Top = 77
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 80
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 120
    Width = 75
    Height = 25
    Caption = 'exit'
    TabOrder = 3
    OnClick = Button2Click
  end
end
