unit ElecObra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery, ObraClass;

type
  TfrmElecObra = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    Panel4: TPanel;
    grdDatos: TDBGrid;
    DataSource1: TDataSource;
    Query: TQuery;
    btnModificar: TButton;
    btnEliminar: TButton;
    btnAgregar: TButton;
    QueryIdObra: TSmallintField;
    QueryNombre: TStringField;
    QueryTipoObra: TStringField;
    QueryCliente: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure btnAgregarClick(Sender: TObject);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure ControlKeyPress(Sender: TObject; var Key: Char);

  private
    gTipoOrden, gOrden: String;
    gModo, gModoGet, Teclas: Byte;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);

  public
    function GetId(var Id: Smallint): Boolean;
    function GetObra(var Obra: TObra): Boolean;

  end;

var
  frmElecObra: TfrmElecObra;

implementation

uses Comunes, Util, PoolQuerys, Obra;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecObra.PrepararForm;
var
  i: Byte;
begin
  btnElegir.Visible:=(gModo=2) and (Query.RecordCount<>0);
  btnEliminar.Enabled:=(Query.RecordCount<>0);
  btnModificar.Enabled:=(Query.RecordCount<>0);
end;

procedure TfrmElecObra.PrepararQuery(Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT IdObra, TipoObra, Cliente, Nombre FROM vwObras ';
  Orden := 'ORDER BY ' + Orden;

  //Construye el script del filtro
  Filtro:='';
  Filtro := 'WHERE (' +
            'TipoObra LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'TipoObra LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'TipoObra LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'TipoObra LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
            'Cliente LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Cliente LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Cliente LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Cliente LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
            'Nombre LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Nombre LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Nombre LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Nombre LIKE ' + #39 + edtDesc.Text + #39 + ')';

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

function TfrmElecObra.GetId(var Id: Smallint): Boolean;
begin
  gModo:=2;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    Id := Query.FieldByName('IdObra').AsInteger;
end;

function TfrmElecObra.GetObra(var Obra: TObra): Boolean;
begin
  gModo:=2;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    Obra := TObra.Create(Query.FieldByName('IdObra').AsInteger);
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecObra.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla (Name+'.col',grdDatos);
  RecuperarEstadoVentana (Name,Self);
  gTipoOrden:=' ASC';
  gOrden:='Nombre' + gTipoOrden;
end;

procedure TfrmElecObra.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecObra.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then
    gTipoOrden := ' DESC'
  else
    gTipoOrden := ' ASC';
  gOrden := Column.FieldName + gTipoOrden;
  PrepararQuery(gOrden);
end;

procedure TfrmElecObra.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmObra.Create(nil) do
  begin
    R := Agregar;
    Release;
  end;

  if R then
  begin
    Id := dmQuerys.GetMaxIntValue('Obra', 'IdObra');
    PrepararQuery(gOrden);
    Existe(Query, 'IdObra', Id);
  end;
end;

procedure TfrmElecObra.grdDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    btnModificarClick(Sender);
  if Key = 46 then
    btnEliminarClick(Sender);
  if Key = 65 then
    btnAgregarClick(Sender);
end;

procedure TfrmElecObra.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmObra.Create(nil) do
  begin
    R := Eliminar(Query.FieldByName('IdObra').AsInteger);
    Release;
  end;

  if R then PrepararQuery(gOrden);
end;

procedure TfrmElecObra.btnModificarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  Id := Query.FieldByName('IdObra').AsInteger;
  with TfrmObra.Create(nil) do
  begin
    R := Modificar(Id);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Existe(Query, 'IdObra', Id);
  end;
end;

procedure TfrmElecObra.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecObra.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecObra.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmElecObra.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmElecObra.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecObra.ControlKeyPress(Sender: TObject; var Key: Char);
begin
  if (Sender = edtDesc) and (Key = #13) then
    PrepararQuery(gOrden);
  if Key = '+' then btnAgregarClick(nil)
  else if Key = '-' then btnEliminarClick(nil)
  else if Key = '*' then btnModificarClick(nil);
end;

end.
