unit ElecArtefacto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmElecArtefacto = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    Panel4: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1DESCRIPCIONED: TStringField;
    Query1DESCRIPCIONDEPT: TStringField;
    Query1DESCRIPCIONTA: TStringField;
    Query1MARCA: TStringField;
    Query1FECHAINI: TDateTimeField;
    Query1FECHAFIN: TDateTimeField;
    Query1IDEDIFICIO: TIntegerField;
    Query1IDDEPARTAMENTO: TIntegerField;
    Query1IDTIPOARTEFACTO: TIntegerField;
    Query1IDARTEFACTO: TIntegerField;
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
  frmElecArtefacto: TfrmElecArtefacto;

implementation

uses Comunes, Tablas, IngArtefacto;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecArtefacto.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecArtefacto.PrepararQuery (Orden:String);
var
        Script: String;
begin
        Script:='SELECT * FROM VW_ARTEFACTO ORDER BY ' + Orden;
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

procedure TfrmElecArtefacto.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecArtefacto.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='DescripcionEd ' + gTipoOrden;
end;

procedure TfrmElecArtefacto.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecArtefacto.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngArtefacto.Create(nil) do
        begin
                R:=Insertar;
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecArtefacto.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngArtefacto.Create(nil) do
        begin
                R:=Eliminar(Query1IdArtefacto.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecArtefacto.btnModificarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngArtefacto.Create(nil) do
        begin
                R:=Actualizar(Query1IdArtefacto.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecArtefacto.grdDatosTitleClick(Column: TColumn);
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

procedure TfrmElecArtefacto.grdDatosKeyDown(Sender: TObject; var Key: Word;
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
