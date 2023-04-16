unit ElecCoef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, DBTables;

type
  TfrmElecCoef = class(TForm)
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
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1TIPO: TStringField;
    Query1PERSONAL: TStringField;
    Query1CANT_AMB: TIntegerField;
    Query1PORCENTAJE: TFloatField;
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
  frmElecCoef: TfrmElecCoef;

implementation

uses Comunes, Tablas, IngCoef;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecCoef.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecCoef.PrepararQuery (Orden:String);
var
        Script: String;
begin
        Script:='SELECT * FROM COEFICIENTE_ALQUILER ORDER BY ' + Orden;
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

procedure TfrmElecCoef.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecCoef.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='Tipo ' + gTipoOrden;
end;

procedure TfrmElecCoef.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecCoef.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngCoef.Create(nil) do
        begin
                R:=Insertar;
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecCoef.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngCoef.Create(nil) do
        begin
                R:=Eliminar(Query1Tipo.Value,Query1Personal.Value,Query1Cant_Amb.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecCoef.btnModificarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngCoef.Create(nil) do
        begin
                R:=Actualizar(Query1Tipo.Value,Query1Personal.Value,Query1Cant_Amb.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecCoef.grdDatosTitleClick(Column: TColumn);
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

procedure TfrmElecCoef.grdDatosKeyDown(Sender: TObject; var Key: Word;
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
 