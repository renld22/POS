object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Flistbarang'
  ClientHeight = 303
  ClientWidth = 506
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 57
    Align = alTop
    Alignment = taRightJustify
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Height = 55
      ExplicitLeft = 72
      ExplicitTop = 32
      ExplicitHeight = 100
    end
    object Splitter2: TSplitter
      Left = 79
      Top = 1
      Height = 55
      ExplicitLeft = 152
      ExplicitTop = 32
      ExplicitHeight = 100
    end
    object Splitter3: TSplitter
      Left = 232
      Top = 1
      Height = 55
      ExplicitTop = 32
      ExplicitHeight = 100
    end
    object Bttambah: TButton
      Left = 157
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'tambah'
      TabOrder = 0
      OnClick = BttambahClick
    end
    object Btedit: TButton
      Left = 4
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'edit'
      TabOrder = 1
      OnClick = BteditClick
    end
    object Bthapus: TButton
      Left = 82
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'hapus'
      TabOrder = 2
      OnClick = BthapusClick
    end
    object Btrefresh: TButton
      Left = 235
      Top = 1
      Width = 75
      Height = 55
      Align = alLeft
      Caption = 'refresh'
      TabOrder = 3
      OnClick = BtrefreshClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 506
    Height = 26
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 17
      Height = 24
      Align = alLeft
      Caption = 'cari'
      ExplicitHeight = 13
    end
    object Splitter4: TSplitter
      Left = 18
      Top = 1
      Height = 24
      ExplicitLeft = 16
      ExplicitTop = 16
      ExplicitHeight = 100
    end
    object Editcari: TEdit
      Left = 21
      Top = 1
      Width = 121
      Height = 24
      Align = alLeft
      TabOrder = 0
      OnChange = EditcariChange
      ExplicitHeight = 21
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 83
    Width = 506
    Height = 220
    Align = alClient
    DataSource = DSbarang
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object DSbarang: TDataSource
    DataSet = Qbarang
    Left = 184
    Top = 160
  end
  object Qbarang: TMyQuery
    Connection = dm.MyConnection1
    SQL.Strings = (
      'select * from tbarang'
      '&where'
      '&orderby')
    Left = 120
    Top = 152
    MacroData = <
      item
        Name = 'where'
      end
      item
        Name = 'orderby'
      end>
    object Qbarangkode_barang: TStringField
      FieldName = 'kode_barang'
      Origin = 'tbarang.kode_barang'
    end
    object Qbarangnama_barang: TStringField
      FieldName = 'nama_barang'
      Origin = 'tbarang.nama_barang'
      Size = 100
    end
    object Qbarangdeskripsi: TStringField
      FieldName = 'deskripsi'
      Origin = 'tbarang.deskripsi'
      Size = 250
    end
    object Qbarangsatuan: TStringField
      FieldName = 'satuan'
      Origin = 'tbarang.satuan'
      Size = 10
    end
    object Qbarangstokawal: TFloatField
      FieldName = 'stokawal'
      Origin = 'tbarang.stokawal'
    end
    object Qbarangstokmin: TFloatField
      FieldName = 'stokmin'
      Origin = 'tbarang.stokmin'
    end
    object Qbaranghargajual: TFloatField
      FieldName = 'hargajual'
      Origin = 'tbarang.hargajual'
    end
    object Qbarangflg_aktif: TSmallintField
      FieldName = 'flg_aktif'
      Origin = 'tbarang.flg_aktif'
    end
    object Qbarangid: TIntegerField
      FieldName = 'id'
    end
  end
end
