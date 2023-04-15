unit ElecEmpleado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery;

type
  TfrmElecEmpleado = class(TForm)
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
    QueryApellido: TStringField;
    QueryNombres: TStringField;
    QueryIdEmpleado: TSmallintField;
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

  end;

var
  frmElecEmpleado: TfrmElecEmpleado;

implementation

uses Comunes, Util, PoolQuerys, Empleado;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecEmpleado.PrepararForm;
var
  i: Byte;
begin
  btnElegir.Visible:=(gModo=2) and (Query.RecordCount<>0);
  btnEliminar.Enabled:=(Query.RecordCount<>0);
  btnModificar.Enabled:=(Query.RecordCount<>0);
end;

procedure TfrmElecEmpleado.PrepararQuery(Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT IdEmpleado, Apellido, Nombres FROM vwEmpleados ';
  Orden := 'ORDER BY ' + Orden;

  //Construye el script del filtro
  Filtro:='';
  Filtro := 'WHERE (' +
            'Apellido LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Apellido LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Apellido LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Apellido LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
            'Nombres LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Nombres LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Nombres LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Nombres LIKE ' + #39 + edtDesc.Text + #39 + ')';

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

function TfrmElecEmpleado.GetId(var Id: Smallint): Boolean;
begin
  gModo:=2;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    Id := Query.FieldByName('IdEmpleado').AsInteger;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecEmpleado.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla (Name+'.col',grdDatos);
  RecuperarEstadoVentana (Name,Self);
  gTipoOrden:=' ASC';
  gOrden:='Nombres' + gTipoOrden;
end;

procedure TfrmElecEmpleado.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecEmpleado.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then
    gTipoOrden := ' DESC'
  else
    gTipoOrden := ' ASC';
  gOrden := Column.FieldName + gTipoOrden;
  PrepararQuery(gOrden);
end;

procedure TfrmElecEmpleado.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmEmpleado.Create(nil) do
  begin
    R := Agregar;
    Release;
  end;

  if R then
  begin
    Id := dmQuerys.GetMaxIntValue('Empleado', 'IdEmpleado');
    PrepararQuery(gOrden);
    Existe(Query, 'IdEmpleado', Id);
  end;
end;

procedure TfrmElecEmpleado.grdDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    btnModificarClick(Sender);
  if Key = 46 then
    btnEliminarClick(Sender);
  if Key = 65 then
    btnAgregarClick(Sender);
end;

procedure TfrmElecEmpleado.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmEmpleado.Create(nil) do
  begin
    R := Eliminar(Query.FieldByName('IdEmpleado').AsInteger);
    Release;
  end;

  if R then PrepararQuery(gOrden);
end;

procedure TfrmElecEmpleado.btnModificarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  Id := Query.FieldByName('IdEmpleado').AsInteger;
  with TfrmEmpleado.Create(nil) do
  begin
    R := Modificar(Id);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Existe(Query, 'IdEmpleado', Id);
  end;
end;

procedure TfrmElecEmpleado.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecEmpleado.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecEmpleado.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmElecEmpleado.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmElecEmpleado.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecEmpleado.ControlKeyPress(Sender: TObject; var Key: Char);
begin
  if (Sender = edtDesc) and (Key = #13) then
    PrepararQuery(gOrden);
  if Key = '+' then btnAgregarClick(nil)
  else if Key = '-' then btnEliminarClick(nil)
  else if Key = '*' then btnModificarClick(nil);
end;

end.
