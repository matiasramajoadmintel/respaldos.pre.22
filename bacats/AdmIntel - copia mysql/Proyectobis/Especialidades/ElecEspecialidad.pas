unit ElecEspecialidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery;

type
  TfrmElecEspecialidad = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel4: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1IDESPECIALIDAD: TIntegerField;
    Query1DESCRIPCION: TStringField;
    Query1ABREV: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    function GetId(var Descripcion:String): integer;
    { Public declarations }
  end;

var
  frmElecEspecialidad: TfrmElecEspecialidad;

implementation

uses Comunes, Tablas, IngEspecialidad;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecEspecialidad.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecEspecialidad.PrepararQuery (Orden:String);
var
        Script,Filtro: String;
begin
        Script:='SELECT * FROM ESPECIALIDAD';
        Filtro:='';
        if edtDesc.Text<>'' then
                Filtro:='WHERE (' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + #39 + ')';
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

procedure TfrmElecEspecialidad.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

function TfrmElecEspecialidad.GetId(var Descripcion:String):integer;
begin
        gModo:=2;
        PrepararQuery (gOrden);
        ShowModal;
        if ModalResult=mrOk then
        begin
                Descripcion:=Query1Descripcion.Value;
                Result:=Query1IdEspecialidad.Value;
        end
        else
                Result:=0;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecEspecialidad.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='Descripcion ' + gTipoOrden;
end;

procedure TfrmElecEspecialidad.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecEspecialidad.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
        IdEspecialidad:integer;
begin
        with TfrmIngEspecialidad.Create(nil) do
        begin
                R:=Insertar(IdEspecialidad);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe (Query1,'IdEspecialidad',IdEspecialidad);
        end;
end;

procedure TfrmElecEspecialidad.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngEspecialidad.Create(nil) do
        begin
                R:=Eliminar(Query1IdEspecialidad.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecEspecialidad.btnModificarClick(Sender: TObject);
var
        R:Boolean;
        IdEspecialidad:integer;
begin
        IdEspecialidad:=Query1IdEspecialidad.Value;
        with TfrmIngEspecialidad.Create(nil) do
        begin
                R:=Actualizar(IdEspecialidad);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe (Query1,'IdEspecialidad',IdEspecialidad);
        end;
end;

procedure TfrmElecEspecialidad.grdDatosTitleClick(Column: TColumn);
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
                gOrden := Column.FieldName + ' ' + gTipoOrden;
                PrepararQuery(gOrden);
        end;
end;

procedure TfrmElecEspecialidad.grdDatosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

procedure TfrmElecEspecialidad.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery(gOrden);
end;

procedure TfrmElecEspecialidad.edtDescKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

end.
