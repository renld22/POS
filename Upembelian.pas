unit Upembelian;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFpembelian = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edkodepembelian: TEdit;
    Dtpembelian: TDateTimePicker;
    cbnama_supplier: TComboBox;
    Edkodesupplier: TEdit;
    Ednobukti: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    CDS1: TClientDataSet;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Btcancel: TButton;
    Btsimpan: TButton;
    insert1: TMenuItem;
    edit1: TMenuItem;
    delete: TMenuItem;
    CDS1kode_barang: TStringField;
    CDS1nama_barang: TStringField;
    CDS1satuan: TStringField;
    CDS1qty: TFloatField;
    CDS1sub_total: TFloatField;
    CDS1harga_beli: TFloatField;
    procedure BtcancelClick(Sender: TObject);
    procedure BtsimpanClick(Sender: TObject);
    procedure cbnama_supplierDropDown(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure edit1Click(Sender: TObject);
    procedure cbnama_supplierChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpembelian: TFpembelian;

implementation

{$R *.dfm}

uses Myfunction, UDM, Ulistpembelian;

procedure TFpembelian.BtcancelClick(Sender: TObject);
begin
close;
end;

procedure TFpembelian.BtsimpanClick(Sender: TObject);
begin
if Edkodepembelian.Text='' then
 begin
   Messagedlg('Kode Pembelian Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if cbnama_supplier.Text='' then
 begin
   Messagedlg('Nama supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Edkodesupplier.Text='' then
 begin
   Messagedlg('Kode supplier Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ednobukti.Text='' then
 begin
   Messagedlg('No Telp Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if CDS1.RecordCount=0 then
 begin
   Messagedlg('Data Detail Masih Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 //Tambah
 if status_simpan=1 then
 begin
  //master
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='INSERT INTO dbpost1.tpembelian_master(kode_pembelian, '+
              'tgl_pembelian,kode_supplier,no_bukti) VALUES('+
        QuotedStr(Edkodepembelian.Text)+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpembelian.DateTime))+','+
        QuotedStr(Edkodesupplier.Text)+','+
        QuotedStr(Ednobukti.Text)+')';
    Execute;
  end;
  //Detail
  CDS1.First;
  while not CDS1.Eof do
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO dbpost1.tpembelian_detail(kode_pembelian,'+
                'kode_barang,qty,harga_beli,sub_total) VALUES('+
          QuotedStr(Edkodepembelian.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_beli.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Tambah Data Berhasil',MtInformation,[Mbok],0);
 end;
 //edit
 if status_simpan=2 then
 begin
  with dm.Qtemp do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='UPDATE dbpost1.tpembelian_master SET '+
        'tgl_pembelian='+QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpembelian.DateTime))+','+
        'kode_supplier= '+QuotedStr(Edkodesupplier.Text)+','+
        'no_bukti= '+QuotedStr(Ednobukti.Text)+
        ' WHERE kode_pembelian= '+QuotedStr(Edkodepembelian.Text);
    Execute;
  end;
  //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM dbpost1.tpembelian_detail '+
         ' WHERE kode_pembelian= '+QuotedStr(Edkodepembelian.Text);
      Execute;
    end;
  //Detail
  CDS1.First;
  while not CDS1.Eof do
  begin
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='INSERT INTO dbpost1.tpembelian_detail(kode_pembelian,'+
                'kode_barang,qty,harga_beli,sub_total) VALUES('+
          QuotedStr(Edkodepembelian.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_beli.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Flistpembelian.btrefreshClick(Sender);
  Close;
end;

procedure TFpembelian.cbnama_supplierChange(Sender: TObject);
begin
with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select kode_supplier from supplier where nama_supplier='+QuotedStr(cbnama_supplier.Text);
       Open;
      Edkodesupplier.Text:=FieldByName('kode_supplier').AsString;
    end;
end ;


procedure TFpembelian.cbnama_supplierDropDown(Sender: TObject);
begin
with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select nama_supplier from supplier';
       Open;
      cbnama_supplier.Clear;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        cbnama_supplier.Items.Add(dm.Qtemp.FieldByName('nama_supplier').AsString);
        dm.Qtemp.Next;
      end;

end;

end;

procedure TFpembelian.DBGrid1ColExit(Sender: TObject);
begin
if (CDS1.State in [dsInsert, dsEdit]) and (CDS1kode_barang.Text<>'') then
  begin
    with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select nama_barang,satuan from tbarang where kode_barang='+QuotedStr(CDS1kode_barang.Text);
       Open;
       if RecordCount=0 then
       Begin
         Messagedlg('Kode Barang Tidak ditemukan',mtWarning,[Mbok],0);
          Exit;
       End;
       CDS1nama_barang.Text := FieldByName('nama_barang').AsString;
       CDS1satuan.Text := FieldByName('satuan').AsString;
    end;
    if (CDS1qty.Value<>0) or (CDS1harga_beli.Value<>0) then
      CDS1sub_total.Value := CDS1qty.Value * CDS1harga_beli.Value;
    CDS1.Post;
  end;
end;



procedure TFpembelian.deleteClick(Sender: TObject);
begin
if CDS1.RecordCount > 0 then
  CDS1.Delete;
end;

procedure TFpembelian.edit1Click(Sender: TObject);
begin
CDS1.Edit;
end;

end.
