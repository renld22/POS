object Flistpenjualan: TFlistpenjualan
  Left = 0
  Top = 0
  Caption = 'Flistpenjualan'
  ClientHeight = 369
  ClientWidth = 615
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
    Width = 615
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
    Width = 615
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
    Width = 615
    Height = 272
    Align = alClient
    DataSource = DSpenjualan
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
        FieldName = 'kode_penjualan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tgl_penjualan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kode_pelanggan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'no_bukti'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_pelanggan'
        Visible = True
      end>
  end
  object Qpenjualan: TMyQuery
    Connection = dm.MyConnection1
    SQL.Strings = (
      'SELECT tpm.*,tp.nama_pelanggan FROM tpenjualan_master tpm'
      'INNER JOIN pelanggan tp ON tp.kode_pelanggan=tpm.kode_pelanggan'
      '&WHERE'
      '&ORDERBY')
    Left = 160
    Top = 176
    MacroData = <
      item
        Name = 'WHERE'
      end
      item
        Name = 'ORDERBY'
      end>
    object Qpenjualankode_penjualan: TStringField
      FieldName = 'kode_penjualan'
    end
    object Qpenjualantgl_penjualan: TDateField
      FieldName = 'tgl_penjualan'
    end
    object Qpenjualankode_pelanggan: TStringField
      FieldName = 'kode_pelanggan'
    end
    object Qpenjualanno_bukti: TStringField
      FieldName = 'no_bukti'
    end
    object Qpenjualannama_pelanggan: TStringField
      FieldName = 'nama_pelanggan'
      Size = 60
    end
    object Qpenjualantotal: TFloatField
      FieldName = 'total'
    end
    object Qpenjualanbayar: TFloatField
      FieldName = 'bayar'
    end
    object Qpenjualankembali: TFloatField
      FieldName = 'kembali'
    end
  end
  object DSpenjualan: TDataSource
    DataSet = Qpenjualan
    Left = 376
    Top = 176
  end
end
