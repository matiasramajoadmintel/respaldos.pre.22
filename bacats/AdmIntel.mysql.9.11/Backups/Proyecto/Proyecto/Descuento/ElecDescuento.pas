unit ElecDescuento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmElecDescuento = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1APELLIDO: TStringField;
    Query1NOMBRE: TStringField;
    Query1DESCRIPCION: TStringField;
    Query1MES: TStringField;
    Query1ANIO: TIntegerField;
    Query1MONTO: TFloatField;
    Query1IDOCUPANTE: TIntegerField;
    Query1IDTIPODESCUENTO: TIntegerField;
    Query1IDDESCUENTO: TIntegerField;
    Query1Ocupante: TStringField;
    ComboMes: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure ComboMesKeyPress(Sender: TObject; var Key: Char);
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
  frmElecDescuento: TfrmElecDescuento;

implementation

uses Comunes, Tablas, IngDescuento;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecDescuento.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
end;

procedure TfrmElecDescuento.PrepararQuery (Orden:String);
var
  Script,Filtro: String;
begin
  Script := 'SELECT * FROM VW_DESCUENTO';
  Filtro := '';
  if edtDesc.Text <> '' then
    Filtro := 'WHERE ((' +
              'Apellido LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
              'Apellido LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
              'Apellido LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
              'Apellido LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
              'Nombre LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
              'Nombre LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
              'Nombre LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
              'Nombre LIKE ' + #39 + edtDesc.Text + #39 + '))';

  if ComboMes.Text <> '' then
    if Filtro = '' then
      Filtro := 'WHERE (MES=' + #39 + ComboMes.Text + #39 + ')'
    else
      Filtro := Filtro + ' AND (MES=' + #39 + ComboMes.Text + #39 + ')';

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

procedure TfrmElecDescuento.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecDescuento.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='Apellido ' + gTipoOrden + ', Nombre ' + gTipoOrden;
end;

procedure TfrmElecDescuento.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecDescuento.grdDatosTitleClick(Column: TColumn);
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

procedure TfrmElecDescuento.Query1CalcFields(DataSet: TDataSet);
begin
        Query1Ocupante.Value:=Query1Apellido.Value + ', ' + Query1Nombre.Value;
end;

procedure TfrmElecDescuento.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecDescuento.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecDescuento.ComboMesKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

end.
 