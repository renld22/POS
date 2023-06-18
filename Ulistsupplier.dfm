object Flistsupplier: TFlistsupplier
  Left = 0
  Top = 0
  Caption = 'Flistsupplier'
  ClientHeight = 278
  ClientWidth = 527
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
    Width = 527
    Height = 65
    Align = alTop
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 1
      Height = 63
      ExplicitLeft = 8
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object Splitter2: TSplitter
      Left = 85
      Top = 1
      Height = 63
      ExplicitLeft = 96
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object Splitter3: TSplitter
      Left = 163
      Top = 1
      Height = 63
      ExplicitLeft = 192
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object Splitter4: TSplitter
      Left = 241
      Top = 1
      Height = 63
      ExplicitLeft = 248
      ExplicitTop = 24
      ExplicitHeight = 100
    end
    object Btambah: TButton
      Left = 4
      Top = 1
      Width = 81
      Height = 63
      Align = alLeft
      Caption = 'Tambah '
      TabOrder = 0
      OnClick = BtambahClick
    end
    object Btedit: TButton
      Left = 88
      Top = 1
      Width = 75
      Height = 63
      Align = alLeft
      Caption = 'Edit'
      TabOrder = 1
      OnClick = BteditClick
    end
    object Bthapus: TButton
      Left = 166
      Top = 1
      Width = 75
      Height = 63
      Align = alLeft
      Caption = 'Hapus'
      TabOrder = 2
      OnClick = BthapusClick
    end
    object Btrefresh: TButton
      Left = 244
      Top = 1
      Width = 75
      Height = 63
      Align = alLeft
      Caption = 'Refresh'
      TabOrder = 3
      OnClick = BtrefreshClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 527
    Height = 32
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 19
      Height = 30
      Align = alLeft
      Caption = 'Cari'
      ExplicitHeight = 13
    end
    object Splitter5: TSplitter
      Left = 20
      Top = 1
      Height = 30
      ExplicitLeft = 32
      ExplicitTop = 8
      ExplicitHeight = 100
    end
    object Edcari: TEdit
      Left = 23
      Top = 1
      Width = 121
      Height = 30
      Align = alLeft
      TabOrder = 0
      OnChange = EdcariChange
      ExplicitHeight = 21
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 97
    Width = 527
    Height = 181
    Align = alClient
    DataSource = DSsupplier
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'kode_supplier'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_supplier'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alamat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_telp'
        Visible = True
      end>
  end
  object DSsupplier: TDataSource
    DataSet = Qsupplier
    Left = 280
    Top = 184
  end
  object Qsupplier: TMyQuery
    Connection = dm.MyConnection1
    SQL.Strings = (
      'SELECT * FROM supplier'
      '&WHERE'
      '&ORDERBY')
    Left = 88
    Top = 168
    MacroData = <
      item
        Name = 'WHERE'
      end
      item
        Name = 'ORDERBY'
      end>
    object Qsupplierkode_supplier: TStringField
      FieldName = 'kode_supplier'
    end
    object Qsuppliernama_supplier: TStringField
      FieldName = 'nama_supplier'
      Size = 60
    end
    object Qsupplieralamat: TMemoField
      FieldName = 'alamat'
      BlobType = ftMemo
    end
    object Qsupplierno_telp: TStringField
      FieldName = 'no_telp'
      Size = 13
    end
  end
end
