unit ElecProveedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery;

type
  TfrmElecProveedor = class(TForm)
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
    QueryIdProveedor: TSmallintField;
    QueryRazonSocial: TStringField;
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
    function GetId(var Id: Word): Boolean;

  end;

var
  frmElecProveedor: TfrmElecProveedor;

implementation

uses Comunes, Util, PoolQuerys, Proveedor;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecProveedor.PrepararForm;
var
  i: Byte;
begin
  btnElegir.Visible:=(gModo=2) and (Query.RecordCount<>0);
  btnEliminar.Enabled:=(Query.RecordCount<>0);
  btnModificar.Enabled:=(Query.RecordCount<>0);
end;

procedure TfrmElecProveedor.PrepararQuery(Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT IdProveedor, RazonSocial FROM vwProveedores ';
  Orden := 'ORDER BY ' + Orden;

  //Construye el script del filtro
  Filtro:='';
  Filtro := 'WHERE (' +
            'RazonSocial LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'RazonSocial LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'RazonSocial LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'RazonSocial LIKE ' + #39 + edtDesc.Text + #39 + ')';

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

function TfrmElecProveedor.GetId(var Id: Word): Boolean;
begin
  gModo:=2;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    Id := Query.FieldByName('IdProveedor').AsInteger;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecProveedor.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla (Name+'.col',grdDatos);
  RecuperarEstadoVentana (Name,Self);
  gTipoOrden:=' ASC';
  gOrden:='RazonSocial' + gTipoOrden;
end;

procedure TfrmElecProveedor.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecProveedor.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then
    gTipoOrden := ' DESC'
  else
    gTipoOrden := ' ASC';
  gOrden := Column.FieldName + gTipoOrden;
  PrepararQuery(gOrden);
end;

procedure TfrmElecProveedor.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmProv.Create(nil) do
  begin
    R := Agregar;
    Release;
  end;

  if R then
  begin
    Id := dmQuerys.GetMaxIntValue('Proveedor', 'IdProveedor');
    PrepararQuery(gOrden);
    Existe(Query, 'IdProveedor', Id);
  end;
end;

procedure TfrmElecProveedor.grdDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    btnModificarClick(Sender);
  if Key = 46 then
    btnEliminarClick(Sender);
  if Key = 65 then
    btnAgregarClick(Sender);
end;

procedure TfrmElecProveedor.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmProv.Create(nil) do
  begin
    R := Eliminar(Query.FieldByName('IdProveedor').AsInteger);
    Release;
  end;

  if R then PrepararQuery(gOrden);
end;

procedure TfrmElecProveedor.btnModificarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  Id := Query.FieldByName('IdProveedor').AsInteger;
  with TfrmProv.Create(nil) do
  begin
    R := Modificar(Id);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Existe(Query, 'IdProveedor', Id);
  end;
end;

procedure TfrmElecProveedor.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecProveedor.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecProveedor.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmElecProveedor.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmElecProveedor.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecProveedor.ControlKeyPress(Sender: TObject; var Key: Char);
begin
  if (Sender = edtDesc) and (Key = #13) then
    PrepararQuery(gOrden);
  if Key = '+' then btnAgregarClick(nil)
  else if Key = '-' then btnEliminarClick(nil)
  else if Key = '*' then btnModificarClick(nil);
end;

end.
