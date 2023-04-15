unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Util;

type
  TForm1 = class(TForm)
    btnEjecutar: TBitBtn;
    qryDesc: TQuery;
    qryDescIDTIPODESCUENTO: TIntegerField;
    qryDescMES: TStringField;
    qryDescANIO: TIntegerField;
    qryDescMONTO: TFloatField;
    Database1: TDatabase;
    tblFechaDesc: TTable;
    tblFechaDescIDTIPO_DESCUENTO: TIntegerField;
    tblFechaDescFECHA: TDateTimeField;
    tblFechaDescMES: TStringField;
    tblFechaDescANIO: TIntegerField;
    tblFechaDescMONTO: TFloatField;
    tblFechaDescDEPTOS_ACTIVOS: TIntegerField;
    qryDescCANT_ACTIVOS: TIntegerField;
    procedure btnEjecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnEjecutarClick(Sender: TObject);
begin
  qryDesc.Open;
  tblFechaDesc.Open;
  tblFechaDesc.EmptyTable;
  qryDesc.First;
  while not qryDesc.Eof do
  begin
    tblFechaDesc.Append;
    tblFechaDescIDTIPO_DESCUENTO.Value := qryDescIDTIPODESCUENTO.Value;
    tblFechaDescFECHA.Value := EncodeDate(qryDescANIO.Value, MesComoWord(qryDescMES.Text), 28);
    tblFechaDescMES.Value := qryDescMES.Value;
    tblFechaDescANIO.Value := qryDescANIO.Value;
    tblFechaDescMONTO.Value := qryDescMONTO.Value;
    tblFechaDescDEPTOS_ACTIVOS.Value := qryDescCANT_ACTIVOS.Value;
    tblFechaDesc.Post;

    qryDesc.Next;
  end;
  qryDesc.Close;
  tblFechaDesc.Close;
  btnEjecutar.Caption := 'FIN';
end;

end.
