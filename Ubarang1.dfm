object Fbarang1: TFbarang1
  Left = 0
  Top = 0
  Caption = 'Fbarang1'
  ClientHeight = 473
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 64
    Width = 61
    Height = 13
    Caption = 'Kode barang'
  end
  object Label2: TLabel
    Left = 72
    Top = 112
    Width = 64
    Height = 13
    Caption = 'Nama barang'
  end
  object Label3: TLabel
    Left = 72
    Top = 152
    Width = 42
    Height = 13
    Caption = 'Deskripsi'
  end
  object Label4: TLabel
    Left = 72
    Top = 192
    Width = 34
    Height = 13
    Caption = 'Satuan'
  end
  object Label5: TLabel
    Left = 72
    Top = 248
    Width = 45
    Height = 13
    Caption = 'stok awal'
  end
  object Label6: TLabel
    Left = 72
    Top = 288
    Width = 39
    Height = 13
    Caption = 'stok min'
  end
  object Label7: TLabel
    Left = 72
    Top = 344
    Width = 48
    Height = 13
    Caption = 'harga jual'
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 630
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 473
    object Splitter1: TSplitter
      Left = 473
      Top = 1
      Height = 39
      Align = alRight
      ExplicitLeft = 552
      ExplicitTop = 32
      ExplicitHeight = 100
    end
    object Splitter2: TSplitter
      Left = 551
      Top = 1
      Height = 39
      Align = alRight
      ExplicitLeft = 554
    end
    object Button1: TButton
      Left = 554
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'cancel'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 476
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'simpan'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Edkodebarang: TEdit
    Left = 176
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Ednamabarang: TEdit
    Left = 176
    Top = 109
    Width = 409
    Height = 21
    TabOrder = 2
  end
  object Eddeskripsi: TEdit
    Left = 176
    Top = 149
    Width = 409
    Height = 21
    TabOrder = 3
  end
  object Edstokawal: TEdit
    Left = 176
    Top = 245
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edstokmin: TEdit
    Left = 176
    Top = 285
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edhargajual: TEdit
    Left = 176
    Top = 336
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Cbsatuan: TComboBox
    Left = 176
    Top = 189
    Width = 185
    Height = 21
    TabOrder = 7
    Items.Strings = (
      'pcs'
      'bungkus '
      'kg')
  end
  object chflg_aktif: TCheckBox
    Left = 152
    Top = 384
    Width = 97
    Height = 17
    Caption = 'flg_aktif'
    TabOrder = 8
    OnClick = chflg_aktifClick
  end
end
