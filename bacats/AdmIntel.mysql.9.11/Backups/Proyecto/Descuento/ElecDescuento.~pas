unit ElecDescuento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables,
  ComCtrls;

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
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1APELLIDO: TStringField;
    Query1NOMBRE: TStringField;
    Query1MES: TStringField;
    Query1ANIO: TIntegerField;
    Query1MONTO: TFloatField;
    Query1IDOCUPANTE: TIntegerField;
    Query1IDTIPODESCUENTO: TIntegerField;
    Query1IDDESCUENTO: TIntegerField;
    Query1Ocupante: TStringField;
    ComboMes: TComboBox;
    Label2: TLabel;
    edtAnio: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    cmbTDesc: TComboBox;
    StaticText1: TStaticText;
    TDESC: TTable;
    TDESCIDTIPODESCUENTO: TIntegerField;
    TDESCCODDESC: TIntegerField;
    Bevel1: TBevel;
    Panel4: TPanel;
    btnImprimir: TBitBtn;
    Label4: TLabel;
    TDESCTIPOPAGO: TStringField;
    Query1DESCRIPCION: TStringField;
    TDESCDESCRIPCION: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure Query1CalcFields(DataSet: TDataSet);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure ComboMesKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);

  private
    gTipoOrden, gOrden: String;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);

  public
    procedure Mostrar;

  end;

var
  frmElecDescuento: TfrmElecDescuento;

implementation

uses Comunes, Tablas, IngDescuento, QRDescuentos, Util;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecDescuento.PrepararForm;
begin
  edtAnio.Text := IntToStr(CurrentYear);
  UpDown1.Position := CurrentYear;
end;

procedure TfrmElecDescuento.PrepararQuery (Orden:String);
var
  Script,Filtro: String;
  Total: Currency;
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

  if edtAnio.Text <> '' then
    if Filtro = '' then
      Filtro := 'WHERE (ANIO=' + edtAnio.Text + ')'
    else
      Filtro := Filtro + ' AND (ANIO=' + edtAnio.Text + ')';

  if cmbTDesc.Text <> '' then
    if Filtro = '' then
      Filtro := 'WHERE (DESCRIPCION=' + #39 + cmbTDesc.Text + #39 + ')'
    else
      Filtro := Filtro + ' AND (DESCRIPCION=' + #39 + cmbTDesc.Text + #39 + ')';

  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Script);
    SQL.Add(Filtro);
    SQL.Add('ORDER BY ' + Orden);
    Open;
  end;

  Query1.DisableControls;
  Total := SumaColumna(Query1, 'Monto');
  StaticText1.Caption := 'Total: ' + CurrToStrF(Total,ffCurrency,2);
  Query1.First;
  Query1.EnableControls;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmElecDescuento.Mostrar;
begin
  PrepararForm;
  PrepararQuery(gOrden);

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

procedure TfrmElecDescuento.btnImprimirClick(Sender: TObject);
var
  form: TfrmQRDescuentos;
begin
  if ComboMes.Text = '' then
  begin
    MsjError('Debe seleccionar un mes.');
    Exit;
  end;

  if edtAnio.Text = '' then
  begin
    MsjError('Debe seleccionar un año.');
    Exit;
  end;

  if cmbTDesc.Text = '' then
  begin
    MsjError('Debe seleccionar un concepto.');
    Exit;
  end;

  Existe(TDESC, 'DESCRIPCION', cmbTDesc.Text);
  form := TfrmQRDescuentos.Create(nil);
  form.VistaPrevia(ComboMes.Text, TDESCTIPOPAGO.Text, UpDown1.Position, TDESCCODDESC.Value);
  form.Release;
end;

end.
