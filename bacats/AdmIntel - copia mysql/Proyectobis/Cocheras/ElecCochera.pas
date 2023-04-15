unit ElecCochera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmElecCochera = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel6: TPanel;
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
    Query1IDEDIFICIO: TIntegerField;
    Query1IDCOCHERA: TIntegerField;
    Query1IDOCUPANTE: TIntegerField;
    Query1COEFICIENTE: TFloatField;
    Query1DESCRIPCION: TStringField;
    Query1DESCRIPCIONED: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  frmElecCochera: TfrmElecCochera;

implementation

uses Comunes, Tablas, IngCochera;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecCochera.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecCochera.PrepararQuery (Orden:String);
var
        Script: String;
begin
        Script:='SELECT C.*,E.Descripcion AS DescripcionEd FROM COCHERA C, EDIFICIO E WHERE C.IdEdificio=E.IdEdificio ORDER BY ' + Orden;
        with Query1 do
        begin
                Close;
                SQL.Clear;
                SQL.Add(Script);
                Open;
        end;
        PrepararForm;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmElecCochera.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecCochera.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='E.Descripcion ' + gTipoOrden;
end;

procedure TfrmElecCochera.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecCochera.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngCochera.Create(nil) do
        begin
                R:=Insertar;
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecCochera.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngCochera.Create(nil) do
        begin
                R:=Eliminar(Query1IdEdificio.Value,Query1IdCochera.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecCochera.btnModificarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngCochera.Create(nil) do
        begin
                R:=Actualizar(Query1IdEdificio.Value,Query1IdCochera.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecCochera.grdDatosTitleClick(Column: TColumn);
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
                if Column.FieldName='DESCRIPCIONED' then
                        gOrden:='E.Descripcion ' + gTipoOrden
                else
                        gOrden := Column.FieldName + ' ' + gTipoOrden;
                PrepararQuery(gOrden);
        end;
end;

procedure TfrmElecCochera.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

end.
