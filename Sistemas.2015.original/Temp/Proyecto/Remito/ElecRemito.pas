unit ElecRemito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery;

type
  TfrmElecRemito = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    grdDatos: TDBGrid;
    DataSource1: TDataSource;
    Query: TQuery;
    QueryIdRemito: TSmallintField;
    QueryNumero: TStringField;
    QueryIdObra: TSmallintField;
    QueryFecha: TDateTimeField;
    QueryIdFactura: TSmallintField;
    QueryIdProveedor: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);

  private
    gTipoOrden, gOrden: String;
    gModo, gModoGet, Teclas: Byte;
    gIdObra, gIdProv: Smallint;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);

  public
    function GetId(var Id: Smallint): Boolean;
    function GetRemito(IdObra, IdProv: Smallint; var Id: Smallint; var Num: String; var Fecha: TDate): Boolean;

  end;

var
  frmElecRemito: TfrmElecRemito;

implementation

uses Comunes, Util, PoolQuerys, Obra;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecRemito.PrepararForm;
var
  i: Byte;
begin
  btnElegir.Visible:=(gModo=2) and (Query.RecordCount<>0);
end;

procedure TfrmElecRemito.PrepararQuery(Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT IdRemito, Numero, IdObra, IdProveedor, Fecha, IdFactura FROM vwRemitos ';
  Orden := 'ORDER BY ' + Orden;

  //Construye el script del filtro
  Filtro:='';

  if gIdObra <> -1 then
    Filtro := 'WHERE (IdObra=' + IntToStr(gIdObra) + ') AND ' +
             '(IdProveedor=' + IntToStr(gIdProv) + ') AND (IdFactura IS NULL)';

  with Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Script);
    SQL.Add(Filtro);
    SQL.Add(Orden);
    Open;
  end;
  PrepararForm;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmElecRemito.GetId(var Id: Smallint): Boolean;
begin
  gModo:=2;
  gIdObra := -1;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    Id := Query.FieldByName('IdRemito').AsInteger;
end;

function TfrmElecRemito.GetRemito(IdObra, IdProv: Smallint; var Id: Smallint; var Num: String; var Fecha: TDate): Boolean;
begin
  gModo:=2;
  gIdObra := IdObra;
  gIdProv := IdProv;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    Id := Query.FieldByName('IdRemito').AsInteger;
    Num := Query.FieldByName('Numero').AsString;
    Fecha := Query.FieldByName('Fecha').AsDateTime;
  end;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecRemito.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla (Name+'.col',grdDatos);
  RecuperarEstadoVentana (Name,Self);
  gTipoOrden:=' ASC';
  gOrden:='Numero' + gTipoOrden;
end;

procedure TfrmElecRemito.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecRemito.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then
    gTipoOrden := ' DESC'
  else
    gTipoOrden := ' ASC';
  gOrden := Column.FieldName + gTipoOrden;
  PrepararQuery(gOrden);
end;

procedure TfrmElecRemito.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecRemito.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecRemito.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmElecRemito.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmElecRemito.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

end.
