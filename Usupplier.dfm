object Fsupplier: TFsupplier
  Left = 0
  Top = 0
  Caption = 'Fsupplier'
  ClientHeight = 371
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 40
    Top = 27
    Width = 64
    Height = 13
    Caption = 'Kode supplier'
  end
  object Label3: TLabel
    Left = 40
    Top = 51
    Width = 80
    Height = 13
    Caption = 'Nama pelanggan'
  end
  object Label4: TLabel
    Left = 40
    Top = 91
    Width = 89
    Height = 13
    Caption = 'Alamat Pelanggan '
  end
  object Label5: TLabel
    Left = 40
    Top = 232
    Width = 46
    Height = 13
    Caption = 'No telpon'
  end
  object Edkodesupplier: TEdit
    Left = 136
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Ednamasupplier: TEdit
    Left = 136
    Top = 51
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object EdMemoalamat: TMemo
    Left = 135
    Top = 88
    Width = 266
    Height = 135
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Ednotelpon: TEdit
    Left = 136
    Top = 229
    Width = 265
    Height = 21
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 330
    Width = 545
    Height = 41
    Align = alBottom
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 466
      Top = 1
      Height = 39
      Align = alRight
      ExplicitLeft = 447
    end
    object Btcancel: TButton
      Left = 469
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = BtcancelClick
    end
    object Btsimpan: TButton
      Left = 391
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = BtsimpanClick
    end
  end
end
