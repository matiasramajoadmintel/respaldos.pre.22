unit ElecMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery;

type
  TfrmElecMateriales = class(TForm)
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
    QueryRubro: TStringField;
    QueryDescrip: TStringField;
    QueryIdMaterial: TSmallintField;
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
    procedure Mostrar;
    function GetId(var Id: Word): Boolean;

  end;

var
  frmElecMateriales: TfrmElecMateriales;

implementation

uses Comunes, Util, Material, PoolQuerys;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecMateriales.PrepararForm;
var
  i: Byte;
begin
  btnElegir.Visible:=(gModo=2) and (Query.RecordCount<>0);
  btnEliminar.Enabled:=(Query.RecordCount<>0);
  btnModificar.Enabled:=(Query.RecordCount<>0);
end;

procedure TfrmElecMateriales.PrepararQuery(Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT * FROM vwMateriales ';
  Orden := 'ORDER BY ' + Orden;

  //Construye el script del filtro
  Filtro:='';
  Filtro := 'WHERE (' +
            'Descrip LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Descrip LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Descrip LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Descrip LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
            'Rubro LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
            'Rubro LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
            'Rubro LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
            'Rubro LIKE ' + #39 + edtDesc.Text + #39 + ')';

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

function TfrmElecMateriales.GetId(var Id: Word): Boolean;
begin
  gModo:=2;
  PrepararQuery(gOrden);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    Id := Query.FieldByName('IdMaterial').AsInteger;
end;

procedure TfrmElecMateriales.Mostrar;
begin
  gModo:=0;
  PrepararQuery(gOrden);

  ShowModal;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecMateriales.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla (Name+'.col',grdDatos);
  RecuperarEstadoVentana (Name,Self);
  gTipoOrden:=' ASC';
  gOrden:='Descrip' + gTipoOrden;
end;

procedure TfrmElecMateriales.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecMateriales.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then
    gTipoOrden := ' DESC'
  else
    gTipoOrden := ' ASC';
  gOrden := Column.FieldName + gTipoOrden;
  PrepararQuery(gOrden);
end;

procedure TfrmElecMateriales.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmMaterial.Create(nil) do
  begin
    R := Agregar;
    Release;
  end;

  if R then
  begin
    Id := dmQuerys.GetMaxIntValue('Material', 'IdMaterial');
    PrepararQuery(gOrden);
    Existe(Query, 'IdMaterial', Id);
  end;
end;

procedure TfrmElecMateriales.grdDatosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    btnModificarClick(Sender);
  if Key = 46 then
    btnEliminarClick(Sender);
  if Key = 65 then
    btnAgregarClick(Sender);
end;

procedure TfrmElecMateriales.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmMaterial.Create(nil) do
  begin
    R := Eliminar(Query.FieldByName('IdMaterial').AsInteger);
    Release;
  end;

  if R then PrepararQuery(gOrden);
end;

procedure TfrmElecMateriales.btnModificarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  Id := Query.FieldByName('IdMaterial').AsInteger;
  with TfrmMaterial.Create(nil) do
  begin
    R := Modificar(Id);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Existe(Query, 'IdMaterial', Id);
  end;
end;

procedure TfrmElecMateriales.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecMateriales.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecMateriales.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmElecMateriales.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmElecMateriales.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecMateriales.ControlKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '+' then btnAgregarClick(nil)
  else if Key = '-' then btnEliminarClick(nil)
  else if Key = '*' then btnModificarClick(nil);
end;

end.
