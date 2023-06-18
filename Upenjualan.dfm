object Fpenjualan: TFpenjualan
  Left = 0
  Top = 0
  Caption = 'Fpenjualan'
  ClientHeight = 506
  ClientWidth = 629
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
    Width = 77
    Height = 13
    Caption = 'Kode penjualan '
  end
  object Label1: TLabel
    Left = 40
    Top = 59
    Width = 36
    Height = 13
    Caption = 'tanggal'
  end
  object Label3: TLabel
    Left = 37
    Top = 99
    Width = 80
    Height = 13
    Caption = 'Nama pelanggan'
  end
  object Label4: TLabel
    Left = 37
    Top = 128
    Width = 77
    Height = 13
    Caption = 'Kode pelanggan'
  end
  object Label5: TLabel
    Left = 37
    Top = 155
    Width = 78
    Height = 13
    Caption = 'No BuktiKwitansi'
  end
  object Edkodepenjualan: TEdit
    Left = 144
    Top = 24
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object Dtpenjualan: TDateTimePicker
    Left = 144
    Top = 59
    Width = 186
    Height = 21
    Date = 45087.000000000000000000
    Time = 0.417601018518325900
    TabOrder = 1
  end
  object cbnama_pelanggan: TComboBox
    Left = 144
    Top = 96
    Width = 186
    Height = 21
    TabOrder = 2
    OnChange = cbnama_pelangganChange
    OnDropDown = cbnama_pelangganDropDown
  end
  object Edkodepelanggan: TEdit
    Left = 144
    Top = 123
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Ednobukti: TEdit
    Left = 144
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 200
    Width = 625
    Height = 265
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    OnExit = DBGrid1Exit
  end
  object Panel1: TPanel
    Left = 0
    Top = 465
    Width = 629
    Height = 41
    Align = alBottom
    TabOrder = 6
    object Splitter1: TSplitter
      Left = 550
      Top = 1
      Height = 39
      Align = alRight
      ExplicitLeft = 447
    end
    object Btcancel: TButton
      Left = 553
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = BtcancelClick
    end
    object Btsimpan: TButton
      Left = 475
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = BtsimpanClick
    end
  end
  object Panel2: TPanel
    Left = 348
    Top = 8
    Width = 273
    Height = 186
    TabOrder = 7
    object Label6: TLabel
      Left = 8
      Top = 19
      Width = 87
      Height = 18
      Caption = 'Total Harga'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 72
      Width = 48
      Height = 18
      Caption = 'Bayar '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 126
      Width = 60
      Height = 18
      Caption = 'Kembali'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edbayar: TEdit
      Left = 104
      Top = 73
      Width = 137
      Height = 21
      TabOrder = 0
      OnChange = EdbayarChange
    end
    object Edkembali: TEdit
      Left = 104
      Top = 127
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object Edtotal: TEdit
      Left = 112
      Top = 20
      Width = 145
      Height = 21
      TabOrder = 2
    end
  end
  object CDS1: TClientDataSet
    PersistDataPacket.Data = {
      A70000009619E0BD010000001800000006000000000003000000A7000C6B6F64
      655F626172616E672001004900000001000557494454480200020014000B6E61
      6D615F626172616E67010049000000010005574944544802000200C800067361
      7475616E01004900000001000557494454480200020014000A68617267615F6A
      75616C0800040000000000037174790800040000000000097375625F746F7461
      6C08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'kode_barang '
        DataType = ftString
        Size = 20
      end
      item
        Name = 'nama_barang'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'satuan'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'harga_jual'
        DataType = ftFloat
      end
      item
        Name = 'qty'
        DataType = ftFloat
      end
      item
        Name = 'sub_total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = CDS1AfterPost
    Left = 368
    Top = 320
    object CDS1kode_barang: TStringField
      FieldName = 'kode_barang '
    end
    object CDS1nama_barang: TStringField
      FieldName = 'nama_barang'
      Size = 200
    end
    object CDS1satuan: TStringField
      FieldName = 'satuan'
    end
    object CDS1harga_jual: TFloatField
      FieldName = 'harga_jual'
    end
    object CDS1qty: TFloatField
      FieldName = 'qty'
    end
    object CDS1sub_total: TFloatField
      FieldName = 'sub_total'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 304
    object insert1: TMenuItem
      Caption = 'insert'
      ShortCut = 16462
      OnClick = insert1Click
    end
    object edittopup: TMenuItem
      Caption = 'edit'
      ShortCut = 16463
      OnClick = edittopupClick
    end
    object delete1: TMenuItem
      Caption = 'delete'
      ShortCut = 16430
      OnClick = delete1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS1
    Left = 104
    Top = 296
  end
end
