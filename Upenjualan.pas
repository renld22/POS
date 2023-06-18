unit Upenjualan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.Menus;

type
  TFpenjualan = class(TForm)
    Label2: TLabel;
    Edkodepenjualan: TEdit;
    Label1: TLabel;
    Dtpenjualan: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbnama_pelanggan: TComboBox;
    Edkodepelanggan: TEdit;
    Ednobukti: TEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Btcancel: TButton;
    Btsimpan: TButton;
    CDS1: TClientDataSet;
    PopupMenu1: TPopupMenu;
    DataSource1: TDataSource;
    CDS1kode_barang: TStringField;
    CDS1nama_barang: TStringField;
    CDS1satuan: TStringField;
    CDS1harga_jual: TFloatField;
    CDS1qty: TFloatField;
    CDS1sub_total: TFloatField;
    insert1: TMenuItem;
    edittopup: TMenuItem;
    delete1: TMenuItem;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edbayar: TEdit;
    Edkembali: TEdit;
    Edtotal: TEdit;
    procedure BtcancelClick(Sender: TObject);
    procedure BtsimpanClick(Sender: TObject);
    procedure cbnama_pelangganChange(Sender: TObject);
    procedure cbnama_pelangganDropDown(Sender: TObject);
    procedure CDS1AfterPost(DataSet: TDataSet);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure delete1Click(Sender: TObject);
    procedure EdbayarChange(Sender: TObject);
    procedure insert1Click(Sender: TObject);
    procedure edittopupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpenjualan: TFpenjualan;

implementation

{$R *.dfm}

uses Ulistpenjualan, Myfunction, UDM;

procedure TFpenjualan.BtcancelClick(Sender: TObject);
begin
Close;
end;

procedure TFpenjualan.BtsimpanClick(Sender: TObject);
begin
if Edkodepenjualan.Text='' then
 begin
   Messagedlg('Kode Penjualan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if cbnama_pelanggan.Text='' then
 begin
   Messagedlg('Nama Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Edkodepelanggan.Text='' then
 begin
   Messagedlg('Kode Pelanggan Tidak Boleh Kosong',mtWarning,[Mbok],0);
   Exit;
 end;
 if Ednobukti.Text='' then
 begin
   Messagedlg('No buktikwintansi Tidak Boleh Kosong',mtWarning,[Mbok],0);
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
    SQL.Text:='INSERT INTO dbpost1.tpenjualan_master(kode_penjualan, '+
              'tgl_penjualan,kode_pelanggan,no_bukti,total,bayar,kembali) VALUES('+
        QuotedStr(Edkodepenjualan.Text)+','+
        QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpenjualan.DateTime))+','+
        QuotedStr(Edkodepelanggan.Text)+','+
        QuotedStr(Ednobukti.Text)+','+
        QuotedStr(Edtotal.Text)+','+
        QuotedStr(Edbayar.Text)+','+
        QuotedStr(Edkembali.Text)+')';
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
      SQL.Text:='INSERT INTO dbpost1.tpenjualan_detail(kode_penjualan,'+
                'kode_barang,qty,harga_jual,sub_total) VALUES('+
          QuotedStr(Edkodepenjualan.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_jual.Value)+','+
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
    SQL.Text:='UPDATE dbpost1.tpenjualan_master SET '+
        'tgl_penjualan='+QuotedStr(FormatDateTime('yyyy-mm-dd',Dtpenjualan.DateTime))+','+
        'kode_pelanggan= '+QuotedStr(Edkodepelanggan.Text)+','+
        'no_bukti= '+QuotedStr(Ednobukti.Text)+','+
        'total= '+QuotedStr(Edtotal.Text)+','+
        'bayar= '+QuotedStr(Edbayar.Text)+','+
        'kembali= '+QuotedStr(Edkembali.Text)+
        ' WHERE kode_penjualan= '+QuotedStr(Edkodepenjualan.Text);
    Execute;
  end;
  //DETAIL
    with dm.Qtemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='DELETE FROM dbpost1.tpenjualan_detail '+
         ' WHERE kode_penjualan= '+QuotedStr(Edkodepenjualan.Text);
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
      SQL.Text:='INSERT INTO dbpost1.tpenjualan_detail(kode_penjualan,'+
                'kode_barang,qty,harga_jual,sub_total) VALUES('+
          QuotedStr(Edkodepenjualan.Text)+','+
          QuotedStr(CDS1kode_barang.Text)+','+
          FloatToStr(CDS1qty.Value)+','+
          FloatToStr(CDS1harga_jual.Value)+','+
          FloatToStr(CDS1sub_total.Value)+')';
      Execute;
      CDS1.Next;
    end;
  end;
   Messagedlg('Ubah Data Berhasil',MtInformation,[Mbok],0);
 end;
  Flistpenjualan.btrefreshClick(Sender);
  Close;
end;



procedure TFpenjualan.cbnama_pelangganChange(Sender: TObject);
begin
with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select kode_pelanggan from pelanggan where nama_pelanggan='+
       QuotedStr(cbnama_pelanggan.Text);
       Open;
      Edkodepelanggan.Text:=FieldByName('kode_pelanggan').AsString;

end;
    end;
procedure TFpenjualan.cbnama_pelangganDropDown(Sender: TObject);
begin
with dm.Qtemp do
    begin
       SQL.Clear;
       sql.Text := 'select nama_pelanggan from pelanggan';
       Open;
      cbnama_pelanggan.Clear;
      dm.Qtemp.First;
      while not dm.Qtemp.Eof do
      begin
        cbnama_pelanggan.Items.Add(dm.Qtemp.FieldByName('nama_pelanggan').AsString);
        dm.Qtemp.Next;

end;
 end;
end;
procedure TFpenjualan.CDS1AfterPost(DataSet: TDataSet);
begin
 Edtotal.Clear;
 CDS1.First;
 while not CDS1.Eof do
 begin
  Edtotal.Text := FloatToStr(StrToFloatDef(Edtotal.Text,0)+CDS1sub_total.Value);
  CDS1.Next;

end;
 end;
procedure TFpenjualan.DBGrid1ColExit(Sender: TObject);
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
    if (CDS1qty.Value<>0) or (CDS1harga_jual.Value<>0) then
      CDS1sub_total.Value := CDS1qty.Value * CDS1harga_jual.Value;
    CDS1.Post;
  end;
end;



procedure TFpenjualan.DBGrid1Exit(Sender: TObject);
begin
Edtotal.Clear;
 CDS1.First;
 while not CDS1.Eof do
 begin
  Edtotal.Text := FloatToStr(StrToFloatDef(Edtotal.Text,0)+CDS1sub_total.Value);
  CDS1.Next;
 end;
end;

procedure TFpenjualan.delete1Click(Sender: TObject);
begin
if CDS1.RecordCount > 0 then
  CDS1.Delete;
end;


procedure TFpenjualan.EdbayarChange(Sender: TObject);
begin
Edkembali.Text := FloatToStr(StrToFloatDef(Edbayar.Text,0) - StrToFloatDef(Edtotal.Text,0));
end;


procedure TFpenjualan.edittopupClick(Sender: TObject);
begin
CDS1.Edit;
end;

procedure TFpenjualan.insert1Click(Sender: TObject);
begin
  CDS1.Insert;
end;

end.
