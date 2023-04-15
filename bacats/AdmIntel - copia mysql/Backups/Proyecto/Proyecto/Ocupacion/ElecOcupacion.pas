unit ElecOcupacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmElecOcupacion = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1NOMBRE: TStringField;
    Query1APELLIDO: TStringField;
    Query1DESCRIPCIONED: TStringField;
    Query1DESCRIPCIONDEPT: TStringField;
    Query1FECHAINI: TDateTimeField;
    Query1FECHAFIN: TDateTimeField;
    Query1FECHARETIRO: TDateTimeField;
    Query1IDEDIFICIO: TIntegerField;
    Query1IDDEPARTAMENTO: TIntegerField;
    Query1IDOCUPANTE: TIntegerField;
    Query1IDOCUPACION: TIntegerField;
    Query1Ocupante: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
  private
    gTipoOrden, gOrden: String;
    gModo:Byte;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);
    { Private declarations }
  public
    procedure Mostrar;
    { Public declarations }
  end;

var
  frmElecOcupacion: TfrmElecOcupacion;

implementation

uses Comunes, Tablas, IngOcupacion;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecOcupacion.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecOcupacion.PrepararQuery (Orden:String);
var
        Script,Filtro: String;
begin
        Script:='SELECT * FROM VW_OCUPACION';
        Filtro:='';
        if edtDesc.Text<>'' then
                Filtro:='WHERE (' +
                        'Apellido LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Apellido LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Apellido LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Apellido LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + edtDesc.Text + #39 + ')';
        with Query1 do
        begin
                Close;
                SQL.Clear;
                SQL.Add(Script);
                SQL.Add(Filtro);
                SQL.Add('ORDER BY ' + Orden);
                Open;
        end;
        PrepararForm;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmElecOcupacion.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecOcupacion.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='DescripcionEd ' + gTipoOrden;
end;

procedure TfrmElecOcupacion.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecOcupacion.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
        IdOcupacion:integer;
begin
        with TfrmIngOcupacion.Create(nil) do
        begin
                R:=Insertar(IdOcupacion);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdOcupacion',IdOcupacion);
        end;
end;

procedure TfrmElecOcupacion.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngOcupacion.Create(nil) do
        begin
                R:=Eliminar(Query1IdOcupacion.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecOcupacion.btnModificarClick(Sender: TObject);
var
        R:Boolean;
        IdOcupacion:integer;
begin
        IdOcupacion:=Query1IdOcupacion.Value;
        with TfrmIngOcupacion.Create(nil) do
        begin
                R:=Actualizar(IdOcupacion);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdOcupacion',IdOcupacion);
        end;
end;

procedure TfrmElecOcupacion.grdDatosTitleClick(Column: TColumn);
var
  F: TField;
begin
        F := Query1.FindField(Column.FieldName);
        if F.FieldKind = fkData then
        begin
                if gTipoOrden = 'ASC' then
                        gTipoOrden := 'DESC'
                else
                        gTipoOrden := 'ASC';
                if Column.FieldName='Ocupante' then
                        gOrden:='Apellido ' + gTipoOrden + ', Nombre ' + gTipoOrden
                else
                        gOrden := Column.FieldName + ' ' + gTipoOrden;
                PrepararQuery(gOrden);
        end;
end;

procedure TfrmElecOcupacion.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

procedure TfrmElecOcupacion.Query1CalcFields(DataSet: TDataSet);
begin
        Query1Ocupante.Value:=Query1Apellido.Value + ', ' + Query1Nombre.Value;
end;

procedure TfrmElecOcupacion.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecOcupacion.edtDescKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

end.
