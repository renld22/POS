object Fpembelian: TFpembelian
  Left = 0
  Top = 0
  Caption = 'Fpembelian'
  ClientHeight = 550
  ClientWidth = 619
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
    Width = 75
    Height = 13
    Caption = 'Kode pembelian'
  end
  object Label1: TLabel
    Left = 40
    Top = 59
    Width = 36
    Height = 13
    Caption = 'tanggal'
  end
  object Label3: TLabel
    Left = 40
    Top = 99
    Width = 67
    Height = 13
    Caption = 'Nama supplier'
  end
  object Label4: TLabel
    Left = 40
    Top = 131
    Width = 64
    Height = 13
    Caption = 'Kode supplier'
  end
  object Label5: TLabel
    Left = 40
    Top = 171
    Width = 78
    Height = 13
    Caption = 'No BuktiKwitansi'
  end
  object Edkodepembelian: TEdit
    Left = 144
    Top = 24
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object Dtpembelian: TDateTimePicker
    Left = 144
    Top = 59
    Width = 186
    Height = 21
    Date = 45087.000000000000000000
    Time = 0.417601018518325900
    TabOrder = 1
  end
  object cbnama_supplier: TComboBox
    Left = 144
    Top = 96
    Width = 145
    Height = 21
    TabOrder = 2
    OnChange = cbnama_supplierChange
    OnDropDown = cbnama_supplierDropDown
  end
  object Edkodesupplier: TEdit
    Left = 144
    Top = 131
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Ednobukti: TEdit
    Left = 144
    Top = 168
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 216
    Width = 619
    Height = 289
    DataSource = DataSource1
    PopupMenu = PopupMenu1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    Columns = <
      item
        Expanded = False
        FieldName = 'kode_barang'
        Title.Caption = 'kode barang'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama_barang'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'satuan'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'harga_jual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sub_total'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 509
    Width = 619
    Height = 41
    Align = alBottom
    TabOrder = 6
    object Splitter1: TSplitter
      Left = 540
      Top = 1
      Height = 39
      Align = alRight
      ExplicitLeft = 447
    end
    object Btcancel: TButton
      Left = 543
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = BtcancelClick
    end
    object Btsimpan: TButton
      Left = 465
      Top = 1
      Width = 75
      Height = 39
      Align = alRight
      Caption = 'Simpan'
      TabOrder = 1
      OnClick = BtsimpanClick
    end
  end
  object DataSource1: TDataSource
    DataSet = CDS1
    Left = 72
    Top = 312
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 344
    object insert1: TMenuItem
      Caption = 'insert'
      ShortCut = 16462
    end
    object edit1: TMenuItem
      Caption = 'edit'
      ShortCut = 16463
      OnClick = edit1Click
    end
    object delete: TMenuItem
      Caption = 'delete'
      ShortCut = 4142
      OnClick = deleteClick
    end
  end
  object CDS1: TClientDataSet
    PersistDataPacket.Data = {
      A60000009619E0BD010000001800000006000000000003000000A6000B6B6F64
      655F626172616E6701004900000001000557494454480200020014000B6E616D
      615F626172616E67010049000000010005574944544802000200C80006736174
      75616E01004900000001000557494454480200020014000A68617267615F6265
      6C690800040000000000037174790800040000000000097375625F746F74616C
      08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'kode_barang'
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
        Name = 'harga_beli'
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
    Left = 328
    Top = 288
    object CDS1kode_barang: TStringField
      FieldName = 'kode_barang'
    end
    object CDS1nama_barang: TStringField
      FieldName = 'nama_barang'
      Size = 200
    end
    object CDS1satuan: TStringField
      FieldName = 'satuan'
    end
    object CDS1qty: TFloatField
      FieldName = 'qty'
    end
    object CDS1sub_total: TFloatField
      FieldName = 'sub_total'
    end
    object CDS1harga_beli: TFloatField
      FieldName = 'harga_beli'
    end
  end
end
