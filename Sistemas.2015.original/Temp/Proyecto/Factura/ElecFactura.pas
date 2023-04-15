unit ElecFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery, FacturaClass;

type
  TfrmElecFacturas = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    grdDatos: TDBGrid;
    DataSource1: TDataSource;
    Query: TQuery;
    QueryIdFactura: TSmallintField;
    QueryNumero: TStringField;
    QueryFecha: TDateTimeField;
    QueryProveedor: TStringField;
    QueryObra: TStringField;
    QueryPagado: TBooleanField;
    QueryTipo: TStringField;
    QueryMonto: TFloatField;
    QuerySaldo: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure ControlKeyPress(Sender: TObject; var Key: Char);
    procedure QueryCalcFields(DataSet: TDataSet);

  private
    gTipoOrden, gOrden: String;
    gModo, gModoGet, Teclas: Byte;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);

  public
    function GetId(var Id: Smallint): Boolean;
    function GetFactura(var F: TFactura): Boolean;
  end;

var
  frmElecFacturas: TfrmElecFacturas;

implementation

uses Comunes, Util, PoolQuerys, Proveedor, FacturaDataSets;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecFacturas.PrepararForm;
var
  i: Byte;
begin
  btnElegir.Visible:=(gModo=2) and (Query.RecordCount<>0);
end;

procedure TfrmElecFacturas.PrepararQuery(Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT * FROM vwFacturas ';
  Orden := 'ORDER BY ' + Orden;

  //Construye el script del filtro
  Filtro:='';
  Filtro := 'WHERE ((' +
            'Proveedor LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Proveedor LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Proveedor LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Proveedor LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
            'Obra LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Obra LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Obra LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Obra LIKE ' + #39 + edtDesc.Text + #39 + '))';

  Filtro := Filtro + ' AND Pagado = 0';

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

function TfrmElecFacturas.GetId(var Id: Smallint): Boolean;
begin
  gModo:=2;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    Id := Query.FieldByName('IdFactura').AsInteger;
end;

function TfrmElecFacturas.GetFactura(var F: TFactura): Boolean;
begin
  gModo:=2;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    F := TFactura.Create(Query.FieldByName('IdFactura').AsInteger);
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecFacturas.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla (Name+'.col',grdDatos);
  RecuperarEstadoVentana (Name,Self);
  gTipoOrden:=' ASC';
  gOrden:='Fecha' + gTipoOrden;
end;

procedure TfrmElecFacturas.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecFacturas.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then
    gTipoOrden := ' DESC'
  else
    gTipoOrden := ' ASC';
  gOrden := Column.FieldName + gTipoOrden;
  PrepararQuery(gOrden);
end;

procedure TfrmElecFacturas.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecFacturas.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecFacturas.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmElecFacturas.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmElecFacturas.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecFacturas.ControlKeyPress(Sender: TObject; var Key: Char);
begin
  if (Sender = edtDesc) and (Key = #13) then
    PrepararQuery(gOrden);
end;

procedure TfrmElecFacturas.QueryCalcFields(DataSet: TDataSet);
begin
  QuerySaldo.Value := QueryMonto.Value - dmFactura.GetMontoPagado(QueryIdFactura.Value);
end;

end.
